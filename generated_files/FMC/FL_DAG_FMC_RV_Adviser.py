"""
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 5.3.0.10, generation date: 2023/03/29 00:56:06
DV_NAME: sandbox_dv - Release: DV Evolve Adviser(5) - Comment: Adviser Topic - Updated source dataset ini parameter - Release date: 2023/03/28 02:08:39, 
SRC_NAME: raw_evolve - Release: raw_evolve(10) - Comment: Advisor topic - updated source dataset ini parameters - Release date: 2023/03/28 02:06:49
 """


from datetime import datetime, timedelta
from pathlib import Path
import json

from airflow import DAG
from airflow.models import Variable
from airflow.operators.dummy_operator import DummyOperator

from airflow.providers.google.cloud.operators.bigquery import BigQueryExecuteQueryOperator


default_args = {
	"owner":"Vaultspeed",
	"retries": 3,
	"retry_delay": timedelta(seconds=10),
	"use_legacy_sql": False,
	"start_date":datetime.strptime("24-03-2023 06:00:00", "%d-%m-%Y %H:%M:%S")
}

path_to_mtd = Path(Variable.get("path_to_metadata"))

path_to_sql=Path(Variable.get("path_to_sql"))
template_searchpath=[
	path_to_sql / "INIT" / "FLOW_MANAGEMENT_CONTROL_LAYER",
	path_to_sql / "ALL" / "FLOW_MANAGEMENT_CONTROL_LAYER",
	path_to_sql / "INIT" / "DELTA_FIREWALL_LAYER",
	path_to_sql / "INIT" / "EXTRACTION_LAYER",
	path_to_sql / "INIT" / "STAGING_LAYER",
	path_to_sql / "INIT" / "FOUNDATION_LAYER"
]

if (path_to_mtd / "34_mappings_FMC_RV_Adviser_20230329_005606.json").exists():
	with open(path_to_mtd / "34_mappings_FMC_RV_Adviser_20230329_005606.json") as file: 
		mappings = json.load(file)

else:
	with open(path_to_mtd / "mappings_FMC_RV_Adviser.json") as file: 
		mappings = json.load(file)

FMC_RV_Adviser = DAG(
	dag_id="FMC_RV_Adviser", 
	default_args=default_args,
	description="FMC_RV for Adviser", 
	schedule_interval="@once", 
	concurrency=2, 
	template_searchpath=template_searchpath, 
	user_defined_macros={"grouped_flow": "N"},
	catchup=False, 
	max_active_runs=1,
	tags=["VaultSpeed", "raw_evolve", "sandbox_dv"]
)

# Create initial fmc tasks
# insert load metadata
fmc_mtd = BigQueryExecuteQueryOperator(
	task_id="fmc_mtd", 
	gcp_conn_id="raw_evolve_udp", 
	sql=f"""set_fmc_mtd_fl_init_raw_evolve.sql""", 
	dag=FMC_RV_Adviser
)

tasks = {"fmc_mtd":fmc_mtd}

# Create mapping tasks
for map, info in mappings.items():
	task = BigQueryExecuteQueryOperator(
		task_id=map, 
		gcp_conn_id="raw_evolve_udp", 
		sql=f"""{map}.sql""", 
		dag=FMC_RV_Adviser
	)
	
	for dep in info["dependencies"]:
		task << tasks[dep]
	
	tasks[map] = task
	

# task to indicate the end of a load
end_task = DummyOperator(
	task_id="end_of_load", 
	dag=FMC_RV_Adviser
)

# Set end of load dependency
if (path_to_mtd / "34_FL_mtd_FMC_RV_Adviser_20230329_005606.json").exists():
	with open(path_to_mtd / "34_FL_mtd_FMC_RV_Adviser_20230329_005606.json") as file: 
		analyze_data = json.load(file)
else:
	with open(path_to_mtd / "FL_mtd_FMC_RV_Adviser.json") as file: 
		analyze_data = json.load(file)

for table, data in analyze_data.items():
	for dep in data["dependencies"]:
		end_task << tasks[dep.split("/")[-1]]

# Save load status tasks
fmc_load_fail = BigQueryExecuteQueryOperator(
	task_id="fmc_load_fail", 
	gcp_conn_id="raw_evolve_udp", 
	sql=f"""fmc_upd_run_status_fl_raw_evolve.sql""", 
	trigger_rule="one_failed", 
	dag=FMC_RV_Adviser
)
fmc_load_fail << end_task

fmc_load_success = BigQueryExecuteQueryOperator(
	task_id="fmc_load_success", 
	gcp_conn_id="raw_evolve_udp", 
	sql=f"""fmc_upd_run_status_fl_raw_evolve.sql""", 
	dag=FMC_RV_Adviser
)
fmc_load_success << end_task


/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 5.3.0.10, generation date: 2023/03/27 00:31:05
DV_NAME: prj-insignia-udp-rv - Release: prj-insignia-udp-rv_release1(1) - Comment: Initial Release - Adviser Topic - Release date: 2023/03/27 00:13:19, 
BV release: init(1) - Comment: initial release - Release date: 2023/03/27 00:29:44, 
SRC_NAME: prj-insignia-udp-raw-evolve - Release: prj-insignia-udp-raw-evolve(1) - Comment: Initial Release - Adviser topic - Release date: 2023/03/27 00:09:32
 */



-- hub_tgt

	INSERT INTO `RDV_FL`.`hub_adviser`(
		 `adviser_hkey`
		,`meta_inserted_datetime_utc `
		,`meta_load_cycle_id`
		,`adviser_bkey`
		,`meta_record_source_system`
		,`meta_record_source_name`
	)
	WITH `change_set` AS 
	( 
		SELECT 
			  `stg_src1`.`adviser_hkey` AS `adviser_hkey`
			, `stg_src1`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, `stg_src1`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, 0 AS `logposition`
			, `stg_src1`.`adviser_bkey` AS `adviser_bkey`
			, `stg_src1`.`meta_record_source_system` AS `meta_record_source_system`
			, 0 AS `vs_general_order`
		FROM `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser` `stg_src1`
		WHERE  `stg_src1`.`record_type` = 'S'
	)
	, `min_load_time` AS 
	( 
		SELECT 
			  `change_set`.`adviser_hkey` AS `adviser_hkey`
			, `change_set`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, `change_set`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, `change_set`.`adviser_bkey` AS `adviser_bkey`
			, `change_set`.`meta_record_source_system` AS `meta_record_source_system`
			, `change_set`.`meta_record_source_name` AS `meta_record_source_name`
			, ROW_NUMBER()OVER(PARTITION BY `change_set`.`adviser_hkey` ORDER BY `change_set`.`vs_general_order`,
				`change_set`.`meta_inserted_datetime_utc `,`change_set`.`logposition`) AS `vs_data_order`
		FROM `change_set` `change_set`
	)
	SELECT 
		  `min_load_time`.`adviser_hkey` AS `adviser_hkey`
		, `min_load_time`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `min_load_time`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `min_load_time`.`adviser_bkey` AS `adviser_bkey`
		, `min_load_time`.`meta_record_source_system` AS `meta_record_source_system`
		, `min_load_time`.`meta_record_source_name` AS `meta_record_source_name`
	FROM `min_load_time` `min_load_time`
	LEFT OUTER JOIN `RDV_FL`.`hub_adviser` `hub_src` ON  `min_load_time`.`adviser_hkey` = `hub_src`.`adviser_hkey`
	WHERE  `min_load_time`.`vs_data_order` = 1 AND `hub_src`.`adviser_hkey` is NULL
	;



 
 

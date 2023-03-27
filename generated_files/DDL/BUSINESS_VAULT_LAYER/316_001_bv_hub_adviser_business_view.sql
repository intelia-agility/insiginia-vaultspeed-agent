/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 5.3.0.10, generation date: 2023/03/27 00:31:21
DV_NAME: prj-insignia-udp-rv - Release: prj-insignia-udp-rv_release1(1) - Comment: Initial Release - Adviser Topic - Release date: 2023/03/27 00:13:19, 
BV release: init(1) - Comment: initial release - Release date: 2023/03/27 00:29:44, 
SRC_NAME: prj-insignia-udp-raw-evolve - Release: prj-insignia-udp-raw-evolve(1) - Comment: Initial Release - Adviser topic - Release date: 2023/03/27 00:09:32
 */


DROP VIEW IF EXISTS `RDV_BV`.`hub_adviser`;
CREATE  VIEW `RDV_BV`.`hub_adviser`  AS 
	SELECT 
		  `dvt_src`.`adviser_hkey` AS `adviser_hkey`
		, `dvt_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `dvt_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `dvt_src`.`adviser_bkey` AS `adviser_bkey`
		, `dvt_src`.`meta_record_source_system` AS `meta_record_source_system`
		, `dvt_src`.`meta_record_source_name` AS `meta_record_source_name`
	FROM `RDV_FL`.`hub_adviser` `dvt_src`
	;

 
 

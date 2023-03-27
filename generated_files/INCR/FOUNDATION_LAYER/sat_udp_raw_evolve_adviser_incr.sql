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



-- sat_temp_tgt

	DELETE FROM `prj-insignia-udp-raw-evolve_stg`.`sat_udp_raw_evolve_adviser_tmp` WHERE 1=1;

	INSERT INTO `prj-insignia-udp-raw-evolve_stg`.`sat_udp_raw_evolve_adviser_tmp`(
		 `adviser_hkey`
		,`meta_inserted_datetime_utc `
		,`meta_load_cycle_id`
		,`record_type`
		,`source`
		,`equal`
		,`meta_hash_diff`
		,`meta_is_deleted`
		,`cdc_timestamp`
		,`value_identifier`
		,`value_references_dealer_identifier_code`
		,`value_references_dealer_identifier_legalentity`
		,`value_identifier_code`
		,`value_identifier_legalentity`
		,`value_state_contact_streetaddress_dpid`
		,`value_state_contact_streetaddress_country`
		,`value_state_contact_streetaddress_postcode`
		,`value_state_contact_streetaddress_state`
		,`value_state_contact_streetaddress_suburb`
		,`value_state_contact_streetaddress_line2`
		,`value_state_contact_streetaddress_line1`
		,`value_state_contact_streetaddress_line0`
		,`value_state_contact_postaladdress_dpid`
		,`value_state_contact_postaladdress_country`
		,`value_state_contact_postaladdress_postcode`
		,`value_state_contact_postaladdress_state`
		,`value_state_contact_postaladdress_suburb`
		,`value_state_contact_postaladdress_line2`
		,`value_state_contact_postaladdress_line1`
		,`value_state_contact_postaladdress_line0`
		,`value_state_contact_phonenumbers_work`
		,`value_state_contact_phonenumbers_mobile`
		,`value_state_contact_phonenumbers_freecall`
		,`value_state_contact_phonenumbers_fax`
		,`value_state_contact_email`
		,`value_state_contact_salutation`
		,`value_state_contact_firstname`
		,`value_state_contact_givennames`
		,`value_state_contact_surname`
		,`value_state_contact_title`
		,`value_state_companyname`
		,`value_state_displayname`
		,`value_state_advisertype`
		,`value_state_role`
		,`value_state_adviserregistercode`
		,`value_state_code`
		,`value_state_active`
		,`value_references_dealer_domain`
		,`value_references_dealer_identifier`
		,`value_timestamp`
		,`value_type`
		,`meta_source_operation_type`
		,`meta_source_snapshot_datetime_utc`
		,`meta_record_source_category`
		,`meta_record_source_name`
		,`meta_record_source_type`
		,`meta_inserted_datetime_utc`
	)
	WITH `dist_stg` AS 
	( 
		SELECT DISTINCT 
 			  `stg_dis_src`.`adviser_hkey` AS `adviser_hkey`
			, `stg_dis_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		FROM `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser` `stg_dis_src`
		WHERE  `stg_dis_src`.`record_type` = 'S'
	)
	, `temp_table_set` AS 
	( 
		SELECT 
			  `stg_temp_src`.`adviser_hkey` AS `adviser_hkey`
			, `stg_temp_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, `stg_temp_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, PARSE_TIMESTAMP('%d/%m/%Y %H:%M:%S', NULL) AS `unknown`
			, `stg_temp_src`.`record_type` AS `record_type`
			, 'STG' AS `source`
			, 1 AS `vs_origin_id`
			, UPPER(TO_HEX(SHA256(COALESCE(RTRIM( UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', 
				`stg_temp_src`.`meta_inserted_datetime_utc`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`meta_record_source_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`meta_record_source_name` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`meta_record_source_category` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', `stg_temp_src`.`meta_source_snapshot_datetime_utc`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`meta_source_operation_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', `stg_temp_src`.`value_timestamp`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_references_dealer_identifier` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_references_dealer_domain` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_active` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_code` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_adviserregistercode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_role` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_advisertype` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_displayname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_companyname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_title` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_surname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_givennames` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_firstname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_salutation` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_email` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_phonenumbers_fax` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_phonenumbers_freecall` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_phonenumbers_mobile` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_phonenumbers_work` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_line0` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_line1` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_line2` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_suburb` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_state` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_postcode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_country` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_postaladdress_dpid` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_line0` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_line1` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_line2` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_suburb` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_state` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_postcode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_country` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_state_contact_streetaddress_dpid` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_identifier_legalentity` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_identifier_code` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_references_dealer_identifier_legalentity` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_temp_src`.`value_references_dealer_identifier_code` AS STRING)),'~'),'#','\\' || '#'))|| '#','#' || '~'),'~') ))) AS `meta_hash_diff`
			, CASE WHEN `stg_temp_src`.`jrn_flag` = 'D' THEN CAST('Y' AS STRING) ELSE CAST('N' AS STRING) END AS `meta_is_deleted`
			, `stg_temp_src`.`cdc_timestamp` AS `cdc_timestamp`
			, `stg_temp_src`.`value_identifier` AS `value_identifier`
			, `stg_temp_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
			, `stg_temp_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `stg_temp_src`.`value_identifier_code` AS `value_identifier_code`
			, `stg_temp_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `stg_temp_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `stg_temp_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `stg_temp_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `stg_temp_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `stg_temp_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `stg_temp_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `stg_temp_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `stg_temp_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `stg_temp_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `stg_temp_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `stg_temp_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `stg_temp_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `stg_temp_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `stg_temp_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `stg_temp_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `stg_temp_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `stg_temp_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `stg_temp_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `stg_temp_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `stg_temp_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `stg_temp_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `stg_temp_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `stg_temp_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `stg_temp_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `stg_temp_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `stg_temp_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `stg_temp_src`.`value_state_companyname` AS `value_state_companyname`
			, `stg_temp_src`.`value_state_displayname` AS `value_state_displayname`
			, `stg_temp_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `stg_temp_src`.`value_state_role` AS `value_state_role`
			, `stg_temp_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `stg_temp_src`.`value_state_code` AS `value_state_code`
			, `stg_temp_src`.`value_state_active` AS `value_state_active`
			, `stg_temp_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `stg_temp_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `stg_temp_src`.`value_timestamp` AS `value_timestamp`
			, `stg_temp_src`.`value_type` AS `value_type`
			, `stg_temp_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `stg_temp_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `stg_temp_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `stg_temp_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `stg_temp_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `stg_temp_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		FROM `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser` `stg_temp_src`
		WHERE  `stg_temp_src`.`record_type` = 'S'
		UNION ALL 
		SELECT 
			  `sat_src`.`adviser_hkey` AS `adviser_hkey`
			, `sat_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, `sat_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, MAX(`sat_src`.`meta_inserted_datetime_utc `)OVER( PARTITION BY `sat_src`.`adviser_hkey`) AS `unknown`
			, 'SAT' AS `record_type`
			, 'SAT' AS `source`
			, 0 AS `vs_origin_id`
			, `sat_src`.`meta_hash_diff` AS `meta_hash_diff`
			, `sat_src`.`meta_is_deleted` AS `meta_is_deleted`
			, `sat_src`.`cdc_timestamp` AS `cdc_timestamp`
			, `sat_src`.`value_identifier` AS `value_identifier`
			, `sat_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
			, `sat_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `sat_src`.`value_identifier_code` AS `value_identifier_code`
			, `sat_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `sat_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `sat_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `sat_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `sat_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `sat_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `sat_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `sat_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `sat_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `sat_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `sat_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `sat_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `sat_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `sat_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `sat_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `sat_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `sat_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `sat_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `sat_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `sat_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `sat_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `sat_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `sat_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `sat_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `sat_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `sat_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `sat_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `sat_src`.`value_state_companyname` AS `value_state_companyname`
			, `sat_src`.`value_state_displayname` AS `value_state_displayname`
			, `sat_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `sat_src`.`value_state_role` AS `value_state_role`
			, `sat_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `sat_src`.`value_state_code` AS `value_state_code`
			, `sat_src`.`value_state_active` AS `value_state_active`
			, `sat_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `sat_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `sat_src`.`value_timestamp` AS `value_timestamp`
			, `sat_src`.`value_type` AS `value_type`
			, `sat_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `sat_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `sat_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `sat_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `sat_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `sat_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		FROM `RDV_FL`.`sat_udp_raw_evolve_adviser` `sat_src`
		INNER JOIN `dist_stg` `dist_stg` ON  `sat_src`.`adviser_hkey` = `dist_stg`.`adviser_hkey`
	)
	SELECT 
		  `temp_table_set`.`adviser_hkey` AS `adviser_hkey`
		, `temp_table_set`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `temp_table_set`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `temp_table_set`.`record_type` AS `record_type`
		, `temp_table_set`.`source` AS `source`
		, CASE WHEN `temp_table_set`.`source` = 'STG' AND CAST(`temp_table_set`.`meta_is_deleted` AS STRING) || CAST(`temp_table_set`.`meta_hash_diff` AS STRING)
			= LAG( CAST(`temp_table_set`.`meta_is_deleted` AS STRING) || CAST(`temp_table_set`.`meta_hash_diff` AS STRING),1)OVER(PARTITION BY `temp_table_set`.`adviser_hkey` ORDER BY `temp_table_set`.`meta_inserted_datetime_utc `,`temp_table_set`.`vs_origin_id`)THEN 1 ELSE 0 END AS `equal`
		, `temp_table_set`.`meta_hash_diff` AS `meta_hash_diff`
		, `temp_table_set`.`meta_is_deleted` AS `meta_is_deleted`
		, `temp_table_set`.`cdc_timestamp` AS `cdc_timestamp`
		, `temp_table_set`.`value_identifier` AS `value_identifier`
		, `temp_table_set`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		, `temp_table_set`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `temp_table_set`.`value_identifier_code` AS `value_identifier_code`
		, `temp_table_set`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `temp_table_set`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `temp_table_set`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `temp_table_set`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `temp_table_set`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `temp_table_set`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `temp_table_set`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `temp_table_set`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `temp_table_set`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `temp_table_set`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `temp_table_set`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `temp_table_set`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `temp_table_set`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `temp_table_set`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `temp_table_set`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `temp_table_set`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `temp_table_set`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `temp_table_set`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `temp_table_set`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `temp_table_set`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `temp_table_set`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `temp_table_set`.`value_state_contact_email` AS `value_state_contact_email`
		, `temp_table_set`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `temp_table_set`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `temp_table_set`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `temp_table_set`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `temp_table_set`.`value_state_contact_title` AS `value_state_contact_title`
		, `temp_table_set`.`value_state_companyname` AS `value_state_companyname`
		, `temp_table_set`.`value_state_displayname` AS `value_state_displayname`
		, `temp_table_set`.`value_state_advisertype` AS `value_state_advisertype`
		, `temp_table_set`.`value_state_role` AS `value_state_role`
		, `temp_table_set`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `temp_table_set`.`value_state_code` AS `value_state_code`
		, `temp_table_set`.`value_state_active` AS `value_state_active`
		, `temp_table_set`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `temp_table_set`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `temp_table_set`.`value_timestamp` AS `value_timestamp`
		, `temp_table_set`.`value_type` AS `value_type`
		, `temp_table_set`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `temp_table_set`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `temp_table_set`.`meta_record_source_category` AS `meta_record_source_category`
		, `temp_table_set`.`meta_record_source_name` AS `meta_record_source_name`
		, `temp_table_set`.`meta_record_source_type` AS `meta_record_source_type`
		, `temp_table_set`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
	FROM `temp_table_set` `temp_table_set`
	WHERE  `temp_table_set`.`source` = 'STG' OR(`temp_table_set`.`meta_inserted_datetime_utc ` = `temp_table_set`.`unknown` AND `temp_table_set`.`source` = 'SAT')
	;


-- sat_inur_tgt

	INSERT INTO `RDV_FL`.`sat_udp_raw_evolve_adviser`(
		 `adviser_hkey`
		,`meta_inserted_datetime_utc `
		,`meta_load_cycle_id`
		,`meta_hash_diff`
		,`meta_is_deleted`
		,`cdc_timestamp`
		,`value_identifier`
		,`value_references_dealer_identifier_code`
		,`value_references_dealer_identifier_legalentity`
		,`value_identifier_code`
		,`value_identifier_legalentity`
		,`value_state_contact_streetaddress_dpid`
		,`value_state_contact_streetaddress_country`
		,`value_state_contact_streetaddress_postcode`
		,`value_state_contact_streetaddress_state`
		,`value_state_contact_streetaddress_suburb`
		,`value_state_contact_streetaddress_line2`
		,`value_state_contact_streetaddress_line1`
		,`value_state_contact_streetaddress_line0`
		,`value_state_contact_postaladdress_dpid`
		,`value_state_contact_postaladdress_country`
		,`value_state_contact_postaladdress_postcode`
		,`value_state_contact_postaladdress_state`
		,`value_state_contact_postaladdress_suburb`
		,`value_state_contact_postaladdress_line2`
		,`value_state_contact_postaladdress_line1`
		,`value_state_contact_postaladdress_line0`
		,`value_state_contact_phonenumbers_work`
		,`value_state_contact_phonenumbers_mobile`
		,`value_state_contact_phonenumbers_freecall`
		,`value_state_contact_phonenumbers_fax`
		,`value_state_contact_email`
		,`value_state_contact_salutation`
		,`value_state_contact_firstname`
		,`value_state_contact_givennames`
		,`value_state_contact_surname`
		,`value_state_contact_title`
		,`value_state_companyname`
		,`value_state_displayname`
		,`value_state_advisertype`
		,`value_state_role`
		,`value_state_adviserregistercode`
		,`value_state_code`
		,`value_state_active`
		,`value_references_dealer_domain`
		,`value_references_dealer_identifier`
		,`value_timestamp`
		,`value_type`
		,`meta_source_operation_type`
		,`meta_source_snapshot_datetime_utc`
		,`meta_record_source_category`
		,`meta_record_source_name`
		,`meta_record_source_type`
		,`meta_inserted_datetime_utc`
	)
	SELECT 
		  `sat_temp_src_inur`.`adviser_hkey` AS `adviser_hkey`
		, `sat_temp_src_inur`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `sat_temp_src_inur`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `sat_temp_src_inur`.`meta_hash_diff` AS `meta_hash_diff`
		, `sat_temp_src_inur`.`meta_is_deleted` AS `meta_is_deleted`
		, `sat_temp_src_inur`.`cdc_timestamp` AS `cdc_timestamp`
		, `sat_temp_src_inur`.`value_identifier` AS `value_identifier`
		, `sat_temp_src_inur`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		, `sat_temp_src_inur`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `sat_temp_src_inur`.`value_identifier_code` AS `value_identifier_code`
		, `sat_temp_src_inur`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `sat_temp_src_inur`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `sat_temp_src_inur`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `sat_temp_src_inur`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `sat_temp_src_inur`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `sat_temp_src_inur`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `sat_temp_src_inur`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `sat_temp_src_inur`.`value_state_contact_email` AS `value_state_contact_email`
		, `sat_temp_src_inur`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `sat_temp_src_inur`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `sat_temp_src_inur`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `sat_temp_src_inur`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `sat_temp_src_inur`.`value_state_contact_title` AS `value_state_contact_title`
		, `sat_temp_src_inur`.`value_state_companyname` AS `value_state_companyname`
		, `sat_temp_src_inur`.`value_state_displayname` AS `value_state_displayname`
		, `sat_temp_src_inur`.`value_state_advisertype` AS `value_state_advisertype`
		, `sat_temp_src_inur`.`value_state_role` AS `value_state_role`
		, `sat_temp_src_inur`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `sat_temp_src_inur`.`value_state_code` AS `value_state_code`
		, `sat_temp_src_inur`.`value_state_active` AS `value_state_active`
		, `sat_temp_src_inur`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `sat_temp_src_inur`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `sat_temp_src_inur`.`value_timestamp` AS `value_timestamp`
		, `sat_temp_src_inur`.`value_type` AS `value_type`
		, `sat_temp_src_inur`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `sat_temp_src_inur`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `sat_temp_src_inur`.`meta_record_source_category` AS `meta_record_source_category`
		, `sat_temp_src_inur`.`meta_record_source_name` AS `meta_record_source_name`
		, `sat_temp_src_inur`.`meta_record_source_type` AS `meta_record_source_type`
		, `sat_temp_src_inur`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
	FROM `prj-insignia-udp-raw-evolve_stg`.`sat_udp_raw_evolve_adviser_tmp` `sat_temp_src_inur`
	WHERE  `sat_temp_src_inur`.`source` = 'STG' AND `sat_temp_src_inur`.`equal` = 0
	;



 
 

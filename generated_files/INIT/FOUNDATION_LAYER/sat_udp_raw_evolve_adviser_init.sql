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



-- sat_tgt

	DELETE FROM `RDV_FL`.`sat_udp_raw_evolve_adviser` WHERE 1=1;

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
	WITH `stg_src` AS 
	( 
		SELECT 
			  `stg_inr_src`.`adviser_hkey` AS `adviser_hkey`
			, `stg_inr_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, `stg_inr_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, UPPER(TO_HEX(SHA256(COALESCE(RTRIM( UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', 
				`stg_inr_src`.`meta_inserted_datetime_utc`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`meta_record_source_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`meta_record_source_name` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`meta_record_source_category` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', `stg_inr_src`.`meta_source_snapshot_datetime_utc`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`meta_source_operation_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_type` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( FORMAT_TIMESTAMP('%d/%m/%Y %H:%M:%S', `stg_inr_src`.`value_timestamp`)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_references_dealer_identifier` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_references_dealer_domain` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_active` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_code` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_adviserregistercode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_role` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_advisertype` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_displayname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_companyname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_title` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_surname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_givennames` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_firstname` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_salutation` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_email` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_phonenumbers_fax` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_phonenumbers_freecall` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_phonenumbers_mobile` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_phonenumbers_work` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_line0` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_line1` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_line2` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_suburb` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_state` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_postcode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_country` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_postaladdress_dpid` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_line0` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_line1` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_line2` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_suburb` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_state` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_postcode` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_country` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_state_contact_streetaddress_dpid` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_identifier_legalentity` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_identifier_code` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_references_dealer_identifier_legalentity` AS STRING)),'~'),'#','\\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( CAST(`stg_inr_src`.`value_references_dealer_identifier_code` AS STRING)),'~'),'#','\\' || '#'))|| '#','#' || '~'),'~') ))) AS `meta_hash_diff`
			, CAST('N' AS STRING) AS `meta_is_deleted`
			, `stg_inr_src`.`cdc_timestamp` AS `cdc_timestamp`
			, `stg_inr_src`.`value_identifier` AS `value_identifier`
			, `stg_inr_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
			, `stg_inr_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `stg_inr_src`.`value_identifier_code` AS `value_identifier_code`
			, `stg_inr_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `stg_inr_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `stg_inr_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `stg_inr_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `stg_inr_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `stg_inr_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `stg_inr_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `stg_inr_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `stg_inr_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `stg_inr_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `stg_inr_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `stg_inr_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `stg_inr_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `stg_inr_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `stg_inr_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `stg_inr_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `stg_inr_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `stg_inr_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `stg_inr_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `stg_inr_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `stg_inr_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `stg_inr_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `stg_inr_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `stg_inr_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `stg_inr_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `stg_inr_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `stg_inr_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `stg_inr_src`.`value_state_companyname` AS `value_state_companyname`
			, `stg_inr_src`.`value_state_displayname` AS `value_state_displayname`
			, `stg_inr_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `stg_inr_src`.`value_state_role` AS `value_state_role`
			, `stg_inr_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `stg_inr_src`.`value_state_code` AS `value_state_code`
			, `stg_inr_src`.`value_state_active` AS `value_state_active`
			, `stg_inr_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `stg_inr_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `stg_inr_src`.`value_timestamp` AS `value_timestamp`
			, `stg_inr_src`.`value_type` AS `value_type`
			, `stg_inr_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `stg_inr_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `stg_inr_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `stg_inr_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `stg_inr_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `stg_inr_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, ROW_NUMBER()OVER(PARTITION BY `stg_inr_src`.`adviser_hkey` ORDER BY `stg_inr_src`.`meta_inserted_datetime_utc `) AS `vs_data_order`
		FROM `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser` `stg_inr_src`
	)
	SELECT 
		  `stg_src`.`adviser_hkey` AS `adviser_hkey`
		, `stg_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `stg_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `stg_src`.`meta_hash_diff` AS `meta_hash_diff`
		, `stg_src`.`meta_is_deleted` AS `meta_is_deleted`
		, `stg_src`.`cdc_timestamp` AS `cdc_timestamp`
		, `stg_src`.`value_identifier` AS `value_identifier`
		, `stg_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		, `stg_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `stg_src`.`value_identifier_code` AS `value_identifier_code`
		, `stg_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `stg_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `stg_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `stg_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `stg_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `stg_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `stg_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `stg_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `stg_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `stg_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `stg_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `stg_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `stg_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `stg_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `stg_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `stg_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `stg_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `stg_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `stg_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `stg_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `stg_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `stg_src`.`value_state_contact_email` AS `value_state_contact_email`
		, `stg_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `stg_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `stg_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `stg_src`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `stg_src`.`value_state_contact_title` AS `value_state_contact_title`
		, `stg_src`.`value_state_companyname` AS `value_state_companyname`
		, `stg_src`.`value_state_displayname` AS `value_state_displayname`
		, `stg_src`.`value_state_advisertype` AS `value_state_advisertype`
		, `stg_src`.`value_state_role` AS `value_state_role`
		, `stg_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `stg_src`.`value_state_code` AS `value_state_code`
		, `stg_src`.`value_state_active` AS `value_state_active`
		, `stg_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `stg_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `stg_src`.`value_timestamp` AS `value_timestamp`
		, `stg_src`.`value_type` AS `value_type`
		, `stg_src`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `stg_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `stg_src`.`meta_record_source_category` AS `meta_record_source_category`
		, `stg_src`.`meta_record_source_name` AS `meta_record_source_name`
		, `stg_src`.`meta_record_source_type` AS `meta_record_source_type`
		, `stg_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
	FROM `stg_src` `stg_src`
	WHERE  `stg_src`.`vs_data_order` = 1
	;



 
 

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



-- ext_tgt

	DELETE FROM `prj-insignia-udp-raw-evolve_ext`.`statechange_adviser` WHERE 1=1;

	INSERT INTO `prj-insignia-udp-raw-evolve_ext`.`statechange_adviser`(
		 `meta_load_cycle_id`
		,`meta_inserted_datetime_utc `
		,`cdc_timestamp`
		,`jrn_flag`
		,`record_type`
		,`value_identifier`
		,`value_identifier_bkey`
		,`meta_inserted_datetime_utc`
		,`meta_record_source_type`
		,`meta_record_source_name`
		,`meta_record_source_category`
		,`meta_source_snapshot_datetime_utc`
		,`meta_source_operation_type`
		,`value_type`
		,`value_timestamp`
		,`value_references_dealer_identifier`
		,`value_references_dealer_domain`
		,`value_state_active`
		,`value_state_code`
		,`value_state_adviserregistercode`
		,`value_state_role`
		,`value_state_advisertype`
		,`value_state_displayname`
		,`value_state_companyname`
		,`value_state_contact_title`
		,`value_state_contact_surname`
		,`value_state_contact_givennames`
		,`value_state_contact_firstname`
		,`value_state_contact_salutation`
		,`value_state_contact_email`
		,`value_state_contact_phonenumbers_fax`
		,`value_state_contact_phonenumbers_freecall`
		,`value_state_contact_phonenumbers_mobile`
		,`value_state_contact_phonenumbers_work`
		,`value_state_contact_postaladdress_line0`
		,`value_state_contact_postaladdress_line1`
		,`value_state_contact_postaladdress_line2`
		,`value_state_contact_postaladdress_suburb`
		,`value_state_contact_postaladdress_state`
		,`value_state_contact_postaladdress_postcode`
		,`value_state_contact_postaladdress_country`
		,`value_state_contact_postaladdress_dpid`
		,`value_state_contact_streetaddress_line0`
		,`value_state_contact_streetaddress_line1`
		,`value_state_contact_streetaddress_line2`
		,`value_state_contact_streetaddress_suburb`
		,`value_state_contact_streetaddress_state`
		,`value_state_contact_streetaddress_postcode`
		,`value_state_contact_streetaddress_country`
		,`value_state_contact_streetaddress_dpid`
		,`value_identifier_legalentity`
		,`value_identifier_code`
		,`value_references_dealer_identifier_legalentity`
		,`value_references_dealer_identifier_code`
	)
	WITH `load_init_data` AS 
	( 
		SELECT 
			  CAST('I'  AS STRING) AS `jrn_flag`
			, `ini_src`.`cdc_timestamp` AS `cdc_timestamp`
			, CAST('S' AS STRING) AS `record_type`
			, COALESCE(`ini_src`.`value_identifier`, CAST(`mex_inr_src`.`key_attribute_string` AS STRING)) AS `value_identifier`
			, `ini_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `ini_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `ini_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `ini_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `ini_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `ini_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `ini_src`.`value_type` AS `value_type`
			, `ini_src`.`value_timestamp` AS `value_timestamp`
			, `ini_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `ini_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `ini_src`.`value_state_active` AS `value_state_active`
			, `ini_src`.`value_state_code` AS `value_state_code`
			, `ini_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `ini_src`.`value_state_role` AS `value_state_role`
			, `ini_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `ini_src`.`value_state_displayname` AS `value_state_displayname`
			, `ini_src`.`value_state_companyname` AS `value_state_companyname`
			, `ini_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `ini_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `ini_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `ini_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `ini_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `ini_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `ini_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `ini_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `ini_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `ini_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `ini_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `ini_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `ini_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `ini_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `ini_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `ini_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `ini_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `ini_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `ini_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `ini_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `ini_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `ini_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `ini_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `ini_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `ini_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `ini_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `ini_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `ini_src`.`value_identifier_code` AS `value_identifier_code`
			, `ini_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `ini_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `prj-insignia-udp-raw-evolve_ini`.`statechange_adviser` `ini_src`
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_inr_src` ON  `mex_inr_src`.`record_type` = 'N'
	)
	, `prep_excep` AS 
	( 
		SELECT 
			  `load_init_data`.`jrn_flag` AS `jrn_flag`
			, `load_init_data`.`cdc_timestamp` AS `cdc_timestamp`
			, `load_init_data`.`record_type` AS `record_type`
			, NULL AS `meta_load_cycle_id`
			, `load_init_data`.`value_identifier` AS `value_identifier`
			, `load_init_data`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `load_init_data`.`meta_record_source_type` AS `meta_record_source_type`
			, `load_init_data`.`meta_record_source_name` AS `meta_record_source_name`
			, `load_init_data`.`meta_record_source_category` AS `meta_record_source_category`
			, `load_init_data`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `load_init_data`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `load_init_data`.`value_type` AS `value_type`
			, `load_init_data`.`value_timestamp` AS `value_timestamp`
			, `load_init_data`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `load_init_data`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `load_init_data`.`value_state_active` AS `value_state_active`
			, `load_init_data`.`value_state_code` AS `value_state_code`
			, `load_init_data`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `load_init_data`.`value_state_role` AS `value_state_role`
			, `load_init_data`.`value_state_advisertype` AS `value_state_advisertype`
			, `load_init_data`.`value_state_displayname` AS `value_state_displayname`
			, `load_init_data`.`value_state_companyname` AS `value_state_companyname`
			, `load_init_data`.`value_state_contact_title` AS `value_state_contact_title`
			, `load_init_data`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `load_init_data`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `load_init_data`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `load_init_data`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `load_init_data`.`value_state_contact_email` AS `value_state_contact_email`
			, `load_init_data`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `load_init_data`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `load_init_data`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `load_init_data`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `load_init_data`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `load_init_data`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `load_init_data`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `load_init_data`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `load_init_data`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `load_init_data`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `load_init_data`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `load_init_data`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `load_init_data`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `load_init_data`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `load_init_data`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `load_init_data`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `load_init_data`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `load_init_data`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `load_init_data`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `load_init_data`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `load_init_data`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `load_init_data`.`value_identifier_code` AS `value_identifier_code`
			, `load_init_data`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `load_init_data`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `load_init_data` `load_init_data`
		UNION ALL 
		SELECT 
			  CAST('I'  AS STRING) AS `jrn_flag`
			, PARSE_TIMESTAMP('%d/%m/%Y %H:%M:%S', `mex_ext_src`.`key_attribute_timestamp`) AS `cdc_timestamp`
			, `mex_ext_src`.`record_type` AS `record_type`
			, CAST(`mex_ext_src`.`meta_load_cycle_id`  AS INT64) AS `meta_load_cycle_id`
			, CAST(`mex_ext_src`.`key_attribute_string` AS STRING) AS `value_identifier`
			, PARSE_TIMESTAMP('%d/%m/%Y %H:%M:%S', `mex_ext_src`.`attribute_timestamp`) AS `meta_inserted_datetime_utc`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `meta_record_source_type`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `meta_record_source_name`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `meta_record_source_category`
			, PARSE_TIMESTAMP('%d/%m/%Y %H:%M:%S', `mex_ext_src`.`attribute_timestamp`) AS `meta_source_snapshot_datetime_utc`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `meta_source_operation_type`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_type`
			, PARSE_TIMESTAMP('%d/%m/%Y %H:%M:%S', `mex_ext_src`.`attribute_timestamp`) AS `value_timestamp`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_references_dealer_identifier`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_references_dealer_domain`
			, CAST(`mex_ext_src`.`attribute_bool` AS BOOL) AS `value_state_active`
			, CAST(`mex_ext_src`.`attribute_int64` AS INT64) AS `value_state_code`
			, CAST(`mex_ext_src`.`attribute_int64` AS INT64) AS `value_state_adviserregistercode`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_role`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_advisertype`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_displayname`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_companyname`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_title`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_surname`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_givennames`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_firstname`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_salutation`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_email`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_phonenumbers_fax`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_phonenumbers_freecall`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_phonenumbers_mobile`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_phonenumbers_work`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_line0`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_line1`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_line2`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_suburb`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_state`
			, CAST(`mex_ext_src`.`attribute_int64` AS INT64) AS `value_state_contact_postaladdress_postcode`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_country`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_postaladdress_dpid`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_line0`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_line1`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_line2`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_suburb`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_state`
			, CAST(`mex_ext_src`.`attribute_int64` AS INT64) AS `value_state_contact_streetaddress_postcode`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_country`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_state_contact_streetaddress_dpid`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_identifier_legalentity`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_identifier_code`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_references_dealer_identifier_legalentity`
			, CAST(`mex_ext_src`.`attribute_string` AS STRING) AS `value_references_dealer_identifier_code`
		FROM `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_ext_src`
	)
	, `calculate_bk` AS 
	( 
		SELECT 
			  COALESCE(`prep_excep`.`meta_load_cycle_id`,`lci_src`.`meta_load_cycle_id`) AS `meta_load_cycle_id`
			, `lci_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
			, CASE WHEN `prep_excep`.`record_type` = 'S' THEN `prep_excep`.`cdc_timestamp` ELSE `lci_src`.`meta_inserted_datetime_utc ` END AS `cdc_timestamp`
			, `prep_excep`.`jrn_flag` AS `jrn_flag`
			, `prep_excep`.`record_type` AS `record_type`
			, `prep_excep`.`value_identifier` AS `value_identifier`
			, COALESCE(UPPER(REPLACE(TRIM(`prep_excep`.`value_identifier`),'#','\\' || '#')),`mex_src`.`key_attribute_string`) AS `value_identifier_bkey`
			, `prep_excep`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `prep_excep`.`meta_record_source_type` AS `meta_record_source_type`
			, `prep_excep`.`meta_record_source_name` AS `meta_record_source_name`
			, `prep_excep`.`meta_record_source_category` AS `meta_record_source_category`
			, `prep_excep`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `prep_excep`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `prep_excep`.`value_type` AS `value_type`
			, `prep_excep`.`value_timestamp` AS `value_timestamp`
			, `prep_excep`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `prep_excep`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `prep_excep`.`value_state_active` AS `value_state_active`
			, `prep_excep`.`value_state_code` AS `value_state_code`
			, `prep_excep`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `prep_excep`.`value_state_role` AS `value_state_role`
			, `prep_excep`.`value_state_advisertype` AS `value_state_advisertype`
			, `prep_excep`.`value_state_displayname` AS `value_state_displayname`
			, `prep_excep`.`value_state_companyname` AS `value_state_companyname`
			, `prep_excep`.`value_state_contact_title` AS `value_state_contact_title`
			, `prep_excep`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `prep_excep`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `prep_excep`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `prep_excep`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `prep_excep`.`value_state_contact_email` AS `value_state_contact_email`
			, `prep_excep`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `prep_excep`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `prep_excep`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `prep_excep`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `prep_excep`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `prep_excep`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `prep_excep`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `prep_excep`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `prep_excep`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `prep_excep`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `prep_excep`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `prep_excep`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `prep_excep`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `prep_excep`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `prep_excep`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `prep_excep`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `prep_excep`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `prep_excep`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `prep_excep`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `prep_excep`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `prep_excep`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `prep_excep`.`value_identifier_code` AS `value_identifier_code`
			, `prep_excep`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `prep_excep`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `prep_excep` `prep_excep`
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`load_cycle_info` `lci_src` ON  1 = 1
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_src` ON  1 = 1
		WHERE  `mex_src`.`record_type` = 'N'
	)
	SELECT 
		  `calculate_bk`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `calculate_bk`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `calculate_bk`.`cdc_timestamp` AS `cdc_timestamp`
		, `calculate_bk`.`jrn_flag` AS `jrn_flag`
		, `calculate_bk`.`record_type` AS `record_type`
		, `calculate_bk`.`value_identifier` AS `value_identifier`
		, `calculate_bk`.`value_identifier_bkey` AS `value_identifier_bkey`
		, `calculate_bk`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		, `calculate_bk`.`meta_record_source_type` AS `meta_record_source_type`
		, `calculate_bk`.`meta_record_source_name` AS `meta_record_source_name`
		, `calculate_bk`.`meta_record_source_category` AS `meta_record_source_category`
		, `calculate_bk`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `calculate_bk`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `calculate_bk`.`value_type` AS `value_type`
		, `calculate_bk`.`value_timestamp` AS `value_timestamp`
		, `calculate_bk`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `calculate_bk`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `calculate_bk`.`value_state_active` AS `value_state_active`
		, `calculate_bk`.`value_state_code` AS `value_state_code`
		, `calculate_bk`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `calculate_bk`.`value_state_role` AS `value_state_role`
		, `calculate_bk`.`value_state_advisertype` AS `value_state_advisertype`
		, `calculate_bk`.`value_state_displayname` AS `value_state_displayname`
		, `calculate_bk`.`value_state_companyname` AS `value_state_companyname`
		, `calculate_bk`.`value_state_contact_title` AS `value_state_contact_title`
		, `calculate_bk`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `calculate_bk`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `calculate_bk`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `calculate_bk`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `calculate_bk`.`value_state_contact_email` AS `value_state_contact_email`
		, `calculate_bk`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `calculate_bk`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `calculate_bk`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `calculate_bk`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `calculate_bk`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `calculate_bk`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `calculate_bk`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `calculate_bk`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `calculate_bk`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `calculate_bk`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `calculate_bk`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `calculate_bk`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `calculate_bk`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `calculate_bk`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `calculate_bk`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `calculate_bk`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `calculate_bk`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `calculate_bk`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `calculate_bk`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `calculate_bk`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `calculate_bk`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `calculate_bk`.`value_identifier_code` AS `value_identifier_code`
		, `calculate_bk`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `calculate_bk`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
	FROM `calculate_bk` `calculate_bk`
	;



 
 

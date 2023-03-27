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
	WITH `calculate_bk` AS 
	( 
		SELECT 
			  `lci_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
			, TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 2*row_number() over (order by `tdfv_src`.`cdc_timestamp`)
				MICROSECOND)   AS `meta_inserted_datetime_utc `
			, `tdfv_src`.`cdc_timestamp` AS `cdc_timestamp`
			, `mex_src`.`attribute_string` AS `jrn_flag`
			, `tdfv_src`.`record_type` AS `record_type`
			, `tdfv_src`.`value_identifier` AS `value_identifier`
			, COALESCE(UPPER(REPLACE(TRIM( CAST(`tdfv_src`.`value_identifier` AS STRING)),'#','\\' || '#')),`mex_src`.`key_attribute_string`) AS `value_identifier_bkey`
			, `tdfv_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `tdfv_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `tdfv_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `tdfv_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `tdfv_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `tdfv_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `tdfv_src`.`value_type` AS `value_type`
			, `tdfv_src`.`value_timestamp` AS `value_timestamp`
			, `tdfv_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `tdfv_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `tdfv_src`.`value_state_active` AS `value_state_active`
			, `tdfv_src`.`value_state_code` AS `value_state_code`
			, `tdfv_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `tdfv_src`.`value_state_role` AS `value_state_role`
			, `tdfv_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `tdfv_src`.`value_state_displayname` AS `value_state_displayname`
			, `tdfv_src`.`value_state_companyname` AS `value_state_companyname`
			, `tdfv_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `tdfv_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `tdfv_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `tdfv_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `tdfv_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `tdfv_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `tdfv_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `tdfv_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `tdfv_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `tdfv_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `tdfv_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `tdfv_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `tdfv_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `tdfv_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `tdfv_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `tdfv_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `tdfv_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `tdfv_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `tdfv_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `tdfv_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `tdfv_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `tdfv_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `tdfv_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `tdfv_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `tdfv_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `tdfv_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `tdfv_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `tdfv_src`.`value_identifier_code` AS `value_identifier_code`
			, `tdfv_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `tdfv_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `prj-insignia-udp-raw-evolve_dfv`.`vw_statechange_adviser` `tdfv_src`
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`load_cycle_info` `lci_src` ON  1 = 1
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_src` ON  1 = 1
		WHERE  `mex_src`.`record_type` = 'N'
	)
	, `ext_union` AS 
	( 
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
	)
	SELECT 
		  `ext_union`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `ext_union`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `ext_union`.`cdc_timestamp` AS `cdc_timestamp`
		, `ext_union`.`jrn_flag` AS `jrn_flag`
		, `ext_union`.`record_type` AS `record_type`
		, `ext_union`.`value_identifier` AS `value_identifier`
		, `ext_union`.`value_identifier_bkey` AS `value_identifier_bkey`
		, `ext_union`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		, `ext_union`.`meta_record_source_type` AS `meta_record_source_type`
		, `ext_union`.`meta_record_source_name` AS `meta_record_source_name`
		, `ext_union`.`meta_record_source_category` AS `meta_record_source_category`
		, `ext_union`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `ext_union`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `ext_union`.`value_type` AS `value_type`
		, `ext_union`.`value_timestamp` AS `value_timestamp`
		, `ext_union`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `ext_union`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `ext_union`.`value_state_active` AS `value_state_active`
		, `ext_union`.`value_state_code` AS `value_state_code`
		, `ext_union`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `ext_union`.`value_state_role` AS `value_state_role`
		, `ext_union`.`value_state_advisertype` AS `value_state_advisertype`
		, `ext_union`.`value_state_displayname` AS `value_state_displayname`
		, `ext_union`.`value_state_companyname` AS `value_state_companyname`
		, `ext_union`.`value_state_contact_title` AS `value_state_contact_title`
		, `ext_union`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `ext_union`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `ext_union`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `ext_union`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `ext_union`.`value_state_contact_email` AS `value_state_contact_email`
		, `ext_union`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `ext_union`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `ext_union`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `ext_union`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `ext_union`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `ext_union`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `ext_union`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `ext_union`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `ext_union`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `ext_union`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `ext_union`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `ext_union`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `ext_union`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `ext_union`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `ext_union`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `ext_union`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `ext_union`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `ext_union`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `ext_union`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `ext_union`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `ext_union`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `ext_union`.`value_identifier_code` AS `value_identifier_code`
		, `ext_union`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `ext_union`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
	FROM `ext_union` `ext_union`
	;



 
 

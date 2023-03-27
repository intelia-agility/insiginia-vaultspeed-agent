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



-- stg_tgt

	DELETE FROM `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser` WHERE 1=1;

	INSERT INTO `prj-insignia-udp-raw-evolve_stg`.`statechange_adviser`(
		 `adviser_hkey`
		,`meta_inserted_datetime_utc `
		,`meta_load_cycle_id`
		,`meta_record_source_system`
		,`meta_record_source_name`
		,`cdc_timestamp`
		,`jrn_flag`
		,`record_type`
		,`value_identifier`
		,`adviser_bkey`
		,`meta_inserted_datetime_utc`
		,`meta_record_source_type`
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
	SELECT 
		  UPPER(TO_HEX(SHA256( 'global_key' || '#' || `ext_src`.`value_identifier_bkey` || '#' ))) AS `adviser_hkey`
		, `ext_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `ext_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, 'global_key' AS `meta_record_source_system`
		, 'Evolve.statechange_adviser' AS `meta_record_source_name`
		, `ext_src`.`cdc_timestamp` AS `cdc_timestamp`
		, `ext_src`.`jrn_flag` AS `jrn_flag`
		, `ext_src`.`record_type` AS `record_type`
		, `ext_src`.`value_identifier` AS `value_identifier`
		, `ext_src`.`value_identifier_bkey` AS `adviser_bkey`
		, `ext_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		, `ext_src`.`meta_record_source_type` AS `meta_record_source_type`
		, `ext_src`.`meta_record_source_category` AS `meta_record_source_category`
		, `ext_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `ext_src`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `ext_src`.`value_type` AS `value_type`
		, `ext_src`.`value_timestamp` AS `value_timestamp`
		, `ext_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `ext_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `ext_src`.`value_state_active` AS `value_state_active`
		, `ext_src`.`value_state_code` AS `value_state_code`
		, `ext_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `ext_src`.`value_state_role` AS `value_state_role`
		, `ext_src`.`value_state_advisertype` AS `value_state_advisertype`
		, `ext_src`.`value_state_displayname` AS `value_state_displayname`
		, `ext_src`.`value_state_companyname` AS `value_state_companyname`
		, `ext_src`.`value_state_contact_title` AS `value_state_contact_title`
		, `ext_src`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `ext_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `ext_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `ext_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `ext_src`.`value_state_contact_email` AS `value_state_contact_email`
		, `ext_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `ext_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `ext_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `ext_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `ext_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `ext_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `ext_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `ext_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `ext_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `ext_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `ext_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `ext_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `ext_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `ext_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `ext_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `ext_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `ext_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `ext_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `ext_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `ext_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `ext_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `ext_src`.`value_identifier_code` AS `value_identifier_code`
		, `ext_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `ext_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
	FROM `prj-insignia-udp-raw-evolve_ext`.`statechange_adviser` `ext_src`
	INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_src` ON  `mex_src`.`record_type` = 'U'
	;



 
 

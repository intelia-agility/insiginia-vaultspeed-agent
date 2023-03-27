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


DROP VIEW IF EXISTS `RDV_BV`.`sat_udp_raw_evolve_adviser`;
CREATE  VIEW `RDV_BV`.`sat_udp_raw_evolve_adviser`  AS 
	SELECT 
		  `dvt_src`.`adviser_hkey` AS `adviser_hkey`
		, `dvt_src`.`meta_inserted_datetime_utc ` AS `meta_inserted_datetime_utc `
		, `dvt_src`.`cdc_timestamp` AS `cdc_timestamp`
		, `dvt_src`.`meta_load_cycle_id` AS `meta_load_cycle_id`
		, `dvt_src`.`value_identifier` AS `value_identifier`
		, `dvt_src`.`meta_hash_diff` AS `meta_hash_diff`
		, `dvt_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		, `dvt_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `dvt_src`.`value_identifier_code` AS `value_identifier_code`
		, `dvt_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `dvt_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `dvt_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `dvt_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `dvt_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `dvt_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `dvt_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `dvt_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `dvt_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `dvt_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `dvt_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `dvt_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `dvt_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `dvt_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `dvt_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `dvt_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `dvt_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `dvt_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `dvt_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `dvt_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `dvt_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `dvt_src`.`value_state_contact_email` AS `value_state_contact_email`
		, `dvt_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `dvt_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `dvt_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `dvt_src`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `dvt_src`.`value_state_contact_title` AS `value_state_contact_title`
		, `dvt_src`.`value_state_companyname` AS `value_state_companyname`
		, `dvt_src`.`value_state_displayname` AS `value_state_displayname`
		, `dvt_src`.`value_state_advisertype` AS `value_state_advisertype`
		, `dvt_src`.`value_state_role` AS `value_state_role`
		, `dvt_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `dvt_src`.`value_state_code` AS `value_state_code`
		, `dvt_src`.`value_state_active` AS `value_state_active`
		, `dvt_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `dvt_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `dvt_src`.`value_timestamp` AS `value_timestamp`
		, `dvt_src`.`value_type` AS `value_type`
		, `dvt_src`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `dvt_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `dvt_src`.`meta_record_source_category` AS `meta_record_source_category`
		, `dvt_src`.`meta_record_source_name` AS `meta_record_source_name`
		, `dvt_src`.`meta_record_source_type` AS `meta_record_source_type`
		, `dvt_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		, `dvt_src`.`meta_is_deleted` AS `meta_is_deleted`
	FROM `RDV_FL`.`sat_udp_raw_evolve_adviser` `dvt_src`
	;

 
 

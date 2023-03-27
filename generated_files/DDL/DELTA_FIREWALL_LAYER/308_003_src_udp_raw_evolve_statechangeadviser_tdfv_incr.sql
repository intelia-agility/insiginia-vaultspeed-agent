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


DROP VIEW IF EXISTS `prj-insignia-udp-raw-evolve_dfv`.`vw_statechange_adviser`;
CREATE  VIEW `prj-insignia-udp-raw-evolve_dfv`.`vw_statechange_adviser`  AS 
	WITH `delta_window` AS 
	( 
		SELECT 
			  `lwt_src`.`fmc_begin_lw_timestamp` AS `fmc_begin_lw_timestamp`
			, `lwt_src`.`fmc_end_lw_timestamp` AS `fmc_end_lw_timestamp`
		FROM `prj-insignia-udp-raw-evolve_mtd`.`fmc_loading_window_table` `lwt_src`
	)
	, `delta_view_filter` AS 
	( 
		SELECT 
			  `cdc_src`.`cdc_timestamp` AS `cdc_timestamp`
			, CAST('S'  AS STRING) AS `record_type`
			, `cdc_src`.`value_identifier` AS `value_identifier`
			, `cdc_src`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `cdc_src`.`meta_record_source_type` AS `meta_record_source_type`
			, `cdc_src`.`meta_record_source_name` AS `meta_record_source_name`
			, `cdc_src`.`meta_record_source_category` AS `meta_record_source_category`
			, `cdc_src`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `cdc_src`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `cdc_src`.`value_type` AS `value_type`
			, `cdc_src`.`value_timestamp` AS `value_timestamp`
			, `cdc_src`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `cdc_src`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `cdc_src`.`value_state_active` AS `value_state_active`
			, `cdc_src`.`value_state_code` AS `value_state_code`
			, `cdc_src`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `cdc_src`.`value_state_role` AS `value_state_role`
			, `cdc_src`.`value_state_advisertype` AS `value_state_advisertype`
			, `cdc_src`.`value_state_displayname` AS `value_state_displayname`
			, `cdc_src`.`value_state_companyname` AS `value_state_companyname`
			, `cdc_src`.`value_state_contact_title` AS `value_state_contact_title`
			, `cdc_src`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `cdc_src`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `cdc_src`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `cdc_src`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `cdc_src`.`value_state_contact_email` AS `value_state_contact_email`
			, `cdc_src`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `cdc_src`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `cdc_src`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `cdc_src`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `cdc_src`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `cdc_src`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `cdc_src`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `cdc_src`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `cdc_src`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `cdc_src`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `cdc_src`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `cdc_src`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `cdc_src`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `cdc_src`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `cdc_src`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `cdc_src`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `cdc_src`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `cdc_src`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `cdc_src`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `cdc_src`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `cdc_src`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `cdc_src`.`value_identifier_code` AS `value_identifier_code`
			, `cdc_src`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `cdc_src`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `prj-insignia-udp-raw-evolve_cdc`.`cdc_statechange_adviser` `cdc_src`
		INNER JOIN `delta_window` `delta_window` ON  1 = 1
		WHERE  `cdc_src`.`cdc_timestamp` > `delta_window`.`fmc_begin_lw_timestamp` AND `cdc_src`.`cdc_timestamp` <= `delta_window`.`fmc_end_lw_timestamp`
	)
	, `delta_view` AS 
	( 
		SELECT 
			  `delta_view_filter`.`cdc_timestamp` AS `cdc_timestamp`
			, `delta_view_filter`.`record_type` AS `record_type`
			, `delta_view_filter`.`value_identifier` AS `value_identifier`
			, `delta_view_filter`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `delta_view_filter`.`meta_record_source_type` AS `meta_record_source_type`
			, `delta_view_filter`.`meta_record_source_name` AS `meta_record_source_name`
			, `delta_view_filter`.`meta_record_source_category` AS `meta_record_source_category`
			, `delta_view_filter`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `delta_view_filter`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `delta_view_filter`.`value_type` AS `value_type`
			, `delta_view_filter`.`value_timestamp` AS `value_timestamp`
			, `delta_view_filter`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `delta_view_filter`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `delta_view_filter`.`value_state_active` AS `value_state_active`
			, `delta_view_filter`.`value_state_code` AS `value_state_code`
			, `delta_view_filter`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `delta_view_filter`.`value_state_role` AS `value_state_role`
			, `delta_view_filter`.`value_state_advisertype` AS `value_state_advisertype`
			, `delta_view_filter`.`value_state_displayname` AS `value_state_displayname`
			, `delta_view_filter`.`value_state_companyname` AS `value_state_companyname`
			, `delta_view_filter`.`value_state_contact_title` AS `value_state_contact_title`
			, `delta_view_filter`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `delta_view_filter`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `delta_view_filter`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `delta_view_filter`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `delta_view_filter`.`value_state_contact_email` AS `value_state_contact_email`
			, `delta_view_filter`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `delta_view_filter`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `delta_view_filter`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `delta_view_filter`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `delta_view_filter`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `delta_view_filter`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `delta_view_filter`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `delta_view_filter`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `delta_view_filter`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `delta_view_filter`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `delta_view_filter`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `delta_view_filter`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `delta_view_filter`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `delta_view_filter`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `delta_view_filter`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `delta_view_filter`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `delta_view_filter`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `delta_view_filter`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `delta_view_filter`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `delta_view_filter`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `delta_view_filter`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `delta_view_filter`.`value_identifier_code` AS `value_identifier_code`
			, `delta_view_filter`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `delta_view_filter`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `delta_view_filter` `delta_view_filter`
	)
	, `prepjoinbk` AS 
	( 
		SELECT 
			  `delta_view`.`cdc_timestamp` AS `cdc_timestamp`
			, `delta_view`.`record_type` AS `record_type`
			, COALESCE(`delta_view`.`value_identifier`,`mex_bk_src`.`key_attribute_string`) AS `value_identifier`
			, `delta_view`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
			, `delta_view`.`meta_record_source_type` AS `meta_record_source_type`
			, `delta_view`.`meta_record_source_name` AS `meta_record_source_name`
			, `delta_view`.`meta_record_source_category` AS `meta_record_source_category`
			, `delta_view`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
			, `delta_view`.`meta_source_operation_type` AS `meta_source_operation_type`
			, `delta_view`.`value_type` AS `value_type`
			, `delta_view`.`value_timestamp` AS `value_timestamp`
			, `delta_view`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
			, `delta_view`.`value_references_dealer_domain` AS `value_references_dealer_domain`
			, `delta_view`.`value_state_active` AS `value_state_active`
			, `delta_view`.`value_state_code` AS `value_state_code`
			, `delta_view`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
			, `delta_view`.`value_state_role` AS `value_state_role`
			, `delta_view`.`value_state_advisertype` AS `value_state_advisertype`
			, `delta_view`.`value_state_displayname` AS `value_state_displayname`
			, `delta_view`.`value_state_companyname` AS `value_state_companyname`
			, `delta_view`.`value_state_contact_title` AS `value_state_contact_title`
			, `delta_view`.`value_state_contact_surname` AS `value_state_contact_surname`
			, `delta_view`.`value_state_contact_givennames` AS `value_state_contact_givennames`
			, `delta_view`.`value_state_contact_firstname` AS `value_state_contact_firstname`
			, `delta_view`.`value_state_contact_salutation` AS `value_state_contact_salutation`
			, `delta_view`.`value_state_contact_email` AS `value_state_contact_email`
			, `delta_view`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
			, `delta_view`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
			, `delta_view`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
			, `delta_view`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
			, `delta_view`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
			, `delta_view`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
			, `delta_view`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
			, `delta_view`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
			, `delta_view`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
			, `delta_view`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
			, `delta_view`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
			, `delta_view`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
			, `delta_view`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
			, `delta_view`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
			, `delta_view`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
			, `delta_view`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
			, `delta_view`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
			, `delta_view`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
			, `delta_view`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
			, `delta_view`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
			, `delta_view`.`value_identifier_legalentity` AS `value_identifier_legalentity`
			, `delta_view`.`value_identifier_code` AS `value_identifier_code`
			, `delta_view`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
			, `delta_view`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
		FROM `delta_view` `delta_view`
		INNER JOIN `prj-insignia-udp-raw-evolve_mtd`.`mtd_exception_records` `mex_bk_src` ON  1 = 1
		WHERE  `mex_bk_src`.`record_type` = 'N'
	)
	SELECT 
		  `prepjoinbk`.`cdc_timestamp` AS `cdc_timestamp`
		, `prepjoinbk`.`record_type` AS `record_type`
		, `prepjoinbk`.`value_identifier` AS `value_identifier`
		, `prepjoinbk`.`meta_inserted_datetime_utc` AS `meta_inserted_datetime_utc`
		, `prepjoinbk`.`meta_record_source_type` AS `meta_record_source_type`
		, `prepjoinbk`.`meta_record_source_name` AS `meta_record_source_name`
		, `prepjoinbk`.`meta_record_source_category` AS `meta_record_source_category`
		, `prepjoinbk`.`meta_source_snapshot_datetime_utc` AS `meta_source_snapshot_datetime_utc`
		, `prepjoinbk`.`meta_source_operation_type` AS `meta_source_operation_type`
		, `prepjoinbk`.`value_type` AS `value_type`
		, `prepjoinbk`.`value_timestamp` AS `value_timestamp`
		, `prepjoinbk`.`value_references_dealer_identifier` AS `value_references_dealer_identifier`
		, `prepjoinbk`.`value_references_dealer_domain` AS `value_references_dealer_domain`
		, `prepjoinbk`.`value_state_active` AS `value_state_active`
		, `prepjoinbk`.`value_state_code` AS `value_state_code`
		, `prepjoinbk`.`value_state_adviserregistercode` AS `value_state_adviserregistercode`
		, `prepjoinbk`.`value_state_role` AS `value_state_role`
		, `prepjoinbk`.`value_state_advisertype` AS `value_state_advisertype`
		, `prepjoinbk`.`value_state_displayname` AS `value_state_displayname`
		, `prepjoinbk`.`value_state_companyname` AS `value_state_companyname`
		, `prepjoinbk`.`value_state_contact_title` AS `value_state_contact_title`
		, `prepjoinbk`.`value_state_contact_surname` AS `value_state_contact_surname`
		, `prepjoinbk`.`value_state_contact_givennames` AS `value_state_contact_givennames`
		, `prepjoinbk`.`value_state_contact_firstname` AS `value_state_contact_firstname`
		, `prepjoinbk`.`value_state_contact_salutation` AS `value_state_contact_salutation`
		, `prepjoinbk`.`value_state_contact_email` AS `value_state_contact_email`
		, `prepjoinbk`.`value_state_contact_phonenumbers_fax` AS `value_state_contact_phonenumbers_fax`
		, `prepjoinbk`.`value_state_contact_phonenumbers_freecall` AS `value_state_contact_phonenumbers_freecall`
		, `prepjoinbk`.`value_state_contact_phonenumbers_mobile` AS `value_state_contact_phonenumbers_mobile`
		, `prepjoinbk`.`value_state_contact_phonenumbers_work` AS `value_state_contact_phonenumbers_work`
		, `prepjoinbk`.`value_state_contact_postaladdress_line0` AS `value_state_contact_postaladdress_line0`
		, `prepjoinbk`.`value_state_contact_postaladdress_line1` AS `value_state_contact_postaladdress_line1`
		, `prepjoinbk`.`value_state_contact_postaladdress_line2` AS `value_state_contact_postaladdress_line2`
		, `prepjoinbk`.`value_state_contact_postaladdress_suburb` AS `value_state_contact_postaladdress_suburb`
		, `prepjoinbk`.`value_state_contact_postaladdress_state` AS `value_state_contact_postaladdress_state`
		, `prepjoinbk`.`value_state_contact_postaladdress_postcode` AS `value_state_contact_postaladdress_postcode`
		, `prepjoinbk`.`value_state_contact_postaladdress_country` AS `value_state_contact_postaladdress_country`
		, `prepjoinbk`.`value_state_contact_postaladdress_dpid` AS `value_state_contact_postaladdress_dpid`
		, `prepjoinbk`.`value_state_contact_streetaddress_line0` AS `value_state_contact_streetaddress_line0`
		, `prepjoinbk`.`value_state_contact_streetaddress_line1` AS `value_state_contact_streetaddress_line1`
		, `prepjoinbk`.`value_state_contact_streetaddress_line2` AS `value_state_contact_streetaddress_line2`
		, `prepjoinbk`.`value_state_contact_streetaddress_suburb` AS `value_state_contact_streetaddress_suburb`
		, `prepjoinbk`.`value_state_contact_streetaddress_state` AS `value_state_contact_streetaddress_state`
		, `prepjoinbk`.`value_state_contact_streetaddress_postcode` AS `value_state_contact_streetaddress_postcode`
		, `prepjoinbk`.`value_state_contact_streetaddress_country` AS `value_state_contact_streetaddress_country`
		, `prepjoinbk`.`value_state_contact_streetaddress_dpid` AS `value_state_contact_streetaddress_dpid`
		, `prepjoinbk`.`value_identifier_legalentity` AS `value_identifier_legalentity`
		, `prepjoinbk`.`value_identifier_code` AS `value_identifier_code`
		, `prepjoinbk`.`value_references_dealer_identifier_legalentity` AS `value_references_dealer_identifier_legalentity`
		, `prepjoinbk`.`value_references_dealer_identifier_code` AS `value_references_dealer_identifier_code`
	FROM `prepjoinbk` `prepjoinbk`
	;

 
 

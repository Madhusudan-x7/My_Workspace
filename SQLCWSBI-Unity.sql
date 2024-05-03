CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentlines LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentlines COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocuments LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocuments COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentsubmodels LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentsubmodels COPY LOCATION;

CREATE TABLE IF NOT EXISTS dev_silver.cws_custom.production_sites LIKE hive_metastore.silver.sql01_cws_cc_custom_production_sites COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.dbo_customers LIKE hive_metastore.silver.sql01_cws_cc_bi_dbo_customers COPY LOCATION;



dev_silver.cws_bi.pelladw_salesdocumentlines
dev_silver.cws_bi.pelladw_salesdocuments
dev_silver.cws_bi.pelladw_salesdocumentsubmodels
dev_silver.cws_bi.dbo_customers
dev_silver.cws_custom.production_sites


silver.sql01_cws_cc_bi_pelladw_salesdocumentlines
silver.sql01_cws_cc_bi_pelladw_salesdocuments
silver.sql01_cws_cc_bi_pelladw_salesdocumentsubmodels
silver.sql01_cws_cc_bi_dbo_customers
silver.sql01_cws_cc_custom_production_sites


===================================================================================================================================================================
select * from [etl].[ControlTableSourceToAdlsLoad] where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake'

update  [etl].[ControlTableSourceToAdlsLoad] set UCFlag = 'Y' where SourceTableName in ('SalesDocumentLines','SalesDocuments','SalesDocumentSubmodels') and PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake';
update  [etl].[ControlTableSourceToAdlsLoad] set IsActiveFlag = 'Y' where SourceTableName in ('SalesDocumentLines','SalesDocuments','SalesDocumentSubmodels') and PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake';


SELECT * FROM [etl].[LinkedServiceConnectionStore] WHERE UCSchemaPrefix  = 'CWS'
update  [etl].[ControlTableSourceToAdlsLoad] set UCFlag = 'N' where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake'  and SourceTableName = 'ExternalSalesOrdersShipmentStatus';;

update  [etl].[ControlTableSourceToAdlsLoad] set IsActiveFlag = 'N' where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake' and SourceTableName = 'ExternalSalesOrdersShipmentStatus';

==========================================================================================
CREATE SCHEMA IF NOT EXISTS dev_silver.cws_bi;
CREATE SCHEMA IF NOT EXISTS dev_silver.cws_custom;

CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentlines LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentlines COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocuments LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocuments COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentsubmodels LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentsubmodels COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.dbo_customers LIKE hive_metastore.silver.sql01_cws_cc_bi_dbo_customers COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_custom.production_sites LIKE hive_metastore.silver.sql01_cws_cc_custom_production_sites COPY LOCATION;


select max(ETLDate) from dev_silver.cws_bi.pelladw_salesdocumentlines
select * from dev_silver.cws_bi.pelladw_salesdocuments
select * from dev_silver.cws_bi.pelladw_salesdocumentsubmodels
select * from dev_silver.cws_bi.dbo_customers
select * from dev_silver.cws_custom.production_sites


CREATE TABLE IF NOT EXISTS dev_gold.order_transparency.shipment LIKE hive_metastore.entities_gold.shipment COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_gold.order_transparency.package LIKE hive_metastore.entities_gold.package COPY LOCATION;









select * from [etl].[ControlTableSourceToAdlsLoad] where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake'

update  [etl].[ControlTableSourceToAdlsLoad] set UCFlag = 'Y' where SourceTableName in ('SalesDocumentLines','SalesDocuments','SalesDocumentSubmodels') and PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake';
update  [etl].[ControlTableSourceToAdlsLoad] set IsActiveFlag = 'Y' where SourceTableName in ('SalesDocumentLines','SalesDocuments','SalesDocumentSubmodels') and PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake';


SELECT * FROM [etl].[LinkedServiceConnectionStore] WHERE UCSchemaPrefix  = 'CWS'

update  [etl].[ControlTableSourceToAdlsLoad] set UCFlag = 'Y' where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake'  and SourceTableName != 'ExternalSalesOrdersShipmentStatus';;
update  [etl].[ControlTableSourceToAdlsLoad] set IsActiveFlag = 'Y' where PipelineTriggerName = 'trgExtraxctLoadSQLCWSBI_toDataLake' and SourceTableName != 'ExternalSalesOrdersShipmentStatus';



CREATE SCHEMA IF NOT EXISTS dev_silver.cws_bi;
CREATE SCHEMA IF NOT EXISTS dev_silver.cws_custom;

CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentlines LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentlines COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocuments LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocuments COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.pelladw_salesdocumentsubmodels LIKE hive_metastore.silver.sql01_cws_cc_bi_pelladw_salesdocumentsubmodels COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_bi.dbo_customers LIKE hive_metastore.silver.sql01_cws_cc_bi_dbo_customers COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_silver.cws_custom.production_sites LIKE hive_metastore.silver.sql01_cws_cc_custom_production_sites COPY LOCATION;



select max(ETLDate) from dev_silver.cws_bi.pelladw_salesdocumentlines
select * from dev_silver.cws_bi.pelladw_salesdocuments
select * from dev_silver.cws_bi.pelladw_salesdocumentsubmodels
select * from dev_silver.cws_bi.dbo_customers
select * from dev_silver.cws_custom.production_sites


CREATE TABLE IF NOT EXISTS dev_gold.order_transparency.shipment LIKE hive_metastore.entities_gold.shipment COPY LOCATION;
CREATE TABLE IF NOT EXISTS dev_gold.order_transparency.package LIKE hive_metastore.entities_gold.package COPY LOCATION;














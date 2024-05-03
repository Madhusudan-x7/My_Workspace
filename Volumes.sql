--- Create an external volume under the directory “my-path”
> CREATE EXTERNAL IF NOT EXISTS VOLUME dev_gold.ftp.ftp
        COMMENT 'This is my example external volume'
        LOCATION 's3://my-bucket/my-location/my-path'

--- Set the current catalog
> USE CATALOG dev_gold;


--- Set the current schema
> USE SCHEMA ftp;


--- Create a managed volume; it is not necessary to specify a location
> CREATE VOLUME myManagedVolume
    COMMENT 'This is my example managed volume'; 


--- List the files inside the volume, all names are lowercase
> LIST '/Volumes/dev_gold/ftp/myexternalvolume'
Output - sample.csv


> LIST 'dbfs:/Volumes/dev_gold/ftp/mymanagedvolume'
Output - sample.csv


--- Print the content of a csv file
> SELECT * FROM csv."/Volumes/dev_gold/ftp/myexternalvolume/sample.csv"
Output - 20


> SELECT * FROM csv."dbfs:/Volumes/dev_gold/ftp/mymanagedvolume/sample.csv"
Output - 20

--- Write a csv file to volumes using pandas pyspark

VolumeFileName = "sample"
VolumeFilePath = "/Volumes/dev_gold/ftp/zilliant/"+ VolumeFileName + ".csv"
print(VolumeFilePath)

os.makedirs(os.path.dirname(VolumeFilePath), exist_ok=True)
pd = df_spark.toPandas()
pd.to_csv(VolumeFilePath, header=True, sep=",", index=False)



CREATE SCHEMA IF NOT EXISTS dev_gold.adls;
--drop volumes dev_gold.ftp.ftp;

CREATE EXTERNAL VOLUME dev_gold.adls.ftp_zilliant
COMMENT 'This volume is used to write csv file to adls'
LOCATION 'abfss://master@stdlalds2uscdev.dfs.core.windows.net/ftp/zilliant';

DESCRIBE volume dev_gold.adls.ftp_zilliant;

-- subhash created volume dev_gold.ftp.ftp 
-- tested with zilliant files, then dropped it.
-- Amy created another volume dev_gold.adls.ftp_zilliant.
-- Amy asked to change the volume path to use new one, and UnityCatalogName to use "_gold". dev,test,prod should be parameterized.


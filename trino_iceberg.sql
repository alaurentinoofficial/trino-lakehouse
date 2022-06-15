-- Create schema
CREATE SCHEMA IF NOT EXISTS lake.vendors
WITH (LOCATION = 's3a://gold/')

DROP SCHEMA lake.vendors

DESCRIBE lake.gold


-- Create a table
CREATE TABLE lake.vendors.my_partitioned_table_iceberg
WITH (
	format = 'PARQUET'
)
AS SELECT name, comment, regionkey FROM tpch.tiny.nation;


-- Describe the table
DESCRIBE lake.teste.my_partitioned_table_iceberg


-- Select in the table
SELECT * FROM lake.teste.my_partitioned_table_iceberg;


-- Show the partitions
SELECT * FROM lake.teste."my_partitioned_table_iceberg$partitions"


-- Show the snapshots
SELECT * FROM lake.teste."my_partitioned_table_iceberg$snapshots";
-- Insert item
INSERT INTO lake.teste.my_partitioned_table_iceberg (name, comment, regionkey) VALUES ('teste', 'teste2', 20);
-- Show the snapshots after insert item
SELECT * FROM lake.teste."my_partitioned_table_iceberg$snapshots";


-- Drop everything
DROP TABLE lake.teste.my_partitioned_table_iceberg;
DROP SCHEMA lake.teste;
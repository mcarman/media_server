-- *********************************************************************
-- SQL to roll back currently unexecuted changes
-- *********************************************************************
-- Change Log: classpath:liquibase/db-changelog.xml
-- Ran at: 2/8/24, 5:46 PM
-- Against: SA@jdbc:hsqldb:file:/config/db/airsonic;hsqldb.tx=mvcc;sql.enforce_size=false;sql.char_literal=false;sql.nulls_first=false;sql.pad_space=false;hsqldb.defrag_limit=50;shutdown=true
-- Liquibase version: 4.6.2
-- *********************************************************************

-- Lock Database
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = TRUE, LOCKEDBY = '67e889082322 (10.5.0.4)', LOCKGRANTED = '2024-02-08 17:46:39.706' WHERE ID = 1 AND LOCKED = FALSE;

-- Release Database Lock
UPDATE PUBLIC.DATABASECHANGELOGLOCK SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


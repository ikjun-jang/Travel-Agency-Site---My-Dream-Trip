--------------------------------------------------------
--  ������ ������ - �ݿ���-5��-08-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRIP_COUNTRY
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TRIP_COUNTRY" 
   (	"COUNTRYNO" NUMBER(10,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"IMG" VARCHAR2(200 BYTE), 
	"BACKIMG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TRIP_COUNTRY
SET DEFINE OFF;
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (1,'������','../images/country/france.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (2,'�߱�','../images/country/china.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (3,'������','../images/country/spain.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (4,'��Ż����','../images/country/italia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (5,'�븸','../images/country/taiwan.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (6,'����','../images/country/uk.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (7,'�̱�','../images/country/america.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (8,'����Ʈ����','../images/country/austria.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (9,'ȫ��','../images/country/hongkong.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (10,'����','../images/country/germany.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (11,'�ѱ�','../images/country/korea.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (12,'�Ϻ�','../images/country/japan.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (13,'�ε��׽þ�','../images/country/indonesia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (14,'�±�','../images/country/thailand.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (15,'�ʸ���','../images/country/philippines.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (16,'�״�����','../images/country/netherlands.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (17,'���þ�','../images/country/russia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (18,'ü��','../images/country/czech.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (19,'ĳ����','../images/country/canada.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (20,'����Ʈ���ϸ���','../images/country/australia.png',null);
--------------------------------------------------------
--  DDL for Index COUNTRY_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."COUNTRY_NO_PK" ON "SCOTT"."TRIP_COUNTRY" ("COUNTRYNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRIP_COUNTRY
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_COUNTRY" ADD CONSTRAINT "COUNTRY_NO_PK" PRIMARY KEY ("COUNTRYNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."TRIP_COUNTRY" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_COUNTRY" MODIFY ("IMG" NOT NULL ENABLE);
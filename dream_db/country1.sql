--------------------------------------------------------
--  파일이 생성됨 - 금요일-5월-08-2015   
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
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (1,'프랑스','../images/country/france.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (2,'중국','../images/country/china.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (3,'스페인','../images/country/spain.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (4,'이탈리아','../images/country/italia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (5,'대만','../images/country/taiwan.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (6,'영국','../images/country/uk.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (7,'미국','../images/country/america.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (8,'오스트리아','../images/country/austria.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (9,'홍콩','../images/country/hongkong.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (10,'독일','../images/country/germany.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (11,'한국','../images/country/korea.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (12,'일본','../images/country/japan.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (13,'인도네시아','../images/country/indonesia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (14,'태국','../images/country/thailand.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (15,'필리핀','../images/country/philippines.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (16,'네덜란드','../images/country/netherlands.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (17,'러시아','../images/country/russia.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (18,'체코','../images/country/czech.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (19,'캐나다','../images/country/canada.png',null);
Insert into SCOTT.TRIP_COUNTRY (COUNTRYNO,NAME,IMG,BACKIMG) values (20,'오스트레일리아','../images/country/australia.png',null);
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

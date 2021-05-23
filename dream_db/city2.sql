--------------------------------------------------------
--  ������ ������ - �ݿ���-5��-08-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRIP_CITY
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TRIP_CITY" 
   (	"CITYNUM" NUMBER(3,0), 
	"CITYNAME" VARCHAR2(10 BYTE), 
	"IMG" VARCHAR2(100 BYTE), 
	"COUNTRYNO" NUMBER(10,0), 
	"BIGIMG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TRIP_CITY
SET DEFINE OFF;
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (2,'�ĸ�','../images/city/paris.png',1,'../images/city/paris.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (3,'����¡','../images/city/beijing.jpg',2,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (4,'�ٸ����γ�','../images/city/barcelona.png',3,'../images/city/spain.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (5,'�θ�','../images/city/roma.png',4,'../images/city/roma.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (6,'Ÿ������','../images/city/taipei.png',5,'../images/city/tai.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (7,'����','../images/city/london.png',6,'../images/city/london.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (8,'����','../images/city/newyork.png',7,'../images/city/newyork.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (9,'�񿣳�','../images/city/vienna.png',8,'../images/city/vienna.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (10,'�Ƿ�ü','../images/city/firenze.png',4,'../images/city/Firenze.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (11,'ȫ��','../images/city/hong.png',9,'../images/city/hongkong.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (12,'������','../images/city/berlin.png',10,'../images/city/Berlin.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (13,'�󽺺�����','..',7,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (14,'Ķ�����Ͼ�','..',7,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (15,'���ֵ�','..',11,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (16,'����ī','..',12,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (17,'������ī','..',12,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (18,'�߸�','..',13,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (19,'Ǫ��','..',14,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (20,'����','..',14,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (21,'����ī��','..',15,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (22,'�Ͻ��׸���','..',16,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (23,'���帮��','..',3,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (24,'��ũ��','..',17,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (25,'������','..',18,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (26,'������','..',19,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (27,'�����','..',20,null);
--------------------------------------------------------
--  DDL for Index CITY_CN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CITY_CN_PK" ON "SCOTT"."TRIP_CITY" ("CITYNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRIP_CITY
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_CITY" ADD CONSTRAINT "CITY_CN_PK" PRIMARY KEY ("CITYNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."TRIP_CITY" MODIFY ("CITYNAME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_CITY" MODIFY ("IMG" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRIP_CITY
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_CITY" ADD CONSTRAINT "CITY_CNO_FK" FOREIGN KEY ("COUNTRYNO")
	  REFERENCES "SCOTT"."TRIP_COUNTRY" ("COUNTRYNO") ENABLE;
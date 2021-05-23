--------------------------------------------------------
--  파일이 생성됨 - 금요일-5월-08-2015   
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
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (2,'파리','../images/city/paris.png',1,'../images/city/paris.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (3,'베이징','../images/city/beijing.jpg',2,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (4,'바르셀로나','../images/city/barcelona.png',3,'../images/city/spain.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (5,'로마','../images/city/roma.png',4,'../images/city/roma.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (6,'타이페이','../images/city/taipei.png',5,'../images/city/tai.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (7,'런던','../images/city/london.png',6,'../images/city/london.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (8,'뉴욕','../images/city/newyork.png',7,'../images/city/newyork.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (9,'비엔나','../images/city/vienna.png',8,'../images/city/vienna.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (10,'피렌체','../images/city/firenze.png',4,'../images/city/Firenze.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (11,'홍콩','../images/city/hong.png',9,'../images/city/hongkong.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (12,'베를린','../images/city/berlin.png',10,'../images/city/Berlin.jpg');
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (13,'라스베가스','..',7,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (14,'캘리포니아','..',7,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (15,'제주도','..',11,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (16,'오사카','..',12,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (17,'후쿠오카','..',12,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (18,'발리','..',13,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (19,'푸켓','..',14,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (20,'방콕','..',14,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (21,'보라카이','..',15,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (22,'암스테르담','..',16,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (23,'마드리드','..',3,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (24,'모스크바','..',17,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (25,'프라하','..',18,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (26,'밴쿠버','..',19,null);
Insert into SCOTT.TRIP_CITY (CITYNUM,CITYNAME,IMG,COUNTRYNO,BIGIMG) values (27,'멜버른','..',20,null);
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

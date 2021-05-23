--------------------------------------------------------
--  ÆÄÀÏÀÌ »ý¼ºµÊ - ±Ý¿äÀÏ-5¿ù-08-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRIP_BOARD
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TRIP_BOARD" 
   (	"BNO" NUMBER(10,0), 
	"ID" VARCHAR2(20 BYTE), 
	"WDATE" DATE, 
	"HITS" NUMBER(10,0), 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"REPLYNO" NUMBER(10,0), 
	"STATUS" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TRIP_BOARD
SET DEFINE OFF;
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (25,'admin',to_date('15/05/07','RR/MM/DD'),1,'´ñ±Û','¤·´Ï¶ó¤Ã¤¤¤·¤©',10,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (26,'admin',to_date('15/05/07','RR/MM/DD'),0,'¤±¤¤¤·¤©¤§¤©','¤¤¤§¤«¤¤¤§¤©¤©',25,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (20,'admin',to_date('15/05/07','RR/MM/DD'),6,'asd','asd',19,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (19,'admin',to_date('15/05/07','RR/MM/DD'),5,'yes','yes',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (23,'han',to_date('15/05/07','RR/MM/DD'),1,'zzzzzz','zzzzz',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (28,'admin',to_date('15/05/07','RR/MM/DD'),1,'´ñ±Û¿¡´ñ±Û¿¡´ñ±Û','´ñ±Û',27,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (7,'m2000jh',to_date('15/05/07','RR/MM/DD'),1,'sdfsd','sdfsdfsdfsdf',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (29,'han',to_date('15/05/07','RR/MM/DD'),0,'´ñ±Û ´ñ±Û ´ñ±Û ´ñ±Û','´ñ±Û´ñ±Û´ñ±Û´ñ±Û',28,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (30,'m2000jh',to_date('15/05/08','RR/MM/DD'),0,'´ñ±Û','´ñ±Û',20,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (10,'m2000jh',to_date('15/05/07','RR/MM/DD'),4,'435¤¡¤¸¤§¤¡¤©¤¤¤·¤©','¤¤¤·¤©¤¤¤·¤©¤¤¤·¤©¤·¤¤¤©',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (11,'m2000jh',to_date('15/05/07','RR/MM/DD'),3,'¤©¤§¤¸¤©¤§¤¸¤©','¤§¤©¤§¤¬¤¬¤§¤©',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (12,'m2000jh',to_date('15/05/07','RR/MM/DD'),2,'¤»¤¼¤º¤½¤¤¤·¤©','¤·¤¤¤©¤§¤©¤§¤©',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (13,'m2000jh',to_date('15/05/07','RR/MM/DD'),5,'¤¤¤·¤©¤§¤©¤¤¤§¤©','¤§¤¤¤©¤¤¤§¤©¤¤¤§¤©¤¤¤©¤§',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (22,'admin',to_date('15/05/07','RR/MM/DD'),7,'ÀÔ±ÝÀº ¾ðÁ¦±îÁö ÇÏ¸éµÇ³ª¿ä?','³×?',null,1);
Insert into SCOTT.TRIP_BOARD (BNO,ID,WDATE,HITS,TITLE,CONTENT,REPLYNO,STATUS) values (24,'a',to_date('15/05/07','RR/MM/DD'),3,'test',null,11,1);
--------------------------------------------------------
--  DDL for Index BOARD_BNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."BOARD_BNO_PK" ON "SCOTT"."TRIP_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRIP_BOARD
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_BOARD" ADD CONSTRAINT "BOARD_BNO_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."TRIP_BOARD" MODIFY ("WDATE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_BOARD" MODIFY ("HITS" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_BOARD" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRIP_BOARD
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_BOARD" ADD CONSTRAINT "BOARD_ID_FK" FOREIGN KEY ("ID")
	  REFERENCES "SCOTT"."TRIP_USER" ("ID") ENABLE;

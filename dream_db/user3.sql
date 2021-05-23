--------------------------------------------------------
--  ������ ������ - �ݿ���-5��-08-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRIP_USER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TRIP_USER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(10 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"BIRTHNUM" NUMBER(6,0), 
	"PHONE" VARCHAR2(15 BYTE), 
	"SEX" NUMBER(1,0), 
	"MARRIED" NUMBER(1,0), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"QUESTION" VARCHAR2(50 BYTE), 
	"ANSWER" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TRIP_USER
SET DEFINE OFF;
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('a','������','c',840705,'010-9999- 9999',0,0,'ikjuny@hanmail.net','�ڽ��� �¾ ���� ?','����');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('kk','�赿��','ss',999999,'010-999-9999',0,1,'kk@naver.com','ùŰ�� ��Ҵ� ?','��ȭ��');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('bobo','����','tiger',921020,'010-1111-1111',1,0,'m2000mg@naver.com','�ڽ��� �¾ ���� ?','������');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('m2000jh','��ȯ','tiger',880613,'010-1111-1111',0,0,'m2000mg@naver.com','ùŰ�� ��Ҵ� ?','����');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('HBI','�ִ���','hbi',910522,'010-1111-1111',0,0,'balttegr@naver.com','��Ӵ� ������ ?','�����');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('ye0823','�̻���','gkgkgk',111111,'010-2222-2222',0,0,'111@111.11','�ڽ��� �¾ ���� ?','gkgkgk');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('gkgkgkgkgkgk','gkgkgkgkgk','gkgk',888888,'010-2222- 1111',1,1,'gkgkgk@gkgk.gkgk','�ڽ��� �¾ ���� ?','zzz');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('admin','������','hbi',111111,'010-1111-1111',0,0,'hbi@hbi.com','�ڽ��� �¾ ���� ?','����');
Insert into SCOTT.TRIP_USER (ID,NAME,PASSWORD,BIRTHNUM,PHONE,SEX,MARRIED,EMAIL,QUESTION,ANSWER) values ('han','�ִ���','choi',910522,'010-5031-5220',0,0,'balttegr@naver.com','�ڽ��� �¾ ���� ?','������');
--------------------------------------------------------
--  DDL for Index USER_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USER_ID_PK" ON "SCOTT"."TRIP_USER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRIP_USER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("BIRTHNUM" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("PHONE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("QUESTION" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" MODIFY ("ANSWER" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_USER" ADD CONSTRAINT "USER_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
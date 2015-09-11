SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE FT_CUST_PERSON;
DROP TABLE FT_CUST_MGMT;
DROP TABLE FT_CUST_RECORD;




/* Create Tables */

CREATE TABLE FT_CUST_PERSON
(
	CUST_PERSON_SEQ int NOT NULL COMMENT '고객사 담당자 번호',
	CUST_SEQ int NOT NULL COMMENT '고객사 번호',
	PERSON_NM varchar(15) NOT NULL COMMENT '담당자 성명',
	DEPT_NM varchar(50) COMMENT '부서',
	JOB_TITLE_NM varchar(20) COMMENT '직위',
	BIRTHDAY varchar(10) COMMENT '생년월일',
	MAIL_ID varchar(100) COMMENT '메일주소',
	OFFICE_PHONE varchar(15) COMMENT '사무실 전화번호',
	MOBILE_PHONE varchar(15) COMMENT '휴대전화',
	BUSINESS_NM varchar(100) COMMENT '담당업무',
	MEMO varchar(500),
	USER_ID varchar(20) COMMENT '작성자 아이디',
	REG_DATE datetime COMMENT '등록일시',
	MOD_DATE datetime COMMENT '수정일시',
	PRIMARY KEY (CUST_PERSON_SEQ)
);


CREATE TABLE FT_CUST_MGMT
(
	CUST_SEQ int NOT NULL COMMENT '고객사 번호',
	USER_ID varchar(20) NOT NULL COMMENT '작성자 아이디',
	COMP_ID varchar(3) NOT NULL COMMENT '회사 아이디',
	CUST_NM varchar(100) NOT NULL COMMENT '거래처명',
	CUST_DEGT varchar(15) COMMENT '대표자',
	CUST_CORPN varchar(14) COMMENT '법인번호',
	CUST_LICES varchar(12) COMMENT '사업자번호',
	CUST_TYPE_NM varchar(50) COMMENT '업종',
	MAIL_ID varchar(100) COMMENT '메일주소',
	PHONE varchar(20) COMMENT '대표전화',
	FAX varchar(20) COMMENT '팩스',
	ADDRESS varchar(255) COMMENT '사업장 주소',
	CUST_INFO varchar(1000) COMMENT '고객사 정보',
	REG_DATE datetime COMMENT '등록일시',
	MOD_DATE datetime COMMENT '수정일시',
	PRIMARY KEY (CUST_SEQ)
);


CREATE TABLE FT_CUST_RECORD
(
	REC_SEQ int NOT NULL COMMENT '업무기록 번호',
	CUST_SEQ int COMMENT '고객사 번호',
	REC_YMD varchar(10) COMMENT '작성일',
	REC_CONT varchar(500) COMMENT '업무내용',
	USER_ID varchar(20) COMMENT '작성자 아이디',
	FILE_ID varchar(36) COMMENT '첨부파일',
	REG_DATE datetime COMMENT '등록일시',
	MOD_DATE datetime COMMENT '수정일시',
	PRIMARY KEY (REC_SEQ)
);




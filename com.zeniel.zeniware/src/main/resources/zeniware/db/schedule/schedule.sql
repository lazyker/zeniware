SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE FS_HLDY;
DROP TABLE FS_SCHED_RPET;
DROP TABLE FS_TODO;
DROP TABLE FS_RPET_EXCPT;
DROP TABLE FS_SCHED;
DROP TABLE FS_CLDR;




/* Create Tables */

CREATE TABLE FS_HLDY
(
	HLDY_YMD varchar(10) NOT NULL COMMENT '휴일날짜',
	HLDY_ID int NOT NULL AUTO_INCREMENT COMMENT '휴일 아이디',
	HLDY_NM varchar(60) NOT NULL COMMENT '휴일 이름',
	HLDY_TYPE varchar(1) NOT NULL COMMENT '휴일 타입',
	REG_DATE datetime COMMENT '등록일시',
	PRIMARY KEY (HLDY_YMD, HLDY_ID)
);


CREATE TABLE FS_SCHED_RPET
(
	CLDR_ID varchar(12) NOT NULL COMMENT '캘린더 아이디',
	SCHED_ID varchar(20) NOT NULL COMMENT '스케줄 아이디',
	RPET_DATE_TYPE varchar(1) DEFAULT 'N' NOT NULL COMMENT '반복날짜 형태',
	RPET_DD varchar(15) COMMENT '반복날짜(1 ~ 31) 
0,1,2,3,4,5,6 -일,월,화,수,목,금,토',
	RPET_WK varchar(15) COMMENT '반복주(1,3)',
	RPET_MM varchar(15) COMMENT '반복월',
	PRIMARY KEY (CLDR_ID, SCHED_ID)
);


-- 회원의 할일 정보를 저장하는 테이블로 <캘린더아이디>와는 무관한 
-- 테이블이다.
CREATE TABLE FS_TODO
(
	USER_ID varchar(20) NOT NULL COMMENT '사용자 아이디',
	TODO_SEQ decimal(19,4) NOT NULL COMMENT '할일순번',
	TODO_NM varchar(300) NOT NULL COMMENT '할일이름',
	START_YMD varchar(10) COMMENT '시작일자',
	END_YMD varchar(10) COMMENT '종료일자',
	CMPLT_YN varchar(1) DEFAULT '''N''' NOT NULL COMMENT '완료여부',
	REG_DATE datetime COMMENT '등록일시',
	MOD_DATE datetime COMMENT '수정일시',
	PRIMARY KEY (USER_ID, TODO_SEQ)
) COMMENT = '회원의 할일 정보를 저장하는 테이블로 <캘린더아이디>와는 무관한 
테이블이다.';


-- 반복일정에 대한 예외를 저장하는 테이블로 반복일정에서 특정구간이 변경되는 경우 그 대상일자를 저장한다.
-- 일정 삭제의 경우는 [스케줄]테이블에 새로운 인스턴스가 생성되지 않지만, 수정의 경우는 새로운 인스턴스가 생성된다. [반복일정예외] 테이블의 경우
-- 이러한 신 인스턴스와 기존 반복일정 인스턴스간의 관계는 추적하지 않지만 변경(수정/삭제)이 발생시 그 대상일자만 기록하여 [스케줄]과 조인을 통해 필터링 하도록 되어 있다.
CREATE TABLE FS_RPET_EXCPT
(
	CLDR_ID varchar(12) NOT NULL COMMENT '캘린더 아이디',
	RPET_SCHED_ID varchar(20) NOT NULL COMMENT '스케줄 아이디',
	TRGT_YMD varchar(10) NOT NULL COMMENT '예외 대상 일자',
	MOD_DATE datetime NOT NULL COMMENT '변경일시',
	PRIMARY KEY (CLDR_ID, RPET_SCHED_ID, TRGT_YMD)
) COMMENT = '반복일정에 대한 예외를 저장하는 테이블로 반복일정에서 특정구간이 변경되는 경우 그 대상일자를 저장한다.
일';


-- 캘린더의 그룹정보(카테고리)를 저장하는 테이블로 실제 캘린더의 구성 스케줄은 [스케줄] 테이블에 저장되어 있다. 
-- [캘린더] 테이블은 해당 캘린더에 대한 설명과 색상값과 같은 정보를 저장
-- 한다.
CREATE TABLE FS_CLDR
(
	CLDR_ID varchar(12) NOT NULL COMMENT '캘린더 아이디',
	CLDR_NM varchar(100) NOT NULL COMMENT '캘린더 이름',
	CLDR_COLOR_VAL varchar(10) COMMENT '캘린더 색상값(RGB)',
	COMP_ID varchar(30) NOT NULL COMMENT '회사 아이디',
	USER_ID varchar(20) NOT NULL COMMENT '사용자 아이디',
	COLSE_YN varchar(1) DEFAULT 'N' NOT NULL COMMENT '비공개 여부',
	SHRE_YN varchar(1) DEFAULT 'N' NOT NULL COMMENT '공유여부(Y면 공유 캘린더)',
	REG_DATE datetime NOT NULL COMMENT '등록일시',
	MOD_DATE datetime NOT NULL COMMENT '수정일시',
	PRIMARY KEY (CLDR_ID)
) COMMENT = '캘린더의 그룹정보(카테고리)를 저장하는 테이블로 실제 캘린더의 구성 스케줄은 [스케줄] 테이블에 저장되어 있';


CREATE TABLE FS_SCHED
(
	CLDR_ID varchar(12) NOT NULL COMMENT '캘린더 아이디',
	SCHED_ID varchar(20) NOT NULL COMMENT '스케줄 아이디',
	SCHED_NM varchar(400) NOT NULL COMMENT '스케줄 이름',
	START_YMD varchar(8) NOT NULL COMMENT '스케줄 시작일자',
	END_YMD varchar(8) NOT NULL COMMENT '스케줄 종료일자',
	REG_DATE datetime NOT NULL COMMENT '등록일시',
	MOD_DATE datetime NOT NULL COMMENT '수정일시',
	FST_FRMIGR_ID varchar(20) NOT NULL COMMENT '최조 작성자 아이디',
	LST_MODR_ID varchar(20) COMMENT '최종 수정자 아이디',
	START_TM varchar(4) COMMENT '시작시간',
	END_TM varchar(4) COMMENT '종료시간',
	RPET_YN varchar(1) DEFAULT 'N' NOT NULL COMMENT '반복여부',
	RPET_END_YMD varchar(10) COMMENT '반복 종료일',
	RPET_TYPE varchar(1) DEFAULT 'D' NOT NULL COMMENT '반복유형(D:일, W:주, M:월, Y:년)',
	RPET_CYC int COMMENT '반복주기',
	APNT_PLC varchar(300) COMMENT '약속 장소',
	MEMO_CONT varchar(500) COMMENT '메모 내용',
	PRIMARY KEY (CLDR_ID, SCHED_ID)
);



/* Create Foreign Keys */

ALTER TABLE FS_SCHED
	ADD FOREIGN KEY (CLDR_ID)
	REFERENCES FS_CLDR (CLDR_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FS_SCHED_RPET
	ADD FOREIGN KEY (CLDR_ID, SCHED_ID)
	REFERENCES FS_SCHED (CLDR_ID, SCHED_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FS_RPET_EXCPT
	ADD FOREIGN KEY (CLDR_ID, RPET_SCHED_ID)
	REFERENCES FS_SCHED (CLDR_ID, SCHED_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;




SET SESSION FOREIGN_KEY_CHECKS=0;

DROP TABLE EMPLOYEE;
DROP TABLE FB_ADMN_MAST;
DROP TABLE FB_ADMN_USER;
DROP TABLE FB_BLOK_DEPT;
DROP TABLE FB_BLOK_USER;
DROP TABLE FB_BOAD_MAST;
DROP TABLE FB_BOAD_READ_HSTY;
DROP TABLE FB_BORD_MAIN;
DROP TABLE FB_OPEN_BOAD_USER;
DROP TABLE FC_ACPT_SUGG_COMT;
DROP TABLE FC_ACPT_SUGG_EVAL_LIST;
DROP TABLE FC_ACPT_SUGG_LIKE_LIST;
DROP TABLE FC_ACPT_SUGG_LIST;
DROP TABLE FC_ACPT_SUGG_TYPE_LIST;
DROP TABLE FC_ADMN_MAST;
DROP TABLE FC_BOARD_LIKE_LIST;
DROP TABLE FC_BORD_INFO;
DROP TABLE FC_CUMT_ADD_INFO;
DROP TABLE FC_CUMT_ADMN_USER;
DROP TABLE FC_CUMT_BOAD_INFO;
DROP TABLE FC_CUMT_INFO;
DROP TABLE FC_FBFC_COMT_BORD;
DROP TABLE FC_FBFC_FILE_BORD;
DROP TABLE FC_OPEN__FCFB_USER;
DROP TABLE FC_PART_MAGT_COMT;
DROP TABLE FC_PART_MAGT_LIKE_LIST;
DROP TABLE FC_PART_MAGT_LIST;
DROP TABLE FC_PART_MAGT_LIST_ADMN;
DROP TABLE MEMBERINFO;
DROP TABLE MEMBER_AUTHORITY;
DROP TABLE NO_SURY_ADM_USER;
DROP TABLE NO_SURY_ANSR_USER;
DROP TABLE NO_SURY_ASKL;
DROP TABLE NO_SURY_ASK_INFO;
DROP TABLE NO_SURY_BORD_INFO;
DROP TABLE NO_SURY_COMT_BORD;
DROP TABLE NO_SURY_EXAM;
DROP TABLE NO_SURY_LIKE_LIST;
DROP TABLE NO_SURY_TAGT_USER;

/* Create Tables */

CREATE TABLE FB_ADMN_MAST
(
	ADM_BOARD_SEQ smallint(0) NOT NULL AUTO_INCREMENT,
	COMP_ID char(3) NOT NULL,
	-- 커뮤니티 개설 타입 설정값
	-- 1: 관리자 승인없이 개설
	-- 2: 관리자 승인 후 개설
	BOARD_OPEN_TYPE varchar(2) DEFAULT '1' NOT NULL COMMENT '커뮤니티 개설 타입 설정값
1: 관리자 승인없이 개설
2: 관리자 승인 후 개설',
	-- 첨부파일 용량제한 여부
	FILE_SIZE_YN char(1) DEFAULT 'Y' NOT NULL COMMENT '첨부파일 용량제한 여부',
	-- 첨부파일 용량 제한 사이즈 M
	FILE_SIZE smallint DEFAULT 100 COMMENT '첨부파일 용량 제한 사이즈 M',
	-- 첨부파일 개수 제한 여부
	FILE_ADD_YN char(1) DEFAULT 'Y' NOT NULL COMMENT '첨부파일 개수 제한 여부',
	-- 첨부파일 제한 갯수
	FILE_ADD_CNT smallint DEFAULT 0 COMMENT '첨부파일 제한 갯수',
	-- 업로드 불가 파일 확장자명 ,로 구분
	FILE_NOT_NAME varchar(100) COMMENT '업로드 불가 파일 확장자명 ,로 구분',
	-- Y:보이기
	-- N:숨기기
	STOP_VIEW_YN varchar(2) DEFAULT 'N' COMMENT 'Y:보이기
N:숨기기',
	REG_DATE datetime,
	ADMIN_USER_ID varchar(20),
	PRIMARY KEY (ADM_BOARD_SEQ)
);


CREATE TABLE FB_ADMN_USER
(
	ADM_USER_SEQ smallint(9) NOT NULL AUTO_INCREMENT,
	BOARD_ID bigint(20) NOT NULL,
	COMP_ID char(3),
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	USER_NM varchar(50),
	-- S:  주 관리 운영자
	-- B : 부 관리 운영자
	ADM_GUBUN char(2) DEFAULT 'S' NOT NULL COMMENT 'S:  주 관리 운영자
B : 부 관리 운영자',
	PRIMARY KEY (ADM_USER_SEQ)
);


CREATE TABLE FB_OPEN_BOAD_USER
(
	FB_OPEN_ID varchar(20) NOT NULL,
	BOARD_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	OPEN_BOARD_TYPE varchar(10),
	OPEN_TYPE_DETAIL varchar(10),
	-- Y : 읽기/쓰기
	-- N : 읽기
	READ_TYPE varchar(2) DEFAULT 'N' COMMENT 'Y : 읽기/쓰기
N : 읽기',
	PRIMARY KEY (FB_OPEN_ID)
);


CREATE TABLE FB_BORD_MAIN
(
	BOARD_SEQ bigint(20) NOT NULL,
	ADM_BOARD_SEQ smallint(0) NOT NULL,
	BOARD_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20),
	DEPT_ID char(4) NOT NULL,
	TITLE varchar(100) NOT NULL,
	CONTENT text,
	-- Y : 첨부 파일 존재
	-- N : 첨부파일 없음
	FILE_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 첨부 파일 존재
N : 첨부파일 없음',
	-- Y : 공개
	-- N : 비공개
	VIEW_YN varchar(2) DEFAULT 'Y' COMMENT 'Y : 공개
N : 비공개',
	-- Y : TOP 공지
	-- N:  TOP 공지 아님
	TOP_VIEW_YN varchar(2) DEFAULT 'N' COMMENT 'Y : TOP 공지
N:  TOP 공지 아님',
	DEL_YN varchar(2) DEFAULT 'N',
	REG_DATE datetime NOT NULL,
	MOD_DATE datetime,
	REG_USER_ID varchar(20) NOT NULL,
	MOD_USER_ID varchar(20),
	-- Y : 즐겨찾기 추가
	-- N : 즐겨찾기 미 추가
	BOOKMARK_YN varchar(2) COMMENT 'Y : 즐겨찾기 추가
N : 즐겨찾기 미 추가',
	PRIMARY KEY (BOARD_SEQ)
);


CREATE TABLE FB_BLOK_USER
(
	BLOCK_ID bigint(20) NOT NULL,
	BOARD_SEQ bigint(20) NOT NULL,
	COMP_ID char(3),
	-- W : 접근 가능 타입
	-- B : 블럭 타입
	BLOCK_TYPE varchar(2) DEFAULT 'W' COMMENT 'W : 접근 가능 타입
B : 블럭 타입',
	USER_ID varchar(20),
	DEPT_ID char(4),
	REG_DATE datetime NOT NULL,
	PRIMARY KEY (BLOCK_ID)
);


CREATE TABLE FB_BLOK_DEPT
(
	BLOCK_DEPT_ID bigint unsigned NOT NULL,
	BOARD_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	DEPT_ID char(4),
	-- Y : 접근
	-- N : 미접근
	AUTH_YN char(2) DEFAULT 'Y' COMMENT 'Y : 접근
N : 미접근',
	-- Y : 하위부서 포함
	-- N : 하위부서 미 포함
	DEPT_LOW_YN varchar(2) DEFAULT 'Y' COMMENT 'Y : 하위부서 포함
N : 하위부서 미 포함',
	REG_DATE datetime,
	REG_USER_ID varchar(20),
	PRIMARY KEY (BLOCK_DEPT_ID)
);


CREATE TABLE FB_BOAD_MAST
(
	BOARD_ID bigint(20) NOT NULL,
	ADM_BOARD_SEQ smallint(0) NOT NULL,
	BOARD_NM varchar(50) NOT NULL,
	COMP_ID char(3) NOT NULL,
	-- C : 클래식
	-- P : 피드(SNS)
	BOARD_TYPE char(2) DEFAULT 'C' COMMENT 'C : 클래식
P : 피드(SNS)',
	BOARD_COMT varchar(300),
	-- Y:사용
	-- N :미사용
	BOARD_HRAD_YN char(2) DEFAULT 'N' NOT NULL COMMENT 'Y:사용
N :미사용',
	-- 공개범위 Y 인 경우 (쓰기/읽기) 기본
	BOARD_OPEN_YN char(2) DEFAULT 'Y' COMMENT '공개범위 Y 인 경우 (쓰기/읽기) 기본',
	-- 메일발송 버튼 표시 기본은 1( 발송버튼) 2버튼없음
	MAIL_SEND_YN numeric(2) DEFAULT 1 COMMENT '메일발송 버튼 표시 기본은 1( 발송버튼) 2버튼없음',
	BOARD_ADM_YN char(1),
	MAIN_VIEW_YN char(1) DEFAULT 'N',
	-- Y : 댓글 사용
	-- N : 댓글 미사용
	COMT_ADD_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 댓글 사용
N : 댓글 미사용',
	-- Y : 공지 기능
	-- N : 공지 기능 없음
	TOP_VIEW_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 공지 기능
N : 공지 기능 없음',
	-- Y : 즐겨찾기 추가
	-- N : 즐겨찾기 미 추가
	BOOKMARK_YN varchar(2) COMMENT 'Y : 즐겨찾기 추가
N : 즐겨찾기 미 추가',
	SHOT_INDEX int(9),
	REG_DATE datetime,
	MOD_DATE datetime,
	REG_USER_ID varchar(20),
	MOD_USER_ID varchar(20),
	PRIMARY KEY (BOARD_ID)
);


CREATE TABLE FB_BOAD_READ_HSTY
(
	SEQ_ID bigint(20) NOT NULL AUTO_INCREMENT,
	BOARD_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	-- Y : 삭제
	-- N : 미 삭제
	DEL_YN varchar(1) DEFAULT 'N' COMMENT 'Y : 삭제
N : 미 삭제',
	PRIMARY KEY (SEQ_ID)
);


CREATE TABLE FC_FBFC_FILE_BORD
(
	FILE_ADD_ID bigint(20) unsigned NOT NULL,
	-- 10 : 전사 게시판
	-- 20 : 부서 게시판
	-- 30 : 커뮤니티 게시판
	-- 40 : 댓글 게시판
	ADD_TYPE varchar(4) NOT NULL COMMENT '10 : 전사 게시판
20 : 부서 게시판
30 : 커뮤니티 게시판
40 : 댓글 게시판',
	FILE_ADD varchar(100),
	PRIMARY KEY (FILE_ADD_ID)
);


CREATE TABLE NO_SURY_ADM_USER
(
	SURY_ID bigint(20) unsigned NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	PRIMARY KEY (SURY_ID)
);


CREATE TABLE NO_SURY_ASKL
(
	ASK_NUM smallint(4) DEFAULT 1 NOT NULL,
	INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	ASK_TITLE varchar(100) NOT NULL,
	-- S : 선택형
	-- T : 텍스트형
	-- P : 점수형
	ASK_TYPE char(1) DEFAULT 'S' NOT NULL COMMENT 'S : 선택형
T : 텍스트형
P : 점수형',
	-- S인 경우
	-- O : 하나만 선택
	-- D : 복수 선택
	-- T인 경우
	-- S : 단문 입력
	-- L : 장문 입력
	-- P인 경우
	-- 3 : 3점
	-- 5 : 5점
	-- 7 : 7점
	-- 10 : 10점
	ASK_TYPE_INFO varchar(4) DEFAULT 'O' COMMENT 'S인 경우
O : 하나만 선택
D : 복수 선택
T인 경우
S : 단문 입력
L : 장문 입력
P인 경우
3 : 3점
5 : 5점
7 : 7점
10 : 10점',
	-- Y : 필수
	-- N : 필수 아님
	ASK_PLESU_YN varchar(1) COMMENT 'Y : 필수
N : 필수 아님',
	REG_DATE datetime NOT NULL,
	PRIMARY KEY (ASK_NUM)
);


CREATE TABLE NO_SURY_EXAM
(
	EXAMPLE_SEQ bigint NOT NULL,
	ASK_NUM smallint(4) DEFAULT 1 NOT NULL,
	COMP_ID char(3) NOT NULL,
	EXAM_TITLE varchar(100),
	REG_DATE datetime NOT NULL,
	PRIMARY KEY (EXAMPLE_SEQ)
);


CREATE TABLE NO_SURY_TAGT_USER
(
	INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	-- C : 클래스 선택
	-- D : 직접 선택
	-- C,D : 위 전부 선택
	-- R : 참조자
	TARGET_TYPE varchar(4) NOT NULL COMMENT 'C : 클래스 선택
D : 직접 선택
C,D : 위 전부 선택
R : 참조자',
	-- 직위
	-- 직급
	-- 직책
	GROUP_TYPE varchar(4) COMMENT '직위
직급
직책',
	GROUP_ID varchar(4),
	USER_ID varchar(20),
	-- Y : 참조자 임
	-- N : 참조자 아님
	READ_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 참조자 임
N : 참조자 아님'
);


CREATE TABLE NO_SURY_LIKE_LIST
(
	FCSURVEY_LIST_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL
);


CREATE TABLE NO_SURY_COMT_BORD
(
	COMT_SEQ bigint NOT NULL,
	NO_INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	COMMENT varchar(300),
	-- Y
	-- N
	FILE_ADD_YN varchar(2) DEFAULT 'N' COMMENT 'Y
N',
	REG_DATE datetime,
	MOD_DATE datetime,
	PRIMARY KEY (COMT_SEQ)
);


CREATE TABLE NO_SURY_ASK_INFO
(
	ASK_INFO_SEQ bigint NOT NULL,
	INFO_ID bigint(20),
	ANSR_SEQ bigint NOT NULL,
	COMP_ID char(3) NOT NULL,
	ANSER_COMT varchar(1000),
	REG_DATE datetime NOT NULL,
	MOD_USER_ID varchar(20),
	MOD_DATE datetime,
	PRIMARY KEY (ASK_INFO_SEQ)
);


CREATE TABLE FC_BOARD_LIKE_LIST
(
	FC_BOARD_LIST_SEQ bigint(20) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	DEPT_ID char(4) NOT NULL
);


CREATE TABLE FC_FBFC_COMT_BORD
(
	FBFC_SEQ bigint(20) NOT NULL,
	BOARD_SRQ bigint(20) NOT NULL,
	FC_COMT_ID bigint(20),
	-- 10 : 전사게시판
	-- 20 : 부서 게시판
	-- 30 : 커뮤니티 게시판
	COMT_TYPE varchar(4) NOT NULL COMMENT '10 : 전사게시판
20 : 부서 게시판
30 : 커뮤니티 게시판',
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	COMMENT varchar(300) NOT NULL,
	-- Y : 첨부
	-- N : 미첨부
	FILE_ADD_YN varchar(2) COMMENT 'Y : 첨부
N : 미첨부',
	REG_DATE datetime,
	MOD_DATE datetime,
	PRIMARY KEY (FBFC_SEQ)
);


CREATE TABLE FC_PART_MAGT_LIST
(
	-- 부서 키값
	-- 
	PARTER_SEQ bigint unsigned NOT NULL COMMENT '부서 키값
',
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	TITLE varchar(100),
	CONTENT_PATH char,
	ATTACHED_FILE_PATH char,
	CORPORATE_NUMBER varchar(100),
	-- 사업자 등록 번호
	CORPORATE_REGISTRATION_NUMBER varchar(100) COMMENT '사업자 등록 번호',
	REPRESENTATIVE_NAME varchar(100),
	BUSINESS_TYPE varchar(100),
	PHONE1 varchar(100),
	PHONE2 varchar(100),
	COMPANY_ADDRESS varchar(100),
	FOUNDATION_DAY datetime,
	CONTRACT_YN varchar(1),
	REG_DATE datetime,
	MOD_DATE datetime,
	PRIMARY KEY (PARTER_SEQ)
);


CREATE TABLE FC_PART_MAGT_LIST_ADMN
(
	-- 부서 키값
	-- 
	FC_PARTER_MANAGER_LIST_SEQ bigint unsigned NOT NULL COMMENT '부서 키값
',
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	REG_DATE datetime,
	PRIMARY KEY (FC_PARTER_MANAGER_LIST_SEQ)
);


CREATE TABLE FC_PART_MAGT_COMT
(
	PART_COMT_SEQ bigint(20) NOT NULL,
	-- 부서 키값
	-- 
	PARTER_SEQ bigint unsigned NOT NULL COMMENT '부서 키값
',
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	COMMENT varchar(300) NOT NULL,
	-- Y : 첨부
	-- N : 미 첨부
	FILE_ADD_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 첨부
N : 미 첨부',
	PRIMARY KEY (PART_COMT_SEQ)
);


CREATE TABLE FC_PART_MAGT_LIKE_LIST
(
	-- 부서 키값
	-- 
	FC_LIKE_LIST_SEQ bigint unsigned NOT NULL COMMENT '부서 키값
',
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL
);


CREATE TABLE FC_ACPT_SUGG_LIST
(
	ACCEPT_SEQ bigint(20) NOT NULL,
	TYPE_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(3) NOT NULL,
	-- 1 : 제안
	-- 2 : 건의
	SUGG_TYPE varchar(1) DEFAULT '1' NOT NULL COMMENT '1 : 제안
2 : 건의',
	-- 1 : 접수
	-- 2: 진행중
	-- 3 : 반려
	-- 4 : 제안완료
	STATUS varchar(10) COMMENT '1 : 접수
2: 진행중
3 : 반려
4 : 제안완료',
	TITLE varchar(100) NOT NULL,
	PROBLEM varchar(1000) NOT NULL,
	CONTENT1 text,
	CONTENT2 varchar(1000),
	SUGG_MEMO varchar(1000),
	RESULT_SEQ bigint,
	-- 1 : 실시 진행 접수
	-- 2 : 실시 진행중
	-- 3 : 실시 완료
	RESULT_STATUS varchar(2) COMMENT '1 : 실시 진행 접수
2 : 실시 진행중
3 : 실시 완료',
	POINT int,
	REG_DATE datetime NOT NULL,
	MOD_DATE datetime,
	PRIMARY KEY (ACCEPT_SEQ)
);


CREATE TABLE FC_ACPT_SUGG_TYPE_LIST
(
	TYPE_SEQ bigint(20) NOT NULL,
	COMP_ID char(3),
	PRIMARY KEY (TYPE_SEQ)
);


CREATE TABLE FC_ACPT_SUGG_LIKE_LIST
(
	SUGG_LIKE_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	PRIMARY KEY (SUGG_LIKE_SEQ)
);


CREATE TABLE FC_ACPT_SUGG_COMT
(
	SUGG_COMT_SEQ bigint(0) NOT NULL,
	ACCEPT_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	-- NM : 일반 의견
	-- AD : 실시의견
	COMT_TYPE varchar(2) DEFAULT 'NM' COMMENT 'NM : 일반 의견
AD : 실시의견',
	SUGG_COMT varchar(300) NOT NULL,
	-- Y : 첨뷰
	-- N : 첨부 파일 없음
	FILE_ADD_YN varchar(1) DEFAULT 'N' COMMENT 'Y : 첨뷰
N : 첨부 파일 없음',
	REG_DATE datetime NOT NULL,
	MOD_DATE datetime,
	PRIMARY KEY (SUGG_COMT_SEQ)
);


CREATE TABLE FC_ACPT_SUGG_EVAL_LIST
(
	EVAL_SEQ bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	-- 1 : 1등급
	-- 2 : 2등급
	-- 3 : 3등급
	-- 4 : 4등급
	-- 5 : 5등급
	-- 6 : 단순
	-- 7 : 반려
	EVAL_TYPE varchar(10) NOT NULL COMMENT '1 : 1등급
2 : 2등급
3 : 3등급
4 : 4등급
5 : 5등급
6 : 단순
7 : 반려',
	PRIMARY KEY (EVAL_SEQ)
);


CREATE TABLE NO_SURY_BORD_INFO
(
	INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	SURY_TITLE varchar(100) NOT NULL,
	SURY_START_DATE varchar(10) NOT NULL,
	SURY_END_DATE varchar(10) NOT NULL,
	-- A : 전사
	-- S : 일부
	SURY_TARGET_TYPE char(1) DEFAULT 'A' NOT NULL COMMENT 'A : 전사
S : 일부',
	-- C : 클래스 선택
	-- D : 직접 선택
	-- C,D : 위 전부 선택
	TARGET_TYPE varchar(4) COMMENT 'C : 클래스 선택
D : 직접 선택
C,D : 위 전부 선택',
	READ_YN varchar(2),
	-- Y : 공개
	-- N : 비공개
	RESULT_OPEN_YN varchar(1) DEFAULT 'Y' NOT NULL COMMENT 'Y : 공개
N : 비공개',
	-- Y : 작성
	-- N : 미 작성
	COMMENT_YN char(1) DEFAULT 'Y' NOT NULL COMMENT 'Y : 작성
N : 미 작성',
	-- Y : 허용
	-- N : 미 허용
	JOIN_MOD_YN char(1) DEFAULT 'Y' COMMENT 'Y : 허용
N : 미 허용',
	VIEW_ADD_NM varchar(50),
	INFO_COMT varchar(200),
	-- Y : 첨부
	-- N : 미 첨부
	FILE_ADD_YN varchar(1) DEFAULT 'N' COMMENT 'Y : 첨부
N : 미 첨부',
	REG_DATE datetime NOT NULL,
	REG_USER_ID varchar(20) NOT NULL,
	MOD_DATE datetime,
	MOD_USER_ID varchar(20),
	PRIMARY KEY (INFO_ID)
);


CREATE TABLE NO_SURY_ANSR_USER
(
	ANSR_SEQ bigint NOT NULL,
	INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	ASK_NUM smallint NOT NULL,
	REG_DATE datetime NOT NULL,
	PRIMARY KEY (ANSR_SEQ)
);


CREATE TABLE FC_ADMN_MAST
(
	FC_ADM_SEQ smallint(9) NOT NULL AUTO_INCREMENT,
	COMP_ID char(3) NOT NULL,
	-- Y : 관리자 승인 개설
	-- N : 관리자 승인 없이 개설
	CUMT_TYPE varchar(2) DEFAULT 'N' NOT NULL COMMENT 'Y : 관리자 승인 개설
N : 관리자 승인 없이 개설',
	-- Y : 제한
	-- N : 제한 없음
	FILE_SIZE_YN char(1) DEFAULT 'N' NOT NULL COMMENT 'Y : 제한
N : 제한 없음',
	FILE_SIZE smallint,
	-- Y : 갯수 제한
	-- N : 갯수 제한 없음
	FILE_ADD_YN char(1) DEFAULT 'N' NOT NULL COMMENT 'Y : 갯수 제한
N : 갯수 제한 없음',
	FILE_ADD_CNT smallint,
	FILE_NOT_NAME varchar(100),
	REG_DATE datetime NOT NULL,
	ADM_USER_ID varchar(20),
	PRIMARY KEY (FC_ADM_SEQ)
);


CREATE TABLE FC_OPEN_FCFB_USER
(
	FC_OPEN_USER_ID varchar(20) NOT NULL,
	BOARD_INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	OPEN_AREA varchar(10),
	OPEN_TYPE_DETAIL varchar(10),
	-- Y : 읽기/쓰기
	-- N : 읽기
	READ_TYPE varchar(2) DEFAULT 'N' COMMENT 'Y : 읽기/쓰기
N : 읽기',
	PRIMARY KEY (FC_OPEN_USER_ID)
);


CREATE TABLE FC_BORD_INFO
(
	BOARD_INFO_ID bigint(20) NOT NULL,
	FC_COMT_ID varchar(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	FC_BOARD_TITLE varchar(100) NOT NULL,
	-- C : 클래식
	-- P : 피드(SNS)
	FC_BOARD_TYPE varchar(2) DEFAULT 'C' COMMENT 'C : 클래식
P : 피드(SNS)',
	-- Y : 사용
	-- N : 미사용
	FC_BOARD_HEAD_YN char(1) DEFAULT 'N' COMMENT 'Y : 사용
N : 미사용',
	-- Y : 있음
	-- N : 없음
	FC_BOARD_ADM_YN char(1) DEFAULT 'Y' COMMENT 'Y : 있음
N : 없음',
	-- Y : 사용
	-- N : 미사용
	FC_BOARD_OPEN_YN char(1) DEFAULT 'N' COMMENT 'Y : 사용
N : 미사용',
	-- Y : 허용
	-- N : 미 허용
	FC_BOARD_COMT_YN char(1) DEFAULT 'Y' COMMENT 'Y : 허용
N : 미 허용',
	-- Y : 추가
	-- N : 추가없음
	BOOKMARK_YN varchar(2) DEFAULT 'N' COMMENT 'Y : 추가
N : 추가없음',
	-- Y :  구분선
	-- N : 일반
	LINE_GUBUN char(1) COMMENT 'Y :  구분선
N : 일반',
	SORT_INT int(4),
	REG_DATE datetime NOT NULL,
	REG_USER_ID varchar(20) NOT NULL,
	PRIMARY KEY (BOARD_INFO_ID)
);


CREATE TABLE FC_COMT_ADMN_USER
(
	FC_COMT_ID varchar(20) NOT NULL,
	BOARD_INFO_ID bigint(20),
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	-- M : 마스터
	-- B : 부마스터
	MAST_GUBUN char(1) DEFAULT 'M' NOT NULL COMMENT 'M : 마스터
B : 부마스터',
	-- C : 커뮤니티
	-- B : 커뮤니티 게시판
	TYPE_GUBUN char(2) DEFAULT 'C' COMMENT 'C : 커뮤니티
B : 커뮤니티 게시판'
);


CREATE TABLE FC_CUMT_BOAD_INFO
(
	BOARD_SEQ bigint(20) NOT NULL,
	BOARD_INFO_ID bigint(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	-- C : 클래식
	-- P : 피드(SNS)
	FC_BOARD_TYPE varbinary(2) COMMENT 'C : 클래식
P : 피드(SNS)',
	TITLE varchar(100) NOT NULL,
	CONTENTS text NOT NULL,
	FILE_YN boolean,
	-- Y : 공개
	-- N : 비공개
	OPEN_YN varchar(1) DEFAULT 'Y' COMMENT 'Y : 공개
N : 비공개',
	-- Y :  공지 등록
	-- N : 공지 미 등록
	MAIN_TOP_YN varchar(1) COMMENT 'Y :  공지 등록
N : 공지 미 등록',
	-- Y : 멤버 알림
	-- N : 멤버 알림 없음
	MEMBER_VIEW varchar(2) COMMENT 'Y : 멤버 알림
N : 멤버 알림 없음',
	REG_DATE datetime NOT NULL,
	MOD_DATE datetime,
	PRIMARY KEY (BOARD_SEQ)
);


CREATE TABLE FC_CUMT_INFO
(
	FC_COMT_ID varchar(20) NOT NULL,
	FC_ADM_SEQ smallint(9) NOT NULL,
	COMP_ID char(3) NOT NULL,
	CUMT_NM varchar(100) NOT NULL,
	CUMT_COMMENT varchar(300),
	-- Y : 승인
	-- N : 대기
	-- R : 거부
	ADM_ACT_YN varchar(1) COMMENT 'Y : 승인
N : 대기
R : 거부',
	-- Y : 공개
	-- N : 비공개
	OPEN_YN char(1) DEFAULT 'Y' NOT NULL COMMENT 'Y : 공개
N : 비공개',
	REG_DATE datetime NOT NULL,
	MOD_DATE datetime,
	REG_USER_ID varchar(20) NOT NULL,
	MOD_USER_ID varchar(20),
	PRIMARY KEY (FC_COMT_ID)
);


CREATE TABLE FC_CUMT_ADD_INFO
(
	FC_COMT_ID varchar(20) NOT NULL,
	COMP_ID char(3) NOT NULL,
	USER_ID varchar(20) NOT NULL,
	DEPT_ID char(4) NOT NULL,
	-- C : 커뮤니티
	-- B : 게시판
	TYPE_GUBUN char(1) DEFAULT 'C' NOT NULL COMMENT 'C : 커뮤니티
B : 게시판',
	BOARD_INFO_ID bigint(20),
	-- M : 마스터
	-- B : 부마스터
	-- U : 일반
	MAST_GUBUN char(1) DEFAULT 'U' COMMENT 'M : 마스터
B : 부마스터
U : 일반',
	-- Y : 승인
	-- N : 미승인
	BD_OPEN_YN char(1) DEFAULT 'N' COMMENT 'Y : 승인
N : 미승인',
	-- Y : 즐겨찾기 포함
	-- N : 즐겨찾기 미 포함
	BOOKMARK_YN varchar(1) DEFAULT 'N' COMMENT 'Y : 즐겨찾기 포함
N : 즐겨찾기 미 포함',
	-- 10: 초대
	-- 20: 미 초대
	-- 30 : 일반가입
	-- 40 : 가입요청
	INVITE_YN varchar(2) COMMENT '10: 초대
20: 미 초대
30 : 일반가입
40 : 가입요청',
	-- Y : 승인
	-- N : 가입대기
	JOIN_YN char(1) DEFAULT 'N' COMMENT 'Y : 승인
N : 가입대기',
	REG_DATE datetime
);



/* Create Foreign Keys */

ALTER TABLE FB_BOAD_MAST
	ADD FOREIGN KEY (ADM_BOARD_SEQ)
	REFERENCES FB_ADMN_MAST (ADM_BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_BORD_MAIN
	ADD FOREIGN KEY (ADM_BOARD_SEQ)
	REFERENCES FB_ADMN_MAST (ADM_BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_BOAD_READ_HSTY
	ADD FOREIGN KEY (BOARD_SEQ)
	REFERENCES FB_BORD_MAIN (BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_BLOK_DEPT
	ADD FOREIGN KEY (BOARD_SEQ)
	REFERENCES FB_BORD_MAIN (BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_BLOK_USER
	ADD FOREIGN KEY (BOARD_SEQ)
	REFERENCES FB_BORD_MAIN (BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_ADMN_USER
	ADD FOREIGN KEY (BOARD_ID)
	REFERENCES FB_BOAD_MAST (BOARD_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_OPEN_BOAD_USER
	ADD FOREIGN KEY (BOARD_ID)
	REFERENCES FB_BOAD_MAST (BOARD_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FB_BORD_MAIN
	ADD FOREIGN KEY (BOARD_ID)
	REFERENCES FB_BOAD_MAST (BOARD_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_EXAM
	ADD FOREIGN KEY (ASK_NUM)
	REFERENCES NO_SURY_ASKL (ASK_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_PART_MAGT_LIST_ADMN
	ADD FOREIGN KEY (FC_PARTER_MANAGER_LIST_SEQ)
	REFERENCES FC_PART_MAGT_LIST (PARTER_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_PART_MAGT_COMT
	ADD FOREIGN KEY (PARTER_SEQ)
	REFERENCES FC_PART_MAGT_LIST (PARTER_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_PART_MAGT_LIKE_LIST
	ADD FOREIGN KEY (FC_LIKE_LIST_SEQ)
	REFERENCES FC_PART_MAGT_LIST (PARTER_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_ACPT_SUGG_LIKE_LIST
	ADD FOREIGN KEY (SUGG_LIKE_SEQ)
	REFERENCES FC_ACPT_SUGG_LIST (ACCEPT_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_ACPT_SUGG_COMT
	ADD FOREIGN KEY (ACCEPT_SEQ)
	REFERENCES FC_ACPT_SUGG_LIST (ACCEPT_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_ACPT_SUGG_EVAL_LIST
	ADD FOREIGN KEY (EVAL_SEQ)
	REFERENCES FC_ACPT_SUGG_LIST (ACCEPT_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_ACPT_SUGG_LIST
	ADD FOREIGN KEY (TYPE_SEQ)
	REFERENCES FC_ACPT_SUGG_TYPE_LIST (TYPE_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_TAGT_USER
	ADD FOREIGN KEY (INFO_ID)
	REFERENCES NO_SURY_BORD_INFO (INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_ANSR_USER
	ADD FOREIGN KEY (INFO_ID)
	REFERENCES NO_SURY_BORD_INFO (INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_ASKL
	ADD FOREIGN KEY (INFO_ID)
	REFERENCES NO_SURY_BORD_INFO (INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_COMT_BORD
	ADD FOREIGN KEY (NO_INFO_ID)
	REFERENCES NO_SURY_BORD_INFO (INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_LIKE_LIST
	ADD FOREIGN KEY (FCSURVEY_LIST_SEQ)
	REFERENCES NO_SURY_BORD_INFO (INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NO_SURY_ASK_INFO
	ADD FOREIGN KEY (ANSR_SEQ)
	REFERENCES NO_SURY_ANSR_USER (ANSR_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_CUMT_INFO
	ADD FOREIGN KEY (FC_ADM_SEQ)
	REFERENCES FC_ADMN_MAST (FC_ADM_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_FBFC_COMT_BORD
	ADD FOREIGN KEY (FC_COMT_ID)
	REFERENCES FC_BORD_INFO (BOARD_INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_OPEN_FCFB_USER
	ADD FOREIGN KEY (BOARD_INFO_ID)
	REFERENCES FC_BORD_INFO (BOARD_INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_CUMT_BOAD_INFO
	ADD FOREIGN KEY (BOARD_INFO_ID)
	REFERENCES FC_BORD_INFO (BOARD_INFO_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_FBFC_COMT_BORD
	ADD FOREIGN KEY (BOARD_SRQ)
	REFERENCES FC_CUMT_BOAD_INFO (BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_BOARD_LIKE_LIST
	ADD FOREIGN KEY (FC_BOARD_LIST_SEQ)
	REFERENCES FC_CUMT_BOAD_INFO (BOARD_SEQ)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_CUMT_ADD_INFO
	ADD FOREIGN KEY (FC_COMT_ID)
	REFERENCES FC_CUMT_INFO (FC_COMT_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_COMT_ADMN_USER
	ADD FOREIGN KEY (FC_COMT_ID)
	REFERENCES FC_CUMT_INFO (FC_COMT_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FC_BORD_INFO
	ADD FOREIGN KEY (FC_COMT_ID)
	REFERENCES FC_CUMT_INFO (FC_COMT_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;
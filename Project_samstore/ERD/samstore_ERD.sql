
/* Drop Tables */

DROP TABLE samstore_reply CASCADE CONSTRAINTS;
DROP TABLE samstore_board CASCADE CONSTRAINTS;
DROP TABLE samstore_like CASCADE CONSTRAINTS;
DROP TABLE samstore_merchandise CASCADE CONSTRAINTS;
DROP TABLE samstore_request CASCADE CONSTRAINTS;
DROP TABLE samstore_member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE samstore_board
(
	brd_uid number NOT NULL,
	brd_ban number default 1,
	brd_rate number default 0,
	brd_viewCnt number default 0,
	brd_title varchar2(30) NOT NULL,
	brd_content varchar2(300),
	brd_regDate date default sysdate,
	mb_uid number NOT NULL,
	PRIMARY KEY (brd_uid)
);


CREATE TABLE samstore_like
(
	like_cnt number default 0,
	mb_uid number NOT NULL,
	mds_uid number NOT NULL
);


CREATE TABLE samstore_member
(
	mb_uid number NOT NULL,
	mb_type number default 1,
	mb_id varchar2(20),
	mb_pw varchar2(20) NOT NULL,
	mb_name varchar2(20),
	mb_img_org varchar2(100),
	mb_img_sav varchar2(100),
	mb_tel varchar2(20),
	mb_email varchar2(30),
	mb_regDate date default sysdate,
	mb_address varchar2(50),
	PRIMARY KEY (mb_uid)
);


CREATE TABLE samstore_merchandise
(
	mds_uid number NOT NULL,
	mds_type number default 0,
	mds_rate number default 0,
	mds_price number default 0,
	mds_amount number default 0,
	mds_name varchar2(30) NOT NULL,
	mds_content varchar2(100),
	mds_img_org varchar2(100),
	mds_img_sav varchar2(100),
	mds_regNum number NOT NULL,
	mds_regDate date default sysdate,
	mb_uid number NOT NULL,
	PRIMARY KEY (mds_uid)
);


CREATE TABLE samstore_reply
(
	reply_uid number NOT NULL,
	reply_ban number default 1,
	reply_depth number default 1,
	reply_content varchar2(100),
	reply_regDate date default sysdate,
	brd_uid number NOT NULL,
	mb_uid number NOT NULL,
	PRIMARY KEY (reply_uid)
);


CREATE TABLE samstore_request
(
	req_uid number NOT NULL,
	req_type number default 0,
	req_check number default 0,
	req_content varchar2(150),
	mb_uid number NOT NULL,
	PRIMARY KEY (req_uid)
);



/* Create Foreign Keys */

ALTER TABLE samstore_reply
	ADD FOREIGN KEY (brd_uid)
	REFERENCES samstore_board (brd_uid)
;


ALTER TABLE samstore_board
	ADD FOREIGN KEY (mb_uid)
	REFERENCES samstore_member (mb_uid)
;


ALTER TABLE samstore_like
	ADD FOREIGN KEY (mb_uid)
	REFERENCES samstore_member (mb_uid)
;


ALTER TABLE samstore_merchandise
	ADD FOREIGN KEY (mb_uid)
	REFERENCES samstore_member (mb_uid)
;


ALTER TABLE samstore_reply
	ADD FOREIGN KEY (mb_uid)
	REFERENCES samstore_member (mb_uid)
;


ALTER TABLE samstore_request
	ADD FOREIGN KEY (mb_uid)
	REFERENCES samstore_member (mb_uid)
;


ALTER TABLE samstore_like
	ADD FOREIGN KEY (mds_uid)
	REFERENCES samstore_merchandise (mds_uid)
;




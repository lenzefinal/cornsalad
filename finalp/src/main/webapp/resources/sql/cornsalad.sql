DROP TABLE BANK CASCADE CONSTRAINTS;

 CREATE TABLE BANK (	
    BANK_ID VARCHAR2(20)CONSTRAINT PK_BANK PRIMARY KEY, 
	BANK_NAME VARCHAR2(40)
);

   COMMENT ON COLUMN BANK.BANK_ID IS '은행 아이디';
   COMMENT ON COLUMN BANK.BANK_NAME IS '은행 이름';
  
   
--SELECT * FROM BANK;
----------------------------------------------------------------------------------------------------------------


DROP TABLE MEMBER CASCADE CONSTRAINTS;

 CREATE TABLE MEMBER (	
    MEMBER_ID VARCHAR2(30) CONSTRAINT PK_MEMBER PRIMARY KEY, 
	MEMBER_PWD VARCHAR2(100) NOT NULL, 
    MEMBER_NAME VARCHAR2(50) NOT NULL, 
	EMAIL VARCHAR2(40), 
    PHONE VARCHAR2(30), 
	ADDRESS_NUM VARCHAR2(50),
	ADDRESS VARCHAR2(500), 
	ENROLL_DATE DATE, 
	BLACKLIST_FLAG VARCHAR2(1) CHECK(BLACKLIST_FLAG IN ('Y', 'N')),
    ADMIN_FLAG VARCHAR2(1) CHECK(ADMIN_FLAG IN ('Y', 'N')),
    PROFILE_IMG_ORINAME VARCHAR2(100),
    PROFILE_IMG_RENAME VARCHAR2(100),
    LAST_LOGIN_DATE VARCHAR2(50),
    SYS_DATE VARCHAR2(50)

);

   COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
   COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '비밀번호';
   COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '이름';
   COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
   COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
   COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
   COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입날짜';
   COMMENT ON COLUMN MEMBER.BLACKLIST_FLAG IS '블랙리스트 플래그';
   COMMENT ON COLUMN MEMBER.ADMIN_FLAG IS '관리자 플래그';
   COMMENT ON COLUMN MEMBER.PROFILE_IMG_ORINAME IS '프로필이미지 원래 이름';
   COMMENT ON COLUMN MEMBER.PROFILE_IMG_RENAME IS '프로필이미지 변경된 이름';
   COMMENT ON COLUMN MEMBER.LAST_LOGIN_DATE IS '마지막 로그인 날짜';
   COMMENT ON COLUMN MEMBER.ADDRESS_NUM IS '우편 번호';
   
--SELECT * FROM MEMBER;
----------------------------------------------------------------------------------------------------------------

DROP TABLE MEMBER_ACCOUNT CASCADE CONSTRAINTS;

 CREATE TABLE MEMBER_ACCOUNT (	
    MEMBER_ID VARCHAR2(30), 
	ACCOUNT_NUMBER VARCHAR2(40), 
    BANK_ID VARCHAR2(20), 
    
    CONSTRAINT FK_MEMBERACCOUNT_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_MEMBERACCOUNT_BANK_ID FOREIGN KEY (BANK_ID) REFERENCES BANK (BANK_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN MEMBER_ACCOUNT.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN MEMBER_ACCOUNT.ACCOUNT_NUMBER IS '계좌번호';
   COMMENT ON COLUMN MEMBER_ACCOUNT.BANK_ID IS '은행 아이디';
  
  
   
--SELECT * FROM MEMBER_ACCOUNT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE T_MEM_RPT_COUNT CASCADE CONSTRAINTS;

 CREATE TABLE T_MEM_RPT_COUNT (	
    MEMBER_ID VARCHAR2(30), 
	TOTAL_REPORT_COUNT NUMBER DEFAULT 0, 
    
    CONSTRAINT FK_T_MEM_RPT_COUNT_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN T_MEM_RPT_COUNT.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN T_MEM_RPT_COUNT.TOTAL_REPORT_COUNT IS '총 신고 횟수';
  
   
--SELECT * FROM T_MEM_RPT_COUNT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE CATEGORY (	
    CATEGORY_ID VARCHAR2(10) CONSTRAINT PK_CATEGORY PRIMARY KEY, 
	CATEGORY_NAME VARCHAR2(50)
);

   COMMENT ON COLUMN CATEGORY.CATEGORY_ID IS '중카테고리 아이디';
   COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '중 카테고리 이름';
  
   
--SELECT * FROM CATEGORY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE CATEGORY_SUB CASCADE CONSTRAINTS;

 CREATE TABLE CATEGORY_SUB (	
    CATEGORY_SUB_ID VARCHAR2(10) CONSTRAINT PK_CATEGORY_SUB PRIMARY KEY, 
	CATEGORY_SUB_NAME VARCHAR2(50),
    CATEGORY_ID VARCHAR2(10), 
	
    CONSTRAINT FK_CATEGORY_SUB_CATEGORY_ID FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN CATEGORY_SUB.CATEGORY_SUB_ID IS '소카테고리 아이디';
   COMMENT ON COLUMN CATEGORY_SUB.CATEGORY_SUB_NAME IS '소카테고리 이름';
   COMMENT ON COLUMN CATEGORY_SUB.CATEGORY_ID IS '중카테고리 아이디';
  
--SELECT * FROM CATEGORY_SUB;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PROJECT_CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE PROJECT_CATEGORY (	
    PROJECT_CATEGORY_ID VARCHAR2(10) CONSTRAINT PK_PROJECT_CATEGORY PRIMARY KEY, 
	PROJECT_CATEGORY_NAME VARCHAR2(30)
);

   COMMENT ON COLUMN PROJECT_CATEGORY.PROJECT_CATEGORY_ID IS '프로젝트 카테고리 아이디';
   COMMENT ON COLUMN PROJECT_CATEGORY.PROJECT_CATEGORY_NAME IS '프로젝트 카테고리 이름';
  
--SELECT * FROM PROJECT_CATEGORY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PROJECT CASCADE CONSTRAINTS;

 CREATE TABLE PROJECT (	
    PROJECT_ID VARCHAR2(40) CONSTRAINT PK_PROJECT PRIMARY KEY, 
	PROJECT_CATEGORY_ID VARCHAR2(10), 
    CATEGORY_SUB_ID VARCHAR2(10), 
	PROJECT_NAME VARCHAR2(1000),
	MEMBER_ID VARCHAR2(30), 
	IMAGE_ORINAME VARCHAR2(500), 
    IMAGE_RENAME VARCHAR2(500), 
	REP_CONTENT VARCHAR2(4000), 
	TARGET_AMOUNT NUMBER, 
	CREATION_DATE DATE,
    START_DATE DATE,
    END_DATE DATE,
    PAYMENT_DATE DATE,
    REFUND_ROLE VARCHAR2(4000),
    PROJECT_REQUEST_FLAG VARCHAR2(1) CHECK(PROJECT_REQUEST_FLAG IN ('Y', 'N')),
    PROJECT_ONOFF_FLAG VARCHAR2(1) CHECK(PROJECT_ONOFF_FLAG IN ('Y', 'N')),
    REPORT_COUNT NUMBER DEFAULT 0,
    CERTIF_FLAG VARCHAR2(1) CHECK(CERTIF_FLAG IN ('Y', 'N')),
    REFUND_FLAG VARCHAR2(1) CHECK(REFUND_FLAG IN ('Y', 'N')),
    
    CONSTRAINT FK_PROJECT_PROJECT_CATEGORY_ID FOREIGN KEY (PROJECT_CATEGORY_ID) REFERENCES PROJECT_CATEGORY (PROJECT_CATEGORY_ID) ON DELETE SET NULL,
    CONSTRAINT FK_PROJECT_CATEGORY_SUB_ID FOREIGN KEY (CATEGORY_SUB_ID) REFERENCES CATEGORY_SUB (CATEGORY_SUB_ID) ON DELETE SET NULL,
    CONSTRAINT FK_PROJECT_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN PROJECT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PROJECT.PROJECT_CATEGORY_ID IS '프로젝트 카테고리 아이디';
   COMMENT ON COLUMN PROJECT.CATEGORY_SUB_ID IS '소카테고리 아이디';
   COMMENT ON COLUMN PROJECT.PROJECT_NAME IS '프로젝트 이름';
   COMMENT ON COLUMN PROJECT.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN PROJECT.IMAGE_ORINAME IS '대표이미지 원래 파일명';
   COMMENT ON COLUMN PROJECT.IMAGE_RENAME IS '대표이미지 변경된 파일명';
   COMMENT ON COLUMN PROJECT.REP_CONTENT IS '프로젝트 문구';
   COMMENT ON COLUMN PROJECT.TARGET_AMOUNT IS '목표금액';
   COMMENT ON COLUMN PROJECT.CREATION_DATE IS '등록일';
   COMMENT ON COLUMN PROJECT.START_DATE IS '시작일';
   COMMENT ON COLUMN PROJECT.END_DATE IS '마감일';
   COMMENT ON COLUMN PROJECT.PAYMENT_DATE IS '결제일';
   COMMENT ON COLUMN PROJECT.REFUND_ROLE IS '환불정책';
   COMMENT ON COLUMN PROJECT.PROJECT_REQUEST_FLAG IS '프로젝트 승인 요청 플래그';
   COMMENT ON COLUMN PROJECT.PROJECT_ONOFF_FLAG IS '프로젝트 비활성화 플래그';
   COMMENT ON COLUMN PROJECT.REPORT_COUNT IS '신고 횟수';
   COMMENT ON COLUMN PROJECT.CERTIF_FLAG IS '인증 여부';
   COMMENT ON COLUMN PROJECT.REFUND_FLAG IS '환불 여부';
  
   
--SELECT * FROM PROJECT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PROJECT_CONTENT CASCADE CONSTRAINTS;

 CREATE TABLE PROJECT_CONTENT (	
    PROJECT_ID VARCHAR2(40), 
	VIDEO_URL VARCHAR2(1000), 
    CONTENT CLOB, 
    
    CONSTRAINT FK_PROJECT_CONTENT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN PROJECT_CONTENT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PROJECT_CONTENT.VIDEO_URL IS '소개 영상 URL';
   COMMENT ON COLUMN PROJECT_CONTENT.CONTENT IS '상세 내용';
  
  
   
--SELECT * FROM PROJECT_CONTENT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE GIFT CASCADE CONSTRAINTS;

 CREATE TABLE GIFT (	
    GIFT_ID VARCHAR2(50) CONSTRAINT PK_GIFT PRIMARY KEY, 
	SUPPORT_PRICE NUMBER DEFAULT 0, 
    CAPACITY NUMBER DEFAULT 0, 
	PROJECT_ID VARCHAR2(40),
    
    CONSTRAINT FK_GIFT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN GIFT.GIFT_ID IS '선물 아이디';
   COMMENT ON COLUMN GIFT.SUPPORT_PRICE IS '후원 금액';
   COMMENT ON COLUMN GIFT.CAPACITY IS '최대 수량';
   COMMENT ON COLUMN GIFT.PROJECT_ID IS '프로젝트 아이디';
   
--SELECT * FROM GIFT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE ITEM CASCADE CONSTRAINTS;

 CREATE TABLE ITEM (	
    ITEM_ID VARCHAR2(50) CONSTRAINT PK_ITEM PRIMARY KEY, 
	ITEM_NAME VARCHAR2(500), 
    PROJECT_ID VARCHAR2(40), 
    
    CONSTRAINT FK_ITEM_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN ITEM.ITEM_ID IS '아이템 아이디';
   COMMENT ON COLUMN ITEM.ITEM_NAME IS '아이템 이름';
   COMMENT ON COLUMN ITEM.PROJECT_ID IS '프로젝트 아이디';
  
   
--SELECT * FROM ITEM;
----------------------------------------------------------------------------------------------------------------

DROP TABLE GIFT_IN_ITEMS CASCADE CONSTRAINTS;

 CREATE TABLE GIFT_IN_ITEMS (	
    GIFT_ID VARCHAR2(50), 
	ITEM_ID VARCHAR2(50), 
    COUNT NUMBER DEFAULT 1,

    CONSTRAINT FK_GIFT_IN_ITEMS_GIFT_ID FOREIGN KEY (GIFT_ID) REFERENCES GIFT (GIFT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_GIFT_IN_ITEMS_ITEM_ID FOREIGN KEY (ITEM_ID) REFERENCES ITEM (ITEM_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN GIFT_IN_ITEMS.GIFT_ID IS '선물 아이디';
   COMMENT ON COLUMN GIFT_IN_ITEMS.ITEM_ID IS '아이템 아이디';
   COMMENT ON COLUMN GIFT_IN_ITEMS.COUNT IS '아이템 수량';
  
   
--SELECT * FROM GIFT_IN_ITEMS;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PRODUCT CASCADE CONSTRAINTS;

 CREATE TABLE PRODUCT (	
    PRODUCT_ID VARCHAR2(50) CONSTRAINT PK_PRODUCT PRIMARY KEY, 
	PROJECT_ID VARCHAR2(40), 
    PRODUCT_NAME VARCHAR2(500), 
    PRODUCT_PRICE NUMBER DEFAULT 0,
	MINCOUNT NUMBER DEFAULT 0,
    
    CONSTRAINT FK_PRODUCT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN PRODUCT.PRODUCT_ID IS '공동구매 물품 아이디';
   COMMENT ON COLUMN PRODUCT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '상품명';
   COMMENT ON COLUMN PRODUCT.PRODUCT_PRICE IS '상품 가격';
   COMMENT ON COLUMN PRODUCT.MINCOUNT IS '최소 구매량';
  
--SELECT * FROM PRODUCT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PROJECT_ACCOUNT CASCADE CONSTRAINTS;

 CREATE TABLE PROJECT_ACCOUNT (	
    PROJECT_ID VARCHAR2(40), 
	BANK_ID VARCHAR2(20), 
    ACCOUNT_NAME VARCHAR2(100), 
	ACCOUNT_NUMBER VARCHAR2(30),
    
    CONSTRAINT FK_PROJECT_ACCOUNT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_PROJECT_ACCOUNT_BANK_ID FOREIGN KEY (BANK_ID) REFERENCES BANK (BANK_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN PROJECT_ACCOUNT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PROJECT_ACCOUNT.BANK_ID IS '거래 은행 아이디';
   COMMENT ON COLUMN PROJECT_ACCOUNT.ACCOUNT_NAME IS '예금주명';
   COMMENT ON COLUMN PROJECT_ACCOUNT.ACCOUNT_NUMBER IS '계좌 번호';
  
   
--SELECT * FROM PROJECT_ACCOUNT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PROJECT_REPLY CASCADE CONSTRAINTS;

DROP SEQUENCE PROREPLY_SEQ;

CREATE SEQUENCE PROREPLY_SEQ
START WITH 1
INCREMENT BY 1;

 CREATE TABLE PROJECT_REPLY (	
    PROJECT_REPLY_ID NUMBER CONSTRAINT PK_PROJECT_REPLY PRIMARY KEY, 
	MEMBER_ID VARCHAR2(30), 
    PROJECT_ID VARCHAR2(40), 
	REPLY_CONTENT VARCHAR2(1000),
	CREATION_DATE DATE, 
	REPLY_LEVEL NUMBER, 
    REPORT_COUNT NUMBER DEFAULT 0, 
	PROJ_REPLY_ID_REF NUMBER, 
    REPLY_SEQ NUMBER,
    
    CONSTRAINT FK_PROJECT_REPLY_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL,
    CONSTRAINT FK_PROJECT_REPLY_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_P_REPLY_PROJ_REPLY_ID_REF FOREIGN KEY (PROJ_REPLY_ID_REF) REFERENCES PROJECT_REPLY (PROJECT_REPLY_ID) ON DELETE CASCADE
);

  
   COMMENT ON COLUMN PROJECT_REPLY.PROJECT_REPLY_ID IS '프로젝트 댓글 아이디';
   COMMENT ON COLUMN PROJECT_REPLY.MEMBER_ID IS '댓글 작성자 아이디';
   COMMENT ON COLUMN PROJECT_REPLY.PROJECT_ID IS '원글 아이디(프로젝트 아이디)';
   COMMENT ON COLUMN PROJECT_REPLY.REPLY_CONTENT IS '내용';
   COMMENT ON COLUMN PROJECT_REPLY.CREATION_DATE IS '작성일';
   COMMENT ON COLUMN PROJECT_REPLY.REPLY_LEVEL IS '댓글 레벨';
   COMMENT ON COLUMN PROJECT_REPLY.REPORT_COUNT IS '신고 횟수';
   COMMENT ON COLUMN PROJECT_REPLY.PROJ_REPLY_ID_REF IS '프로젝트 댓글 아이디(대댓글용)';
   
--SELECT * FROM PROJECT_REPLY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE LIKES CASCADE CONSTRAINTS;

 CREATE TABLE LIKES (	
    PROJECT_ID VARCHAR2(40), 
	MEMBER_ID VARCHAR2(30), 
    
    CONSTRAINT FK_LIKES_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_LIKES_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN LIKES.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN LIKES.MEMBER_ID IS '회원 아이디';
     
--SELECT * FROM LIKES;
----------------------------------------------------------------------------------------------------------------

DROP TABLE MEMBER_TRUST CASCADE CONSTRAINTS;

 CREATE TABLE MEMBER_TRUST (	
    PROJECT_ID VARCHAR2(40), 
	MEMBER_ID VARCHAR2(30), 
    CORN_GRADE NUMBER DEFAULT 5, 
    CREATION_DATE DATE, 
    
    CONSTRAINT FK_MEMBER_TRUST_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_MEMBER_TRUST_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN MEMBER_TRUST.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN MEMBER_TRUST.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN MEMBER_TRUST.CORN_GRADE IS '콘 지수';
   COMMENT ON COLUMN MEMBER_TRUST.CREATION_DATE IS '평가한 날짜';
     
--SELECT * FROM MEMBER_TRUST;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PAYMENT CASCADE CONSTRAINTS;

 CREATE TABLE PAYMENT (	
    PAYMENT_ID VARCHAR2(50) CONSTRAINT PK_PAYMENT_ID PRIMARY KEY,  
    MEMBER_ID VARCHAR2(30), 
    PROJECT_ID VARCHAR2(40),
    TOTAL_AMOUNT NUMBER DEFAULT 0, 
    PAYMENT_DATE DATE, 
    REFUND_DATE DATE, 
    REFUND_FLAG VARCHAR2(1) CHECK(REFUND_FLAG IN ('Y', 'N')), 
    PAY_OPTION VARCHAR2(1) CHECK(PAY_OPTION IN('K', 'C')),

    
    CONSTRAINT FK_PAYMENT_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_PAYMENT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN PAYMENT.PAYMENT_ID IS '결제 아이디';
   COMMENT ON COLUMN PAYMENT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PAYMENT.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN PAYMENT.TOTAL_AMOUNT IS '총 금액';
   COMMENT ON COLUMN PAYMENT.PAYMENT_DATE IS '결제일';
   COMMENT ON COLUMN PAYMENT.REFUND_DATE IS '환불날짜';
   COMMENT ON COLUMN PAYMENT.REFUND_FLAG IS '환불 여부 플래그';
   COMMENT ON COLUMN PAYMENT.PAY_OPTION IS '결제 수단';
     
--SELECT * FROM PAYMENT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE PAYMENT_COUNT CASCADE CONSTRAINTS;

 CREATE TABLE PAYMENT_COUNT (	
    PAYMENT_ID VARCHAR2(50),
    PROJECT_ID VARCHAR2(50),
	GIFT_ID VARCHAR2(50), 
    PRODUCT_ID VARCHAR2(50), 
    COUNT NUMBER DEFAULT 1,
    
    CONSTRAINT FK_PAYMENTC_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_PAYMENTC_GIFT_ID FOREIGN KEY (GIFT_ID) REFERENCES GIFT (GIFT_ID) ON DELETE SET NULL,
    CONSTRAINT FK_PAYMENTC_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN PAYMENT_COUNT.PAYMENT_ID IS '결제 아이디';
   COMMENT ON COLUMN PAYMENT_COUNT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN PAYMENT_COUNT.GIFT_ID IS '선물 아이디';
   COMMENT ON COLUMN PAYMENT_COUNT.PRODUCT_ID IS '물품 아이디';
   COMMENT ON COLUMN PAYMENT_COUNT.COUNT IS '선물,물품 갯수';
     
--SELECT * FROM PAYMENT_COUNT;
----------------------------------------------------------------------------------------------------------------


DROP TABLE BOARD_CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE BOARD_CATEGORY (	
    BOARD_CATEGORY_ID VARCHAR2(10) CONSTRAINT PK_BOARD_CATEGORY PRIMARY KEY, 
	BOARD_CATEGORY_NAME VARCHAR2(30)
);

   COMMENT ON COLUMN BOARD_CATEGORY.BOARD_CATEGORY_ID IS '게시글 카테고리 아이디';
   COMMENT ON COLUMN BOARD_CATEGORY.BOARD_CATEGORY_NAME IS '게시글 카테고리 이름';
     
--SELECT * FROM BOARD_CATEGORY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE BOARD CASCADE CONSTRAINTS;

 CREATE TABLE BOARD (	
    BOARD_ID NUMBER CONSTRAINT PK_BOARD PRIMARY KEY, 
	BOARD_CATEGORY_ID VARCHAR2(10), 
    MEMBER_ID VARCHAR2(30), 
	TITLE VARCHAR2(100),
	CONTENT VARCHAR2(4000), 
	CREATION_DATE DATE, 
    READCOUNT NUMBER  DEFAULT 0, 
	RECOMMEND_COUNT NUMBER  DEFAULT 0, 
    REPORT_COUNT NUMBER  DEFAULT 0, 
    ORI_FILENAME VARCHAR2(100), 
    RE_FILENAME VARCHAR2(100), 
    
    CONSTRAINT FK_BOARD_BOARD_CATEGORY_ID FOREIGN KEY (BOARD_CATEGORY_ID) REFERENCES BOARD_CATEGORY (BOARD_CATEGORY_ID) ON DELETE CASCADE,
    CONSTRAINT FK_BOARD_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN BOARD.BOARD_ID IS '게시글 아이디';
   COMMENT ON COLUMN BOARD.BOARD_CATEGORY_ID IS '게시글 카테고리 아이디';
   COMMENT ON COLUMN BOARD.MEMBER_ID IS '작성자';
   COMMENT ON COLUMN BOARD.TITLE IS '제목';
   COMMENT ON COLUMN BOARD.CONTENT IS '내용';
   COMMENT ON COLUMN BOARD.CREATION_DATE IS '작성일';
   COMMENT ON COLUMN BOARD.READCOUNT IS '조회수';
   COMMENT ON COLUMN BOARD.RECOMMEND_COUNT IS '추천수';
   COMMENT ON COLUMN BOARD.REPORT_COUNT IS '신고 횟수';
   COMMENT ON COLUMN BOARD.ORI_FILENAME IS '파일 원래 이름';
   COMMENT ON COLUMN BOARD.RE_FILENAME IS '파일 변경된 이름';
    
--SELECT * FROM BOARD;
----------------------------------------------------------------------------------------------------------------

DROP TABLE BOARD_REPLY CASCADE CONSTRAINTS;

 CREATE TABLE BOARD_REPLY (	
    BOARD_REPLY_ID NUMBER CONSTRAINT PK_BOARD_REPLY PRIMARY KEY, 
	MEMBER_ID VARCHAR2(30), 
    BOARD_ID NUMBER, 
	BOARD_CONTENT VARCHAR2(1000),
	CREATION_DATE DATE, 
	BOARD_LEVEL NUMBER, 
    REPORT_COUNT NUMBER  DEFAULT 0, 
	BOARD_REPLY_ID_REF NUMBER, 
    
    CONSTRAINT FK_BOARD_REPLY_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL,
    CONSTRAINT FK_BOARD_REPLY_BOARD_ID FOREIGN KEY (BOARD_ID) REFERENCES BOARD (BOARD_ID) ON DELETE CASCADE,
    CONSTRAINT FK_BOARD_REPLY_B_REPLY_ID_REF FOREIGN KEY (BOARD_REPLY_ID_REF) REFERENCES BOARD_REPLY (BOARD_REPLY_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN BOARD_REPLY.BOARD_REPLY_ID IS '게시글 댓글 아이디';
   COMMENT ON COLUMN BOARD_REPLY.MEMBER_ID IS '댓글 작성자 아이디';  
   COMMENT ON COLUMN BOARD_REPLY.BOARD_ID IS '원글 아이디(게시글 아이디)';
   COMMENT ON COLUMN BOARD_REPLY.BOARD_CONTENT IS '내용';
   COMMENT ON COLUMN BOARD_REPLY.CREATION_DATE IS '작성일';
   COMMENT ON COLUMN BOARD_REPLY.BOARD_LEVEL IS '댓글 레벨';
   COMMENT ON COLUMN BOARD_REPLY.REPORT_COUNT IS '신고 횟수';
   COMMENT ON COLUMN BOARD_REPLY.BOARD_REPLY_ID_REF IS '게시글 댓글 아이디(대댓글용)';
    
--SELECT * FROM BOARD_REPLY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE QUESTION_CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE QUESTION_CATEGORY (	
    QUESTION_CATEGORY_ID VARCHAR2(10) CONSTRAINT PK_QUESTION_CATEGORY PRIMARY KEY, 
	QUESTION_CATEGORY_NAME VARCHAR2(50)
);

   COMMENT ON COLUMN QUESTION_CATEGORY.QUESTION_CATEGORY_ID IS '문의함 카테고리';
   COMMENT ON COLUMN QUESTION_CATEGORY.QUESTION_CATEGORY_NAME IS '문의함 카테고리 이름';
     
--SELECT * FROM QUESTION_CATEGORY;
----------------------------------------------------------------------------------------------------------------


DROP TABLE QUESTION CASCADE CONSTRAINTS;

 CREATE TABLE QUESTION (	
    QUESTION_ID NUMBER CONSTRAINT PK_QUESTION PRIMARY KEY, 
	QUESTION_CATEGORY_ID VARCHAR2(10), 
    RECEIVE_MEMBER_ID VARCHAR2(30), 
	SEND_MEMBER_ID VARCHAR2(30),
	TITLE VARCHAR2(100), 
	CONTENT VARCHAR2(500), 
    RE_CONTENT VARCHAR2(500), 
    SEND_CREATION_DATE DATE,
    RECEIVE_CREATION_DATE DATE,
    
    CONSTRAINT FK_QUESTION_QCATEGORY_ID FOREIGN KEY (QUESTION_CATEGORY_ID) REFERENCES QUESTION_CATEGORY (QUESTION_CATEGORY_ID) ON DELETE CASCADE,
    CONSTRAINT FK_QUESTION_RECEIVE_MEMBER_ID FOREIGN KEY (RECEIVE_MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_QUESTION_SEND_MEMBER_ID FOREIGN KEY (SEND_MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL
);

  
   COMMENT ON COLUMN QUESTION.QUESTION_ID IS '문의함 아이디';
   COMMENT ON COLUMN QUESTION.QUESTION_CATEGORY_ID IS '문의함 카테고리';
   COMMENT ON COLUMN QUESTION.RECEIVE_MEMBER_ID IS '받는 회원 아이디';
   COMMENT ON COLUMN QUESTION.SEND_MEMBER_ID IS '보내는 회원 아이디';
   COMMENT ON COLUMN QUESTION.TITLE IS '문의함 제목';
   COMMENT ON COLUMN QUESTION.CONTENT IS '문의함 내용';
   COMMENT ON COLUMN QUESTION.RE_CONTENT IS '문의함 답변 내용';
   COMMENT ON COLUMN QUESTION.SEND_CREATION_DATE IS '문의 작성 날짜';
   COMMENT ON COLUMN QUESTION.RECEIVE_CREATION_DATE IS '문의 답변 날짜';
    
--SELECT * FROM QUESTION;
----------------------------------------------------------------------------------------------------------------

DROP TABLE REPORT_CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE REPORT_CATEGORY (	
    REPORT_CATEGORY_ID VARCHAR2(10) CONSTRAINT PK_REPORT_CATEGORY PRIMARY KEY, 
	REPORT_CATEGORY_NAME VARCHAR2(50)
);

   COMMENT ON COLUMN REPORT_CATEGORY.REPORT_CATEGORY_ID IS '신고 카테고리 아이디';
   COMMENT ON COLUMN REPORT_CATEGORY.REPORT_CATEGORY_NAME IS '신고 카테고리 이름';
     
--SELECT * FROM REPORT_CATEGORY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE REPORT CASCADE CONSTRAINTS;

 CREATE TABLE REPORT (   
    REPORT_ID NUMBER CONSTRAINT PK_REPORT PRIMARY KEY, 
   REPORT_CATEGORY_ID VARCHAR2(10), 
    PROJECT_ID VARCHAR2(40), 
   PROJECT_REPLY_ID NUMBER,
   BOARD_ID NUMBER, 
   BOARD_REPLY_ID NUMBER, 
    REPORT_REASON VARCHAR2(200), 
   MEMBER_ID VARCHAR2(30), 
    REPORT_DATE DATE, 
    REPORT_READ_FLAG VARCHAR2(1) CHECK(REPORT_READ_FLAG IN ('Y', 'N')),
    
    CONSTRAINT FK_REPORT_REPORT_CATEGORY_ID FOREIGN KEY (REPORT_CATEGORY_ID) REFERENCES REPORT_CATEGORY (REPORT_CATEGORY_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REPORT_PROJECT_ID FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REPORT_PROJECT_REPLY_ID FOREIGN KEY (PROJECT_REPLY_ID) REFERENCES PROJECT_REPLY (PROJECT_REPLY_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REPORT_BOARD_ID FOREIGN KEY (BOARD_ID) REFERENCES BOARD (BOARD_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REPORT_BOARD_REPLY_ID FOREIGN KEY (BOARD_REPLY_ID) REFERENCES BOARD_REPLY (BOARD_REPLY_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REPORT_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

   COMMENT ON COLUMN REPORT.REPORT_ID IS '신고 아이디';
   COMMENT ON COLUMN REPORT.REPORT_CATEGORY_ID IS '신고 카테고리 아이디';
   COMMENT ON COLUMN REPORT.PROJECT_ID IS '프로젝트 아이디';
   COMMENT ON COLUMN REPORT.PROJECT_REPLY_ID IS '프로젝트 댓글 아이디';
   COMMENT ON COLUMN REPORT.BOARD_ID IS '게시글 아이디';
   COMMENT ON COLUMN REPORT.BOARD_REPLY_ID IS '게시글 댓글 아이디';
   COMMENT ON COLUMN REPORT.REPORT_REASON IS '신고 사유';
   COMMENT ON COLUMN REPORT.MEMBER_ID IS '신고한 회원';
   COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고 날짜';
   COMMENT ON COLUMN REPORT.REPORT_READ_FLAG IS '신고 읽음 여부';
    
--SELECT * FROM REPORT;
----------------------------------------------------------------------------------------------------------------

DROP TABLE NOTICE CASCADE CONSTRAINTS;

 CREATE TABLE NOTICE (	
    NOTICE_ID NUMBER CONSTRAINT PK_NOTICE PRIMARY KEY, 
	TITLE VARCHAR2(100),
    CREATION_DATE DATE,
    CONTENT VARCHAR2(1000)
);

   COMMENT ON COLUMN NOTICE.NOTICE_ID IS '공지사항 아이디';
   COMMENT ON COLUMN NOTICE.TITLE IS '제목';
   COMMENT ON COLUMN NOTICE.CREATION_DATE IS '작성일';
   COMMENT ON COLUMN NOTICE.CONTENT IS '내용';
        
--SELECT * FROM NOTICE;
----------------------------------------------------------------------------------------------------------------


DROP TABLE TABOO CASCADE CONSTRAINTS;

 CREATE TABLE TABOO (	
    CONTENT VARCHAR2(50)
);

   COMMENT ON COLUMN TABOO.CONTENT IS '금지단어';
        
--SELECT * FROM TABOO;
----------------------------------------------------------------------------------------------------------------

DROP TABLE ALARM_CATEGORY CASCADE CONSTRAINTS;

 CREATE TABLE ALARM_CATEGORY (	
    ALA_CATE_ID VARCHAR2(30) CONSTRAINT PK_ALARM_CATEGORY PRIMARY KEY, 
	ALA_CATE_NAME VARCHAR2(50)
);

   COMMENT ON COLUMN ALARM_CATEGORY.ALA_CATE_ID IS '알람 카테고리 아이디';
   COMMENT ON COLUMN ALARM_CATEGORY.ALA_CATE_NAME IS '알람 카테고리 이름';  
   
--SELECT * FROM ALARM_CATEGORY;
----------------------------------------------------------------------------------------------------------------

DROP TABLE ALARM CASCADE CONSTRAINTS;

 CREATE TABLE ALARM (	
    ALARM_ID NUMBER CONSTRAINT PK_ALARM PRIMARY KEY, 
	ALA_CATE_ID VARCHAR2(30), 
    MEMBER_ID VARCHAR2(30), 
	CONTENT VARCHAR2(300),
	READ_FLAG VARCHAR2(1) CHECK(READ_FLAG IN ('Y', 'N')), 
    
    CONSTRAINT FK_ALARM_ALA_CATE_ID FOREIGN KEY (ALA_CATE_ID) REFERENCES ALARM_CATEGORY (ALA_CATE_ID) ON DELETE CASCADE,
    CONSTRAINT FK_ALARM_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL
);

   COMMENT ON COLUMN ALARM.ALARM_ID IS '알람 아이디';
   COMMENT ON COLUMN ALARM.ALA_CATE_ID IS '알람 카테고리 아이디';  
   COMMENT ON COLUMN ALARM.MEMBER_ID IS '회원 아이디';
   COMMENT ON COLUMN ALARM.CONTENT IS '내용';
   COMMENT ON COLUMN ALARM.READ_FLAG IS '읽음 여부';
    
--SELECT * FROM ALARM;
----------------------------------------------------------------------------------------------------------------
DROP TABLE board_recommend CASCADE CONSTRAINTS;
create table board_recommend(
    member_id varchar2(30),
    board_id number,
    CONSTRAINT FK_brecommend_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_brecommend_board_ID FOREIGN KEY (board_ID) REFERENCES board (board_ID) ON DELETE CASCADE
 );
select * from board_recommend;
----------------------------------------------------------------------------------------------------------------
DROP TABLE webchat CASCADE CONSTRAINTS;
create table webchat(
    room_id number constraint pk_webchat primary key,
    room_name varchar2(100 byte),
    member_id varchar2(30 byte),
    room_reply_id number,
    room_category varchar2(30)
     CONSTRAINT FK_webchat_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
     CONSTRAINT FK_webchat_reply_ID FOREIGN KEY (room_reply_id) REFERENCES webchat (room_ID) ON DELETE CASCADE
);
 COMMENT ON COLUMN webchat.room_ID IS '방 고유번호';
 COMMENT ON COLUMN webchat.room_name IS '방 이름';
 COMMENT ON COLUMN webchat.member_ID IS '접속 인원';
 COMMENT ON COLUMN webchat.room_reply_ID IS '접속한 방 번호';
 COMMENT ON COLUMN webchat.room_reply_ID IS '방 분류';
select * from webchat;
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------





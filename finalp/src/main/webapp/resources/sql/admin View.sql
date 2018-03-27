--ADMIN VIEW 
--A_ALARM
CREATE OR REPLACE VIEW A_ALARM(
    MEMBERCOUNT,BLACKLISTCOUNT, PROJECTCOUNT,PRODUCTCOUNT, OFFPROJECTCOUNT, QUESTIONCOUNT, REPORTCOUNT)
AS SELECT (SELECT COUNT(MEMBER_ID) FROM MEMBER) AS MEMBERCOUNT,
(SELECT COUNT(*)FROM MEMBER WHERE BLACKLIST_FLAG='Y') AS BLACKLISTCOUNT,
(SELECT COUNT(PROJECT_ID) FROM PROJECT WHERE PROJECT_CATEGORY_ID='PC-FUND' ) AS PROJECTCOUNT,
(SELECT COUNT(PROJECT_ID) FROM PROJECT WHERE PROJECT_CATEGORY_ID='PC-PROD' ) AS PRODUCTCOUNT,
(SELECT COUNT(PROJECT_ID) FROM PROJECT WHERE PROJECT_REQUEST_FLAG='Y') AS OFFPROJECTCOUNT,
(SELECT COUNT(QUESTION_ID) FROM QUESTION WHERE RECEIVE_MEMBER_ID = 'admin' AND RE_CONTENT IS NULL),
(SELECT COUNT(REPORT_ID) FROM REPORT WHERE REPORT_READ_FLAG='N')
FROM MEMBER
WHERE MEMBER_ID='admin';

--A_QUESTOIN
CREATE OR REPLACE VIEW A_QUESTION(
    QUESTION_ID,QUESTION_CATEGORY_NAME,RECEIVE_MEMBER_NAME, 
    SEND_MEMBER_NAME, TITLE, CONTENT, RE_CONTENT, SEND_CREATION_DATE, RECEIVE_CREATION_DATE)
AS SELECT  QUESTION_ID,QUESTION_CATEGORY_NAME,(SELECT MEMBER_NAME FROM MEMBER M 
          WHERE M.MEMBER_ID = Q.RECEIVE_MEMBER_ID) AS RECEIVE_MEMBER_NAME, 
          (SELECT MEMBER_NAME FROM MEMBER M WHERE M.MEMBER_ID = Q.SEND_MEMBER_ID) AS SEND_MEMBER_NAME, 
          TITLE, CONTENT, RE_CONTENT,SEND_CREATION_DATE, RECEIVE_CREATION_DATE
    FROM QUESTION Q
    LEFT JOIN QUESTION_CATEGORY A ON(Q.QUESTION_CATEGORY_ID = A.QUESTION_CATEGORY_ID)
    ORDER BY SEND_CREATION_DATE DESC;

--A_REPORT(RNUM)
CREATE OR REPLACE VIEW A_REPORT(
RNUM,REPORT_ID, REPORT_CATEGORY_NAME, PROJECT_CATEGORY_ID, PROJECT_ID, PROJECT_REPLY_ID, BOARD_ID, BOARD_REPLY_ID, 
BLACK_NAME, REPORT_REASON, MEMBER_NAME, REPORT_DATE, REPORT_PROJECT_NAME, REPLY_CONTENT, REPORT_COUNT , REPORT_READ_FLAG )
AS SELECT ROWNUM RNUM,REPORT_ID, REPORT_CATEGORY_NAME,PROJECT_CATEGORY_ID, PROJECT_ID, PROJECT_REPLY_ID, BOARD_ID, BOARD_REPLY_ID, 
    BLACK_NAME, REPORT_REASON, MEMBER_NAME, REPORT_DATE, REPORT_PROJECT_NAME, REPLY_CONTENT, REPORT_COUNT , REPORT_READ_FLAG
FROM (SELECT R.REPORT_ID, C.REPORT_CATEGORY_NAME, P.PROJECT_CATEGORY_ID, R.PROJECT_ID, R.PROJECT_REPLY_ID, R.BOARD_ID, R.BOARD_REPLY_ID,
    CASE WHEN R.PROJECT_ID IS NOT NULL THEN (SELECT MEMBER_NAME FROM MEMBER M WHERE M.MEMBER_ID=P.MEMBER_ID) 
        WHEN R.PROJECT_REPLY_ID IS NOT NULL THEN (SELECT MEMBER_NAME FROM MEMBER M WHERE M.MEMBER_ID=T.MEMBER_ID)
        WHEN R.BOARD_ID IS NOT NULL THEN (SELECT MEMBER_NAME FROM MEMBER M WHERE M.MEMBER_ID=B.MEMBER_ID)
        WHEN R.BOARD_REPLY_ID IS NOT NULL THEN (SELECT MEMBER_NAME FROM MEMBER M WHERE M.MEMBER_ID=D.MEMBER_ID)
    END AS BLACK_NAME, R.REPORT_REASON, ME.MEMBER_NAME, R.REPORT_DATE,
    CASE WHEN R.PROJECT_ID IS NOT NULL THEN P.PROJECT_NAME WHEN R.PROJECT_REPLY_ID IS NOT NULL 
        THEN (SELECT J.PROJECT_NAME FROM PROJECT_REPLY E LEFT JOIN PROJECT J ON(E.PROJECT_ID=J.PROJECT_ID)
            WHERE E.PROJECT_REPLY_ID=R.PROJECT_REPLY_ID)
        WHEN R.BOARD_ID IS NOT NULL THEN B.TITLE WHEN R.BOARD_REPLY_ID IS NOT NULL 
        THEN (SELECT O.TITLE FROM BOARD_REPLY A LEFT JOIN BOARD O ON(A.BOARD_ID=O.BOARD_ID) 
            WHERE A.BOARD_REPLY_ID=R.BOARD_REPLY_ID)
    END AS REPORT_PROJECT_NAME,
    CASE WHEN R.PROJECT_REPLY_ID IS NOT NULL THEN T.REPLY_CONTENT
        WHEN R.BOARD_REPLY_ID IS NOT NULL THEN D.BOARD_CONTENT
    END AS REPLY_CONTENT,
    CASE WHEN R.PROJECT_ID IS NOT NULL THEN P.REPORT_COUNT WHEN R.PROJECT_REPLY_ID IS NOT NULL THEN T.REPORT_COUNT
        WHEN R.BOARD_ID IS NOT NULL THEN B.REPORT_COUNT WHEN R.BOARD_REPLY_ID IS NOT NULL THEN D.REPORT_COUNT
    END AS REPORT_COUNT , REPORT_READ_FLAG AS REPORT_READ_FLAG
    FROM REPORT R
    LEFT JOIN MEMBER ME ON(R.MEMBER_ID = ME.MEMBER_ID)
    LEFT JOIN REPORT_CATEGORY C ON(R.REPORT_CATEGORY_ID=C.REPORT_CATEGORY_ID)
    LEFT JOIN PROJECT P ON(R.PROJECT_ID=P.PROJECT_ID)
    LEFT JOIN PROJECT_REPLY T ON(R.PROJECT_REPLY_ID=T.PROJECT_REPLY_ID)
    LEFT JOIN BOARD B ON(R.BOARD_ID=B.BOARD_ID)
    LEFT JOIN BOARD_REPLY D ON(R.BOARD_REPLY_ID=D.BOARD_REPLY_ID)
    ORDER BY REPORT_READ_FLAG ASC, REPORT_DATE DESC);

--A_PROJECT
CREATE OR REPLACE VIEW A_PROJECT(
RNUM, PROJECT_CATEGORY_NAME, CATEGORY_SUB_NAME, PROJECT_ID, PROJECT_NAME, MEMBER_NAME, CREATION_DATE,PROJECT_REQUEST_FLAG, 
PROJECT_ONOFF_FLAG,TARGET_AMOUNT,REPORT_COUNT, START_DATE, END_DATE, SPON , ING_FLAG, REFUND_FLAG)
AS SELECT ROWNUM RNUM,C.PROJECT_CATEGORY_NAME, CS.CATEGORY_SUB_NAME, P.PROJECT_ID, P.PROJECT_NAME, M.MEMBER_NAME, P.CREATION_DATE ,P.PROJECT_REQUEST_FLAG, 
    P.PROJECT_ONOFF_FLAG,P.TARGET_AMOUNT, P.REPORT_COUNT, P.START_DATE, P.END_DATE, 
    CASE WHEN C.PROJECT_CATEGORY_NAME='�ݵ�' THEN ROUND(NVL((SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA 
            WHERE PA.PROJECT_ID = P.PROJECT_ID GROUP BY PROJECT_ID),0)/NVL(TARGET_AMOUNT,0)*100)
        WHEN C.PROJECT_CATEGORY_NAME='��������' THEN ROUND(NVL((SELECT SUM(NVL(PAYTOTAL.COUNT, 0)) AS SUM_PAY_COUNT
                        FROM PRODUCT PROD
                        LEFT JOIN (SELECT PAY.PROJECT_ID,
                                          PAYC.PRODUCT_ID,
                                          COUNT
                                    FROM PAYMENT PAY
                                    JOIN PAYMENT_COUNT PAYC ON(PAY.PAYMENT_ID = PAYC.PAYMENT_ID)
                                    WHERE PAYC.PRODUCT_ID IS NOT NULL) PAYTOTAL ON(PAYTOTAL.PRODUCT_ID = PROD.PRODUCT_ID)
                        WHERE PROD.PROJECT_ID = P.PROJECT_ID
                        GROUP BY (PROD.PROJECT_ID)),0)/NVL(TARGET_AMOUNT,0)*100)
    END AS SPON,
    CASE WHEN P.END_DATE >= SYSDATE AND P.START_DATE IS NOT NULL THEN 'Y' WHEN P.END_DATE < SYSDATE THEN 'N' END AS ING_FLAG , P.REFUND_FLAG
    FROM PROJECT P
    LEFT JOIN MEMBER M ON(P.MEMBER_ID = M.MEMBER_ID)
    LEFT JOIN PROJECT_CATEGORY C ON(P.PROJECT_CATEGORY_ID=C.PROJECT_CATEGORY_ID)
    LEFT JOIN CATEGORY_SUB CS ON(P.CATEGORY_SUB_ID=CS.CATEGORY_SUB_ID)
    ORDER BY PROJECT_NAME ASC;
    
--A_MEMBER
CREATE OR REPLACE VIEW A_MEMBER(
    RNUM, MEMBER_ID, MEMBER_NAME,EMAIL,PHONE,TOTAL_REPORT_COUNT,BLACKLIST_FLAG,
    PROFILE_IMG_ORINAME, PROFILE_IMG_RENAME,PROJECT_COUNT,SPON_MONEY)
AS SELECT ROWNUM RNUM, MEMBER_ID, MEMBER_NAME,EMAIL,PHONE,
    (SELECT COUNT(*) FROM A_REPORT R WHERE R.BLACK_NAME=M.MEMBER_NAME ) AS TOTAL_REPORT_COUNT,
    BLACKLIST_FLAG,PROFILE_IMG_ORINAME, PROFILE_IMG_RENAME,
    (SELECT COUNT(*) FROM A_PROJECT P WHERE P.MEMBER_NAME=M.MEMBER_NAME) AS PROJECT_COUNT, 
    (SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA WHERE PA.MEMBER_ID = M.MEMBER_ID GROUP BY MEMBER_ID) AS SPON_MONEY
    FROM MEMBER M
    ORDER BY MEMBER_NAME ASC;

--A_MONEYSTAT
CREATE OR REPLACE VIEW A_MONEYSTAT(
    RNUM, MONEY, PROJECT_ID, PROJECT_NAME, PROJECT_CATEGORY_NAME)
AS SELECT RNUM, MONEY ,PROJECT_ID ,PROJECT_NAME ,
    PROJECT_CATEGORY_NAME
FROM (SELECT RANK() OVER(ORDER BY SUM(TOTAL_AMOUNT) DESC) AS RNUM, SUM(TOTAL_AMOUNT) AS MONEY,
      A.PROJECT_ID,R.PROJECT_NAME,C.PROJECT_CATEGORY_NAME
      FROM PAYMENT A
      LEFT JOIN PROJECT R ON (A.PROJECT_ID=R.PROJECT_ID) 
      LEFT JOIN PROJECT_CATEGORY C ON(R.PROJECT_CATEGORY_ID=C.PROJECT_CATEGORY_ID)
      GROUP BY A.PROJECT_ID, R.PROJECT_NAME, C.PROJECT_CATEGORY_NAME
      ORDER BY SUM(TOTAL_AMOUNT) DESC)
WHERE RNUM < 11;

--A_SPONSTAT
CREATE OR REPLACE VIEW A_SPONSTAT(
    RANUM, SPON, MEMBER_ID, MEMBER_NAME, PROFILE_IMG_ORINAME, PROFILE_IMG_RENAME)
AS SELECT RANUM, SPON, MEMBER_ID, MEMBER_NAME, PROFILE_IMG_ORINAME, PROFILE_IMG_RENAME
  FROM (SELECT RANK() OVER(ORDER BY SUM(TOTAL_AMOUNT) DESC) AS RANUM, SUM(TOTAL_AMOUNT) 
          AS SPON, A.MEMBER_ID, M.MEMBER_NAME, M.PROFILE_IMG_ORINAME, M.PROFILE_IMG_RENAME
        FROM PAYMENT A
        LEFT JOIN MEMBER M ON (A.MEMBER_ID=M.MEMBER_ID) 
        GROUP BY A.MEMBER_ID, M.MEMBER_NAME, M.PROFILE_IMG_ORINAME, M.PROFILE_IMG_RENAME
        ORDER BY SUM(TOTAL_AMOUNT) DESC)
  WHERE RANUM < 4;
  
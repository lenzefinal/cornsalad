CREATE OR REPLACE VIEW V_PAY_AMOUNT_TOP5(
RANK_NUM, PROJECT_ID, PROJECT_NAME, PROJECT_CATEGORY_ID, IMAGE_RENAME
)
AS
SELECT ROWNUM,
       PROJECT_ID,
       PROJECT_NAME,
       PROJECT_CATEGORY_ID,
       IMAGE_RENAME
FROM(
    SELECT PRO.PROJECT_ID,
           PRO.PROJECT_NAME,
           PRO.PROJECT_CATEGORY_ID,
           PRO.IMAGE_RENAME,
           SUM(PAY.TOTAL_AMOUNT) AS AMOUNT_SUM
    FROM PAYMENT PAY
    JOIN PROJECT PRO ON(PRO.PROJECT_ID = PAY.PROJECT_ID)
    GROUP BY PRO.PROJECT_ID, PRO.PROJECT_NAME, 
                PRO.PROJECT_CATEGORY_ID, PRO.IMAGE_RENAME
    ORDER BY SUM(TOTAL_AMOUNT) DESC
)
WHERE ROWNUM < 6
;
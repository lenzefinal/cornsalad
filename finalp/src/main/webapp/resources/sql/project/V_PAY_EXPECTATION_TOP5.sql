CREATE OR REPLACE VIEW V_PAY_EXPECTATION_TOP5(
RANK_NUM, PROJECT_ID, PROJECT_NAME, PROJECT_CATEGORY_ID, IMAGE_RENAME
) AS 
SELECT ROWNUM,
       PROJECT_ID,
       PROJECT_NAME,
       PROJECT_CATEGORY_ID,
       IMAGE_RENAME
FROM(   SELECT PROJECT_ID,
               PROJECT_NAME,
               PROJECT_CATEGORY_ID,
               IMAGE_RENAME,
               ROUND(AMOUNT_COUNT/PERCEN, 2) AS EXPECTATION
        FROM(SELECT PROJECT_ID,
                   PROJECT_NAME,
                   PROJECT_CATEGORY_ID,
                   IMAGE_RENAME,
                   AMOUNT_SUM,
                   (SELECT AVG(AMOUNT_SUM)
                    FROM(SELECT SUM(TOTAL_AMOUNT) AS AMOUNT_SUM
                        FROM PAYMENT
                        GROUP BY PROJECT_ID)) AS AVERAGE,
                   CEIL((AMOUNT_SUM/(SELECT AVG(AMOUNT_SUM)
                    FROM(SELECT SUM(TOTAL_AMOUNT) AS AMOUNT_SUM
                        FROM PAYMENT
                        GROUP BY PROJECT_ID)))*100) AS PERCEN,
                    AMOUNT_COUNT     
            FROM(SELECT PRO.PROJECT_ID,
                        PRO.PROJECT_NAME,
                        PRO.PROJECT_CATEGORY_ID,
                        PRO.IMAGE_RENAME,
                        SUM(TOTAL_AMOUNT) AS AMOUNT_SUM,
                        COUNT(TOTAL_AMOUNT) AS AMOUNT_COUNT
                FROM PAYMENT PAY
                JOIN PROJECT PRO ON(PAY.PROJECT_ID = PRO.PROJECT_ID)
                GROUP BY PRO.PROJECT_ID, PRO.PROJECT_NAME,
                       PRO.PROJECT_CATEGORY_ID, PRO.IMAGE_RENAME)
        )
        ORDER BY EXPECTATION DESC
)
WHERE ROWNUM < 6
;
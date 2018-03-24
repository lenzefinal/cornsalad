
----------------------------ÆÝµùÇÁ·ÎÁ§Æ® ½æ³×ÀÏ ºä-------------------
  CREATE OR REPLACE VIEW "CORNSALAD"."V_PROJECTLIST" 
  ("PROJECT_ID", "IMAGE_RENAME", "PROJECT_NAME", "PROJECT_CATEGORY_ID", "PROJECT_CATEGORY_NAME", "CATEGORY_SUB_ID", "CATEGORY_SUB_NAME", 
   "CATEGORY_ID", "CATEGORY_NAME", "START_DATE", "END_DATE", "MEMBER_ID", "MEMBER_NAME", "TARGET_AMOUNT", "DDAY", "TOTAL_AMOUNT", "PERCENT", "REPORT_COUNT") 
   AS 
  (SELECT P.PROJECT_ID AS PROJECT_ID, IMAGE_RENAME, PROJECT_NAME, P.PROJECT_CATEGORY_ID AS PROJECT_CATEGORY_ID, PROJECT_CATEGORY_NAME, 
          P.CATEGORY_SUB_ID AS CATEGORY_SUB_ID, CATEGORY_SUB_NAME, CS.CATEGORY_ID AS CATEGORY_ID, CATEGORY_NAME, START_DATE, END_DATE, 
          P.MEMBER_ID AS MEMBER_ID, MEMBER_NAME, NVL(TARGET_AMOUNT,0), ROUND(END_DATE-SYSDATE) AS DDAY,
          TO_CHAR(NVL((SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA WHERE PA.PROJECT_ID = P.PROJECT_ID GROUP BY PROJECT_ID),0),'999,999,999,999,999') AS TOTAL_AMOUNT, 
          CONCAT(ROUND(NVL((SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA WHERE PA.PROJECT_ID = P.PROJECT_ID GROUP BY PROJECT_ID),0)/NVL(TARGET_AMOUNT,0)*100),'%') AS PERCENT,
          P.REPORT_COUNT
FROM PROJECT P
JOIN PROJECT_CATEGORY PC ON(P.PROJECT_CATEGORY_ID = PC.PROJECT_CATEGORY_ID)
JOIN CATEGORY_SUB CS ON(P.CATEGORY_SUB_ID = CS.CATEGORY_SUB_ID)
JOIN CATEGORY C ON(CS.CATEGORY_ID = C.CATEGORY_ID)
JOIN MEMBER M ON(P.MEMBER_ID = M.MEMBER_ID)
where PROJECT_REQUEST_FLAG ='N' and PROJECT_ONOFF_FLAG='Y' and p.project_category_id='PC-FUND');


-----------------------°øµ¿±¸¸Å ½æ³×ÀÏ ºä------------------
 CREATE OR REPLACE VIEW "CORNSALAD"."V_PRODUCTLIST" 
  ("PROJECT_ID", "IMAGE_RENAME", "PROJECT_NAME", "PROJECT_CATEGORY_ID", "PROJECT_CATEGORY_NAME", "CATEGORY_SUB_ID", "CATEGORY_SUB_NAME", 
   "CATEGORY_ID", "CATEGORY_NAME", "START_DATE", "END_DATE", "MEMBER_ID", "MEMBER_NAME", "TARGET_AMOUNT", "DDAY", "total_count", "PERCENT") 
   AS 
  (SELECT P.PROJECT_ID AS PROJECT_ID, IMAGE_RENAME, PROJECT_NAME, P.PROJECT_CATEGORY_ID AS PROJECT_CATEGORY_ID, PROJECT_CATEGORY_NAME, 
          P.CATEGORY_SUB_ID AS CATEGORY_SUB_ID, CATEGORY_SUB_NAME, CS.CATEGORY_ID AS CATEGORY_ID, CATEGORY_NAME, START_DATE, END_DATE, 
          P.MEMBER_ID AS MEMBER_ID, MEMBER_NAME, NVL(TARGET_AMOUNT,0), ROUND(END_DATE-SYSDATE) AS DDAY, 
          (select sum(nvl(pat.count,0))
           from product pd
           left join( select project_id, product_id, count
                      from payment pa
                      join payment_count pc on(pa.payment_id=pc.payment_id)
                      where pc.product_id is not null) pat on(pat.product_id=pd.product_id)
           where p.project_id=pd.project_id
           group by pd.project_id) as total_count,
           CONCAT(ROUND(NVL((select sum(nvl(pat.count,0))
                              from product pd
                              left join( select project_id, product_id, count
                                         from payment pa
                                         join payment_count pc on(pa.payment_id=pc.payment_id)
                                         where pc.product_id is not null) pat on(pat.product_id=pd.product_id)
                               where p.project_id=pd.project_id
                              group by pd.project_id),0)/NVL(TARGET_AMOUNT,0)*100),'%') AS PERCENT
>>>>>>> 939722fb02d2f70bea7a5190ebe5f6b637c75e0d
FROM PROJECT P
JOIN PROJECT_CATEGORY PC ON(P.PROJECT_CATEGORY_ID = PC.PROJECT_CATEGORY_ID)
JOIN CATEGORY_SUB CS ON(P.CATEGORY_SUB_ID = CS.CATEGORY_SUB_ID)
JOIN CATEGORY C ON(CS.CATEGORY_ID = C.CATEGORY_ID)
JOIN MEMBER M ON(P.MEMBER_ID = M.MEMBER_ID)
where PROJECT_REQUEST_FLAG ='N' and PROJECT_ONOFF_FLAG='Y' and p.project_category_id='PC-PROD');




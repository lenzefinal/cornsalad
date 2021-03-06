--------------Project View-----------------


  CREATE OR REPLACE FORCE VIEW "CORNSALAD"."V_PROJECT" 
  ("PROJECT_ID", "PROJECT_NAME", "MEMBER_NAME", "IMAGE_RENAME", "REP_CONTENT", "TARGET_AMOUNT", "START_DATE", "END_DATE", "DDAY", "PAYMENT_DATE", "REFUND_ROLE", "VIDEO_URL", "CONTENT", "PROJECT_CATEGORY_ID", "PROJECT_CATEGORY_NAME", "CATEGORY_SUB_ID", "CATEGORY_SUB_NAME", "CATEGORY_ID", "CATEGORY_NAME", "TOTAL_AMOUNT", "PERCENT") AS 
  (SELECT P.PROJECT_ID AS PROJECT_ID, PROJECT_NAME,M.MEMBER_NAME,image_rename, REP_CONTENT, NVL(TARGET_AMOUNT,0), START_DATE,END_DATE, FLOOR(END_DATE-sysdate) AS DDAY,
        PAYMENT_DATE, REFUND_ROLE, VIDEO_URL, CONTENT, P.PROJECT_CATEGORY_ID AS PROJECT_CATEGORY_ID, PROJECT_CATEGORY_NAME,
        P.CATEGORY_SUB_ID AS CATEGORY_SUB_ID, CATEGORY_SUB_NAME, CS.CATEGORY_ID AS CATEGORY_ID, CATEGORY_NAME
        ,TO_CHAR(NVL((SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA WHERE PA.PROJECT_ID = P.PROJECT_ID GROUP BY PROJECT_ID),0),'999,999,999,999') AS TOTAL_AMOUNT,
        ROUND(NVL((SELECT SUM(TOTAL_AMOUNT) FROM PAYMENT PA WHERE PA.PROJECT_ID = P.PROJECT_ID GROUP BY PROJECT_ID),0)/NVL(TARGET_AMOUNT,0)*100) AS PERCENT
FROM PROJECT P
LEFT JOIN PROJECT_CONTENT CT ON(P.PROJECT_ID = CT.PROJECT_ID)
JOIN PROJECT_CATEGORY PC ON(P.PROJECT_CATEGORY_ID = PC.PROJECT_CATEGORY_ID)
JOIN CATEGORY_SUB CS ON(P.CATEGORY_SUB_ID = CS.CATEGORY_SUB_ID)
JOIN CATEGORY C ON(CS.CATEGORY_ID = C.CATEGORY_ID)
JOIN MEMBER M ON(P.MEMBER_ID=M.MEMBER_ID)
where P.PROJECT_CATEGORY_ID='PC-FUND');



-----------------GIFT VIEW-------------------

CREATE OR REPLACE VIEW V_GIFT
(PROJECT_ID, GIFT_ID,ITEM_NAME, COUNT)
AS 
        SELECT P.PROJECT_ID, G.GIFT_ID,I.ITEM_NAME, GI.COUNT
    FROM PROJECT P
    LEFT JOIN GIFT G ON(P.PROJECT_ID=G.PROJECT_ID)
    LEFT JOIN GIFT_IN_ITEMS GI ON(G.GIFT_ID=GI.GIFT_ID)
    LEFT JOIN ITEM I ON(GI.ITEM_ID=I.ITEM_ID)
    LEFT JOIN PAYMENT M ON(P.PROJECT_ID=M.PROJECT_ID)
    GROUP BY P.PROJECT_ID, P.PAYMENT_DATE+7, G.GIFT_ID, G.CAPACITY, 
    I.ITEM_ID, I.ITEM_NAME, GI.COUNT;


-------------------REPLY VIEW -------------



create or replace view v_reply
as select project_reply_id, project_id, member_id, member_name, profile_img_rename, reply_content, reply_level, proj_reply_id_ref, reply_seq, creation_date, report_count 
      from (select * 
            from project_reply
            join member m using(member_id)
            order by proj_reply_id_ref desc, reply_level asc, reply_seq asc
            );



------------------SUPPOTER VIEW--------------

CREATE OR REPLACE VIEW V_SUPPOTER
(PROJECT_ID,MEMBER_ID,MEMBER_NAME,PROJECT_CATEGORY_NAME,PAYMENT_DATE,REFUND_FLAG,PROFILE_IMG_RENAME)
AS
(SELECT P.PROJECT_ID, PM.MEMBER_ID, M.MEMBER_NAME,PC.PROJECT_CATEGORY_NAME, PM.PAYMENT_DATE, PM.REFUND_FLAG,M.PROFILE_IMG_RENAME
FROM PROJECT P
JOIN PAYMENT PM ON(P.PROJECT_ID=PM.PROJECT_ID)
JOIN MEMBER M ON(PM.MEMBER_ID=M.MEMBER_ID)
JOIN PROJECT_CATEGORY PC ON(P.PROJECT_CATEGORY_ID=PC.PROJECT_CATEGORY_ID)
GROUP BY P.PROJECT_ID, PM.MEMBER_ID, M.MEMBER_NAME,PC.PROJECT_CATEGORY_NAME, PM.PAYMENT_DATE, PM.REFUND_FLAG, M.PROFILE_IMG_RENAME);


----------------LOGINTIME VIEW-----------------------


  CREATE OR REPLACE FORCE VIEW "CORNSALAD"."V_LOGINTIME" ("MIN", "SECOND", "MEMBER_ID") AS 
  SELECT ABS(FLOOR(MIN/60)) MIN,ABS(MOD(MIN,60)) SECOND,MEMBER_ID
FROM (SELECT MEMBER_ID, (TO_DATE(SYS_DATE,'YYYY-MM-DD HH24:MI')-TO_DATE(LAST_LOGIN_DATE,'YYYY-MM-DD HH24:MI'))*24*60 MIN 
        FROM MEMBER );


------------------ MEMBER VIEW-----------------------


  CREATE OR REPLACE FORCE VIEW "CORNSALAD"."V_MEMBER" ("PROJECT_ID", "MEMBER_ID", "IMAGE_RENAME", "MEMBER_NAME", "EMAIL", "CORN_GRADE") AS 
  (SELECT P.PROJECT_ID, P.MEMBER_ID, P.IMAGE_RENAME,M.MEMBER_NAME,M.EMAIL, T.CORN_GRADE
FROM PROJECT P 
LEFT JOIN MEMBER M ON(P.MEMBER_ID=M.MEMBER_ID)
LEFT JOIN MEMBER_TRUST T ON(P.PROJECT_ID=T.PROJECT_ID));


------------V_GIFTLIST  (프로젝트에 대한 GIFT_ID 리스트 가져오기, 남은 개수)--------------------
    create or replace view v_giftlist
(project_id, gift_id, capacity, payment_date, support_price, sellcount, remain)
as
select s.project_id, s.gift_id, s.capacity, p.payment_date+7 as payment_date, s.support_price, s.sellcount, s.capacity-sellcount as remain
from (select g.project_id as project_id, g.gift_id as gift_id, g.capacity as capacity, g.support_price as support_price, sum(nvl(pc.count,0)) as sellcount
      from gift g
      left join payment_count pc on(g.gift_id=pc.gift_id)
      left join payment pa on(pa.payment_id=pc.payment_id)
      group by g.project_id, g.gift_id, g.capacity, g.support_price) s
join project p on(s.project_id=p.project_id);


------------------v_hotlist----------------

  CREATE OR REPLACE FORCE VIEW "CORNSALAD"."V_HOTLIST" ("PROJECT_NAME", "PROJECT_ID", "LIKECOUNT") AS 
  SELECT "PROJECT_NAME","PROJECT_ID","LIKECOUNT" FROM (SELECT * 
FROM (SELECT PROJECT_NAME,P.PROJECT_ID,COUNT(L.MEMBER_ID) as likecount
        FROM LIKES L
        JOIN PROJECT P ON(P.PROJECT_ID=L.PROJECT_ID)
        GROUP BY PROJECT_NAME,P.PROJECT_ID
        ORDER BY 2 DESC)
WHERE ROWNUM<=10);


--프로젝트 댓글 신고 카운트에 따라 멤버 신고 카운트 증가
CREATE OR REPLACE TRIGGER TGR_REPORT_PROJECT_REPLY
    AFTER UPDATE
    ON PROJECT_REPLY
FOR EACH ROW
BEGIN
    IF :NEW.REPORT_COUNT = 5
        THEN 
            UPDATE T_MEM_RPT_COUNT SET
            TOTAL_REPORT_COUNT = TOTAL_REPORT_COUNT + 1
            WHERE MEMBER_ID = :NEW.MEMBER_ID;
    END IF;
END;

--게시글 신고 카운트에 따라 멤버 신고 카운트 증가
CREATE OR REPLACE TRIGGER TGR_REPORT_BOARD
    AFTER UPDATE
    ON BOARD
FOR EACH ROW
BEGIN
    IF :NEW.REPORT_COUNT = 5
        THEN 
            UPDATE T_MEM_RPT_COUNT SET
            TOTAL_REPORT_COUNT = TOTAL_REPORT_COUNT + 1
            WHERE MEMBER_ID = :NEW.MEMBER_ID;
    END IF;
END;

--게시글 댓글 신고 카운트에 따라 멤버 신고 카운트 증가
CREATE OR REPLACE TRIGGER TGR_REPORT_BOARD_REPLY
    AFTER UPDATE
    ON BOARD_REPLY
FOR EACH ROW
BEGIN
    IF :NEW.REPORT_COUNT = 5
        THEN 
            UPDATE T_MEM_RPT_COUNT SET
            TOTAL_REPORT_COUNT = TOTAL_REPORT_COUNT + 1
            WHERE MEMBER_ID = :NEW.MEMBER_ID;
    END IF;
END;


--멤버 신고 카운트가 3이 되면 블랙리스트 처리
CREATE OR REPLACE TRIGGER TGR_BLACKLIST_MEMBER
    AFTER UPDATE
    ON T_MEM_RPT_COUNT
FOR EACH ROW
BEGIN
    IF :NEW.TOTAL_REPORT_COUNT = 3
        THEN 
            UPDATE MEMBER SET
            BLACKLIST_FLAG = 'Y'
            WHERE MEMBER_ID = :NEW.MEMBER_ID;
    END IF;
END;
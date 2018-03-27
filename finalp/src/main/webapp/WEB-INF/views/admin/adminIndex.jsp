<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 인덱스</title>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
	img#iconimage{
		width: 80px;
		margin-left: 150px;
	}
  </style>
 </head>

 <body class="skin_main">
  <c:import url="../header.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">관리자 메뉴 <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

   <div id="container" style="height:724px;">
   <div id="content" class="section_home">
      <div class="column">
         <div class="sh_group">
            <div class="sh_header">
               <h2>회원관리</h2>
			   <a href="adminMember.do" class="all" style="text-decoration:underline; color:#a3a3a3;">전체보기</a>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
			   <dt>&nbsp;</dt>
               <dd>&nbsp;</dd>
               <dt>총 회원 수</dt>
               <dd>${ aalarm.membercount } 명</dd>
               <dt>BLACKLIST</dt>
               <dd>${ aalarm.blacklistcount } 명</dd>
               </dl>
            </div>
         </div>
         <div class="sh_group">
            <div class="sh_header">
               <h2>공지사항</h2>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
                  <dt class="blind">공지사항아이콘</dt>
            	 <a href="adminNotice.do"><img id="iconimage" src="/finalp/resources/images/adminimage/notice.png" align="center" /></a>
               </dl>
            			   
            </div>
         </div>
		 <div class="sh_group">
            <div class="sh_header">
               <h2>신고 게시글</h2>
               <a href="adminReport.do" class="all" style="text-decoration:underline; color:#a3a3a3;">전체보기</a>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
               <dt>&nbsp;</dt>
               <dd>&nbsp;</dd>
			   <dt>처리하지 않은 신고</dt>
               <dd>${ aalarm.reportcount } 건</dd>
               </dl>
            </div>
         </div>
      </div>
      <div class="column">
         <div class="sh_group">
            
			<div class="sh_header">
               <h2>프로젝트</h2>
               <a href="adminProject.do" class="all" style="text-decoration:underline; color:#a3a3a3;">전체보기</a>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
                  <dt>프로젝트</dt>
                  <dd>${ aalarm.projectcount } 개</dd>
                  <dt>공동구매</dt>
                  <dd>${ aalarm.productcount } 개</dd>
				  <dt>승인 요청</dt>
                  <dd>${ aalarm.offprojectcount } 개</dd>
               </dl>
            </div>
         </div>
         <div class="sh_group">
            <div class="sh_header">
               <h2>문의글</h2>
			   <a href="adminQuestion.do" class="all" style="text-decoration:underline; color:#a3a3a3;">전체보기</a>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
               <dt>&nbsp;</dt>
               <dd>&nbsp;</dd>
			   <dt>답변하지 않은 문의글</dt>
               <dd>${ aalarm.questioncount } 건</dd>
               </dl>   
            </div>
         </div>
		 <div class="sh_group">
            <div class="sh_header">
               <h2>통계</h2>
            </div>
            <div class="sh_content">
               <dl class="sh_lst2">
                  <dt class="blind">통계아이콘</dt>
            	 <a href="adminStat.do"><img id="iconimage" src="/finalp/resources/images/adminimage/stat.png" align="center" /></a>
               </dl>
            </div>
         </div>
      </div>

   </div>
  </div>

</body>
</html>
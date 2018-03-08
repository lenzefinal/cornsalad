<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
	body, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
		margin: 0;
		padding: 0;
		font-size: 12px;
		color: #676363;
		font-family: Roboto, 'Noto Sans KR',sans-serif;
		} 
		.wd-layout-sub-content {
		padding-top: 7px;
		overflow: hidden;
	}
	.reward, .reward-not-story {
		margin-bottom: 1px;
		overflow: visible;
	}

	* {
		box-sizing: content-box;
		box-sizing: border-box;
	}
	/* ++++++++++++++++++++++++++++++ */

	.reward-not-story .reward-header, .reward .reward-header {
		display: none;
		position: relative;
		padding: 60px 0 55px;
		overflow: hidden;
	}
	.reward-header {
		background: #001328!important;
	}
	.reward-not-story .reward-header:before, .reward .reward-header:before {
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		clear: both;
		z-index: 2;
		margin-bottom: 0;
		background: linear-gradient(0deg,rgba(0,0,0,.1),rgba(0,0,0,.4));
		width: 100%;
		height: 100%;
		content: "";
	}
	.reward-header:before, .reward-header .bg {
		display: none!important;
	}
	.reward-header:before {
		background: linear-gradient(to top,rgba(0,0,0,.1),rgba(0,0,0,.4));
		display: block !important;
		content: '';
		clear: both;
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		z-index: 2;
	}
	.reward-not-story .reward-header .bg, .reward .reward-header .bg {
		display: block;
		position: absolute;
		top: -20px;
		right: -20px;
		bottom: -20px;
		left: -20px;
		z-index: 1;
		background-repeat: no-repeat;
		background-position: 50% 30%;
		background-size: cover;
		-webkit-filter: blur(10px);
	}
	.reward-not-story .reward-header a, .reward-not-story .reward-header div, .reward .reward-header a, .reward .reward-header div {
		box-sizing: border-box;
	}
	.reward .reward-header .title-info {
		position: relative;
		z-index: 4;
		margin-bottom: 20px;
		text-align: center;
		line-height: 20px;
		color: #fff;
		font-size: 16px;
		font-weight: 400;
	}
	.reward-not-story .reward-header .title-info em, .reward .reward-header .title-info em {
		display: inline-block;
		margin-right: 5px;
		height: 28px;
		line-height: 28px;
		color: #1affd1;
		font-weight: 500;
	}
		em, address {
		font-style: normal;
	}
	.reward .reward-header .title {
		position: relative;
		z-index: 3;
		padding-right: 30px;
		padding-left: 30px;
		text-align: center;
		line-height: 42px;
		color: #fff;
		font-size: 36px;
		font-weight: 500;
	}
	.reward-not-story .reward-header .title a, .reward .reward-header .title a {
		color: #fff;
	}
	.reward-not-story .reward-header a, .reward-not-story .reward-header div, .reward .reward-header a, .reward .reward-header div {
		box-sizing: border-box;
	}
	.reward-header .bg {
		position: absolute;
		left: -20px;
		top: -20px;
		right: -20px;
		bottom: -20px;
		display: block !important;
		background-position: 50% 30%;
		background-repeat: no-repeat;
		background-size: cover;
		-webkit-filter: blur(10px);
		z-index: 1;
	}
	/* ****************************** */
	.reward-not-story .reward-nav li .count-total, .reward .reward-nav li .count-total {
		position: relative;
		top: -2px;
		color: #00bf99;
		font-size: 12px;
	}
	a {
		text-decoration: none;
		outline: none;
		color: #676363;
	}
	.reward-not-story .reward-nav, .reward .reward-nav {
		
		position: sticky;
		top: 0;
		z-index: 99;
		margin-bottom: 0;
		box-shadow: inset 0 -1px 0 0 #ddd;
		height: 52px;
		text-align: center;
		overflow-y: hidden;
		background: hsla(0,0%,100%,.95);
	}
	.reward-not-story .reward-nav .tab-list, .reward .reward-nav .tab-list {
		transition-property: -webkit-transform;
		transition-timing-function: cubic-bezier(.18,.35,.56,1);
		margin: 0 auto -30px;
		width: 100%;
		max-width: 1000px;
		height: 80px;
		white-space: nowrap;
		overflow-x: scroll;
	}
	ul, ol {
		list-style: none;
	}
	

	ul, menu, dir {
		display: block;
		list-style-type: disc;

	}
	.reward-not-story .reward-nav li, .reward .reward-nav li {
		display: inline-block;
	}
	.reward-not-story .reward-nav li.active a, .reward .reward-nav li.active a {
		position: relative;
		border-bottom: 0;
		color: #0d0f12;
	}
	.reward-not-story .reward-nav li .tab-link, .reward .reward-nav li .tab-link {
		display: block;
		padding: 16px 17px;
		height: 53px;
		line-height: 17px;
		font-size: 15px;
	}
	.reward-not-story .reward-nav li.active a:before, .reward .reward-nav li.active a:before {
		display: block;
		position: absolute;
		right: 17px;
		bottom: 1px;
		left: 17px;
		background-color: #00bf99;
		height: 2px;
		content: "";
	}
	.reward-not-story .reward-nav li .tab-link[data-tab-reward=true], .reward .reward-nav li .tab-link[data-tab-reward=true] {
		display: block;
	}
	.reward-not-story .reward-nav li .tab-link, .reward .reward-nav li .tab-link {
		display: block;
		padding: 16px 17px;
		height: 53px;
		line-height: 17px;
		font-size: 15px;
	}
	/* **************************** */

	.reward-not-story .reward-body-wrap, .reward .reward-body-wrap {
		margin: 0 auto;
		padding: 0;
		width: 100%;
		max-width: 1024px;
	}
	.wd-ui-sub-contents {
		padding: 28px 0 20px 0;
		border-top: 2px solid #fff;
	}
	.reward-not-story .reward-body-wrap .wd-ui-sub-contents, .reward .reward-body-wrap .wd-ui-sub-contents {
		position: relative;
		border-top: inherit;
	}
	.reward-not-story .wd-ui-info-wrap, .reward .wd-ui-info-wrap {
		display: flex;
		flex-direction: column;
	}
	.wd-ui-info-wrap {
		overflow: hidden;
	}
	.wd-ui-sub-contents {
		padding: 28px 0 20px 0;
		border-top: 2px solid #fff;
	}
	.reward-not-story .reward-body-wrap .wd-ui-sub-contents, .reward .reward-body-wrap .wd-ui-sub-contents {
		position: relative;
		border-top: inherit;
	}
	.reward-not-story .wd-ui-info-wrap, .reward .wd-ui-info-wrap {
		display: flex;
		flex-direction: column;
	}
	.reward-not-story .wd-ui-sub-opener-info, .reward .wd-ui-sub-opener-info {
    order: 2;
    float: none;
    transition: padding .25s;
    padding: 0 16px;
    width: 100%!important;
    box-sizing: border-box!important;
}
	.project-state-info {
    width: 100%;
    margin-bottom: 15px;
    font-family: Roboto, 'Noto Sans KR', sans-serif;
    -webkit-font-smoothing: antialiased;
}
.project-state-info .state-box {
    width: 100%;
}
.project-state-info .state-box p.remaining-day {
    font-size: 22px;
    font-weight: 500;
    color: #4a4a4a;
}
.project-state-info .state-box p.rate-bar {
    width: 100%;
    height: 3px;
    background: #ddd;
    overflow: hidden;
}
.project-state-info .state-box p {
    margin-bottom: 25px;
    color: #4a4a4a;
    font-size: 15px;
}
.project-state-info .state-box p.rate-bar em {
    display: block;
    height: 3px;
    background: #00cca3;
}
.project-state-info .state-box p strong {
    padding-right: 5px;
    font-size: 22px;
    font-weight: 500;
}
.project-state-info .btn-wrap.funding {
    width: 100%;
    margin-bottom: 10px;
    padding-top: 10px;
}
.block.wz-btn, .fluid.wz-btn, .wzui a.block.btn, .wzui a.fluid.btn, .wzui button.block, .wzui button.fluid, .wzui input.block[type=button], .wzui input.block[type=submit], .wzui input.fluid[type=button], .wzui input.fluid[type=submit] {
    margin-bottom: .25em;
    width: 100%;
}
.large.wz-btn, .wzui a.large.btn, .wzui button.large, .wzui form.large .wz-btn, .wzui form.large a.btn, .wzui form.large button, .wzui form.large input[type=button], .wzui form.large input[type=submit], .wzui input.large[type=button], .wzui input.large[type=submit] {
    padding: 0 24px;
    height: 48px;
    line-height: 48px;
    font-size: 17px;
}
.primary.wz-btn, .wzui a.primary.btn, .wzui button.primary, .wzui form button[type=submit], .wzui form input[type=submit], .wzui input.primary[type=button], .wzui input.primary[type=submit] {
    background-color: #00cca3;
    color: #fff;
}
.primary-outline.wz-btn, .primary.wz-btn, .wzui a.primary-outline.btn, .wzui a.primary.btn, .wzui button.primary, .wzui button.primary-outline, .wzui form button[type=submit], .wzui form input[type=submit], .wzui input.primary-outline[type=button], .wzui input.primary-outline[type=submit], .wzui input.primary[type=button], .wzui input.primary[type=submit] {
    border-color: #00cca3;
}
.wz-btn, .wzui a.btn, .wzui button, .wzui input[type=button], .wzui input[type=submit] {
    transition-property: background-color,border-color,color,opacity;
    transition-duration: .2s;
    border: 1px solid #dadce0;
    border-radius: 0;
    background: #fff;
    cursor: pointer;
    padding: 0 16px;
    height: 36px;
    vertical-align: middle;
    line-height: 34px;
    color: #7c8288;
    font-size: 15px;
    font-weight: 400;
    box-sizing: border-box!important;
    -webkit-appearance: none;
}
.project-state-info .btn-wrap.share {
    width: 100%;
    margin-bottom: 10px;
}
.reward-not-story .wd-ui-sub-opener-info .project-state-info .btn-like, .reward-not-story .wd-ui-sub-opener-info .project-state-info .btn-share, .reward .wd-ui-sub-opener-info .project-state-info .btn-like, .reward .wd-ui-sub-opener-info .project-state-info .btn-share {
    box-sizing: border-box!important;
}
.project-state-info .btn-share {
    float: right;
    display: block;
    width: 48%;
    height: 38px;
    line-height: 38px;
    color: #4a4a4a;
    background: #fff;
    border: 1px solid #dadce0;
}
.project-state-info .btn-like {
    float: left;
    width: 48%;
    height: 38px;
    background: #fff;
    border: 1px solid #dadce0;
}

.project-state-info .btn-like i.icon-like {
    display: inline-block;
    width: 18px;
    height: 16px;
    margin-right: 3px;
    vertical-align: middle;
    background: url(하트.png) no-repeat 0 0;
    background-size: 100% auto;
}
.project-state-info .btn-like em {
    vertical-align: middle;
    line-height: 38px;
    color: #4a4a4a;
    font-size: 15px;
}
.project-state-info .share-section {
    width: 100%;
    height: 0;
    margin-bottom: 10px;
    overflow-y: hidden;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
.project-state-info .share-list {
    padding: 14px 0;
    text-align: center;
    border: 1px solid #dadce0;
    margin-top: 10px;
}
.project-maker-info {
    width: 100%;
    padding-top: 20px;
    font-family: Roboto, 'Noto Sans KR', sans-serif;

}
.project-right-title {
    margin-bottom: 10px;
    font-weight: 500;
    font-size: 12px;
    color: #777;
    font-family: Roboto, 'Noto Sans KR', sans-serif;
    -webkit-font-smoothing: antialiased;
}
.project-maker-info .maker-box {
    border: 1px solid #eaeaea;
}
.project-maker-info .maker-info {
    padding: 20px 19px 20px;
    border-bottom: 1px solid #eaeaea;
}
.project-maker-info .maker-info dl {
    display: table;
    width: 100%;
    table-layout: fixed;
}
.project-maker-info .maker-info dt button {
    display: block;
    padding: 0;
    margin: 0;
    width: 80px;
    height: 80px;
    background: no-repeat 0 0;
    background-size: cover;
    border: 1px solid #d6d7d8;
    border-radius: 50%;
}
.project-maker-info .maker-info dd {
    display: table-cell;
    width: auto;
    padding-left: 20px;
    vertical-align: top;
}
.project-maker-info .maker-info .name {
    margin-bottom: 7px;
    font-size: 16px;
    font-weight: 500;
    line-height: 20px;
    color: #555;
}
.project-maker-info .maker-info .website {
    margin-bottom: 15px;
    padding-left: 1px;
}

.project-maker-info .maker-info .website li a {
    display: block;
    width: 100%;
    font-size: 11px;
    line-height: 16px;
    word-wrap: break-word;
    word-break: break-all;
}
.project-maker-info .maker-info .social {
    text-align: left;
    padding-left: 1px;
}
.project-maker-info .maker-info .social li {
    display: inline-block;
    margin-right: 10px;
    vertical-align: top;
    text-align: left;
}
.project-maker-info .maker-info .social li a.facebook {
    background-image: url(/resources/static/img/common/icon_blue_facebook.png);
}
.project-maker-info .maker-info .social li a {
    display: inline-block;
    width: 14px;
    height: 14px;
    background: no-repeat 0 0;
    background-size: cover;
}
/* 창작자 소개 */
.bJXRvz {
	font-size:12px;
    width: 100%;
    background-color: #fff;
    border: 1px solid hsla(220,6%,59%,.3);
    box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);
    -webkit-transition: box-shadow .2s ease-in-out;
    transition: box-shadow .2s ease-in-out;
}
.cBbkfc {
    padding: 1.5rem;
}
.fuCNpE {
    font-weight: bolder;
    margin-bottom: 1.25rem;
}
.eYscdN {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-bottom: 1rem;
}
.dHxdxH {
    word-break: keep-all;
    line-height: 1.75;
}
.ilHpOi {
    border-top: 1px solid #efefef;
    margin: 1rem 0;
    height: 0;
}
.iBGoJt {
    color: #757575;
    font-size: .9rem;
    line-height: 1.7;
}
.iBGoJt > div {
    margin-bottom: .25rem;
}
.khYIRi {
    margin-top: 1rem;
    width: 100%;
}
.dxWcyc {
    padding: 1em 1.5em;
    font-size: 1em;
    width: 100%;
    opacity: 1;
}
.dxWcyc {
    color: rgba(0, 0, 0, .6);
    background-color: #e7e7e7;
}.dxWcyc {
    color: rgba(0, 0, 0, .6);
    background-color: #e7e7e7;
}

.dxWcyc {
    cursor: pointer;
    display: inline-block;
    min-height: 1em;
    outline: none;
    border: none;
    vertical-align: baseline;
    box-shadow: 0px 0px 0px 1px transparent inset, 0px 0em 0px 0px rgba(0, 0, 0, 0.1) inset;

    -webkit-transition: opacity 0.1s ease, background-color 0.1s ease, color 0.1s ease, box-shadow 0.1s ease,background 0.1s ease;
    transition: opacity 0.1s ease, background-color 0.1s ease, color 0.1s ease, box-shadow 0.1s ease,background 0.1s ease;

    margin: 0 .25em 0 0;
    border-radius: 0.28571429rem;
    text-transform: none;
    text-shadow: none;
    font-weight: bold;
    line-height: 1em;
    font-style: normal;
    text-align: center;
    text-decoration: none;
}
.dxWcyc > i {
    margin: 0 .42857143em 0 -.21428571em;
}
i._1QY7TzdLHKX3-BKPDNNYKF {
    display: inline-block;
    opacity: 1;
    margin: 0 .25rem 0 0;
    width: 1.18em;
    height: 1em;
    font-family: Icons;
    font-style: normal;
    font-weight: 400;
    text-decoration: inherit;
    text-align: center;
    speak: none;

    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
}
i._1QY7TzdLHKX3-BKPDNNYKF._3YmAkQhwzI7o-uUWz_8Mp4:before {
    content: "\F0E0";
}
reward-not-story .wd-ui-sub-opener-info .project-report, .reward-not-story .wd-ui-sub-opener-info .project-report-mobile, .reward .wd-ui-sub-opener-info .project-report, .reward .wd-ui-sub-opener-info .project-report-mobile {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 1px solid hsla(220,6%,59%,.3);
    padding: 12px 16px;
}
.wz-message-box, .wzui .message-box {
    margin: 24px auto;
    border: 1px solid #babdc0;
    background: #f5f7fa;
    padding: 16px;
    color: #7c8288;
    font-size: 13px;
}
.wd-ui-sub-opener-info .wd-ui-gift {
    margin-top: 20px;
}
.reward-not-story .rightinfo-reward-list, .reward .rightinfo-reward-list {
    padding: 0;
}

.top-info {
    padding: 20px;
    background: #fff;
}
.rightinfo-reward-list .reward-info {
    margin-bottom: 20px;
}
button * {
    position: relative;
}
.rightinfo-reward-list .reward-info dt {
    margin-bottom: 10px;
    font-weight: 500;
    font-size: 16px;
    line-height: 24px;
    color: #00132C;
}
.rightinfo-reward-list .reward-info dd p.reward-name {
    margin-bottom: 10px;
    font-size: 14px;
    line-height: 21px;
    color: #4a4a4a;
}
.rightinfo-reward-list .reward-info dd p {
    font-size: 12px;
    line-height: 19px;
    color: #929292;
}
.rightinfo-reward-list .reward-info dd p {
    font-size: 12px;
    line-height: 19px;
    color: #929292;
}
.rightinfo-reward-list .data-info {
    width: 100%;
    margin-bottom: 20px;
}
.rightinfo-reward-list .data-info li {
    float: left;
    font-size: 12px;
    line-height: 22px;
    color: #9b9b9b;
}
.rightinfo-reward-list .reward-qty {
    margin-bottom: 5px;
    font-size: 12px;
    line-height: 21px;
    color: #c88af9;
}
.rightinfo-reward-list .reward-qty em {
    padding: 2px 6px;
    font-weight: 500;
    background: #f6ecfe;
}
.rightinfo-reward-list .reward-soldcount {
    font-size: 12px;
    line-height: 21px;
    color: #00132C;
}
.hover-text {
    display: block;
    position: absolute;
    top: 50%;
    margin-top: -25px;
    text-align: center;
    color: #fff;
    font-size: 16px;
    line-height: 23px;
}
.rightinfo-reward-list {
    position: relative;
    display: block;
    width: 100%;
    margin-bottom: 20px;
    background: #d19cfa;
    border: 1px solid #eaeaea;
    text-align: left;
    box-sizing: border-box;
}
.reward-not-story .wd-ui-sub-opener-info .recommend-box-container .recommend-box, .reward .wd-ui-sub-opener-info .recommend-box-container .recommend-box {
    float: none;
    margin-top: 18px;
    border: 1px solid #e4e4e4;
    background-color: #fff;
    padding: 20px;
    width: 100%!important;
    box-sizing: border-box;
}
.recommend-box {
    margin-top: 18px;
    float: right;
    width: 242px;
    border: 1px solid #e4e4e4;
    padding: 20px 20px;
    background-color: #fff;
}
.reward-not-story .wd-ui-sub-opener-info .recommend-box-container .recommend-box .title, .reward .wd-ui-sub-opener-info .recommend-box-container .recommend-box .title {
    margin: 5px 0 10px 5px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 3px;
    width: 100%;
    font-size: 16px;
    font-weight: 500;
}
.reward-not-story .wd-ui-sub-opener-info .recommend-box-container .recommend-box .number, .reward .wd-ui-sub-opener-info .recommend-box-container .recommend-box .number {
    display: inline-block;
    margin: 1px 8px 1px 0;
    background-color: #00bf99;
    width: 18px;
    height: 18px;
    text-align: center;
    line-height: 18px;
    color: #fff;
    font-size: 12px;
    font-weight: 500;
}
.recommend-box .item .number {
    font-size: 12px;
    height: 18px;
    line-height: 18px;
    display: inline-block;
    width: 18px;
    margin: 1px 8px 1px 0px;
    color: #fff;
    background-color: #BABDC0;
    font-weight: 500;
    text-align: center;
}
.recommend-box .item .text {
	 height: 22px;
     font-size: 13px; 
     line-height: 18px; 
     width: 209px; 
     display: inline-block; 
     vertical-align: top;
     overflow: hidden;
     text-overflow: ellipsis;
     white-space: nowrap; 
     padding-top: 2px; 
}
.top-info:hover {
	opacity: 0.2;
}
.rightinfo-reward-list.soldout {
    background: #263441;
}
/* ***************좌측**************** */

.reward .wd-ui-sub-opener-info .project-report-mobile {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 1px solid hsla(220,6%,59%,.3);
    padding: 12px 16px;
}
@media screen and (min-width: 767px){
	.reward-not-story .reward-header, .reward .reward-header {
		display: block;
	}
	.reward-not-story .reward-nav, .reward .reward-nav {
		margin-bottom: 12px;
		}
	.reward-not-story .reward-nav .tab-list, .reward .reward-nav .tab-list {
		width: auto;
	}
	.reward-not-story .reward-nav li .tab-link[dsata-tab-reward=true], .reward .reward-nav li .tab-link[data-tab-reward=true] {
		display: none;
	}.reward-not-story .reward-body-wrap, .reward .reward-body-wrap {
    padding-bottom: 0;
	}
	.reward-not-story .wd-ui-info-wrap, .reward .wd-ui-info-wrap {
		display: block;
		padding: 0 30px;
		padding-right: env(safe-area-inset-right);
		padding-left: env(safe-area-inset-left);
	}
	.reward-not-story .wd-ui-info-wrap, .reward .wd-ui-info-wrap {
    display: block;
    padding: 0 30px;
	}
	.reward-not-story .wd-ui-sub-opener-info, .reward .wd-ui-sub-opener-info {
		float: right;
		padding: 0;
		width: 284px!important;
	}
	.reward-not-story .wd-ui-sub-opener-info .project-state-info, .reward .wd-ui-sub-opener-info .project-state-info {
    display: block;
	}
	.project-state-info .state-box p.remaining-day {
    font-size: 28px;
	}
	.reward-not-story .wd-ui-sub-opener-info .recommend-box-container .recommend-box .number, .reward .wd-ui-sub-opener-info .recommend-box-container .recommend-box .number {
    background: #babdc0;
	}
	
		margin-right: 300px;.reward-not-story .wd-ui-sub-campaign-info-container, .reward .wd-ui-sub-campaign-info-container {
	}
	.reward-not-story .wd-ui-sub-campaign-info, .reward .wd-ui-sub-campaign-info {
		float: none!important;
		padding-right: 16px;
		max-width: 632px;
	}
	.reward-not-story .wd-ui-sub-campaign-info {
    padding: 0;
}
.reward-not-story .supporter-tab .achieve-text, .reward .supporter-tab .achieve-text {
    padding: 23px 0;
}
.reward-not-story .support-list .support-item, .reward .support-list .support-item {
    padding-top: 20px;
    padding-bottom: 20px;
}
.reward-not-story .support-list .info, .reward .support-list .info {
    margin-left: 62px;
    line-height: 1.65;
    font-size: 17px;
}
.reward-not-story .support-list .profile, .reward .support-list .profile {
    left: 0;
    width: 46px;
    height: 46px;
}
.reward-not-story .support-list .info abbr, .reward .support-list .info abbr {
    font-size: 13px;
}
.reward .wd-ui-sub-opener-info1 {
    float: left;
    padding: 0;
    width: 284px!important;
}

}
	@media screen and (min-width: 960px){

	.project-state-info .state-box p strong {
		font-size: 24px;
	}
	.rightinfo-reward-list.ing {
    cursor: pointer;
	}
	.rightinfo-reward-list {
    display: inline-block;
    width: 280px;
    cursor: default;
    box-sizing: content-box;
	}

	.rightinfo-reward-list .hover-text {
		width: 280px;
	}
}
@media screen and (min-width: 1095px){

.reward-not-story .reward-body-wrap, .reward .reward-body-wrap {
    padding: 0 30px;
}
}

	</style>
</head>
<body>
<%-- <c:import url="../header.jsp"></c:import> --%>
	
  <div id="container" class="wd-layout-sub-content reward actionbar-hide">
      <!-- S : 캠페인 액션바 -->
      
      <!-- E : 캠페인 액션바 -->
      <!-- S : 리워드 헤더 -->
      <div class="reward-header">
        <div class="bg" style="background-image:url(https://cdn.wadiz.kr/wwwwadiz/green001/2018/0222/20180222115943523_14048.png/wadiz/quality/95/optimize)"></div>
        <p class="title-info"><em>테크</em> <strong>#반려동물로봇고미</strong> 프로젝트</p>
        <h2 class="title"><a href="/web/campaign/detail/14048">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]</a></h2>
      </div>
      <!-- E : 리워드 헤더 -->
      <!-- S : 리워드 네비게이션 -->
      <div class="reward-nav">
        <ul class="tab-list">
          <li class="active"><a class="tab-link" href="/web/campaign/detail/14048">스토리</a></li>
          <li><a class="tab-link" href="/web/campaign/detail/14048#campaign-rewards" data-tab-reward="true">리워드</a></li>
          <li><a class="tab-link" href="/web/campaign/detail/qa/14048">댓글 <span class="count-total comment-total">142</span></a></li>
          <li><a class="tab-link" href="/web/campaign/detailPost/14048">환불및 교환 <span class="count-total">2<i class="icon-new"></i></span></a></li>
          <li><a class="tab-link" href="projectSupporter.do">서포터 <span class="count-total">463<i class="icon-new"></i></span></a></li>  
        </ul>
      </div>
	  <!-- E : 리워드 네비게이션 --> 
	  <div class="reward-body-wrap">
		<div class="wd-ui-sub-contents">
          <!-- S : 페이지 레이아웃 컨테이너 -->
          <div class="wd-ui-info-wrap">
            <!-- S : 좌측 캠페인 관련 정보 -->

			<!-- S : 우측 캠페인 관련 정보 -->
            <div class="wd-ui-sub-opener-info" style="padding-top: 0;">
              <!-- S : 프로젝트 정보  -->
              <h3 class="text-hidden">프로젝트 정보</h3>
              <div class="project-state-info">
                <div class="state-box">
                    <p class="remaining-day">27일 남음</p>
                    <p class="rate-bar"><em style="width:80%"></em></p>
                    <p class="achievement-rate"><strong>1382</strong>% 달성</p>
					<p class="total-amount"><strong>41,489,100</strong>원  펀딩</p>
					<p class="total-supporter"><strong>471</strong>명의 서포터</p>
                </div>
                <div class="btn-wrap funding">
                   <button onclick="backMoney('backing', 'false');" class="wz-btn primary large block">펀딩하기</button>
                </div>
                
                <div class="btn-wrap share">
                  <button id="btnLike" class="campaign-like btn-like"style="width: 100%"><img src="resources/images/icon/하트.png" style=" width: 10%;size: 10%;"> <em id="cntLike" class="cnt-like">119</em></button>
                  <div id="shareSection" class="share-section">
                    <ul class="share-list" style="margin-top:10px">
                      <li><button class="wz-btn icon-facebook circular" onclick="window.open('http://www.facebook.com/sharer/sharer.php?u=https://www.wadiz.kr/web/campaign/detail/14048?utm_source=etc&amp;utm_medium=url_facebook','_blank');" title="페이스북 공유"></button></li>
                      <li class="kakao-share"><button class="wz-btn icon-kakao circular" onclick="sendKakaoLink()" title="카카오톡 공유"></button></li>
                      <li><button class="wz-btn icon-twitter circular" onclick="window.open('https://twitter.com/intent/tweet?text=_&amp;url=https://www.wadiz.kr/web/campaign/detail/14048?utm_source=etc&amp;utm_medium=url_twitter','_blank');" title="트위터 공유"></button></li>
                      <li><button id="urlCopyBtn" class="wz-btn icon-link circular" title="URL 공유" data-clipboard-target="#shareLink"></button></li>
                    </ul>
                  </div>
                </div>

                <div class="banner-section-RB2">
					<a href="https://www.wadiz.kr/web/wboard/newsBoardDetail/4600?headWordId=2&amp;cPage=1&amp;_refer_section_st=RB2_0" class="banner-coupon">
		<div class="bJXRvz">
			<div class="cBbkfc">
				<div class="fuCNpE">창작자 소개</div>
				<div class="eYscdN">
					<span class="ilGdVJ"></span>
					<a href="/u/donipisepozodachi/projects">
						<span class="fVfxlF">크림히어로즈</span>
					</a>
				</div>
				<div class="dHxdxH">유튜브 크림히어로즈 고양이 채널</div>
				<div class="iiBGoJt">
					<div><!-- react-text: 598 -->마지막 로그인&nbsp;&nbsp;<!-- /react-text --><b>38분 전</b></div><!-- react-text: 600 -->진행한 프로젝트&nbsp;&nbsp;<!-- /react-text --><b>3</b><!-- react-text: 602 -->&nbsp;&nbsp;&nbsp;&nbsp; 밀어준 프로젝트&nbsp;&nbsp;<!-- /react-text --><b>0</b>
					</div>
					<div class="khYIRi">
						<button class="dxWcyc" data-toggle="modal" data-target="#contact">
						<img src="resources/images/icon/메일이메일.png" width="15px" width="10px" style=" margin-right:  2px; margin-bottom:  -4px;">
						<i class="_3YmAkQhwzI7o-uUWz_8Mp4 _1QY7TzdLHKX3-BKPDNNY"></i><!-- react-text: 607 -->창작자에게 문의하기<!-- /react-text -->
						</button>
					</div>
				</div>
			</div>
              <!-- E : 프로젝트 위험 요인과 해결 방안  -->
    
              <!-- S : 프로젝트 신고하기 모바일 -->
                
                <div class="wz-message-box project-report-mobile">
                  <p class="title">신고하기란?</p>
                  <p>해당 프로젝트에 지적 재산권을 침해하거나<br>거짓된 내용이 있다면 알려주세요.</p>
                  
                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#blacklist-modal" style="width: 100%; ">
					프로젝트 신고하기
				</button>
                </div>
              <!-- E : 프로젝트 신고하기 -->
              <!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
              <div id="campaign-rewards" style="position: relative; top:-50px"></div>
              <div class="moveRewards">
                <div class="wd-ui-gift">
                  <h3 class="project-right-title">리워드 선택</h3>
                  
                  <button class="rightinfo-reward-list  ing" onclick="backMoney('26841', 'false')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        99,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">일반버드 (고미볼 1세트)</p>
                        <p>정상가 159,000원 (할인율 38%)<br>고미볼(흰색) 1set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                      
                        <em>2018년 06월 말 (21~말일) 예정</em>
                      </li>
                    </ul>
                      <p class="reward-qty">제한수량 <strong>200</strong>개 &nbsp; <em>현재 163개 남음!</em></p>
                    <p class="reward-soldcount">총 <strong>37</strong>개 펀딩완료</p>
                  </div>
                    <p class="hover-text">이 리워드 펀딩하기</p>
                  </button>
                  <button class="rightinfo-reward-list  ing" onclick="backMoney('26842', 'false')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        158,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">커플/친구 패키지 (고미볼 2세트)</p>
                        <p>정상가 159,000원 (할인율 50%)<br>고미볼(흰색) 2set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                        <em>2018년 06월 말 (21~말일) 예정</em>
                      </li>
                    </ul>
                      <p class="reward-qty">제한수량 <strong>150</strong>개 &nbsp; <em>현재 90개 남음!</em></p>
                    <p class="reward-soldcount">총 <strong>60</strong>개 펀딩완료</p>
                  </div>
                    <p class="hover-text">이 리워드 펀딩하기</p>
                  </button>
                  <button class="rightinfo-reward-list  ing" onclick="backMoney('34830', 'false')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        237,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">다둥이용 패키지 (고미볼 3세트)</p>
                        <p>정상가 159,000원 (할인율 50%)<br>고미볼(흰색) 3set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                        <em>2018년 06월 말 (21~말일) 예정</em>
                      </li>
                    </ul>
                      <p class="reward-qty">제한수량 <strong>50</strong>개 &nbsp; <em>현재 44개 남음!</em></p>
                    <p class="reward-soldcount">총 <strong>6</strong>개 펀딩완료</p>
                  </div>
                    <p class="hover-text">이 리워드 펀딩하기</p>
                  </button>
                  
                  <button class="rightinfo-reward-list ing" onclick="backMoney('34831', 'false')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        890,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">동호회 패키지 A (고미볼 10세트)</p>
                        <p>정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 10set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>6,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                        <em>2018년 06월 말 (21~말일) 예정</em>
                  </li>
                    </ul>
                      <p class="reward-qty">제한수량 <strong>10</strong>개 &nbsp; <em>현재 10개 남음!</em></p>
	              <p class="reward-soldcount">총 <strong>0</strong>개 펀딩완료</p>
                   
                  </div>
               
                    <p class="hover-text">이 리워드 펀딩하기</p>
                  
                  
                  </button>
                  
                  <button class="rightinfo-reward-list ing" onclick="backMoney('34832', 'false')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        1,780,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">동호회 패키지 B (고미볼 20세트)</p>
                        <p>정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 20set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>9,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                    <em>2018년 06월 말 (21~말일) 예정</em>
                    </li>
                    </ul>                  
                      <p class="reward-qty">제한수량 <strong>10</strong>개 &nbsp; <em>현재 10개 남음!</em></p>
                                     
                    <p class="reward-soldcount">총 <strong>0</strong>개 펀딩완료</p>
                     
                  </div>
               
                    <p class="hover-text">이 리워드 펀딩하기</p>
                  
                  
                  </button>
                  
                  <button class="rightinfo-reward-list soldout ing" onclick="backMoney('26839', 'true')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        79,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">슈퍼 얼리버드 (고미볼 1세트)</p>
                        <p>정상가 159,000원 (할인율 50%)<br>고미볼 1set<br></p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                        <em>2018년 06월 중순 (11~20일) 예정</em>
                      </li>
                    </ul>
                   
                      <p class="reward-qty soldout"><em>제한수량이 모두 펀딩되었습니다.</em></p>
                    <p class="reward-soldcount">총 <strong>100</strong>개 펀딩완료</p>
                    
                    
                  </div>
                  
                    <p class="hover-text soldout">제한수량이<br>모두 펀딩되었습니다.</p>
                  
                  </button>
                  
                  <button class="rightinfo-reward-list soldout ing" onclick="backMoney('26840', 'true')">
                  <div class="top-info">
                    <dl class="reward-info">
                      <dt>
                        89,000원 펀딩
                      </dt>
                      <dd>
                        <p class="reward-name">얼리버드 (고미볼 1세트)</p>
                        <p>정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 1set</p>
                      </dd>
                    </dl>
                    <ul class="data-info">
                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
                      <li class="date" style="width: 100%;">리워드 발송 시작일
                      
                      
                        <em>2018년 06월 말 (21~말일) 예정</em>
                      
                      
                      </li>
                    </ul>
                    
                      <p class="reward-qty soldout"><em>제한수량이 모두 펀딩되었습니다.</em></p>
                    
                    <p class="reward-soldcount">총 <strong>200</strong>개 펀딩완료</p>
                    
                  </div>
                  
                    <p class="hover-text soldout">제한수량이<br>모두 펀딩되었습니다.</p>
                  </button>
                  
                </div>
              </div>
              <!-- E : 보상품 목록, 참여할 때 드리는 선물 -->
    
              <!-- S : 인기 프로젝트 리스트 -->
              <div id="normalpane" class="recommend-box-container stoped">
                
                <div id="fixed-funding-btn" class="fixed-funding-btn">
                  <button onclick="backMoney('backing', 'false');" class="wz-btn primary large block">이 프로젝트 펀딩하기</button>
                </div>
                
                
                <!-- S : 프로젝트 신고하기 -->
	           <!-- E : 프로젝트 신고하기 -->
                
                <div class="recommend-box">
                  <h3 class="title">인기 프로젝트</h3>
                  
                  <div class="item">
                    <div class="number">1</div>
                    <div class="text"><a href="/web/campaign/detail/17231">라라스윗 : 한 통 다 먹어도 240kcal! 건강한 아이스크림 [앵콜]</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">2</div>
                    <div class="text"><a href="/web/campaign/detail/12356">옷정리를 1초만에 [허들 바지걸이]</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">3</div>
                    <div class="text"><a href="/web/campaign/detail/15404">평범했던 내 의자엔  '바른자세 무중력 방석'</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">4</div>
                    <div class="text"><a href="/web/campaign/detail/14869">하이브리드 스마트 워치 'ZeTime 지타임'</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">5</div>
                    <div class="text"><a href="/web/campaign/detail/17155">[최종 앵콜] 누런이 탈출 프로젝트! 스위스 천연미백 칫솔!</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">6</div>
                    <div class="text"><a href="/web/campaign/detail/16828">[앵콜] 하나로 다 된다. 모노폴드 맥가이버 백팩</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">7</div>
                    <div class="text"><a href="/web/campaign/detail/15765">난 달라, 요요없이 복부지방을 뺀다!  #풋사과야 너를 믿어~</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">8</div>
                    <div class="text"><a href="/web/campaign/detail/16299">치약혁명! 하우투메이크 고체치약</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">9</div>
                    <div class="text"><a href="/web/campaign/detail/17035">사랑하는 반려동물의 건강, 집에서 터치 한 번으로 확인하세요!</a></div>
                  </div>
                  
                  <div class="item">
                    <div class="number">10</div>
                    <div class="text"><a href="/web/campaign/detail/14048">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]</a></div>
                  </div>
                     
                </div>
              </div>
              <!-- E : 인기 프로젝트 리스트 -->
    
              <!-- S : 프로젝트 신고 팝업 -->
              <!-- S : 리턴 폼 -->
              <form action="/web/waccount/wAccountLogin" id="returnForm" method="get" novalidate="novalidate">
                <input type="hidden" id="returnURL" name="returnURL">
              </form>
              <!-- E : 리턴 폼 -->
              
              <!-- S : 인증 확인 모달 -->
              <div id="authMailLypop" class="lypop-fixed" style="display: none;">
                <div class="popup-mint-basic">
                  <a href="javascript:closeLyPop('authMail');" class="btn-close"><em></em></a>
                  <div class="popup-mint-text">
                    <strong class="tit-popup">펀딩을 진행하기 위한<br> 기본 회원 정보를 확인해 주세요.</strong>
                    <div style="padding:20px;">- 이메일 인증 : 미인증</div>
                  </div>
                  <div class="btn-wrap">
                    <a class="btn-pd-mint" href="/web/waccount/wAuth">기본 회원정보 변경</a>
                  </div>
                </div>
              </div>
              <!-- E : 인증 확인 모달 -->
			
            </div>
            <!-- E : 우측 캠페인 관련 정보 -->
			
    
            <!-- S : 캠페인 정보 -->
            
            </div>
			
            <!-- E : 캠페인 정보 -->
			
          </div>
			<div class="wd-ui-sub-campaign-info-container">
              <div class="wd-ui-sub-campaign-info">
                <!-- S : 탭 주요 콘텐츠 -->
                <div class="wd-ui-tab-contents" style=" margin-right: 7%;">
                  
				<div class="wd-ui-tab-contents">
					 <h3 class="text-hidden">프로젝트 스토리</h3> 
						<!-- 이미지가 아닌 동영상 URL이 넘어오는 경우 iframe에 동영상을 보여줘야 함 -->
				  <div class="view-slide-wrap" style="padding: 0">
					  
					  
					  <ul class="view-slide-big">
						<li>
						  <div class="video-wrap">
							<div class="video-container" data-video-url="https://youtu.be/N3en-KjA6s4">
							  <div class="video-cover icon-movie" data-cover-url="" style="background-image: url(&quot;https://img.youtube.com/vi/N3en-KjA6s4/sddefault.jpg&quot;);"></div>
							</div>
						  </div>
						</li>
					  </ul>
					  
					  
					  
				  </div>
				  <ul class="view-slide-nav" style="display: none">
					
					
					<li>
					  <div class="video-wrap" style="position: relative">
						<img class="img-responsive" id="campaignVideoThumbnail" src="" alt=""> <i class="icon_play_sm">Play</i>
					  </div>
					</li>
					
					
					
					
				  </ul>
				  <script>
				  jQuery(function($) {
					$('.view-slide-big.image-slide').show().slick({
					  slidesToShow: 1,
					  slidesToScroll: 1,
					  adaptiveHeight: true,
					  fade: true,
					  focusOnSelect: true
					});
				  });
				  </script>
				  <div class="campaign-title">
					<strong class="title"><a href="/web/campaign/detail/13625">2차 앵콜펀딩! 영화 [좋아해,너를] 개봉 확정 기념 특별 유료 시사회</a></strong>
					<span class="maker"><strong>#뉴이스트출연영화</strong></span>
					<span class="category icon-label-o"><em>대중예술</em></span>
				  </div>
				  <div class="campaign-summary" style="background-color: #ffffff;">
					사랑에 빠지는 순간을 그린 NU’EST 렌 주연의 일본 영화 [좋아해, 너를]
				개봉 확정 기념으로 유료 시사회를 진행하게 되었습니다.
				시사회에 참여하셔서 같이 기쁨을 누려주세요!
					
				  </div> 

				  <!-- S : campaign 컨텐츠 -->
				  <div class="wd-ui-campaign-content">
					<div class="wd-ui-cont">
					
					  <!-- S : 프로젝트 정보 -->
					 
					  <!-- E : 프로젝트 정보 -->
					  <!--S : 팔로우활동 정보  -->
					  <div class="social-info mobile">
						<a href="/web/campaign/detailBacker/13625">
						  <figure>
							<div class="profiles">
							  <span style="background-image: url()"></span>
							</div>
							<figcaption>
							  <p><strong></strong></p>
							</figcaption>
						  </figure>
						  <span class="icon-chevron-right">
						</span></a>
					  </div>
					  <!--E : 팔로우활동 정보  -->
					  <br>
					  <!-- S : 펀딩 기간, 보상품 제공일 -->
					  <div>
						<div style="padding:20px;background:#eafbf7;background:rgba(0, 204, 163, 0.1)">
						  <p style="color:#00cca3;font-size:13px;line-height:20px;margin-bottom:10px;"><strong>목표 금액</strong> 2,000,000원 &nbsp; &nbsp; <strong>펀딩기간</strong> 2017.07.19-2017.08.08</p>
						  
						  
						  <p style="color:#4a4a4a;font-size:12px;line-height:19px;"><strong>100% 이상 모이면 리워드가 제공되는 프로젝트</strong><br>
						  이 프로젝트는 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 리워드가 제공되지 않으며, 결제 또한 진행되지 않습니다.</p>
						  
						  
						  
						</div>
						<div style="padding:20px;background:#f0f0f0;">
						  
						  <p style="color:#4a4a4a;font-size:12px;line-height:19px;margin-bottom:10px;"><strong>펀딩 결제/취소/변경에 대한 안내</strong><br>
						  펀딩 결제는 예약 상태로 유지되다가, 펀딩 마감일 다음 영업일 <strong>2017.08.09 17시</strong>에 모두 함께 진행됩니다. 결제 정보 변경은 결제가 진행되기 전까지 언제나 가능합니다. 참여한 펀딩 정보 변경은 <a href="/web/wmypage/myfunding/fundinglist" style="text-decoration: underline;">나의 펀딩현황</a>에서 진행해주세요.
						  마감일 이후에는 펀딩에 대한 리워드 제작 및 배송이 시작되어, 취소와 더불어 배송지 및 리워드 옵션 변경은 <strong>2017.08.08</strong> 이후로는 불가합니다.</p>
						  
						  <p style="color:#4a4a4a;font-size:12px;line-height:19px;"><strong>리워드 발송 안내</strong><br>메이커가 약속한 가장 빠른 리워드 발송은 <span style="font-weight: bold;">
						
						  <!-- S : 가장 빠른 리워드 발송일 찾기 -->

          <!-- S : As-Is or To-Be 분기 -->
      
          2017.09.20</span>이며,
          
          
          <!-- E : As-Is or To-Be 분기 -->
          리워드마다 발송 시작일이 다를 수 있으니 펀딩 전, 꼭 확인해 주세요.<br>
          리워드를 제작하고 생산하는 과정에서 예상치 못한 상황으로 리워드 발송이 메이커가 약속한 날짜보다 지연 또는 불가할 수 있으며, 관련한 환불 및 교환은 메이커가 정한 규정에 따릅니다. 스토리 하단의 리워드 발송 예상 변동 기간 및 교환 / 환불 / AS 정책을 참고 해주세요.</p>
        </div>
      </div>
      <!-- E : 펀딩 기간, 보상품 제공일 -->
      <br>
      <br>

      <!-- S : 프로젝트 내용 -->
      <div id="introdetails" style="height: auto;" class="story">
        <div class="inner-contents fr-view">
          <p><strong>휴대폰 케이스 관련<br></strong></p><p><br></p>
        </div>
        <div class="wd-ui-risk">
        
          <div><span>프로젝트 위험 요인과 해결 방안</span></div>
          <div class="wd-ui-cont">
            영화 [좋아해,너를] 상영관 확보 프로젝트펀딩에  펀딩해 주신 후원자분들께 감사의 마음을 담아 <br>제공해드리는 리워드의 수행일정을 준수하기 위해 최선을 다할 것을 약속합니다. <br>단, 펀딩을 받아야만 생산을 시작할 수 있는 크라우드 펀딩 특성 및 생산과정에서의 <br>예상치 못한 상황으로 인하여 리워드 제공일이 다소 지연될 수 있는 점을 알려 드립니다.<br><br>  <br>- 약속된 일정으로부터 3달 이내 (2017-12-19) 리워드 제공이 지연될 경우<br>  리워드 지연이 예상되는 시점에 즉시 [새소식]과 [SMS]로 변경된 제공일을 알려드립니다. <br>  (단, 1달 기간내 리워드 일정 지연 사유로 펀딩 취소는 불가)<br><br>- 약속된 일정으로부터 3달 이상 (2017-12-20) 리워드 제공이 지연될 경우 <br>   리워드 제공이 약속된 일정으부터 3개월 이상 지연될 경우 전체환불을 해드립니다.<br><br>3개월이상 지연 됐을 경우의 환불 관련 문의는 docinema.kr@gmail.com으로 연락 부탁드립니다. <br>  <br>							
          </div>
        
        
        </div>
      </div>
      <!-- E : 프로젝트 내용 -->
    </div>
  </div>
  <!-- E : campaign 컨텐츠 -->
  
  <div class="banner-section-RB1"><a href="https://www.wadiz.kr/web/winvest/main?cateOfBsns=&amp;securtType=&amp;incomeDeductYn=Y&amp;growthStage=intrstRate=&amp;expirationDate=&amp;order=undefined&amp;_refer_section_st=RB1_0" class="banner-bar" style="background-image:url(https://cdn.wadiz.kr/ft/images/green001/2018/0129/20180129112242058_440.jpg/wadiz/format/jpg/quality/95/optimize)">
  <p>지금 소득공제기업에 투자하면!</p>
  <p><strong>투자금 100%전액 공제혜택이</strong></p>
</a></div>

  



<!-- Modal -->
<link href="/finalp/resources/css/modalcss/blacklistModal.css" rel="stylesheet">

   
  
   <div class="modal fade" id="blacklist-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; z-index:9999;">
             <div class="modal-dialog">
               <div class="blacklist-container">
                  <a data-dismiss="modal" style="margin-left:90%; max-width:500px;"><i class="xi-close-thin xi-2x"></i></a>
                  <h1>프로젝트 신고하기</h1><br>   
                   <form action="/doubleb/insertblacklist" method="post">
                      <input type="hidden" name="mno_send" value="">
                     <input type="text"  value="" >
                     
                     <input type="hidden" name="mno_receive" value="">
                     <input type="text"  value="" >
                     
                     <textarea name="content" placeholder="신고사유"></textarea>
                     
                     <input type="submit" class="blacklist blacklist-submit" value="신고하기">
                    </form>
             </div>
          </div>
     </div>

   <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; z-index:9999;">
             <div class="modal-dialog">
               <div class="blacklist-container">
                  <a data-dismiss="modal" style="margin-left:90%; max-width:500px;"><i class="xi-close-thin xi-2x"></i></a>
                  <h1>창작자에게 문의하기</h1><br>   
                   <form action="#" method="post">
                      <input type="hidden" name="" value="">
                     <input type="text"  value="" >
                     
                     <input type="hidden" name="" value="">
                     <input type="text"  value="" >
                     
                     <textarea name="content" placeholder="문의 내용"></textarea>
                     
                     <input type="submit" class="blacklist blacklist-submit" value="신고하기">
                    </form>
             </div>
          </div>
     </div>
          </div></div></div></div></div></div></div>
          
</div>
 </body>
</html>
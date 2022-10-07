<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="ko">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src=“https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js“></script> --> <!-- Ajax -->
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script> <!-- Ajax -->
<!-- jquery datepicker -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- jquery datepicker 끝 -->
<style>
html {
	width: 100%;
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
}
/* 버튼 */
.buttonstyle {
	border: 1px solid #A0D9E2;
	color: #A0D9E2;
	background-color: white;
	margin-bottom: 7px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 10pt;
}

.buttonstyle:hover {
	box-shadow: 0px 15px 20px rgba(131, 131, 131, 0.4);
	transform: translateY(-5px);
	background-color: #A0D9E2;
	color: white;
}

.buttonstyle:focus {
	background-color: #A0D9E2;
	color: white;
	border: 3px solid #c9c9c9;
}

.buttonstyle2 {
	border: 1px solid #FF7171;
	color: #FF7171;
	background-color: white;
	margin-bottom: 7px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 10pt;
}

.buttonstyle2:hover {
	box-shadow: 0px 15px 20px rgba(131, 131, 131, 0.4);
	transform: translateY(-5px);
	background-color: #FF7171;
	color: white;
}

.buttonstyle2:focus {
	background-color: #FF7171;
	color: white;
	border: 3px solid #c9c9c9;
}

/*
      *   게시판 이동 모달
      */
.normal_manage_board_modal {
	width: 100%;
	height: 100%;
	background-color: white !important;
}

.normal_manage_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 80px;
	margin: 0 auto;
}

.normal_manage_board_modal .top .close {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_manage_board_modal .top .subject {
	float: left;
	margin-left: 30px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	line-height: 80px;
}

.normal_manage_board_modal .bottom {
	width: 100%;
	vertical-align: middle;
}

.normal_manage_board_modal .bottom .info {
	margin-top: 10px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 30px;
}

.normal_manage_board_modal .bottom .contents {
	margin: 10px 30px 20px 30px;
	text-align: center;
}

.normal_manage_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_manage_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_manage_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
}

.normal_manage_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul .button_li {
	padding-top: 20px;
	width: 100%;
}

.normal_manage_board_modal .bottom .contents .board_manage_go {
	width: 100% !important;
	height: 40px;
	font-size: 15px;
}

.date_subject {
	margin: 0px;
	margin-bottom: 5px;
	margin-left: 12px;
	font-size: 12px;
	font-weight: bold;
	border: none;
}

.date_subject:hover {
	border: 1px solid #A0D9E2 !important;
	border-radius: 7px;
}

.radio {
	margin-top: 9px;
	border: 1px solid #A0D9E2;
}

.colorbox {
	border: 1px solid #A0D9E2;
}
</style>
<title>FrmPopup.htm : 팝업창</title>
</head>
<body>
	<div class="normal_manage_board_modal">
	<script>
         $(function() {
            $("#testDatepicker")
                  .datepicker(
                        {

                           dateFormat : "yy-mm-dd",
                           changeMonth : true,
                           changeYear : true,
                           dayNames : [ '월요일', '화요일', '수요일', '목요일',
                                 '금요일', '토요일', '일요일' ],
                           dayNamesMin : [ '월', '화', '수', '목', '금',
                                 '토', '일' ],
                           monthNamesShort : [ '1', '2', '3', '4',
                                 '5', '6', '7', '8', '9', '10',
                                 '11', '12' ]
                        });
         });
	</script>

      <!-- share 값에 따라 공개, 비공개 체크 상태 -->
	<script type="text/javascript">
	
				
     </script>
               
			<div class="top">
				<!-- <div class="close">x</div> -->
				
				
				<div class="subject">Schedule</div>
			</div>

			<div class="bottom">
				<div class="info">* 변경 혹은 삭제된 일정은 복구할 수 없습니다.</div>
		
			<form role="form" name="schedule_modify">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month" value="${today_info.search_month-1}" />
				<input type="hidden" name="schedule_idx" value="${schedule_show.schedule_idx}" />
				
				<div class="contents">
					<ul>
				
		<%-- <input type="hidden" name="schedule_idx" value="${schedule_show.schedule_idx}" /> --%>
						<li>
							<div class="text_subject">순번 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_num" class="text_type1"
									value="${schedule_show.schedule_num}" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1"
									id="testDatepicker" readonly="readonly"
									value="${schedule_show.schedule_date}" />
							</div>
						</li>
						<li>
							<div class="text_subject">제목 :</div>
							<div class="text_desc">
							<textarea name="schedule_subject" class="textarea_type1" rows="1">${schedule_show.schedule_subject}</textarea>
<%-- 							<textarea name="schedule_subject" class="textarea_type1" rows="1" style="resize: none;">${schedule_show.schedule_subject}</textarea>
 --%>								<%-- <input type="text" name="schedule_subject" class="text_type1"
									value=${schedule_show.schedule_subject }></input> --%>
							</div>
						</li>
						<li style="margin-bottom: 75px;">
							<div class="text_subject">내용 :</div>
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="5">${schedule_show.schedule_desc}</textarea>
							</div>
						</li>
						<li>
							<div class="text_subject">공유 :</div> <input class="radio"
							type="radio" name="schedule_share" id="first_radio" value="1"
							checked="checked"/>공개 <input type="radio"
								name="schedule_share" id="second_radio" value="2"/>비공개 
						</li>
						<li>
							<div class="text_subject">색상 :</div> <input class="colorbox"
							type='color' name='schedule_mycolor'
							value="${schedule_show.schedule_mycolor}" />
						</li>
						<li class="button_li">
							<div class="managebutton">
								<input type="button" onclick="modify(this.form);" value="Modify" class="buttonstyle board_manage_go pointer"/>
						
						
							<%-- <form method="POST" action="modify.do?schedule_idx=${schedule_show.schedule_idx}"> --%>
								<!-- <button type="button" data-oper='modify' onclick="modify(this.form);"
									class="buttonstyle board_manage_go pointer">Modify</button> -->
				</form>
				
							<form>	
								<input type="hidden"  name="schedule_idx" value="${schedule_show.schedule_idx}" />
								<button type="button" onclick="del(this.form);"
									class="buttonstyle2 board_manage_go pointer">Delete</button>
								<!-- <button type="submit" data-oper='delete'
									class="buttonstyle2 board_manage_go pointer">Delete</button> -->
							</form>
							</div>
						</li>
					</ul>
					
				</div>
			</div>
	
	<script>
	
	function del(f) {
		var url = "calendar_delete.do";
		var param = "schedule_idx="+f.schedule_idx.value;
		
		sendRequest(url,param,resultFunc,"POST");
	}
	
	function modify(f) {
		// f.submit();
		var url = "calendar_modify.do";
		var param = "schedule_idx="+f.schedule_idx.value+
			"&schedule_num="+f.schedule_num.value+
			"&schedule_subject="+f.schedule_subject.value+
			"&schedule_desc="+f.schedule_desc.value+
			"&schedule_date="+f.schedule_date.value+
			"&schedule_share="+f.schedule_share.value+
			"&schedule_mycolor="+f.schedule_mycolor.value;
		
		sendRequest(url,param,resultFunc,"POST");
	}
	
	function resultFunc() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			opener.parent.location.reload();	// 팝업 창 닫고, 부모 창 리로드
			window.close();
		}
	}
	
	/* 수정버튼과 삭제버튼 클릭 시 수행되는 코드 */
	$(document).ready(function(){
		 var formObj = $("form");
		 
		 $('button').on("click",function(e){
			 e.preventDefault();
		 
			 var operation = $(this).data("oper");
			 
			 console.log(operation);
			 
			 if(operation === 'delete'){
				 formObj.attr("action", "/delete.do");
			 }else if(operation === 'modify'){
				 formObj.attr("action", "modify.do");
			 }
			 formObj.submit();
		 });
	});
	</script>
	
	

</body>
</html>
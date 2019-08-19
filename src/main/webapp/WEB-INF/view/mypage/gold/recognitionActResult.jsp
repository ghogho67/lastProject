<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="csslinegraph/csslinegraph.css" rel="stylesheet"
	type="text/css" media="screen" />
<title>인지활동내역</title>
<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>


<style>
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

tr {
	text-align: center;
	font-weight: 500;
}

td {
	text-align: center;
}
</style>
<script>
window.onload = function () {
	jQuery.ajaxSettings.traditional = true; 
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	contentType : "application/json; charset=UTF-8",
	theme: "light2",

	axisX:{
		valueFormatString: "M월  D일",
		crosshair: {
			enabled: true,
			snapToDataPoint: true
		}
	},
	axisY: {s
		crosshair: {
			enabled: true
		}
	},
	toolTip:{
		shared:true
	},  
	legend:{
		cursor:"pointer",
		verticalAlign: "bottom",
		horizontalAlign: "left",
		dockInsidePlotArea: true,
		itemclick: toogleDataSeries
	},
	data: [{
		type: "line",
		showInLegend: true,
		name: "인지 평가점수",
		markerType: "square",
		xValueFormatString: "YYYY MM DD",
		color: "#F08080",
		dataPoints: [
			for (var i = 0; i <'${getTestResultVos}'.length; i++) {
				{ x: new Date('${getTestResultVos.sur_time}'.text(data)), y:'${getTestResultVos.sur_result}' },
			}
			
		]
	},
	{
		type: "line",
		showInLegend: true,
		name: "회원 평균 인지점수",
		lineDashType: "dash",
		dataPoints: [
			
			for (var i = 0; i <'${getTestResultVos}'.length; i++) {
				{ x: new Date('${getTestResultVos.sur_time}'.text(data)), y:'${getTestResultVos.sur_result}' },
			}
		]
	}]
});
chart.render();

function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	chart.render();
}

}
</script>
</head>
<body>

	<div class="container-fluid"></div>

	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>



	<c:choose>

		<c:when test="${MEM_INFO.mem_grade==0}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarA.jsp"%>

		</c:when>

		<c:when test="${MEM_INFO.mem_grade==3}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>

		</c:when>

		<c:otherwise>
			<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>

		</c:otherwise>

	</c:choose>





	<form id="frm" action="${cp}/report/report" method="get">
		<input type="hidden" id="reportId" name="reportId"> <input
			type="hidden" id="memid" name="memid" value="${MEM_INFO.mem_id}">
		<input type="hidden" id="memgrade" name="memgrade"
			value="${MEM_INFO.mem_grade}">
	</form>




	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12" style="padding: 0 60px 0 60px;">
				<div class="card">



					<div class="card-body">
						<div id="titlee">
							<h2>
								<span>인지 활동 내역</span> 조회
							</h2>
						</div>



<div id="chartContainer" style="height: 500px; width: 100%;"></div>

					</div>

				</div>

			</div>
		</div>
	</div>





</body>
</html>
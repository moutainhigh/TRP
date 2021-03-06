﻿<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<html>
	<head>
		<title>泰申管理系统</title>
		<link href="../_css/reset.css" rel="stylesheet" type="text/css" />
		<link href="../_css/global.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" language="javascript"
			src="../_js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" language="javascript"
			src="../_js/goto.js"></script>
		<script type="text/javascript" language="javascript"
			src="../_js/menu.js"></script>
		<script type="text/javascript" language="javascript">
<c:if test="${URI==null}">
   	top.location="../login.jsp" 
</c:if>
		function showUL(ulId){
			var selectedUL=document.getElementById(ulId);
			if(selectedUL.style.display==""){
				selectedUL.style.display="none";
			}else{
				selectedUL.style.display="";
			}		
		}
	</script>
	</head>
	<body>
		<div id="mainContainer">
			<div class="fixedSideBar"></div>
			<div id="sideBar">
				<div class="sideBarItem webAdmin">
					<span class="title"><a href="#"
						onclick="showUL('ulBusiness')">业务报表</a> </span>
					<ul class="contents" id="ulBusiness">
						<c:check code="sg01">
							<!-- 
						<li>						
							<a href="marketReport.jsp" target="mainFrame">原始销售报表</a>						
						</li>
						 -->
						</c:check>
						<c:check code="sg02">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadSaleReport&reportType=2"
									target="mainFrame">销售报表</a>
							</li>
						</c:check>
						<c:check code="sg03">
							<li>
								<a
									href="../airticket/report.do?thisAction=initOptTransactionReport"
									target="mainFrame">操作员统计</a>
							</li>
						</c:check>
						<c:check code="sg04">
							<!-- 
						<li>
							<a href="../_jsp/inMarking.jsp" target="mainFrame">平台销售统计报表</a>
						</li>						
						-->
						</c:check>
						<c:check code="sg05">
							<!--
						<li>
							<a href="../_jsp/inMarking.jsp" target="mainFrame">营业销售统计报表</a>
						</li>
						-->
						</c:check>
						<c:check code="sg06">
							<!--
						<li>							
							<a href="../_jsp/inMarking.jsp" target="mainFrame">散客统计报表</a>							
						</li>
						-->
						</c:check>
					</ul>
					<span class="title"><a href="#"
						onclick="showUL('ulFinance')">财务报表</a> </span>
					<ul class="contents" id="ulFinance">
						<!-- 
						<c:check code="sg11">
						<li>
							<a
								href="#" target="mainFrame">银行卡付款统计表</a>
						</li>
						</c:check>
						<c:check code="sg12">
						<li>
							<a href="#" target="mainFrame">平台银行交易统计表</a>
						</li>
						</c:check>
						-->
						<c:check code="sg02">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadSaleReport&reportType=1"
									target="mainFrame">销售报表</a>
							</li>
						</c:check>
						<c:check code="sg14">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadRetireReport&reportType=11"
									target="mainFrame">退废报表</a>
							</li>
						</c:check>
						<c:check code="sg07">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadTeamSaleReport&reportType=51"
									target="mainFrame">团队统计报表</a>
							</li>
						</c:check>
						<c:check code="sg08">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadTeamRakeOffReport&reportType=52"
									target="mainFrame">团队未返代理费报表</a>
							</li>
						</c:check>
					</ul>
					<span class="title"><a href="#"
						onclick="showUL('ulCompare')">报表对比</a> </span>
					<ul class="contents" id="ulCompare">
						<c:check code="sg15">
							<li>
								<a
									href="../transaction/reportCompareResultList.do?thisAction=list"
									target="mainFrame">对比结果列表</a>
							</li>
							<li>
								<a
									href="../transaction/reportRecodeResultList.do?thisAction=list"
									target="mainFrame">导入的报表</a>
							</li>
							<li>
								<a
									href="../transaction/reportRecode.do?thisAction=redirectPlatformCompareManage"
									target="mainFrame">平台-系统</a>
							</li>
							<li>
								<a
									href="../transaction/reportRecode.do?thisAction=redirectPaytoolCompareManage"
									target="mainFrame">平台-支付工具</a>
							</li>
						</c:check>
					</ul>
					<span class="title"><a href="#"
						onclick="showUL('ulCompare')">测试</a> </span>
					<ul class="contents" id="ulCompare">
						<c:check code="sg15">
							<li>
								<a
									href="../airticket/report.do?thisAction=loadSaleReport&reportType=3"
									target="mainFrame">Test1</a>
							</li>
						</c:check>
					</ul>
				</div>
			</div>
			<div class="closeSiseBar">
				<span class="btn"></span>
			</div>
		</div>
		<script type="text/javascript" language="javascript">
      initMenu("sideBar");
</script>
	</body>
</html>

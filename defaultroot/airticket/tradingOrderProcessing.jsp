<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%
	String path = request.getContextPath();
 %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<link href="../_css/reset.css" rel="stylesheet" type="text/css" />
	<link href="../_css/global.css" rel="stylesheet" type="text/css" />
   	<script type='text/javascript' src='<%=path %>/dwr/interface/platComAccountStore.js'></script>
   	<script type='text/javascript' src='<%=path %>/dwr/interface/passengerBiz.js'></script>
   	<script type='text/javascript' src='<%=path %>/dwr/interface/tempPNRBizImp.js'></script>
   	<script type='text/javascript' src='<%=path %>/dwr/interface/parseBlackUtil.js'></script>
   	<script type='text/javascript' src='<%=path %>/dwr/interface/airticketOrderBiz.js'></script>
 	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	<link type="text/css" href="../_js/development-bundle/themes/base/ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="../_js/development-bundle/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="../_js/development-bundle/ui/ui.core.js"></script>
	<script type="text/javascript" src="../_js/development-bundle/ui/ui.draggable.js"></script>
	<script type="text/javascript" src="../_js/development-bundle/ui/ui.dialog.js"></script>
	<script type="text/javascript" src="../_js/loadAccount.js"></script>
	<script src="../_js/calendar/WdatePicker.js" type="text/javascript"></script>
	
	<script src="../_js/common.js" type="text/javascript"></script>
	<script src="../_js/popcalendar.js" type="text/javascript"></script>
	<script src="../_js/orderOperate.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function() {		
		$("#dialog").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:300,
			modal: true
		});
		
		
		$("#dialog2").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});
	  	$("#dialog3").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});	
		$("#dialog4").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
       	$("#dialog5").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
		
	 	$("#dialog6").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
		$("#dialog7").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});
		$("#dialog8").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
		$("#dialog9").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
		 $("#dialog10").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});	
		 $("#dialog11").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});
		
		$("#dialog12").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});	
		$("#dialog13").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 500,
			width:450,
			modal: true
			
		});	
	   $("#dialog14").dialog({
			bgiframe: true,
			autoOpen: false,
			//height: 500,
			//width:450,
			modal: true
			
		});	
							
	});

	</script>
<style>
.BBJ_LOGO {
	color: #195EDC;
	font-weight: 400;
	display: inline-block;
	height: 20px;
	text-indent: 15px;
	background: url(../_img_jajabi/spr_icon.png) no-repeat -6px -36px;
	font-size: 12px;
}
</style>
		<script type="text/javascript" src="../_js_jajabi/JajabiProgress.js"></script>
		<script>
		function startTalking(agentjjbno) {
        var obj = document.getElementById("jjbTalkCab");      
        var  myjjb="";

   		<c:if test="${URI!=null}">
   			 myjjb=<c:out value="${URI.user.userNo}" />; 	
		 </c:if>   
		            
         if (myjjb == "") {
            obj.SetTalkInfo("", agentjjbno, "", "");
          } else{
          	alert('请登录家家比');
          }  
      }
           
      </script>
	</head>
	<body>
		<div id="mainContainer">
			<div id="container">
				<html:form action="/airticket/listAirTicketOrder.do?thisAction=listAirTicketOrderManage">
					<html:hidden property="thisAction" />
					<html:hidden property="lastAction" />
					<html:hidden property="intPage" />
					<html:hidden property="pageCount" />
					<input type="hidden" name="locate"
						value="<c:out value="${locate}"></c:out>" />

					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="10" height="10" class="tblt"></td>
							<td height="10" class="tbtt"></td>
							<td width="10" height="10" class="tbrt"></td>
						</tr>
						<tr>
							<td width="10" class="tbll"></td>
							<td valign="top" class="body">
								<c:import url="../_jsp/mainTitle.jsp?title1=票务订单管理&title2=关联订单"
									charEncoding="UTF-8" />								
								<table width="100%" cellpadding="0" cellspacing="0" border="0" 
									class="dataList">
									<tr>
										<th>
											<div>
												承运人
											</div>
										</th>
										<th>
											<div>
												行程
											</div>
										</th>

										<th>
											<div>
												乘客
											</div>
										</th>
										<th>
											<div>
												票号
											</div>
										</th>
										<th>
											<div>
												票面价
											</div>
										</th>
										<th>
											<div>
												机建
											</div>
										</th>
										<th>
											<div>
												燃油
											</div>
										</th>

										<th>
											<div>
												平台
											</div>
										</th>
										<th>
											<div>
												预定PNR
											</div>
										</th>
										<th>
											<div>
												出票PNR
											</div>
										</th>
										<th>
											<div>
												大PNR
											</div>
										</th>
										<th>
											<div>
												政策
											</div>
										</th>
										<th>
											<div>
												交易金额
											</div>
										</th>
										<th>
											<div>
												交易类型
											</div>
										</th>
										<th>
											<div>
												订单状态
											</div>
										</th>
										<th>
											<div>
												操作人
											</div>
										</th>
										<th>
											<div>
												支付人
											</div>
										</th>
										<th>
											<div>
												订单时间
											</div>
										</th>
										<th colspan="2">
											<div>
												操作
											</div>
										</th>
									</tr>
									<c:forEach var="groupInfo" items="${ulf.list}" varStatus="status">
										<tr>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />" >
													<c:out value="${groupInfo.carrier}" escapeXml="false"/>
											</td>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.flight}" />											
											</td>										
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.passenger}"  escapeXml="false"/>
											</td>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.ticketNo}"  escapeXml="false" />
											</td>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.ticketPrice}" />
											</td>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.airportPrice}" />
											</td>
											<td rowspan="<c:out value="${groupInfo.orderCount}" />">
													<c:out value="${groupInfo.fuelPrice}" />
											</td>										
											<td>
												<c:if test="${!empty groupInfo.saleOrder.platform}">
													<c:out value="${groupInfo.saleOrder.platform.showName}" />
												</c:if>
											</td>
											<td>
												<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${groupInfo.saleOrder.tranType}" />&groupMarkNo=<c:out value="${groupInfo.saleOrder.groupMarkNo}" />&aircketOrderId=<c:out value="${groupInfo.saleOrder.id}" />">
													<c:out value="${groupInfo.saleOrder.subPnr}" /> 
												</a>
											</td>
											<td>
												<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${groupInfo.saleOrder.tranType}" />&groupMarkNo=<c:out value="${groupInfo.saleOrder.groupMarkNo}" />&aircketOrderId=<c:out value="${groupInfo.saleOrder.id}" />">
													<c:out value="${groupInfo.saleOrder.drawPnr}" />
												</a>
											</td>
											<td>
												<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${groupInfo.saleOrder.tranType}" />&groupMarkNo=<c:out value="${groupInfo.saleOrder.groupMarkNo}" />&aircketOrderId=<c:out value="${groupInfo.saleOrder.id}" />">
													<c:out value="${groupInfo.saleOrder.bigPnr}" />
												</a>
											</td>
											<td>
												<c:out value="${groupInfo.saleOrder.rebate}" />
											</td>
											<td>
												<c:out value="${groupInfo.saleOrder.totalAmount}" />
											</td>
											<td>
												<c:out value="${groupInfo.saleOrder.tranTypeText}" />(<c:out value="${groupInfo.saleOrder.businessTypeText}" />)
											</td>
											<td>
												<c:out value="${groupInfo.saleOrder.statusText}" />
											</td>
											<td>
												<a class="BBJ_LOGO"
													href="javascript:startTalking('<c:out value="${groupInfo.saleOrder.entryOperator}" />')"><c:out
														value="${groupInfo.saleOrder.entryOperatorName}" /> </a>
											</td>
											<td>
												<c:if test="${!empty groupInfo.saleOrder.payOperatorName}">
													<a class="BBJ_LOGO"
														href="javascript:startTalking('<c:out value="${groupInfo.saleOrder.payOperatorName}" />')"><c:out
															value="${groupInfo.saleOrder.payOperatorName}" /> </a>
												</c:if>
											</td>											
											<td>
												<c:out value="${groupInfo.saleOrder.entryOrderDate}" />
											</td>
											<td>
												<c:out value='${groupInfo.saleOrder.tradeOperate}' escapeXml="false"/>
											</td>
											<td>
												<c:out value='${groupInfo.saleOrder.commonOperateTextNoRelate}' escapeXml="false"/>
											</td>
											
											<!-- 加载参数 -->		
								  <input id="tmpPlatformId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
	                              <input id="tmpCompanyId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
	                              <input id="tmpAccountId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
	                              <input id="tmpGroupMarkNo9<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.groupMarkNo}' />"  type="hidden" />
								 	
							      <input value="<c:out value='${groupInfo.saleOrder.memo}' />" type="hidden" id="memo<c:out value='${groupInfo.saleOrder.id}' />"/>  							
						
		                          <input id="tmpPlatformId<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
		                          <input id="tmpCompanyId<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
		                          <input id="tmpAccountId<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
		                          <input id="tmpGroupMarkNo<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.groupMarkNo}' />"  type="hidden" />
								  <input id="tmpGroupMarkNo<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.groupMarkNo}' />"  type="hidden" />
							
		                          <input id="tmpPlatformId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
	                              <input id="tmpCompanyId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
	                              <input id="tmpAccountId9<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
	                              <input id="tmpGroupMarkNo9<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.groupMarkNo}' />"  type="hidden" />
								  <input id="tmpTranType9<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.tranType}' />"  type="hidden" />								
									
								 <input type="hidden"  id="ticketPrice<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.ticketPrice}' />"/>
							     <input type="hidden"  id="ticke"  value="<c:out value='${groupInfo.saleOrder.totalAmount}' />"/>
							     <input type="hidden" value="<c:out value='${groupInfo.saleOrder.adultCount}' />">
							     <input type="hidden"  id="passengersCountTemp3<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.passengersCount}' />"/>
									
								<input type="hidden"  id="ticketPrice<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.ticketPrice}' />"/>
									  <input type="hidden"  id="ticke"  value="<c:out value='${groupInfo.saleOrder.totalAmount}' />"/>
									  <input type="hidden" value="<c:out value='${groupInfo.saleOrder.adultCount}' />">
									  <input type="hidden"  id="passengersCountTemp7<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.passengersCount}' />"/>  									
									
									  <input id="tmpPlatformId12<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
					                  <input id="tmpCompanyId12<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
					                  <input id="tmpAccountId12<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
						             
						             <input id="actualAmountTemp4<c:out value='${groupInfo.saleOrder.id}' />" type="hidden" value="<c:out value='${groupInfo.saleOrder.totalAmount}'/>"/>
						              
						             <input type="hidden"  id="passengersCountTemp3<c:out value='${groupInfo.saleOrder.id}' />"  value="<c:out value='${groupInfo.saleOrder.passengersCount}' />"/>						               
						             <input type="hidden" id="TmpFromPCAccount5" value="<c:out value="${groupInfo.saleOrder.platform.name}" />"/>
					                 <input id="tmpPlatformId5<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
					                 <input id="tmpCompanyId5<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
					                 <input id="tmpAccountId5<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
					                    
					                    <input type="hidden" id="TmpFromPCAccount14" value="<c:out value="${groupInfo.saleOrder.platform.name}" />"/>
					                <input id="tmpPlatformId14<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.platform.id}'/>" type="hidden"/>
					                <input id="tmpCompanyId14<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.company.id}'/>" type="hidden"/>
					                <input id="tmpAccountId14<c:out value='${groupInfo.saleOrder.id}' />" value="<c:out value='${groupInfo.saleOrder.account.id}'/>" type="hidden"/>
					                <input type="hidden"  id="platformName<c:out value='${groupInfo.saleOrder.id}'/>" value="<c:out value="${groupInfo.saleOrder.platform.name}" />"/> 
									<input type="hidden"  id="companyName<c:out value='${groupInfo.saleOrder.id}'/>" value="<c:out value="${groupInfo.saleOrder.company.name}" />"/> 
									<input type="hidden"  id="accountName<c:out value='${groupInfo.saleOrder.id}'/>" value="<c:out value="${groupInfo.saleOrder.account.name}" />"/> 
										</tr>
										<c:if test="${groupInfo.orderCount>1}">
										<c:forEach var="info" begin="1" items="${groupInfo.orderList}" varStatus="status3">									
											<c:if test="${info.businessType==2}">
												<tr style="background-color: #CCCCCC">
											</c:if>		
											<c:if test="${info.businessType!=2}">
												<tr>
											</c:if>															
												<td>
													<c:if test="${!empty info.platform}">
															<c:out value="${info.platform.showName}" />
													</c:if>
												</td>
												<td>
													<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${info.tranType}" />&groupMarkNo=<c:out value="${info.groupMarkNo}" />&aircketOrderId=<c:out value="${info.id}" />">
														<c:out value="${info.subPnr}" /> 
													</a>
												</td>
												<td>
													<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${info.tranType}" />&groupMarkNo=<c:out value="${info.groupMarkNo}" />&aircketOrderId=<c:out value="${info.id}" />">
														<c:out value="${info.drawPnr}" />
													</a>
												</td>
												<td>
													<a href="<%=path%>/airticket/listAirTicketOrder.do?thisAction=viewAirticketOrderPage&tranType=<c:out value="${info.tranType}" />&groupMarkNo=<c:out value="${info.groupMarkNo}" />&aircketOrderId=<c:out value="${info.id}" />">
														<c:out value="${info.bigPnr}" />
													</a>
												</td>
												<td>
													<c:out value="${info.rebate}" />
												</td>
												<td>
													<c:out value="${info.totalAmount}" />
												</td>
												<td>
													<c:out value="${info.tranTypeText}" />(<c:out value="${info.businessTypeText}" />)
												</td>
												<td>
													<c:out value="${info.statusText}" />
												</td>
												<td>
													<a class="BBJ_LOGO"
														href="javascript:startTalking('<c:out value="${info.entryOperator}" />')"><c:out
															value="${info.entryOperatorName}" /> </a>
												</td>
												<td>
													<c:if test="${!empty groupInfo.saleOrder.payOperatorName}">
														<a class="BBJ_LOGO"
															href="javascript:startTalking('<c:out value="${info.payOperatorName}" />')"><c:out
																value="${info.payOperatorName}" /> </a>
													</c:if>
												</td>											
												<td>
													<c:out	value="${info.entryOrderDate}" />
												</td>
												<td>											
													<c:out value='${info.tradeOperate}' escapeXml="false"/>
												</td>
												<td>
												<c:out value='${info.commonOperateTextNoRelate}' escapeXml="false"/>
											</td>
											</tr>	
											<!-- 加载参数 -->		
								  <input id="tmpPlatformId9<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
	                              <input id="tmpCompanyId9<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
	                              <input id="tmpAccountId9<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
	                              <input id="tmpGroupMarkNo9<c:out value='${info.id}' />"  value="<c:out value='${info.groupMarkNo}' />"  type="hidden" />
								 	
							      <input value="<c:out value='${info.memo}' />" type="hidden" id="memo<c:out value='${info.id}' />"/>  							
						
		                          <input id="tmpPlatformId<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
		                          <input id="tmpCompanyId<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
		                          <input id="tmpAccountId<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
		                          <input id="tmpGroupMarkNo<c:out value='${info.id}' />"  value="<c:out value='${info.groupMarkNo}' />"  type="hidden" />
								  <input id="tmpGroupMarkNo<c:out value='${info.id}' />"  value="<c:out value='${info.groupMarkNo}' />"  type="hidden" />
							
		                          <input id="tmpPlatformId9<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
	                              <input id="tmpCompanyId9<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
	                              <input id="tmpAccountId9<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
	                              <input id="tmpGroupMarkNo9<c:out value='${info.id}' />"  value="<c:out value='${info.groupMarkNo}' />"  type="hidden" />
								  <input id="tmpTranType9<c:out value='${info.id}' />"  value="<c:out value='${info.tranType}' />"  type="hidden" />								
									
								 <input type="hidden"  id="ticketPrice<c:out value='${info.id}' />"  value="<c:out value='${info.ticketPrice}' />"/>
							     <input type="hidden"  id="ticke"  value="<c:out value='${info.totalAmount}' />"/>
							     <input type="hidden" value="<c:out value='${info.adultCount}' />">
							     <input type="hidden"  id="passengersCountTemp3<c:out value='${info.id}' />"  value="<c:out value='${info.passengersCount}' />"/>
									
								<input type="hidden"  id="ticketPrice<c:out value='${info.id}' />"  value="<c:out value='${info.ticketPrice}' />"/>
									  <input type="hidden"  id="ticke"  value="<c:out value='${info.totalAmount}' />"/>
									  <input type="hidden" value="<c:out value='${info.adultCount}' />">
									  <input type="hidden"  id="passengersCountTemp7<c:out value='${info.id}' />"  value="<c:out value='${info.passengersCount}' />"/>  									
									
									  <input id="tmpPlatformId12<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
					                  <input id="tmpCompanyId12<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
					                  <input id="tmpAccountId12<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
						             
						             <input id="actualAmountTemp4<c:out value='${info.id}' />" type="hidden" value="<c:out value='${info.totalAmount}'/>"/>
						              
						             <input type="hidden"  id="passengersCountTemp3<c:out value='${info.id}' />"  value="<c:out value='${info.passengersCount}' />"/>						               
						             <input type="hidden" id="TmpFromPCAccount5" value="<c:out value="${info.platform.name}" />"/>
					                 <input id="tmpPlatformId5<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
					                 <input id="tmpCompanyId5<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
					                 <input id="tmpAccountId5<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
					                    
					                    <input type="hidden" id="TmpFromPCAccount14" value="<c:out value="${info.platform.name}" />"/>
					                <input id="tmpPlatformId14<c:out value='${info.id}' />" value="<c:out value='${info.platform.id}'/>" type="hidden"/>
					                <input id="tmpCompanyId14<c:out value='${info.id}' />" value="<c:out value='${info.company.id}'/>" type="hidden"/>
					                <input id="tmpAccountId14<c:out value='${info.id}' />" value="<c:out value='${info.account.id}'/>" type="hidden"/>
					                <input type="hidden"  id="platformName<c:out value='${info.id}'/>" value="<c:out value="${info.platform.name}" />"/> 
									<input type="hidden"  id="companyName<c:out value='${info.id}'/>" value="<c:out value="${info.company.name}" />"/> 
									<input type="hidden"  id="accountName<c:out value='${info.id}'/>" value="<c:out value="${info.account.name}" />"/> 
																																
										</c:forEach>
									</c:if>									
							</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</html:form>
			</div>
		</div>
				
<jsp:include page="generalManageDiv.jsp"></jsp:include>
<jsp:include page="../_jsp/importTalkObj.jsp"></jsp:include>

	</body>
</html>

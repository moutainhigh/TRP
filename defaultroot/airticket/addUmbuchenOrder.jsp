<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="../_css/reset.css" rel="stylesheet" type="text/css" />
		<link href="../_css/global.css" rel="stylesheet" type="text/css" />
		<script src="../_js/common.js" type="text/javascript"></script>
		<script src="../_js/common.js" type="text/javascript"></script>
		<script type='text/javascript' src='<%=path %>/dwr/interface/airticketOrderBiz.js'></script>
	 	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		<link type="text/css"
			href="../_js/development-bundle/themes/base/ui.all.css"
			rel="stylesheet" />
		<script type="text/javascript"
			src="../_js/development-bundle/jquery-1.3.2.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/ui.core.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/ui.draggable.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/ui.resizable.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/ui.dialog.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/effects.core.js"></script>
		<script type="text/javascript"
			src="../_js/development-bundle/ui/effects.highlight.js"></script>
			<script src="../_js/calendar/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="../_js/base/DateUtil.js"></script>	
	</head>
	<body>
		<div id="mainContainer">
			<div id="container">
				<html:form action="/airticket/airticketOrder.do">
					<html:hidden property="forwardPage"
						value="addUmbuchenOrder" />
					<input type="hidden" id="pnrNo"
						value="<c:out value="${airticketOrder.subPnr}" />" />
					<input type="hidden" name="id"
						value="<c:out value="${airticketOrder.id}" />" />
					<input type="hidden" name="tranType" value="5" />
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="10" height="10" class="tblt"></td>
							<td height="10" class="tbtt"></td>
							<td width="10" height="10" class="tbrt"></td>
						</tr>
						<tr>
							<td width="10" class="tbll"></td>
							<td valign="top" class="body">
								<c:import url="../_jsp/mainTitle.jsp" charEncoding="UTF-8">
									<c:param name="title1" value="票务管理" />
									<c:param name="title2" value="改签订单录入" />									
								</c:import>
								<div class="searchBar">
									<table cellpadding="0" cellspacing="0" border="0"
										class="searchPanel">
										<tr>
											<td>
												已出票PNR:
												<html:text property="pnr" styleClass="colorblue2 p_5"
													value="${airticketOrder.subPnr}" style="width:120px;" />
											</td>
											<td>
												<input type="button" name="button" id="button" value="导入"
													class="submit greenBtn" onclick=" getPNRinfo()" />
												<a href="../airticket/addOrderByHand.jsp" style="font-size: 20">
													[手工录入]</a>
											</td>
										</tr>
									</table>
									<hr />
								</div>
								原行程信息
								<table width="100%" cellpadding="0" cellspacing="0" border="0"
									class="dataList">
									<tr>
										<th>
											<div>
												航空公司
											</div>
										</th>
										<th>
											<div>
												航班号
											</div>
										</th>
										<th>
											<div>
												航段
											</div>
										</th>
										<th>
											<div>
												乘机日期
											</div>
										</th>
										<th>
											<div>
												舱位
											</div>
										</th>
										<th>
											<div>
												折扣
											</div>
										</th>
										<th>
											<div>
												选择
											</div>
										</th>
									</tr>
									<c:forEach var="flight" items="${airticketOrder.flights}">
										<tr>
											<td>
												<c:out value="${flight.cyr}" />
											</td>
											<td>
												<c:out value="${flight.flightCode}" />
											</td>
											<td>
												<c:out value="${flight.startPoint}" />
												-
												<c:out value="${flight.endPoint}" />
											</td>
											<td>

												<c:out value="${flight.boardingTime}" />

											</td>
											<td>
												<c:out value="${flight.flightClass}" />
											</td>
											<td>
												<c:out value="${flight.discount}" />
											</td>
											<td></td>
										</tr>
									</c:forEach>
								</table>
								改签行程信息

								<table width="100%" cellpadding="0" cellspacing="0" border="0"
									class="dataList">
									<tr>
										<th>
											<div>
												航空公司
											</div>
										</th>
										<th>
											<div>
												航班号
											</div>
										</th>
										<th>
											<div>
												航段
											</div>
										</th>
										<th>
											<div>
												乘机日期
											</div>
										</th>
										<th>
											<div>
												舱位
											</div>
										</th>

										<th>
											<div>
												折扣
											</div>
										</th>
										<th>
											<div>
												选择
												<input type="checkbox" name="fcheckbox" id="fcheckbox"
													checked="checked" onclick="Quitfcheckbox()">
											</div>
										</th>
									</tr>
									<c:forEach var="flight" items="${airticketOrder.flights}"
										varStatus="status">
										<tr>
											
											<td>
												<c:out value="${flight.cyr}" />
											</td>
											<td>

												<input type="text" name="flightCodes"
													value="<c:out value="${flight.flightCode}" />"
													Class="colorblue2 p_5" style="width: 50px;" />

											</td>
											<td>

												<c:out value="${flight.startPoint}" />
												-
												<c:out value="${flight.endPoint}" />

												<input type="hidden" name="startPoints"
													value="<c:out value="${flight.startPoint}" />" />
												<input type="hidden" name="endPoints"
													value="<c:out value="${flight.endPoint}" />" />
											</td>


											<td>
												<input type="text" name="boardingTimes"
													value="<c:out value="${flight.boardingTime}" />"
													Class="colorblue2 p_5" style="width: 150px;" />
											</td>
											<td>


												<input type="text" name="flightClasss"
													value="<c:out value="${flight.flightClass}" />"
													Class="colorblue2 p_5" style="width: 50px;" />

											</td>
											<td>
												<input type="text" name="discounts"
													value="<c:out value="${flight.discount}" />"
													Class="colorblue2 p_5" style="width: 50px;" />
											</td>
											<td>
												<input type="checkbox" onclick="checkFilebox()"
													id="flightIds<c:out value="${status.count-1}" />"
													name="flightIds"
													value="<c:out value="${flight.id}" />"
													checked="checked" />

											</td>

										</tr>
									</c:forEach>

								</table>
								乘客
								<table width="100%" cellpadding="0" cellspacing="0" border="0"
									class="dataList">
									<tr>
										<th>
											<div>
												乘客姓名
											</div>
										</th>
										<th>
											<div>
												证件号
											</div>
										</th>
										<th>
											<div>
												票号
											</div>
										</th>
										<th>
											<div>
												选择
												<input type="checkbox" name="pcheckbox" checked="checked"
													onclick="Quitpcheckbox()" />
											</div>
										</th>
									</tr>
									<c:forEach var="passenger" items="${airticketOrder.passengers}"
										varStatus="status">
										<tr>
											<td>
												<c:out value="${passenger.name}" />
												<input type="hidden" name="passengerNames"
													value="<c:out value="${passenger.name}" />" />
											</td>
											<td>
												<c:out value="${passenger.cardno}" />
												<input type="hidden" name="passengerCardnos"
													value="<c:out value="${passenger.cardno}" />" />
											</td>
											<td>
												<c:out value="${passenger.ticketNumber}" />
												<input type="hidden" name="passengerTicketNumbers"
													value="<c:out value="${passenger.ticketNumber}" />" />
											</td>
											<td>
												<input type="checkbox" onclick="checkPassengerbox()"
													name="passengerIds"
													id="passengerIds<c:out value="${status.count-1}" />"
													value="<c:out value="${passenger.id}" />"
													checked="checked">
											</td>
										</tr>
									</c:forEach>
								</table>
								<table>
									<tr>

										<td>
											平台
										</td>
										<td>
											<select name="toPCAccountId" class="colorblue2 p_5"
												disabled="disabled" style="width: 150px;">
												<option
													value="<c:out value="${airticketOrder.id}" />">
													<c:out
														value="${airticketOrder.platform.showName}" />
												</option>
											</select>
										</td>


										<td>
											订单号
											<html:text property="airOrderNo" styleClass="colorblue2 p_5"
												style="width:150px;" onmousedown="JavaScript:this.value=''" />
										</td>
										<td>
											改签PNR
											<html:text property="umbuchenPnr" styleClass="colorblue2 p_5"
												style="width:100px;" />
										</td>
										<td>
											大PNR
											<html:text property="bigPnr" styleClass="colorblue2 p_5"
												style="width:100px;" />
										</td>
										<td>
											出票PNR
											<html:text property="drawPnr" styleClass="colorblue2 p_5"
												style="width:100px;" />
										</td>

										<td>
											<c:if test="${empty airticketOrder.addType}">
												<input name="label" type="button" class="button1"
													value="创 建" onclick="add();">

											</c:if>
											<c:if test="${!empty airticketOrder.addType}">
												<input name="label" type="button" class="button1"
													value="创 建" onclick="addOutPnr();">

											</c:if>
											<c:out value="${airticketOrder.addType}"></c:out>
										</td>

									</tr>
								</table>


							</td>
						</tr>
					</table>

				</html:form>
			</div>

			<div id="dialog" title="PNR信息导入">
				<p id="validateTips"></p>
				<form
					action="../airticket/airticketOrder.do?thisAction=airticketOrderByBlackOutPNR"
					method="post" id="form3">
					<fieldset>
						<html:hidden property="forwardPage"
							value="addUmbuchenOrderByOut" />
						<table>
							<tr>
								<td>
									<textarea rows="15" cols="90" name="pnrInfo"></textarea>

								</td>
							</tr>
							<tr>
								<td align="center" >
									<input value="提交" type="submit" class="button1">
								</td>
							</tr>

						</table>
					</fieldset>
				</form>
			</div>

	 <div id="dialog2" title="选择订单">
		<p id="validateTips"></p>
	<form action="../airticket/airticketOrder.do?thisAction=getAirticketOrderForRetireUmbuchenBySelect"  method="post" id="form2" >
		<fieldset>
		   <html:hidden property="forwardPage" value="addUmbuchenOrder"/>
		    <table id="per">
		    <tbody>
			</tbody>
			</table>
			<input value="提交" type="button" class="button1"  onclick="submitForm2()" >
		</fieldset>
		</form>
	 </div>
		</div>
		<script type="text/javascript">
		      function getPNRinfo(){		      
		         var pnr = document.forms[0].pnr.value;
		         if(pnr==""){
		              alert("请正确填写PNR!");
		              return false;
		         }		         
		         showDiv2(pnr,'0');              
		      }
		      
		      //是否只包含数字
				function isNum(b){
				   		var re=/^([1-9][0-9]*|0)(\.[0-9]{0,2})?$/;
				   		return(re.test(b));
				}
				
		       function add(){		      
		         var pnr = document.forms[0].pnrNo.value;
		         var airOrderNo = document.forms[0].airOrderNo.value;
		         var bigPnr = document.forms[0].bigPnr.value;
		         var drawPnr = document.forms[0].drawPnr.value;		      
		       
		         if(pnr==""){
		              alert("请先导入PNR!");
		              return false;
		         }
		         if(airOrderNo==""){
		             alert("请正确填写订单号!");
		              return false;
		         }	
		         if(drawPnr==""){
				      alert("请正确填写出票pnr!");
				      return false;
				  }  
		         document.forms[0].action="airticketOrder.do?thisAction=addUmbuchenOrder";
                 document.forms[0].submit();
                 
		      }
		
		  //反选和全选
		     function Quitfcheckbox(){		         
		         var fb= document.getElementsByName("fcheckbox")[0].checked;  
		         var fbox= document.getElementsByName("flightIds");  
		         
		        for(var i=0;i<fbox.length;i++){
		      		document.getElementsByName("flightIds")[i].checked=fb;  
		        }
		         checkFilebox();
		     }
		     
		      //验证是否选中
		     function checkFilebox(){
		         var fbox= document.getElementsByName("flightIds"); 
		         for(var i=0;i<fbox.length;i++){
		              if(fbox[i].checked==false){
		              //  $("#flightIds"+i).attr("value","0");
		              }else{
		              // $("#flightIds"+i).attr("value","1");
		              }		         
		         }
		     }
		     
		       //反选和全选
		    function Quitpcheckbox(){		    
		        var pc= document.getElementsByName("pcheckbox")[0].checked;  
		         var fbox= document.getElementsByName("passengerIds");  
		         
		        for(var i=0;i<fbox.length;i++){		        
		        	document.getElementsByName("passengerIds")[i].checked=pc;  
		        }
		        checkPassengerbox();
		    } 
		    
		      //验证是否选中
		     function checkPassengerbox(){
		         var fbox= document.getElementsByName("passengerIds"); 
		         for(var i=0;i<fbox.length;i++){
		              if(fbox[i].checked==false){
		              //  $("#passengerIds"+i).attr("value","0");
		              }else{
		              // $("#passengerIds"+i).attr("value","1");
		              }		         
		         }
		     }
		     
		 $(function(){		        
			$("#dialog").dialog({
				bgiframe: true,
				autoOpen: false,
				height: 550,
				width:650,
				modal: true
		    });
		    
	    	$("#dialog2").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 550,
			width:650,
			modal: true
	    });
	});
	
		 //黑屏导入
		 function showDiv(){
			  $('#dialog').dialog('open');			 
		}	
			
    function showDiv2(suPnr,tranType){ 
	 airticketOrderBiz.getSaleDrawedOrderListByPNR(suPnr,function(list){
	 
	 $('#per tbody').html("");
	 $('#per tbody').append('<tr><td width="200">承运人</td><td width="200">行程</td>'
	 +'<td width="200">乘客姓名</td>  <td width="280">出票时间</td>  <td width="200">选择</td></tr>');
	 for(var i=0;i<list.length;i++){
	  
	  var cyr="";
	  var hc="";
	  var passengerName="";
	  var cpTime=list[i].drawTimeText;
	  var aoId=list[i].id;
	  
	  var  flights= list[i].flights;
	   for(var f=0;f<flights.length;f++){
	     // alert(flights[f].hcText);
	      cyr=flights[f].cyr;
	      hc+=flights[f].hcText;
	      if(f<flights.length-1){
	      hc+="|";
	      }
	  }
	  
	  var passengers=list[i].passengers;
	  for(var p=0;p<passengers.length;p++){
	     // alert(passengers[p].name);
	      passengerName+=passengers[p].name;
	      if(p<passengers.length-1){
	        passengerName+="|";
	      }
	  }
	  
	  $('#per tbody').append('<tr>' +
							'<td>' + cyr+ '</td>' + 
							'<td>' + hc + '</td>' + 
							'<td>' + passengerName + '</td>' +
							'<td>' + cpTime + '</td>' +
							'<td><input type="radio" name="aoId"  value="' + list[i].id + '"  class="text ui-widget-content ui-corner-all" /></td>' +
							'</tr>'); 
	 }
	 if(list==""||list==null){
	   alert("无效PNR!!!");
	  }else if(list.length==1){
	     var aoId = $("input:radio[name='aoId']").attr("checked","checked");
	    $('#form2').submit();
	   }else if(list.length>1){
	    $('#dialog2').dialog('open');
	   }	 
	 });
	//  $('#dialog2').dialog('open');	 
	}
	
	function  submitForm2(){
	    var aoId = $("input:radio[name='aoId'][checked]").val();	    
	    if(aoId==""||aoId==null){
	      alert("请选择订单！");
	      return false;
	    }else{
	     $('#form2').submit();
	    }	
	}				     
		</script>
	</body>
</html>
	
	//申请支付
	function showDiv9(oId,suPnr,airOrderNo,totalAmount,rebate){
	 
	  $('#oId9').val(oId);
	  $('#pnr9').val(suPnr);
	  $('#airOrderNo9').val();
	 // $('#tmpTotalAmount9').val(totalAmount);
	  $('#totalAmount9').val(0);
	  $('#rebate9').val(0);
	  $('#liruen9').val(0);
	  $('#dialog9').dialog('open');
	  $('#dialog9').draggable({cancle: 'form'}); 
	  
	  var gm=$('#tmpGroupId'+oId).val();
	  $('#groupId9').val(gm);
	  
	   var tmpTranType=$("#tmpTranType9"+oId).val();
	  if(tmpTranType!=""&&tmpTranType!=null){
	  //alert(tmpTranType);
	  if(tmpTranType!=1){
	    $('#form9').attr('action','../airticket/airticketOrder.do?thisAction=anewApplyTicket');
	    }
	  }else{
	   $('#form9').attr('action','../airticket/airticketOrder.do?thisAction=applyTicket');
	  }
	  
	       	//设置下拉框  平台初始值 默认选中
	    var tmpPlatformValue=$("#tmpPlatformId9"+oId).val();
	    var tmpCompanyValue=$("#tmpCompanyId9"+oId).val();  	
	     var tmpAccountValue=$("#tmpAccountId9"+oId).val(); 
	     if(tmpPlatformValue!=null&&tmpPlatformValue!=""){	
	     
	     //loadPlatListSelected('platform_Id9','company_Id9','account_Id9',tmpPlatformValue,tmpCompanyValue,tmpAccountValue);
	     loadPlatListSelectedByType('platform_Id9','company_Id9','account_Id9',tmpPlatformValue,tmpCompanyValue,tmpAccountValue,'2');
	     }else{	     
	     // loadPlatList('platform_Id9','company_Id9','account_Id9');
	     loadPlatListByType('platform_Id9','company_Id9','account_Id9','2');
	     }
	     
	    var onfocusObj=document.getElementById("platform_Id9");
	    onfocusObj.onfocus;
	     
	//alert("groupId:"+groupId);	    
	airticketOrderBiz.getAirticketOrderByGroupIdAndTranType(gm,1,function(ao){
      var tmpTa= ao.totalAmount;
	   if(tmpTa!=null){
	   // alert(tmpTa);
	   $('#tmpTotalAmount9').val(tmpTa);
	  }else{
	    $('#tmpTotalAmount9').val(0);
	  }
	 
	 });
	     
	}
	
	//申请支付 验证
function submitForm9(){	
	 var re=/^([1-9][0-9]*|0)(\.[0-9]{0,3})?$/;
	var totalAmount=  $('#totalAmount9').val();
	var rebate=  $('#rebate9').val();
	totalAmount=  $('#totalAmount9').val($.trim(totalAmount));
	rebate=  $('#rebate9').val($.trim(rebate));
	
	 if(!re.test(totalAmount.val())||totalAmount.val()==""){
           alert("请正确填写金额！");
           
      }else if(!re.test(rebate.val())||rebate.val()==""){
           alert("请正确填写政策！");
       }else{
	  $('#form9').submit();
	}
	  
  }
	

	
	//确认支付
function showDiv(oId,suPnr,airOrderNo,totalAmount,rebate){
	  $('#oId').val(oId);
	  $('#pnr1').val(suPnr);
	  $('#airOrderNo1').val(airOrderNo);
	  $('#totalAmount1').val(totalAmount);
	  $('#totalAmount2').val(totalAmount);
	  $('#tmpTotalAmount1').val(totalAmount);
	  $('#rebate1').val(rebate);
	  calculationLiren('tmpTotalAmount1','totalAmount1','liren1');
	   $('#dialog').dialog('open');
	    $('#dialog').draggable({cancle: 'form'}); 
	   
	   	//设置下拉框  平台初始值 默认选中
    	var tmpPlatformValue=$("#tmpPlatformId"+oId).val();
    	var tmpCompanyValue=$("#tmpCompanyId"+oId).val();
    	var tmpAccountValue=$("#tmpAccountId"+oId).val();
    	if(tmpPlatformValue!=""){
    	 if(tmpPlatformValue!=null&&tmpPlatformValue!=""){	     
	    // loadPlatListSelected('platform_Id','company_Id','account_Id',tmpPlatformValue,tmpCompanyValue,tmpAccountValue);
	      loadPlatListSelectedByType('platform_Id','company_Id','account_Id',tmpPlatformValue,tmpCompanyValue,tmpAccountValue,'2');
	     }else{
	   //  loadPlatList('platform_Id','company_Id','account_Id');
	     loadPlatListByType('platform_Id','company_Id','account_Id','2');		
	     }	  
	 }
	  var gm=$('#tmpGroupId'+oId).val();
	  //alert('#tmpGroupId'+oId+"确认支付 groupId:"+gm);
	 	airticketOrderBiz.getAirticketOrderByGroupIdAndTranType(gm,1,function(ao){
      var tmpTa= ao.totalAmount;
	   if(tmpTa!=null){
	     $('#tmpTotalAmount1').val(tmpTa);
	  calculationLiren('tmpTotalAmount1','totalAmount1','liruen1');
	  }
	 
	 });
	}
   
    function showDiv2(oId,suPnr,groupId){	 
	 passengerBiz.listByairticketOrderId(oId,function(list){
	 $('#per tbody').html("");
	 $('#per tbody').append('<tr><td width="200">乘客姓名</td>  <td width="200" style="display: none;">证件号</td>  <td width="200">票号</td></tr>');
	 for(var i=0;i<list.length;i++){
	 var ticketNumbers=list[i].ticketNumber;
	 if(ticketNumbers==null){
	 ticketNumbers="";
	 }
	    $('#per tbody').append('<tr>' +
							'<td>' + list[i].name + '</td>' + 
							'<td style="display: none;" >' + list[i].cardno + '</td>' + 
							'<td><input type="text" name="ticketNumber"  value="' + ticketNumbers + '"  class="text ui-widget-content ui-corner-all" /></td>' +
							'<input type="hidden" name="pId"  value="' + list[i].id + '" />'+
							'</tr>'); 
	 }
	   
	 
	 });
	  $('#oId2').val(oId);
	  $('#pnr2').val(suPnr);
	   $('#groupId2').val(groupId);
	  $('#dialog2').dialog('open');
	   $('#dialog2').draggable({cancle: 'form'}); 
	 
	}
	//自动刷新
	function getTempPNR(){
	var pnr2=$("#pnr2").val();  
	if(pnr2!=null){ 
		tempPNRBizImp.getTempPNRByPnr(pnr2,function(list){
		//alert(list.tempPassengerList.length);
		if(list.tempPassengerList!=null&&list.tempTicketsList!=null){
		var passList=list.tempPassengerList;
		var ticketsList=list.tempTicketsList;
		 $('#per tbody').html("");
		 $('#per tbody').append('<tr><td width="200">乘客姓名</td>  <td width="200" style="display: none;">证件号</td>  <td width="200">票号</td></tr>');
		 for(var i=0;i<passList.length;i++){
		    $('#per tbody').append('<tr>' +
								'<td>' + passList[i].name + '</td>' + 
								'<td style="display: none;">' + passList[i].ni + '</td>' + 
								'<td><input type="text" name="ticketNumber"  value="' + ticketsList[i] + '"  class="text ui-widget-content ui-corner-all" /></td>' +
								'<input type="hidden" name="pId"  value="' + passList[i].name + '" />'+
								'</tr>'); 
		 }
		}else{
		   alert("链接超时！");
		}  
		 
		 });
	 }
	}
	//show刷新黑屏
 function showDiv10(){	 
	  $('#dialog10').dialog('open');
	   $('#dialog10').draggable({cancle: 'form'}); 
	 
	}	
	
	//黑屏刷新
	function getTempBlackPNR(){
	 $("#dialog10").dialog('close');
	 var memo10=$("#memo10").val();
	 if(memo10!=null){  
			parseBlackUtil.getTempPNRByBlack(memo10,function(list){
			//alert(list.tempPassengerList.length);
			var passList=list.tempPassengerList;
			var ticketsList=list.tempTicketsList;
			 $('#per tbody').html("");
			 $('#per tbody').append('<tr><td width="200">乘客姓名</td>  <td width="200" style="display: none;">证件号</td>  <td width="200">票号</td></tr>');
			 for(var i=0;i<passList.length;i++){
			    $('#per tbody').append('<tr>' +
									'<td>' + passList[i].name + '</td>' + 
									'<td style="display: none;">' + passList[i].ni + '</td>' + 
									'<td><input type="text" name="ticketNumber"  value="' + ticketsList[i] + '"  class="text ui-widget-content ui-corner-all" /></td>' +
									'<input type="hidden" name="pId"  value="' + passList[i].name + '" />'+
									'</tr>'); 
			 }
			   
			 
			 });
	}
  }	
	
 //取消出票
 function showDiv8(oId,tranType,status){
	  $('#oId8').val(oId);
	  $('#tranType8').val(tranType);
	 // $('#groupId8').val(groupId);
	  $('#status8').val(status);
	  $('#dialog8').dialog('open');
	   $('#dialog8').draggable({cancle: 'form'}); 
	 
}	
	
  //审核退废
 function showDiv3(oId,tranType,groupId){
	  $('#oId3').val(oId);
	  $('#tranType3').val(tranType);
	  $('#groupId3').val(groupId);
	  $('#dialog3').dialog('open');
	  $('#dialog3').draggable({cancle: 'form'}); 
	  
	  $('#airOrderNo3').val('');
	  $('#selTuiPercent3').attr('disabled','');
	    
	  var passNum=$('#passengersCountTemp3'+oId).val();
	 if(passNum!=null&&passNum!=""){
	   $('#passengersCount3').val(passNum);//设置新人数
	 }else{
	    $('#passengersCount3').val(0);//设置新人数
	 }
	 //alert("passNum:"+passNum);
	
	 if(tranType==4){
	 $('#selTuiPercent3').attr('disabled','disabled');
	 }
		 airticketOrderBiz.getDrawedAirticketOrderByGroupId(groupId,2,function(ao){
		   	   var ta= ao.totalAmount;
			   if(ta!=null){
				    $('#TmptotalAmount3').val(ta);
				   var oldPassNum= $('#oldPassengersCount3').val(ao.passengersCount);//设置原来人数
				   // alert("----oldPassNum:"+oldPassNum.val());
			    }
			    if(ao.airOrderNo!=null){
			     	$('#airOrderNo3').val(ao.airOrderNo);
			    }

		   		 //设置平台
			  	if(ao.account!=null){	  
			  		//alert(" order account is not null..."); 
				   var  platform_Id= document.getElementById("platform_Id3");
				     platform_Id.options.length=0;
				     $('#platform_Id3').attr("disabled","disabled");
				     option = new Option(ao.platform.name,ao.platform.id);
					 platform_Id.options.add(option);
					 
					 var  company_Id= document.getElementById("company_Id3");
				     company_Id.options.length=0;
				     $('#company_Id3').attr("disabled","disabled");
				     option2 = new Option(ao.company.name,ao.company.id);
					 company_Id.options.add(option2);
					 
					  var  account_Id= document.getElementById("account_Id3");
				     account_Id.options.length=0;
				     $('#account_Id3').attr("disabled","disabled");
				     option3 = new Option(ao.account.name,ao.account.id);
					 account_Id.options.add(option3);
			  }  
		 });
	}

  	 //审核 验证 showDiv3
	function submitForm3(){
	
	var totalAmount=  $('#totalAmount3').val();
	totalAmount=  $('#totalAmount3').val($.trim(totalAmount));
	
	var handlingCharge=  $('#handlingCharge3').val();
	handlingCharge=  $('#handlingCharge3').val($.trim(handlingCharge));

	$('#form3').submit();
	  
	}

  //审核
 function showDiv7(oId,tranType,groupId){

	  $('#oId7').val(oId);
	  $('#tranType7').val(tranType);
	  $('#groupId7').val(groupId);
	  $('#dialog7').dialog('open');
	  $('#airOrderNo7').val('');
	  $('#selTuiPercent7').attr('disabled','');
	  
	  var passNum=$('#passengersCountTemp7'+oId).val();
	 if(passNum!=null&&passNum!=""){
	   $('#passengersCount7').val(passNum);//设置新人数
	 }else{
	    $('#passengersCount7').val(0);//设置新人数
	 }
	 // alert(passNum);
	  
	 if(tranType==4){
	 $('#selTuiPercent7').attr('disabled','disabled');
	 }
	 airticketOrderBiz.getDrawedAirticketOrderByGroupId(groupId,1,function(ao){
	    var ta= ao.totalAmount;
	   if(ta!=null){
	    //alert(ta);
	    $('#TmptotalAmount7').val(ta);
	     var oldPassNum= $('#oldPassengersCount7').val(ao.passengersCount);//设置原来人数
	    }
	    if(ao.airOrderNo!=null){
	     $('#airOrderNo7').val(ao.airOrderNo);
	    }
	    
	    //设置平台
	  if(ao.account!=null){
	   
	   var  platform_Id= document.getElementById("platform_Id7");
	     platform_Id.options.length=0;
	     $('#platform_Id7').attr("disabled","disabled");
	     option = new Option(ao.platform.name,ao.platform.id);
		 platform_Id.options.add(option);
		 
		 var  company_Id= document.getElementById("company_Id7");
	     company_Id.options.length=0;
	     $('#company_Id7').attr("disabled","disabled");
	     option2 = new Option(ao.company.name,ao.company.id);
		 company_Id.options.add(option2);
		 
		  var  account_Id= document.getElementById("account_Id7");
	     account_Id.options.length=0;
	     $('#account_Id7').attr("disabled","disabled");
	     option3 = new Option(ao.account.name,ao.account.id);
		 account_Id.options.add(option3);
	  } 
	 });
	 
	}
	

   //审核 验证 showDiv7
	function submitForm7(){
	
	var totalAmount=  $('#totalAmount7').val();
	totalAmount=  $('#totalAmount7').val($.trim(totalAmount));
	
	var handlingCharge=  $('#handlingCharge7').val();
	handlingCharge=  $('#handlingCharge7').val($.trim(handlingCharge));

	$('#form7').submit();
	  
	}
	
	 //审核(外部)
 function showDiv13(oId,tranType,groupId){

	  $('#oId13').val(oId);
	  $('#tranType13').val(tranType);
	  $('#groupId13').val(groupId);
	  $('#dialog13').dialog('open');
	   $('#dialog13').draggable({cancle: 'form'}); 

	}
	 //审核(外部)
 function showDiv12(oId,tranType,groupId){

	  $('#oId12').val(oId);
	  $('#tranType12').val(tranType);
	  $('#groupId12').val(groupId);
	  $('#dialog12').dialog('open');
	   $('#dialog12').draggable({cancle: 'form'}); 
	
	    //设置下拉框  平台初始值 默认选中
	    var tmpPlatformValue=$("#tmpPlatformId12"+oId).val();
	    var tmpCompanyValue=$("#tmpCompanyId12"+oId).val();  	
	     var tmpAccountValue=$("#tmpAccountId12"+oId).val(); 
	     if(tmpPlatformValue!=null&&tmpPlatformValue!=""){	
	     
	     loadPlatListSelected('platform_Id12','company_Id12','account_Id12',tmpPlatformValue,tmpCompanyValue,tmpAccountValue);
	     }else{
	     
	      loadPlatList('platform_Id12','company_Id12','account_Id12');
	     }
	   
	   
	//var  TmptotalAmount3=$('#TmptotalAmount3');
	/* airticketOrderBiz.getDrawedAirticketOrderByGroupId(groupId,2,function(ao){
	    var ta= ao.totalAmount;
	   if(ta!=null){
	    $('#TmptotalAmount3').val(ta);
	    //alert(ta);
	    }
	 });*/
	}

//确认收款
 function showDiv4(oId,suPnr,groupId){
      var actualAmountTemp4=$('#actualAmountTemp4'+oId).val();
       
      if(actualAmountTemp4!=null){
        $('#actualAmount4').val(actualAmountTemp4);
      }
	  $('#oId4').val(oId);
	  $('#tranType4').val(suPnr);
	  $('#groupId').val(groupId);
	  $('#dialog4').dialog('open');
	   $('#dialog4').draggable({cancle: 'form'}); 
	  
	   var today = new Date();
	   var timeNow= showLocale(today);
	   $('#optTime4').val(timeNow); 
	}
	
	//验证  showDiv4	
	function submitForm4(){
	
	  var re=/^([1-9][0-9]*|0)(\.[0-9]{0,3})?$/;
	   var actualAmount= $('#actualAmount4').val();
       $('#actualAmount4').val($.trim(actualAmount));
       var optTime=$('#optTime4').val();
       
       if(optTime==null||optTime==''){
         alert("请选择日期！");
         
       }else if(!re.test(actualAmount)||actualAmount==""){
           alert("请正确填写金额！");
       }else{
        $('#form4').submit();  
       }
	   
	}
	
//申请改签
 function showDiv5(oId,suPnr,groupId){

	  $('#oId5').val(oId);
	  $('#tranType5').val(suPnr);
	  $('#groupId5').val(groupId);
	  $('#dialog5').dialog('open');
	   $('#dialog5').draggable({cancle: 'form'}); 
	  var TmpFromPCAccount5=$('#TmpFromPCAccount5').val();
	   
	   	//设置下拉框  平台初始值 默认选中
	    var tmpPlatformValue=$("#tmpPlatformId5"+oId).val();
	    var tmpCompanyValue=$("#tmpCompanyId5"+oId).val();  	
	     var tmpAccountValue=$("#tmpAccountId5"+oId).val(); 
	     if(tmpPlatformValue!=null&&tmpPlatformValue!=""){	
	     
	     //loadPlatListSelected('platform_Id5','company_Id5','account_Id5',tmpPlatformValue,tmpCompanyValue,tmpAccountValue);
	     loadPlatListSelectedByType('platform_Id5','company_Id5','account_Id5',tmpPlatformValue,tmpCompanyValue,tmpAccountValue,'2');
	     }else{
	     
	     // loadPlatList('platform_Id5','company_Id5','account_Id5');
	     loadPlatListByType('platform_Id5','company_Id5','account_Id5','2');
	     } 

	 
	}
	
	//申请改签(外部)
 function showDiv14(oId,suPnr,groupId){

	  $('#oId14').val(oId);
	  $('#tranType14').val(suPnr);
	  $('#groupId14').val(groupId);
	  $('#dialog14').dialog('open');
	   $('#dialog14').draggable({cancle: 'form'}); 
       //  loadPlatList('platform_Id14','company_Id14','account_Id14');
	    //设置下拉框  平台初始值 默认选中
	    var tmpPlatformValue=$("#tmpPlatformId14"+oId).val();
	    var tmpCompanyValue=$("#tmpCompanyId14"+oId).val();  	
	     var tmpAccountValue=$("#tmpAccountId14"+oId).val(); 
	     if(tmpPlatformValue!=null&&tmpPlatformValue!=""){	
	     
	     loadPlatListSelected('platform_Id14','company_Id14','account_Id14',tmpPlatformValue,tmpCompanyValue,tmpAccountValue);
	     }else{
	     
	      loadPlatList('platform_Id14','company_Id14','account_Id14');
	     }
	 
	}
	
	//申请改签
 function showDiv6(oId,suPnr,groupId){

	  $('#oId6').val(oId);
	  $('#tranType6').val(suPnr);
	  $('#groupId6').val(groupId);
	  $('#dialog6').dialog('open');
	   $('#dialog6').draggable({cancle: 'form'}); 
	 
	 var platformName=$('#platformName'+oId).val();
	 var companyName=$('#companyName'+oId).val();
	 var accountName=$('#accountName'+oId).val();
	 
	  var platformId= document.getElementById('platformId6');
	  platformId.options.length=0;
	  option = new Option(platformName,'');
	  platformId.options.add(option);
	  
	  var companyId= document.getElementById('companyId6');
	  companyId.options.length=0;
	  option2 = new Option(companyName,'');
	  companyId.options.add(option2);
	  
	  var accountId= document.getElementById('accountId6');
	  accountId.options.length=0;
	  option3 = new Option(accountName,'');
	  accountId.options.add(option3);
	 
	 }
	function submitForm6(){
	  $('#totalAmount6').val(0);
	 if(confirm("确定免费改签？")){
	  $('#form6').submit();
	 }
	
	}
		
	//设置退票原因		
	function submitForm8(){
	   
	    var  rbtnReason= $("input[name='rbtnReason']:checked").val();
	    var  rbtnType= $("input[name='rbtnType']:checked").val();
        var  cause=$("#cause").val(); 
        $("input[name='memo']").val(rbtnType+"/"+rbtnReason+"/"+cause);
	    return true;
	}

//利润计算
function calculationLiren(tmpTotalAmount,totalAmount,liren){	
	
	var tmpTa=$("#"+tmpTotalAmount).val();
	var ta=$("#"+totalAmount).val();
	var lr=$("#"+liren);
	
	//alert(tmpTotalAmount+" value:"+tmpTa+"--"+totalAmount+" value:"+ta+"--"+liren+" value:"+lr); 
	
	 if(tmpTa!=null&&ta!=null){
	   var count=tmpTa-ta;
	 
	 // count=Math.round(count*100)/100;
	  
	  	count= count.toString().replace(/^(\d+\.\d{2})\d*$/,"$1");	  
	    count=getShowDecimal(count,2);
	   
	   lr.val(count);
	 }
	
}
	
		//-------获取规定小数位数
	function getShowDecimal(value,decimalLen){  
	//alert(value);
     if(value!=null&&value!=''){    
           var decimalIndex=value.indexOf('.');    
           if(decimalIndex=='-1'){    
              return value;    
           }else{               	  
              var decimalPart=value.substring(decimalIndex+1,value.length);    
             
              if(decimalPart.length>decimalLen){    
              	//alert(value);
              	 value=value.substring(0,decimalIndex+decimalLen+1);
              	 //alert("2-"+value);
                 return value;    
              }else{    
                 return value;    
              }    
            }    
        }else{
        	return '0';
        }        
	}
	
	
	//备注
	function showDiv11(oId){
	  
	  $('#oId11').val(oId);
	  var  memo=$('#memo'+oId).val()
	  $('#memo11').val(memo);
	  $('#dialog11').dialog('open');
	  $('#dialog11').draggable({cancle: 'form'}); 
	}
	
	//退票客规	
	function selTuiPercent_onchange() {	
		//alert("selTuiPercent_onchange-----");
	    var oIdValue=$('#oId3').val();
	   // alert("oIdValue:"+oIdValue);
	    var ticketPrice=$('#ticketPrice'+oIdValue).val();//票面价
	    var handlingCharge=$('#handlingCharge3');//手续费
	    var selTuiPercent=$('#selTuiPercent3').val();//客规    
	    var passengerNum=$('#passengersCount3').val();//人数
	    var oldPassengerNum=$('#oldPassengersCount3').val();//原来人数
	  // alert(passengerNum);
	   // alert(oldPassengerNum);
	    if(passengerNum==null){
	      passengerNum=1;
	    }
	   if(ticketPrice!=null){ 
	    // alert(ticketPrice+'---'+selTuiPercent);
	    var tgqFee = ticketPrice * selTuiPercent / 100;//手续费计算=票面价*客规*退费人数
	   
	     tgqFee = tgqFee * Math.abs(passengerNum);
	     
	     handlingCharge.val(tgqFee);
	  
	  
	  var TmptotalAmount=$('#TmptotalAmount3').val();
      var totalTicketPrice=$('#totalAmount3');//
    if (TmptotalAmount * 1 > 0) {
        var receiveAmount = (TmptotalAmount/oldPassengerNum*passengerNum) - tgqFee;//应收金额=(卖出金额/原来人数*退费人数)-手续费
       //  alert(TmptotalAmount+'---'+tgqFee);
        
        var totalTicketPriceTemp= Math.round(receiveAmount * 100) / 100;
       // totalTicketPriceTemp= totalTicketPriceTemp.toString().replace(/^(\d+\.\d{2})\d*$/,"$1");//保留2位小数
         totalTicketPrice.val(totalTicketPriceTemp);
       // totalTicketPrice.val(Math.round(receiveAmount * 100) / 100);
    } 
    }
	}	
	
		//客规	
	function selTuiPercent_onchange2() {
	
	    var oIdValue=$('#oId7').val();
	    var ticketPrice=$('#ticketPrice'+oIdValue).val();//票面价
	    var handlingCharge=$('#handlingCharge7');//手续费
	    var selTuiPercent=$('#selTuiPercent7').val();//客规
	    var passengerNum=$('#passengersCount7').val();//人数
	     var oldPassengerNum=$('#oldPassengersCount7').val();//原来人数
	    if(passengerNum==null){
	      passengerNum=1;
	    }
	    if(oldPassengerNum==null){
	    oldPassengerNum=1;
	    }
	   if(ticketPrice!=null){ 
	   //  alert(ticketPrice+'---'+selTuiPercent);
	    var tgqFee = ticketPrice * selTuiPercent / 100;//手续费计算=票面价*客规*退费人数
	   
	     tgqFee = tgqFee * Math.abs(passengerNum);
	     
	     handlingCharge.val(tgqFee);
	     
	  var TmptotalAmount=$('#TmptotalAmount7').val();
      var totalTicketPrice=$('#totalAmount7');
     
    if (TmptotalAmount * 1 > 0) {
    
    //    var receiveAmount = TmptotalAmount - tgqFee;
         var receiveAmount = (TmptotalAmount/oldPassengerNum*passengerNum) - tgqFee;//应收金额=(卖出金额/原来人数*退费人数)-手续费
        // alert(TmptotalAmount+'---'+tgqFee);
       // totalTicketPrice.val(Math.round(receiveAmount * 100) / 100);
       
        var totalTicketPriceTemp= Math.round(receiveAmount * 100) / 100;
        //totalTicketPriceTemp= totalTicketPriceTemp.toString().replace(/^(\d+\.\d{2})\d*$/,"$1");//保留2位小数
        totalTicketPrice.val(totalTicketPriceTemp); 
    } 
   }
	}
	
	//验证出票 showDiv2
function submitForm2(){
	
	var check=true;
   var from2= document.getElementById("form2");
   var ticketNumbers=from2.ticketNumber;
 //  alert(from2.ticketNumber.length)
  for(var i=0;i<ticketNumbers.length;i++){
     
  for(var j=i+1;j<ticketNumbers.length;j++){
    //   alert(ticketNumbers[i].value+"----"+ticketNumbers[j].value);
       
       if (ticketNumbers[i].value!=""&& ticketNumbers[j].value!="") {
        
       if(ticketNumbers[i].value==ticketNumbers[j].value){
          
           alert("票号不能重复！");
           return false;
           check=false;
        }
     }
    }
     
  }
  if(check){
  $('#form2').submit();
  }
}	
package com.fdays.tsms.airticket.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.fdays.tsms.airticket.AirticketOrderListForm;
import com.fdays.tsms.airticket.TeamAirticketOrderReport;
import com.fdays.tsms.airticket.biz.ReportsBiz;
import com.fdays.tsms.transaction.Account;
import com.fdays.tsms.transaction.PlatComAccountStore;
import com.fdays.tsms.transaction.StatementListForm;
import com.fdays.tsms.transaction.biz.PaymentToolBiz;
import com.fdays.tsms.transaction.biz.StatementBiz;
import com.neza.base.BaseAction;
import com.neza.base.DownLoadFile;
import com.neza.exception.AppException;
import com.neza.tool.DateUtil;
import com.neza.utility.FileUtil;

public class ReportsListAction extends BaseAction{
	public ReportsBiz reportsBiz;
	public StatementBiz statementBiz;
	public PaymentToolBiz paymentToolBiz;
    
	/***************************************************************************
	 * 下载销售报表  sc
	 **************************************************************************/
    public ActionForward downLoadsaleReports(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		AirticketOrderListForm ulf = (AirticketOrderListForm) form;
		//ulf.setMoreStatus("5,6");
		ulf.setMoreStatus("5");
		if(ulf!=null){
			
			StringBuffer pIds=new StringBuffer();
			StringBuffer aIds=new StringBuffer();
			String[] platformIds=request.getParameterValues("platformId");
			if(platformIds!=null){
			for (int i = 0; i < platformIds.length; i++) {
				pIds.append(platformIds[i]);
				if(i<platformIds.length-1){
			    pIds.append(",");
				}
			}
			}
			String[] accountIds=request.getParameterValues("accountId");
			if(accountIds!=null){
		    for (int j = 0; j < accountIds.length; j++) {
		    	aIds.append(accountIds[j]);
		    	if(j<accountIds.length-1){
		    		aIds.append(",");
		    	}
			} 
			}
		    System.out.println("platformIds=======>"+pIds);
		    System.out.println("accountIds=======>"+aIds);
		    ulf.setPlatformIds(pIds.toString());
		    ulf.setAccountIds(aIds.toString());
		    ulf.setPerPageNum(10000);
			ArrayList<ArrayList<Object>> lists = reportsBiz.downLoadsaleReports(ulf);
			String outFileName = DateUtil.getDateString("yyyyMMddhhmmss") + ".csv";
			String outText = FileUtil.createCSVFile(lists);
			try
			{
				outText = new String(outText.getBytes("GBK"));
			}
			catch (Exception ex)
			{
	
			}
			DownLoadFile df = new DownLoadFile();
			df.performTask(response, outText, outFileName, "GBK");
			return null;
		}else{
			request.getSession().invalidate();
			return mapping.findForward("exit");
		}
	}
    
	/***************************************************************************
	 * 下载退废报表  sc
	 **************************************************************************/
    public ActionForward downLoadRetireReports(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		AirticketOrderListForm ulf = (AirticketOrderListForm) form;
		ulf.setMoreStatus("6,10,16,22,23,32,33");
		if(ulf!=null){			
			StringBuffer pIds=new StringBuffer();
			StringBuffer aIds=new StringBuffer();
			String[] platformIds=request.getParameterValues("platformId");
			if(platformIds!=null){
				for (int i = 0; i < platformIds.length; i++) {
					pIds.append(platformIds[i]);
					if(i<platformIds.length-1){
				    pIds.append(",");
					}
				}
			}
			String[] accountIds=request.getParameterValues("accountId");
			if(accountIds!=null){
			    for (int j = 0; j < accountIds.length; j++) {
			    	aIds.append(accountIds[j]);
			    	if(j<accountIds.length-1){
			    		aIds.append(",");
			    	}
				} 
			}
		    System.out.println("platformIds=======>"+pIds);
		    System.out.println("accountIds=======>"+aIds);
		    ulf.setPlatformIds(pIds.toString());
		    ulf.setAccountIds(aIds.toString());
		    ulf.setPerPageNum(10000);
			ArrayList<ArrayList<Object>> lists = reportsBiz.downLoadRetireReports(ulf);
			String outFileName = DateUtil.getDateString("yyyyMMddhhmmss") + ".csv";
			String outText = FileUtil.createCSVFile(lists);
			try{
				outText = new String(outText.getBytes("GBK"));
			}
			catch (Exception ex){
				ex.printStackTrace();
			}
			DownLoadFile df = new DownLoadFile();
			df.performTask(response, outText, outFileName, "GBK");
			return null;
		}else{
			request.getSession().invalidate();
			return mapping.findForward("exit");
		}
	}
	
    
    
	/***************************************************************************
	 * 初始化销售报表  sc PlatComAccountStore
	 **************************************************************************/
    public ActionForward loadSaleReports(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		String forwardPage = "";		
		try {			
			List toAccountList=paymentToolBiz.getPaymentToolListByType(Account.tran_type_2);////买出账户
			List formAccountList=paymentToolBiz.getPaymentToolListByType(Account.tran_type_1);////买入账户
			request.setAttribute("toPlatformList", PlatComAccountStore.getToPlatform());//买出平台
			request.setAttribute("formPlatformListByBSP", PlatComAccountStore.getFormPlatformByBSP());//买入平台(平台)
			request.setAttribute("formPlatformListByB2B", PlatComAccountStore.getFormPlatformByB2B());//买入平台(B2B网电)
			
			request.setAttribute("toAccountList", toAccountList);//买出账户
			request.setAttribute("formAccountList",formAccountList);// 买入账户
		} catch (Exception ex) {			
			ex.printStackTrace();
		}
		forwardPage = "saleReports";
		return (mapping.findForward(forwardPage));
	}   
    

	/***************************************************************************
	 * 初始化退废报表  sc 
	 **************************************************************************/
    public ActionForward retireReports(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		String forwardPage = "";		
		try {			
			List toAccountList=paymentToolBiz.getPaymentToolListByType(Account.tran_type_2);////买出账户
			List formAccountList=paymentToolBiz.getPaymentToolListByType(Account.tran_type_1);////买入账户
			request.setAttribute("toPlatformList", PlatComAccountStore.getToPlatform());//买出平台
			request.setAttribute("formPlatformListByBSP", PlatComAccountStore.getFormPlatformByBSP());//买入平台(平台)
			request.setAttribute("formPlatformListByB2B", PlatComAccountStore.getFormPlatformByB2B());//买入平台(B2B网电)
		
			request.setAttribute("toAccountList", toAccountList);//买出账户
			request.setAttribute("formAccountList",formAccountList);// 买入账户
		} catch (Exception ex) {			
		
		}
		forwardPage = "retireReports";
		return (mapping.findForward(forwardPage));
	}
	//银行卡付款统计
	 public ActionForward statementReports(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response)
				throws AppException {
			 String forwardPage = "";
			 StatementListForm  statementForm =(StatementListForm)form;
			 if(statementForm ==null)
			 {
				 statementForm = new StatementListForm();
			 }
			 try {
				statementForm.setList(statementBiz.getStatementList());
			} catch (Exception e) {
				statementForm.setList(new ArrayList());
			}
			forwardPage="statementReports";
			request.setAttribute("accountList", PlatComAccountStore.accountList);
			request.setAttribute("statementForm", statementForm);
			return mapping.findForward(forwardPage);
	 }
	
		 	//导出团队机票销售报表
			public ActionForward downloadTeamAirTicketOrder(ActionMapping mapping, ActionForm form,
					HttpServletRequest request, HttpServletResponse response)
					throws AppException {
					AirticketOrderListForm alf = (AirticketOrderListForm)form;
					if(alf!=null){
						List<TeamAirticketOrderReport> rePortlist=reportsBiz.getTeamAirticketOrderReport(alf);
						ArrayList<ArrayList<Object>> lists =reportsBiz.downloadTeamAirTicketOrder(alf,rePortlist) ;
						String outFileName = DateUtil.getDateString("yyyyMMddhhmmss") + ".csv";
						String outText = FileUtil.createCSVFile(lists);
						try
						{
							outText = new String(outText.getBytes("GB2312"));
						}
						catch (Exception ex){
							ex.printStackTrace();
						}
						DownLoadFile df = new DownLoadFile();
						df.performTask(response, outText, outFileName, "GB2312");
						return null;
					}else{
						request.getSession().invalidate();
						 return mapping.findForward("teamAirTicketOrder");
					}
			}
		 
			//导出团队未返代理费报表
			public ActionForward downloadTeamNotReturnProxy(ActionMapping mapping, ActionForm form,
					HttpServletRequest request, HttpServletResponse response)
					throws AppException {
				AirticketOrderListForm alf = (AirticketOrderListForm)form;
				if(alf!=null){
					List<TeamAirticketOrderReport> rePortlist=reportsBiz.getTeamNotReturnProxy(alf);
					ArrayList<ArrayList<Object>> lists =reportsBiz.downloadTeamNotReturnProxy(alf,rePortlist) ;
					String outFileName = DateUtil.getDateString("yyyyMMddhhmmss") + ".csv";
					String outText = FileUtil.createCSVFile(lists);
					try
					{
						outText = new String(outText.getBytes("GB2312"));
					}
					catch (Exception ex){
						ex.printStackTrace();
					}
					DownLoadFile df = new DownLoadFile();
					df.performTask(response, outText, outFileName, "GB2312");
					return null;
				}else{
					request.getSession().invalidate();
					 return mapping.findForward("teamNotReturnProxy");
				}
			}
			
			/***************************************************************************
			 *  原始销售报表 sc
			 **************************************************************************/
		    public ActionForward marketReports(ActionMapping mapping, ActionForm form,
					HttpServletRequest request, HttpServletResponse response)
					throws AppException {
				String forwardPage = "";
				AirticketOrderListForm ulf = (AirticketOrderListForm) form;
				if (ulf == null)
					ulf = new AirticketOrderListForm();

				try {
					ulf.setList(reportsBiz.marketReportsList(ulf));
				} catch (Exception ex) {
					ulf.setList(new ArrayList());
				}
				request.setAttribute("ulf", ulf);
				forwardPage = "marketReports";
				return (mapping.findForward(forwardPage));
			}
		   
			/***************************************************************************
			 * 原始销售报表下载  sc
			 **************************************************************************/
			public ActionForward downloadMarketReports(ActionMapping mapping, ActionForm form,
				    HttpServletRequest request, HttpServletResponse response)
				    throws AppException
				{
					AirticketOrderListForm ulf = (AirticketOrderListForm) form;
					if(ulf!=null){
						
						ArrayList<ArrayList<Object>> lists = reportsBiz.getMarketReportsList(ulf);
						String outFileName = DateUtil.getDateString("yyyyMMddhhmmss") + ".csv";
						String outText = FileUtil.createCSVFile(lists);
						try{
							outText = new String(outText.getBytes("UTF-8"));
						}catch (Exception ex){
							ex.printStackTrace();
						}
						DownLoadFile df = new DownLoadFile();
						df.performTask(response, outText, outFileName, "GBK");
						return null;
					}else{
						request.getSession().invalidate();
						return mapping.findForward("exit");
					}
				}
			
			

	public void setReportsBiz(ReportsBiz reportsBiz) {
		this.reportsBiz = reportsBiz;
	}

	public void setStatementBiz(StatementBiz statementBiz) {
		this.statementBiz = statementBiz;
	}

	public void setPaymentToolBiz(PaymentToolBiz paymentToolBiz) {
		this.paymentToolBiz = paymentToolBiz;
	}
	
	

}

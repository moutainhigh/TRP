package com.fdays.tsms.transaction.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.fdays.tsms.base.Constant;
import com.fdays.tsms.transaction.Platform;
import com.fdays.tsms.transaction.PlatformCompare;
import com.fdays.tsms.transaction.PlatformReportIndex;
import com.fdays.tsms.transaction.biz.PlatformBiz;
import com.fdays.tsms.transaction.biz.PlatformCompareBiz;
import com.fdays.tsms.transaction.biz.PlatformReportIndexBiz;
import com.neza.base.BaseAction;
import com.neza.base.Inform;
import com.neza.exception.AppException;

public class PlatformCompareAction extends BaseAction {
	private PlatformBiz platformBiz;
	private PlatformCompareBiz platformCompareBiz;
	private PlatformReportIndexBiz platformReportIndexBiz;
	
	//进入平台报表对比
	public ActionForward platformCompareManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {		
		PlatformCompare platformCompare=(PlatformCompare)request.getSession().getAttribute("platformCompare");
		
		if(platformCompare==null){
			platformCompare = new PlatformCompare();			
		}		
		platformCompare.setThisAction("insertPlatformReport");
		
		request.getSession().setAttribute("tempCompare",platformCompare);
		
		List<Platform> platformList = platformBiz.getValidPlatformList();
//		request.setAttribute("platformList", platformList);
		request.getSession().setAttribute("platformList", platformList);
		
		String forwardPage = "platformCompareManage";
		return (mapping.findForward(forwardPage));
	}
	
	/**
	 * 导入平台报表
	 */
	public ActionForward insertPlatformReport(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws AppException {

		String forwardPage = "";
		PlatformCompare platformCompare = (PlatformCompare) form;
		Inform inf = new Inform();
		try {
			Long platformId = Constant.toLong(platformCompare.getPlatformId());
			Long compareType = Constant.toLong(platformCompare.getType());
			
			PlatformReportIndex reportIndex = platformReportIndexBiz.getReportIndexByPlatformIdType(platformId, compareType);
			
			if(reportIndex==null){
				inf.setMessage("请确认该平台报表已设置字段索引");
				inf.setBack(true);
			}else{
				request = platformCompareBiz.insertPlatformReport(platformCompare,reportIndex,
						request);
				
				request=queryOrderCompareList(platformCompare, request);

				List<Platform> platformList = platformBiz.getValidPlatformList();
				request.setAttribute("platformList", platformList);
				
				request.getSession().setAttribute("tempCompare", platformCompare);
				
				return (mapping.findForward("platformCompareManage"));
			}
		} catch (Exception ex) {
			inf.setMessage("增加平台对比记录出错！错误信息是：" + ex.getMessage());
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}

	/**
	 * 对比平台报表
	 */
	public ActionForward comparePlatformReport(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws AppException {
		String forwardPage = "";
		PlatformCompare platformCompare = (PlatformCompare) form;
		Inform inf = new Inform();
		try {
			long a = System.currentTimeMillis();	
			
			String flag=platformCompareBiz.comparePlatformReport(request);

			List<Platform> platformList = platformBiz.getValidPlatformList();
			request.setAttribute("platformList", platformList);
			
			long b = System.currentTimeMillis();
			System.out.println(" over comparePlatformReport  time:" + ((b - a) / 1000) + "s");

			request.getSession().setAttribute("tempCompare", platformCompare);
			
			return (mapping.findForward("platformCompareManage"));
		} catch (Exception ex) {
			inf.setMessage("平台报表对比出错！错误信息是：" + ex.getMessage());
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}
	
	/**
	 * 更新系统报表（平台）
	 */
	public ActionForward updateOrderCompareList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws AppException {
		PlatformCompare platformCompare = (PlatformCompare) form;
		
		String forwardPage = "";		
		Inform inf = new Inform();
		try {
			request=queryOrderCompareList(platformCompare,request);

			List<Platform> platformList = platformBiz.getValidPlatformList();
			request.setAttribute("platformList", platformList);

			request.getSession().setAttribute("tempCompare", platformCompare);
			
			return (mapping.findForward("platformCompareManage"));			
		} catch (Exception ex) {
			inf.setMessage("更新系统报表出错！错误信息是：" + ex.getMessage());
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}
	
	private HttpServletRequest queryOrderCompareList(PlatformCompare platformCompare,HttpServletRequest request)throws AppException{
		List<PlatformCompare> orderCompareList = platformCompareBiz.getOrderCompareList(platformCompare);
		request.getSession().setAttribute("orderCompareList", orderCompareList);
		request.getSession().setAttribute("orderCompareListSize", orderCompareList.size());		 
		return request;
	}


	public ActionForward clearPlatformCompare(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws AppException {
		try {
			List<Platform> platformList = platformBiz.getValidPlatformList();
			request.setAttribute("platformList", platformList);

			PlatformCompare platformCompare=new PlatformCompare();
			request.getSession().setAttribute("tempCompare", platformCompare);
			
			request.getSession().setAttribute("problemCompareList1", new ArrayList<PlatformCompare>());
			request.getSession().setAttribute("problemCompareList1Size",new Long(0));		 
			
			request.getSession().setAttribute("problemCompareList2", new ArrayList<PlatformCompare>());
			request.getSession().setAttribute("problemCompareList2Size",new Long(0));		
			
			request.getSession().setAttribute("reportCompareList",  new ArrayList<PlatformCompare>());
			request.getSession().setAttribute("reportCompareListSize",new Long(0));		 
			
			request.getSession().setAttribute("orderCompareList", new ArrayList<PlatformCompare>());
			request.getSession().setAttribute("orderCompareListSize",new Long(0));			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return (mapping.findForward("platformCompareManage"));		
	}
	public void setPlatformCompareBiz(PlatformCompareBiz platformCompareBiz) {
		this.platformCompareBiz = platformCompareBiz;
	}

	public void setPlatformBiz(PlatformBiz platformBiz) {
		this.platformBiz = platformBiz;
	}

	public void setPlatformReportIndexBiz(
			PlatformReportIndexBiz platformReportIndexBiz) {
		this.platformReportIndexBiz = platformReportIndexBiz;
	}

	
}
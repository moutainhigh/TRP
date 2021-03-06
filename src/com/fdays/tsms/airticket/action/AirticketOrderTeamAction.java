package com.fdays.tsms.airticket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionRedirect;
import com.fdays.tsms.airticket.AirticketOrder;
import com.fdays.tsms.airticket.biz.AirticketOrderBiz;
import com.neza.base.BaseAction;
import com.neza.base.Inform;
import com.neza.exception.AppException;

public class AirticketOrderTeamAction extends BaseAction {
	private AirticketOrderBiz airticketOrderBiz;

	/**
	 * 团队--根据现有销售订单,创建退票订单
	 */
	public ActionForward createTeamRefundBySale(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws AppException {
		String forwardPage = "";
		AirticketOrder orderForm = (AirticketOrder) form;
		Inform inf = new Inform();
		Long id = orderForm.getId();
		try {
			if (id != null && (!(id.equals("")))) {
				long newOrderid=airticketOrderBiz.createTeamRefundBySale(orderForm, request);

				return new ActionRedirect("/airticket/listAirTicketOrder.do?thisAction=editTeamOrder&id="+newOrderid);
			} else {
				inf.setMessage("订单ID不能为空");
				inf.setBack(true);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			inf.setMessage("创建退票订单异常");
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}
	
	// 团队解锁
	public ActionForward unlock(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request, HttpServletResponse response)
	    throws AppException
	{
		AirticketOrder orderForm = (AirticketOrder) form;
	
		String forwardPage = "";
		Inform inf = new Inform();
		long airticketOrderId = orderForm.getId();
		try
		{
			if (airticketOrderId > 0)
			{
				airticketOrderBiz.unlockTeam(orderForm,request);
				return redirectManagePage(request);
			}
			else
			{
				inf.setMessage("订单ID不能为空");
				inf.setBack(true);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			inf.setMessage("确认支付异常");
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}
	
	public ActionForward lock(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request, HttpServletResponse response)
	    throws AppException
	{
		AirticketOrder orderForm = (AirticketOrder) form;
	
		String forwardPage = "";
		Inform inf = new Inform();
		long airticketOrderId = orderForm.getId();
		try
		{
			if (airticketOrderId > 0)
			{
				airticketOrderBiz.lockTeam(orderForm,request);
				return redirectManagePage(request);
			}
			else
			{
				inf.setMessage("订单ID不能为空");
				inf.setBack(true);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			inf.setMessage("确认支付异常");
			inf.setBack(true);
		}
		request.setAttribute("inf", inf);
		forwardPage = "inform";
		return (mapping.findForward(forwardPage));
	}
	public ActionForward redirectManagePage(HttpServletRequest request) {
		ActionRedirect redirect = new ActionRedirect(
				AirticketOrder.TeamManagePath);

		if (request.getSession().getAttribute("orderType") != null) {
			redirect.addParameter("orderType", request.getSession()
					.getAttribute("orderType"));
		}
		if (request.getSession().getAttribute("moreStatus") != null) {
			redirect.addParameter("moreStatus", request.getSession()
					.getAttribute("moreStatus"));
		}
		if (request.getSession().getAttribute("recentlyDay") != null) {
			redirect.addParameter("recentlyDay", request.getSession()
					.getAttribute("recentlyDay"));
		}
		return redirect;

	}

	public void setAirticketOrderBiz(AirticketOrderBiz airticketOrderBiz) {
		this.airticketOrderBiz = airticketOrderBiz;
	}
}

package com.fdays.tsms.transaction.biz;

import java.util.ArrayList;
import java.util.List;

import com.fdays.tsms.transaction.Account;
import com.fdays.tsms.transaction.AccountListForm;
import com.fdays.tsms.transaction.dao.AccountDAO;
import com.neza.exception.AppException;

public class AccountBizImp implements AccountBiz {
	private AccountDAO accountDAO;

	public List list(AccountListForm accountListForm) throws AppException {
		return accountDAO.list(accountListForm);
	}

	public long delete(long id) throws AppException {
		try {
			accountDAO.delete(id);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public long save(Account account) throws AppException {
		return accountDAO.save(account);
	}

	public long update(Account account) throws AppException {
		return accountDAO.update(account);
	}

	public Account getAccountById(long accountId) throws AppException {
		return accountDAO.getAccountById(accountId);
	}

	public List<Account> getAccountList() throws AppException {
		return accountDAO.getAccountList();
	}

	public List<Account> getValidAccountList() throws AppException {
		return accountDAO.getValidAccountList();
	}

	public List<Account> getValidAccountListByTranType(String tranType)
			throws AppException {
		return accountDAO.getValidAccountListByTranType(tranType);
	}

	// 根据外键支付工具id查询,(dwr)
	public List<Account> getAccountListByPaymentToolId(long paymentToolId) {
		return accountDAO.getAccountListByPaymentToolId(paymentToolId);
	}

	// 账号余额导出
	public ArrayList<ArrayList<Object>> getAccountBalanceList(
			AccountListForm alf) throws AppException {
		ArrayList<ArrayList<Object>> list_context = new ArrayList<ArrayList<Object>>();
		ArrayList<Object> list_title = new ArrayList<Object>();
		List list = accountDAO.list(alf);
		list_title.add("账号");
		list_title.add("余额");
		list_context.add(list_title);

		for (int i = 0; i < list.size(); i++) {
			Account account = (Account) list.get(i);
			ArrayList<Object> list_context_item = new ArrayList<Object>();
			list_context_item.add(account.getName());// 账号
			list_context_item.add(account.getTotalAmount());// 金额
			list_context.add(list_context_item);
		}
		return list_context;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

}

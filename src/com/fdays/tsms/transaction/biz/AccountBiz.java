package com.fdays.tsms.transaction.biz;

import java.util.ArrayList;
import java.util.List;
import com.fdays.tsms.transaction.Account;
import com.fdays.tsms.transaction.AccountListForm;
import com.neza.exception.AppException;

public interface AccountBiz {

	public List list(AccountListForm accountListForm) throws AppException;

	public long delete(long id) throws AppException;

	public long save(Account account) throws AppException;

	public long update(Account account) throws AppException;

	public Account getAccountById(long accountId) throws AppException;

	public List<Account> getAccountList() throws AppException;
	public List<Account> getValidAccountList() throws AppException;
	public List<Account> getValidAccountListByTranType(String tranType) throws AppException;

	// 根据外键支付工具id查询,(dwr)
	public List<Account> getAccountListByPaymentToolId(long paymentToolId);

	// 账号余额导出
	public ArrayList<ArrayList<Object>> getAccountBalanceList(
			AccountListForm alf) throws AppException;

}

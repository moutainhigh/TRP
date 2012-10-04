package com.fdays.tsms.user.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fdays.tsms.user.SysUser;
import com.fdays.tsms.user.UserListForm;
import com.neza.exception.AppException;

public interface UserBiz {
	public SysUser getCurrentUser(HttpServletRequest request)
			throws AppException;

	public SysUser getUserById(long id) throws AppException;

	public List getUsers(UserListForm ulf) throws AppException;

	public SysUser login(String userNo, String userPassword)
			throws AppException;

	public void saveUser(SysUser user) throws AppException;

	public long updateUserPassword(SysUser user) throws AppException;

	public long updateUserInfo(SysUser user) throws AppException;

	public long deleteUser(long id) throws AppException;

	public boolean hasSameNo(String userNo) throws AppException;

	public List getUsers() throws AppException;

	public SysUser getUserByNo(SysUser user) throws AppException;
public SysUser getUserByNo(String userNo) throws AppException;

	public int checkUser(SysUser user, String password) throws AppException;

	public SysUser getUserByName(String userName) throws AppException;
}

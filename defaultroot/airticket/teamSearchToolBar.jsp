﻿<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<div class="searchBar">
	<table cellpadding="0" cellspacing="0" border="0" class="searchPanel">
		<tr>
			<td>
				承运人:<html:text property="cyr" styleClass="colorblue2 p_5"
					style="width:50px;" />&nbsp;&nbsp;
				航班号:<html:text property="flightCode" styleClass="colorblue2 p_5"
					style="width:80px;" />
			</td>
			<td>
				订单号:<html:text property="orderNo" styleClass="colorblue2 p_5"
					style="width:120px;" ondblclick="this.value=''" title="订单号，流水号"/>
			</td>
			<td>
				航段:<html:text property="startPoint" styleClass="colorblue2 p_5"
					style="width:40px;" />-<html:text property="endPoint" styleClass="colorblue2 p_5"
					style="width:40px;" />
			</td>
			<td>
				操作人:<html:text property="sysName" styleClass="colorblue2 p_5"
					style="width:60px;" ondblclick="this.value=''"/>
			</td>
			<td>
			  排序:<html:select property="orderBy" styleClass="colorblue2 p_5"
					style="width:80px;">
					<html:option value="0">操作时间</html:option>
					<html:option value="1">创建时间</html:option>
				</html:select>
			</td>
			<td>
				类型:<html:select property="orderType" styleClass="colorblue2 p_5"
					style="width:90px;">
					<html:option value="">请选择</html:option>
					<html:option value="97">正常订单</html:option>
					<html:option value="98">退票订单</html:option>					
				</html:select>
			</td>
		</tr>
		<tr>
			<td>
				客户:<html:select property="agentNo" styleClass="colorblue2 p_5"
					style="width:200px;">
					<html:option value="">--请选择--</html:option>
					<c:forEach items="${agentList}" var="agent">
						<html:option value="${agent.id}">
							<c:out value="${agent.showName}" />
						</html:option>
					</c:forEach>
				</html:select>
			</td>
			<td>
				订票类型:<html:select property="drawer" styleClass="colorblue2 p_5"
					style="width:80px;">
					<html:option value="">请选择</html:option>
					<html:option value="B2B网电">B2B网电</html:option>
					<html:option value="B2C散客">B2C散客</html:option>
					<html:option value="倒票组">倒票组</html:option>
				</html:select>
			</td>
			<td>
				开始:<html:text property="startDate" styleClass="colorblue2 p_5"
					style="width:120px;" onfocus="WdatePicker({startDate:'%y-%M-%D 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"
					readonly="true" />
			</td>
			<td>
				结束:<html:text property="endDate" styleClass="colorblue2 p_5"
					style="width:120px;" onfocus="WdatePicker({startDate:'%y-%M-%D 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStar:true})"
					readonly="true" />
			</td>
			<td>				
				最近<html:text property="recentlyDay" styleId="recentlyDay" 	style="width:25px" maxlength="3" ondblclick="this.value=''" title="0,空格表示所有天"/>天
			</td>
			<td>
				<input type="submit" name="button" id="button" value="提交"
					class="submit greenBtn" />
			</td>
		</tr>
	</table>
	<hr />
</div>
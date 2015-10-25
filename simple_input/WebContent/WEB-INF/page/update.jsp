<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>卷内信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		div.tb_ud
		{
			//border: solid 1px;
			width: 15cm;
		}
	</style>
	<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/js/input.js" charset="utf-8"></script>
  </head>
  
  <body>	
  	<center>
  		  	<h1>卷内信息修改</h1>
  		  	<s:form action="dfxt_update.action" namespace="/" method="post">
  			<div class="tb_ud">
  			
	  		<table>
	  			<tr>
	  				<td><b>id:<label><s:property value="#session.rollFile.id"/></label></b></td>
	  				<td>
	  					<input type="text" name="rollFile.id" id="id" value="<s:property value="#session.rollFile.id"/>" style="display:none;">
	  				</td>
	  			</tr>
		  		<tr>
		  			<td>题名</td>
		  			<td><input type="text" name="rollFile.themeName" id="themeName" value="<s:property value="#session.rollFile.themeName"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;责任者</td>
		  			<td><input type="text" name="rollFile.responser" id="responser" value="<s:property value="#session.rollFile.responser"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>文件时间</td>
		  			<td><input type="text" name="rollFile.fileDate" id="fileDate" value="<s:property value="#session.rollFile.fileDate"/>"></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;页号</td>
		  			<td><input type="text" name="rollFile.pageNo" id="pageNo" value="<s:property value="#session.rollFile.pageNo"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>文件编号</td>
		  			<td><input type="text" name="rollFile.fileNo" id="fileNo" value="<s:property value="#session.rollFile.fileNo"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;顺序号</td>
		  			<td><input type="text" name="rollFile.no" id="no" value="<s:property value="#session.rollFile.no"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>目录号</td>
		  			<td><input type="text" name="rollFile.catalogNo" id="catalogNo" value="<s:property value="#session.rollFile.catalogNo"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;保管期限</td>
		  			<td><input type="text" name="rollFile.term" id="term" value="<s:property value="#session.rollFile.term"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>全宗号</td>
		  			<td><input type="text" name="rollFile.qzh" id="qzh" value="<s:property value="#session.rollFile.qzh"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;归档年度</td>
		  			<td><input type="text" name="rollFile.rollYear" id="rollYear" value="<s:property value="#session.rollFile.rollYear"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>档号</td>
		  			<td><input type="text" name="rollFile.archiveNo" id="archiveNo" value="<s:property value="#session.rollFile.archiveNo"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;分类号</td>
		  			<td><input type="text" name="rollFile.classNo" id="classNo" value="<s:property value="#session.rollFile.classNo"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>主题词</td>
		  			<td><input type="text" name="rollFile.keyWord" id="keyWord" value="<s:property value="#session.rollFile.keyWord"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;载体类型</td>
		  			<td><input type="text" name="rollFile.type" id="type" value="<s:property value="#session.rollFile.type"/>"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>密级</td>
		  			<td><input type="text" name="rollFile.secret" id="secret" value="<s:property value="#session.rollFile.secret"/>"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;备注</td>
		  			<td><input type="text" name="rollFile.rem" id="rem" value="<s:property value="#session.rollFile.rem"/>"/></td>
		  		</tr>
		  		<tr align="center">
		  			<td colspan="4">
		  				<input type="submit" value="提交">
		  				<input type="reset" value="重置">
		  				<a href="<%=path %>/index.jsp">返回</a>
		  			</td>
		  		</tr>
	  		</table>
	  		</div>  
	  		</s:form>		
	  		
	  		<s:if test="#session.update_msg!=null">
	  			<div style="color: red;"><s:property value="#session.update_msg"/></div>
	  		</s:if>
  	</center>
  </body>
</html>
		  		
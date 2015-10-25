<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文书录入</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="<%=path %>/css/ocr.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery.Jcrop.css">
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js" charset="utf-8"></script>
  	<script type="text/javascript" src="<%=path %>/js/input.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.Jcrop.js"></script>
  	<script type="text/javascript">
	//js获取项目根路径，如： http://localhost:8083/uimcardprj
	function getRootPath(){
	    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName);
	    
	}
	
		jQuery(function($){
			var jcrop_api;
			var image;
		    //图片总数量
			var image_count = "${fn:length(imgList)}";
			//临时变量，表示当前图片的索引
			var temp = 1;
			
			$('#photo').Jcrop({
		        //onChange:   showCoords,
		        onSelect:showCoords
			},function(){
				jcrop_api = this;	
			});
					
		    function showCoords(c)
		    {
		      $('#x').val(c.x);
		      $('#y').val(c.y);
		      $('#w').val(c.w);
		      $('#h').val(c.h);
				var x = document.getElementById("x").value;
				var y = document.getElementById("y").value;
				var w = document.getElementById("w").value;
				var h = document.getElementById("h").value;	
				var photoName;
				if(image==null){
					photoName = document.getElementById("image1").name;
				}else{
					photoName = image.name;
				}
				$.ajax({
					type:"post",
					url:getRootPath()+"/"+"input_crop.action",
					data:{
						x:x,
						y:y,
						w:w,
						h:h,
						photoName:photoName
					},
					dataType:"text",
					success:function(data){
						//alert("success");
						//$("valCode").val(data);
					}
				});
		    };
			
		    //显示图片
			$("a[id*='image']").click(function(e) {
				image = document.getElementById(this.id);
				jcrop_api.setImage(image.name);
				jcrop_api.setOptions({boxWidth:1000,boxHeight:1000,drawBorders:true});
				//点击之前，颜色还原
				image.style.color = "red";
				var prev_img = document.getElementById("image"+temp);
				prev_img.style.color = "black";
				temp = parseInt(image.text);
			});			
		    
			//按钮：上一张
			$("#bt_prev").click(function(){
				var prev_img = document.getElementById("image"+temp);
				prev_img.style.color = "black";
				
				if(temp>1){
					temp = temp-1;
					//下一张图片
					var prev_img = document.getElementById("image"+(temp+1));
					prev_img.style.color = "black";
					var photo = document.getElementById("image"+temp);
					photo.style.color = "red";
					jcrop_api.setImage(photo.name);
					jcrop_api.setOptions({boxWidth:1000,boxHeight:1000,drawBorders:true});
				}
			});
			//按钮：下一张
			$("#bt_next").click(function(){
				var prev_img = document.getElementById("image"+temp);
				prev_img.style.color = "black";
				
				if(temp<image_count){
					temp = temp+1;	
					//alert(temp);
					//上一张图片
					if(temp>1){
						var prev_img = document.getElementById("image"+(temp-1));
						prev_img.style.color = "black";
					}	
					var photo = document.getElementById("image"+temp);
					photo.style.color = "red";
					jcrop_api.setImage(photo.name);
					jcrop_api.setOptions({boxWidth:1000,boxHeight:1000,drawBorders:true});
				}
			});
		});
	</script>
  </head>
  
  <body>
		  	<table class="tb1"> 
		  		<tr>
		  			<td><b>案卷信息</b></td>
		  		</tr>
		  		<tr>
		  			<td height="">案卷档号</td>
		  			<td><input type="text" name="load_archiveNo" id="load_archiveNo" value="3468"/></td>
		  			<td><button type="button" name="bt_load" id="bt_load">载入L</button></td>
		  		</tr>
		  		<tr>
		  			<td>目录号</td><td><input type="text" name="" value=""/></td>
		  			<td>保管期限</td><td><input type="text" name="" value=""/></td>
		  		</tr>
		  		<tr>
		  			<td>载体类型</td><td><input type="text" name="" value=""/></td>
		  			<td>页&nbsp;&nbsp;&nbsp;&nbsp;数</td><td><input type="text" name="" value=""/></td>
		  		</tr>
		  		<tr>
		  			<td>组卷年度</td><td><input type="text" name="" value=""/></td>
		  			<td><input type="button" value="保&nbsp;&nbsp;&nbsp;存" onclick=""/></td>
		  		</tr>
		  		<tr>
		  			<td>影像路径</td>
		  			<td><input type="text" name="imgPath" id="imgPath" value="E:\中转站\中山图片\JPG\E30009102 印尼园项目\"></td>
		  		</tr>
		  	</table>
		  	
		  	
		  	<div class="grid">
		  	<b>卷内信息</b><br>
		  	<div class="grid1">
		  	<table id="t1" class="tb2" border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
			  		<tr>
			  			<td><b>序号</b></td>
			  			<td><b>题名</b></td>
			  			<td><b>责任者</b></td>
			  			<td><b>文件时间</b></td>
			  			<td><b>页号</b></td>
			  			<td><b>文件编号</b></td>
			  			<td><b>顺序号</b></td>
			  			<td><b>目录号</b></td>
			  			<td><b>保管期限</b></td>
			  			<td><b>全宗号</b></td>
			  			<td><b>归档年度</b></td>
			  			<td><b>档号</b></td>
			  			<td><b>分类号</b></td>
			  			<td><b>主题词</b></td>
			  			<td><b>录入人</b></td>
			  			<td><b>录入时间</b></td>
			  			<td><b>载体类型</b></td>
			  			<td><b>密级</b></td>
			  			<td><b>备注</b></td>
			  			<td><b>录入遍数标识</b></td>
			  			<td><b>用于状态控制的标识</b></td>
			  			<td><b>操作</b></td>
			  		</tr>
			  		<s:if test="#session.list!=null">
			  			<s:iterator value="#session.list" status="rfs">
			  				<tr>	
				  				<td><s:property value="id"/></td>
				  				<td><s:property value="themeName"/></td>
				  				<td><s:property value="responser"/></td>
				  				<td><s:property value="fileDate"/></td>
				  				<td><s:property value="pageNo"/></td>
				  				<td><s:property value="fileNo"/></td>
				  				<td><s:property value="no"/></td>
				  				<td><s:property value="catalogNo"/></td>
				  				<td><s:property value="term"/></td>
				  				<td><s:property value="qzh"/></td>
				  				<td><s:property value="rollYear"/></td>
				  				<td><s:property value="archiveNo"/></td>
				  				<td><s:property value="classNo"/></td>
				  				<td><s:property value="keyWord"/></td>
				  				<td><s:property value="inputOper"/></td>
				  				<td><s:property value="inputTime"/></td>
				  				<td><s:property value="type"/></td>
				  				<td><s:property value="secret"/></td>
				  				<td><s:property value="rem"/></td>
				  				<td><s:property value="time"/></td>
				  				<td><s:property value="sysState"/></td>
				  				<td>
				  					<a href="<%=path %>/dfxt_alter.action?id=<s:property value="id"/>">修改</a>
				  					<span>/</span>
				  					<a href="javascript:deleteRow(<s:property value="id"/>,<s:property value="archiveNo"/>)">删除</a>
				  				</td>
			  				</tr>
			  			</s:iterator>
			  		</s:if>
			  </table>
			  </div>
	  		  </div>
	  	
	  	<div class="input2">
	  	<s:form action="dfxt_add.action" id="addform" method="post" namespace="/" >
	  		<table>
		  		<tr>
		  			<td>题名</td>
		  			<td><input type="text" name="rollFile.themeName" id="themeName" value="联想收购摩托罗拉移动"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;责任者</td>
		  			<td><input type="text" name="rollFile.responser" id="responser" value="联想"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>文件时间</td>
		  			<td><input type="text" name="rollFile.fileDate" id="fileDate" value="2014.3.1"></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;页号</td>
		  			<td><input type="text" name="rollFile.pageNo" id="pageNo" value="100"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>文件编号</td>
		  			<td><input type="text" name="rollFile.fileNo" id="fileNo" value="20140301"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;顺序号</td>
		  			<td><input type="text" name="rollFile.no" id="no" value="1"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>目录号</td>
		  			<td><input type="text" name="rollFile.catalogNo" id="catalogNo" value="2014"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;保管期限</td>
		  			<td><input type="text" name="rollFile.term" id="term" value="30"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>全宗号</td>
		  			<td><input type="text" name="rollFile.qzh" id="qzh" value="123456"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;归档年度</td>
		  			<td><input type="text" name="rollFile.rollYear" id="rollYear" value="2014"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>档号</td>
		  			<td><input type="text" name="rollFile.archiveNo" id="archiveNo" value="3468"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;分类号</td>
		  			<td><input type="text" name="rollFile.classNo" id="classNo" value="456"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>主题词</td>
		  			<td><input type="text" name="rollFile.keyWord" id="keyWord" value="谷歌"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;载体类型</td>
		  			<td><input type="text" name="rollFile.type" id="type" value="无"/></td>
		  		</tr>
		  		<tr>
		  		  	<td>密级</td>
		  			<td><input type="text" name="rollFile.secret" id="secret" value="公开"/></td>
		  			<td>&nbsp;&nbsp;&nbsp;&nbsp;备注</td>
		  			<td><input type="text" name="rollFile.rem" id="rem" value="记录"/></td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<button type="submit" name="bt_add" id="bt_add">添加</button>
		  				
		  				<input type="reset" value="重置">
		  			</td>
		  			
		  			<td>
		  				&nbsp;&nbsp;
		  				<button id="bt_prev">上一张</button>
		  				<button id="bt_next">下一张</button>
		  			</td>
		  		</tr>
	  		</table>
	  		</s:form>
			  	<br/>
			  	<div style="color: red;">
			  	识别的文字信息为：<input type="text" id="valCode" name="valCode" value="${valCode}" ><br/>
			  	<s:if test="valCode!=null">
			  	<%-- <s:text name="valCode" id="valCode" value="${valCode}"/> --%>
			  	</s:if>
			  	</div>
	  	</div>
	  	
	  	<div class="list">
  		<ul>
    		<c:if test="${imgList!=null}">
	      		<c:forEach var="item" items="${imgList}" varStatus="img">
	    			<li>
	    				<a href="#" id="image${img.count}" name='${item}' style="color: black;">${img.count}</a>
	    			</li>
	    		</c:forEach>
    		</c:if>
    	</ul>
    	</div>
    	
    	<div class="image">
	  		<img alt="" src="${imgList[0] }" width="700px" height="1000px" id="photo">
  		</div>
  		<div class="coord">
			<label style="color: red">X<input type="text" size="4" id="x" name="x" /></label>
			<label style="color: red">Y<input type="text" size="4" id="y" name="y" /></label>
			<label style="color: red">W<input type="text" size="4" id="w" name="w" /></label>
			<label style="color: red">H<input type="text" size="4" id="h" name="h" /></label>
   		</div>
  </body>
  <div class="other">
	  <a href="resource/33.0.1750.27_chrome_installer.exe">Google_Chrome_Browser_Download</a>
	  <s:debug></s:debug>
  </div>
</html>


//获取项目路径
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

$(document).ready(function(){
	//加载
	$("#bt_load").click(function(){
		var archiveNo = document.getElementById("load_archiveNo").getAttribute("value");
		var path = document.getElementById("imgPath").getAttribute("value");
		path = path.replace(/\\/g, "/");
		document.getElementById("imgPath").value = path;
		$.ajax({
			type:"post",
			url:getRootPath()+"/dfxt_load.action",
			data:{
				path:path,
				archiveNo:archiveNo
			},
			cache:false,
			dataType:"text",
			success:function(result)
			{
				if(result!=null&&result!=""&&result=="no"){
					alert("无改案卷档号记录!");
				}else
				{
					window.location.reload();
				}
			}
		});
	});
	
	//卷内信息增加
	$("#bt_add").click(function(){
		var themeName = document.getElementById("themeName").value;
		var responser = document.getElementById("responser").value;
		var fileDate = document.getElementById("fileDate").value;
		var pageNo = document.getElementById("pageNo").value;
		var fileNo = document.getElementById("fileNo").value;
		var no = document.getElementById("no").value;
		var catalogNo = document.getElementById("catalogNo").value;
		var term = document.getElementById("term").value;
		var qzh = document.getElementById("qzh").value;
		var rollYear = document.getElementById("rollYear").value;
		var archiveNo = document.getElementById("archiveNo").value;
		var classNo = document.getElementById("classNo").value;
		var keyWord = document.getElementById("keyWord").value;
		var type = document.getElementById("type").value;
		var secret = document.getElementById("secret").value;
		var rem = document.getElementById("rem").value;
		//alert("archiveNo"+archiveNo);		
		var str = "";
		str = themeName+","+
			responser+","+
			fileDate+","+
			pageNo+","+
			fileNo+","+
			no+","+
			catalogNo+","+
			term+","+
			qzh+","+
			rollYear+","+
			archiveNo+","+
			classNo+","+
			keyWord+","+
			type+","+
			secret+","+
			rem+",";
		//与后台交互
		$.ajax({
			type:"post",
			url:getRootPath()+"/dfxt_add.action",
			data:{
				str:str
			},
			cache:false,
			dataType:"text",
			success:function(result){
				if(result!=null&&result!=""&&result=="success"){
					alert("添加成功！");
				}
				window.location.reload();
			}
		});
	});
});

//删除
function deleteRow(id,archiveNo)
{
	$.ajax({
		type:"post",
		url:getRootPath()+"/dfxt_deleteRow.action",
		data:{
			id:id,
			archiveNo:archiveNo
		},
		cache:false,
		dataType:"text",
		success:function(result){
			window.location.reload();
			if(result!=null&&result!=""&&result=="delete"){
				alert("删除成功!");
			}
		}
	});
}

function displayImg(path)
{
	var photo = document.getElementById("photo");
	photo.src = path;
}		

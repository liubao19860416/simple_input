package com.input.action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.input.pojo.RollFiles;
import com.input.service.RollFileService;

public class RollFilesAction {
	private RollFileService rollFileService;
	private RollFiles rollFile;

	public void setRollFileService(RollFileService rollFileService) {
		this.rollFileService = rollFileService;
	}
	
	public RollFileService getRollFileService() {
		return rollFileService;
	}

	public void setRollFile(RollFiles rollFile) {
		this.rollFile = rollFile;
	}
	
	public RollFiles getRollFile() {
		return rollFile;
	}
	
	/**
	 * 添加记录 -OK
	 * @return
	 */
	public String add()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			PrintWriter out = response.getWriter();
			String str = request.getParameter("str");
			RollFiles rf = null;
			if(StringUtils.isNotBlank(str)){
			   rf = this.getRollFiles(str);
			}
			if(rf!=null){
			    rollFileService.save(rf);
			}
			String result = "success";
			out.write(result);
			out.flush();
			out.close();
			String archiveNo = rf.getArchiveNo();
			String queryStr = "from RollFiles where archiveNo='"+archiveNo+"'";
			List<RollFiles> rfs = rollFileService.find(queryStr);
			request.getSession().setAttribute("list", rfs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
	/*
	 * Action方法
	 */
	public void getImg()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		@SuppressWarnings("deprecation")
		String proPath = request.getRealPath("/");//项目的绝对路径
		System.out.println("RealPath:"+proPath);
		File[] files = new File(proPath+"photo\\").listFiles();
		System.out.println("-----------------------");
		ArrayList<String> al = new ArrayList<String>();
		for (File file : files) {
			String temp = file.toString();
			temp = temp.replace('\\', '/');
			temp = temp.substring(temp.indexOf("photo"), temp.length());
			System.out.println(temp);
			al.add(temp);
		}
		System.out.println("-----------------------");
		request.getSession().setAttribute("imgList", al);
	}

	public String addRow()
	{
		rollFileService.save(rollFile);
		String archiveNo = rollFile.getArchiveNo();
		String queryStr = "from RollFiles where archiveNo='"+archiveNo+"'";
		List<RollFiles> rfs = rollFileService.find(queryStr);
		ServletActionContext.getRequest().getSession().setAttribute("list", rfs);
		return "success";
	}
	
	//删除
	public String deleteRow()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			PrintWriter out = response.getWriter();
			String id = request.getParameter("id");
			rollFileService.delete(id);
			String result = "delete";
			out.write(result);
			out.flush();
			out.close();
			String archiveNo = request.getParameter("archiveNo");
			String queryStr = "from RollFiles where archiveNo='"+archiveNo+"'";
			List<RollFiles> rfs = rollFileService.find(queryStr);
			request.getSession().setAttribute("list", rfs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public String alter()
	{
		System.out.println("------------------alter------------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		String queryStr = "from RollFiles where id_rf='"+id+"'";
		RollFiles rollFile = rollFileService.find(queryStr).get(0);
		request.getSession().setAttribute("rollFile", rollFile);
		System.out.println("rollFile:"+rollFile);
		return "yes";
	}
	
	public String update()
	{
		System.out.println("update()方法");
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			rollFileService.update(rollFile);
			request.getSession().setAttribute("update_msg", "更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("update_msg", "更新失败！");
		}
		return "yes";
	}
	
	public String load() throws IOException
	{
		HttpServletRequest request =  ServletActionContext.getRequest();
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		try {
			String archiveNo = request.getParameter("archiveNo");
			if(archiveNo=="")
				archiveNo = "temp";
			//获取图片
			getImg();
			String queryStr = "from RollFiles where archiveNo='"+archiveNo+"'";
			List<RollFiles> rfs = rollFileService.find(queryStr);
			if(rfs.isEmpty()){//无记录
				String result = "no";
				out.write(result);				
			}
			request.getSession().setAttribute("list", rfs);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	/*
	 * 字符串转换成RollFiles对象
	 */
	public RollFiles getRollFiles(String str)
	{
		RollFiles rf = new RollFiles();		
		String[] strs = str.split(",");
		
		rf.setThemeName(strs[0]);
		rf.setResponser(strs[1]);
		rf.setFileDate(strs[2]);
		rf.setPageNo(Integer.parseInt(strs[3]));
		rf.setFileNo(strs[4]);
		rf.setNo(Integer.parseInt(strs[5]));
		rf.setCatalogNo(strs[6]);
		rf.setTerm(strs[7]);
		rf.setQzh(strs[8]);
		rf.setRollYear(Integer.parseInt(strs[9]));
		rf.setArchiveNo(strs[10]);
		rf.setClassNo(strs[11]);
		rf.setKeyWord(strs[12]);
		rf.setType(strs[13]);
		rf.setSecret(strs[14]);
		rf.setRem(strs[15]);
		
		System.out.println(rf.toString());
		return rf;
	}
}

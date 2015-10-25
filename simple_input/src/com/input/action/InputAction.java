package com.input.action;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.input.tool.OperateImage;
public class InputAction {
    
    //保存识别的文字信息的字段信息
    private String valCode;
	public String getValCode() {
        return valCode;
    }
    public void setValCode(String valCode) {
        this.valCode = valCode;
    }

    //解析选择区域的图片中的文字信息
    public String crop(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			int  x = Integer.parseInt( request.getParameter("x"));
			int  y = Integer.parseInt( request.getParameter("y"));
			int  width = Integer.parseInt( request.getParameter("w"));
			int  height = Integer.parseInt( request.getParameter("h"));
			String photoName = request.getParameter("photoName").replace("/", "\\");
			@SuppressWarnings("deprecation")
			String projectPath  = request.getRealPath("/");
			String srcPath = projectPath+photoName;
			String toPath = projectPath+"photo2\\crop.jpg";
//			this.valCode = OperateImage.cropImage(srcPath, toPath, x, y, width, height, "jpg", "jpg");
			this.valCode = OperateImage.cropImage(srcPath, toPath, x, y, width, height, "jpg", "jpg");
			
			request.getSession().setAttribute("valCode", valCode);
			System.out.println("");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
//		return "success";
	}
}

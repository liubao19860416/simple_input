package com.input.tool;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.input.ocr.OCR;

public class OperateImage {
	
	//根据坐标裁剪图片
    public static String cropImage(String srcPath,String toPath,int x,int y,int width,int height,
    		String readImageFormat,String writeImageFormat) throws IOException{   
    	FileInputStream fis = null ;
        ImageInputStream iis =null ;
        try{   
            //读取图片文件
        	fis = new FileInputStream(srcPath); 
            @SuppressWarnings("rawtypes")
			Iterator it = ImageIO.getImageReadersByFormatName(readImageFormat); 
            ImageReader reader = (ImageReader) it.next(); 
            //获取图片流 
            iis = ImageIO.createImageInputStream(fis);  
            reader.setInput(iis,true) ;
            ImageReadParam param = reader.getDefaultReadParam(); 
            //定义一个矩形
            Rectangle rect = new Rectangle(x, y, width, height); 
            //提供一个 BufferedImage，将其用作解码像素数据的目标。 
            param.setSourceRegion(rect);
            BufferedImage bi = reader.read(0,param);                
            //保存新图片 
            File file = new File(toPath);
            if(!file.exists()){
            	file.createNewFile();
            }
            ImageIO.write(bi, writeImageFormat,file);    
            //OCR图像识别
            System.out.println("toPath:"+toPath);
            String valCode = new OCR().recognizeText(new File(toPath), "jpg"); 
            System.out.println(valCode);   
            
            return valCode;
            
        } catch (Exception e) {
			e.printStackTrace();
		}finally{
            if(fis!=null)
            	fis.close();       
            if(iis!=null)
               iis.close(); 
        } 
        return null;
    }
}

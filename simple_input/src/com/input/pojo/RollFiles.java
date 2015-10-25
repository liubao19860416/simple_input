package com.input.pojo;

import java.util.Date;
/*
 * 案卷卷内,表名 tb_RollFiles
 */
public class RollFiles {
	private int id;						//序号;
	private String themeName;	//题名
	private String responser;	//责任者
	private String fileDate;	//文件时间
	private int pageNo;			//页号
	private String fileNo;		//文件编号
	private int no;				//顺序号
	private String catalogNo;	//目录号
	private String term;		//保管期限
	private String qzh;			//全宗号
	private int rollYear;		//归档年度
	private String archiveNo;	//档号
	private String classNo;		//分类号
	private String keyWord;		//主题词
	private String inputOper;	//录入人
	private Date inputTime;		//录入时间
	private String type;		//载体类型
	private String secret;		//密级
	private String rem;			//备注
	private int time;			//录入遍数标识
	private int SysState;		//用于状态控制的标识
	
	public RollFiles() {
		
	}
	
	public RollFiles(int id, String themeName, String responser,
			String fileDate, int pageNo, String fileNo, int no,
			String catalogNo, String term, String qzh, int rollYear,
			String archiveNo, String classNo, String keyWord, String inputOper,
			Date inputTime, String type, String secret, String rem, int time,
			int sysState) {
		super();
		this.id = id;
		this.themeName = themeName;
		this.responser = responser;
		this.fileDate = fileDate;
		this.pageNo = pageNo;
		this.fileNo = fileNo;
		this.no = no;
		this.catalogNo = catalogNo;
		this.term = term;
		this.qzh = qzh;
		this.rollYear = rollYear;
		this.archiveNo = archiveNo;
		this.classNo = classNo;
		this.keyWord = keyWord;
		this.inputOper = inputOper;
		this.inputTime = inputTime;
		this.type = type;
		this.secret = secret;
		this.rem = rem;
		this.time = time;
		SysState = sysState;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public String getResponser() {
		return responser;
	}

	public void setResponser(String responser) {
		this.responser = responser;
	}

	public String getFileDate() {
		return fileDate;
	}

	public void setFileDate(String fileDate) {
		this.fileDate = fileDate;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCatalogNo() {
		return catalogNo;
	}

	public void setCatalogNo(String catalogNo) {
		this.catalogNo = catalogNo;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getQzh() {
		return qzh;
	}

	public void setQzh(String qzh) {
		this.qzh = qzh;
	}

	public int getRollYear() {
		return rollYear;
	}

	public void setRollYear(int rollYear) {
		this.rollYear = rollYear;
	}

	public String getArchiveNo() {
		return archiveNo;
	}

	public void setArchiveNo(String archiveNo) {
		this.archiveNo = archiveNo;
	}

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getInputOper() {
		return inputOper;
	}

	public void setInputOper(String inputOper) {
		this.inputOper = inputOper;
	}

	public Date getInputTime() {
		return inputTime;
	}

	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getRem() {
		return rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getSysState() {
		return SysState;
	}

	public void setSysState(int sysState) {
		SysState = sysState;
	}

	@Override
	public String toString() {
		return "RollFiles [id=" + id + ", themeName=" + themeName
				+ ", responser=" + responser + ", fileDate=" + fileDate
				+ ", pageNo=" + pageNo + ", fileNo=" + fileNo + ", no=" + no
				+ ", catalogNo=" + catalogNo + ", term=" + term + ", qzh="
				+ qzh + ", rollYear=" + rollYear + ", archiveNo=" + archiveNo
				+ ", classNo=" + classNo + ", keyWord=" + keyWord
				+ ", inputOper=" + inputOper + ", inputTime=" + inputTime
				+ ", type=" + type + ", secret=" + secret + ", rem=" + rem
				+ ", time=" + time + ", SysState=" + SysState + "]";
	}
	
	
}

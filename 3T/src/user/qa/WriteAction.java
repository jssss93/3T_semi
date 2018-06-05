package user.qa;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;


public class WriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QaVO paramClass;
	private QaVO resultClass;

	
	private int currentPage;
	
	private int QA_NO;
	private String QA_SUBJECT;
	private String QA_NAME;
	private String QA_PASSWD;
	private String QA_CONTENT;
	private String QA_FILE_ORGNAME;
	private String QA_FILE_SAVNAME;
	private int QA_CATEGORY_NO; 
	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\git\\3T\\3T\\WebContent\\upload\\";
	
	private int QA_REF;
	private int QA_RE_STEP;
	private int QA_RE_LEVEL;
	

	boolean reply = false;
	
	public WriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}
	
	public String reply() throws Exception
	{
		reply=true;
		resultClass = new QaVO();
		
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectOne", getQA_NO());
		resultClass.setQA_SUBJECT("[´äº¯] " + resultClass.getQA_SUBJECT());
		resultClass.setQA_PASSWD("");
		resultClass.setQA_NAME("");
		resultClass.setQA_CONTENT("");
		resultClass.setQA_FILE_ORGNAME(null);
		resultClass.setQA_FILE_SAVNAME(null);
		
		
		return SUCCESS;
		
	}

	public String execute() throws Exception {
		System.out.println("test");
		paramClass = new QaVO();
		resultClass = new QaVO();
		
		
		if(QA_REF == 0)
		{
			paramClass.setQA_RE_STEP(0);
			paramClass.setQA_RE_LEVEL(0);
		}
		else
		{
			
			paramClass.setQA_REF(getQA_REF());
			paramClass.setQA_RE_STEP(getQA_RE_STEP());
			sqlMapper.update("qa_updateReplyStep", paramClass);
			
			paramClass.setQA_RE_STEP(getQA_RE_STEP() + 1);
			paramClass.setQA_RE_LEVEL(getQA_RE_LEVEL() + 1);
			paramClass.setQA_REF(getQA_REF());
		}
		
		paramClass.setQA_SUBJECT(getQA_SUBJECT());
		paramClass.setQA_CATEGORY_NO(getQA_CATEGORY_NO());
		paramClass.setQA_NAME(getQA_NAME());
		paramClass.setQA_PASSWD(getQA_PASSWD());
		paramClass.setQA_CONTENT(getQA_CONTENT());
		
		paramClass.setQA_REGDATE(today.getTime());
		System.out.println("paramClass.getQA_CATEGORY_NO "+paramClass.getQA_CATEGORY_NO());
		
		if(QA_REF == 0)
			sqlMapper.insert("qa_insertBoard", paramClass);
		else
			sqlMapper.insert("qa_insertBoardReply", paramClass);
		
		if(getUpload() != null)
		{
			resultClass = (QaVO) sqlMapper.queryForObject("qa_selectLastNo");
			
			String file_name = "file_" + resultClass.getQA_NO();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length()
					);
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setQA_NO(resultClass.getQA_NO());
			paramClass.setQA_FILE_ORGNAME(getUploadFileName());
			paramClass.setQA_FILE_SAVNAME(file_name + "." +file_ext);
			
			sqlMapper.update("qa_updateFile", paramClass);
		}

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		WriteAction.sqlMapper = sqlMapper;
	}

	public QaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(QaVO paramClass) {
		this.paramClass = paramClass;
	}

	public QaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(QaVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getQA_NO() {
		return QA_NO;
	}

	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}

	public String getQA_SUBJECT() {
		return QA_SUBJECT;
	}

	public void setQA_SUBJECT(String qA_SUBJECT) {
		QA_SUBJECT = qA_SUBJECT;
	}

	public String getQA_NAME() {
		return QA_NAME;
	}

	public void setQA_NAME(String qA_NAME) {
		QA_NAME = qA_NAME;
	}

	public String getQA_PASSWD() {
		return QA_PASSWD;
	}

	public void setQA_PASSWD(String qA_PASSWD) {
		QA_PASSWD = qA_PASSWD;
	}

	public String getQA_CONTENT() {
		return QA_CONTENT;
	}

	public void setQA_CONTENT(String qA_CONTENT) {
		QA_CONTENT = qA_CONTENT;
	}

	public String getQA_FILE_ORGNAME() {
		return QA_FILE_ORGNAME;
	}

	public void setQA_FILE_ORGNAME(String qA_FILE_ORGNAME) {
		QA_FILE_ORGNAME = qA_FILE_ORGNAME;
	}

	public String getQA_FILE_SAVNAME() {
		return QA_FILE_SAVNAME;
	}

	public void setQA_FILE_SAVNAME(String qA_FILE_SAVNAME) {
		QA_FILE_SAVNAME = qA_FILE_SAVNAME;
	}

	public int getQA_CATEGORY_NO() {
		return QA_CATEGORY_NO;
	}

	public void setQA_CATEGORY_NO(int qA_CATEGORY_NO) {
		QA_CATEGORY_NO = qA_CATEGORY_NO;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public int getQA_REF() {
		return QA_REF;
	}

	public void setQA_REF(int qA_REF) {
		QA_REF = qA_REF;
	}

	public int getQA_RE_STEP() {
		return QA_RE_STEP;
	}

	public void setQA_RE_STEP(int qA_RE_STEP) {
		QA_RE_STEP = qA_RE_STEP;
	}

	public int getQA_RE_LEVEL() {
		return QA_RE_LEVEL;
	}

	public void setQA_RE_LEVEL(int qA_RE_LEVEL) {
		QA_RE_LEVEL = qA_RE_LEVEL;
	}

	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}



}

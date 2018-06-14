package user.qa;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.Map;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

public class ModifyAction extends ActionSupport implements SessionAware{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public Map session;
	private QaVO paramClass;
	private QaVO resultClass;
	
	private int currentPage;
	
	private int QA_NO;
	private String QA_SUBJECT;
	private String QA_NAME;
	private String QA_PASSWD;
	private String QA_CONTENT;
	private String old_file;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Java\\";
	
	public ModifyAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	public String execute() throws Exception
	{
		paramClass = new QaVO();
		resultClass = new QaVO();
		
		paramClass.setQA_NO(getQA_NO());
		paramClass.setQA_SUBJECT(getQA_SUBJECT());
		paramClass.setQA_NAME(getQA_NAME());
		paramClass.setQA_PASSWD(getQA_PASSWD());
		paramClass.setQA_CONTENT(getQA_CONTENT());
		
		sqlMapper.update("qa_updateBoard", paramClass);
		
		if(getUpload() != null)
		{
			String file_name = "file_" + getQA_NO();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') +1, getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setQA_FILE_ORGNAME(getUploadFileName());
			paramClass.setQA_FILE_SAVNAME(file_name + "." + file_ext);
			
			sqlMapper.update("qa_updateFile", paramClass);
			
			
			
		}
		
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectOne", getQA_NO());
		return SUCCESS;
		
		
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ModifyAction.sqlMapper = sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String oldFile) {
		old_file = oldFile;
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
	
	
}

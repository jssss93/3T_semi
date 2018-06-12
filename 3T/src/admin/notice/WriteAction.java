package admin.notice;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.notice.VO.NoticeVO;

public class WriteAction extends ActionSupport implements SessionAware {
	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private NoticeVO paramClass;
	private NoticeVO resultClass;

	private int currentPage;

	private int notice_no;
	private int notice_state;
	private String notice_writer;
	private String notice_subject;

	private String notice_content;
	private String notice_file_orgname;
	private String notice_file_savname;

	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\upload\\";

	public WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String form() throws Exception {

		return SUCCESS;

	}

	public String modifyform() throws Exception {

		resultClass = (NoticeVO) sqlMapper.queryForObject("ANselectOne", getNotice_no());
		return SUCCESS;

	}

	public String execute() throws Exception {

		paramClass = new NoticeVO();
		resultClass = new NoticeVO();

		paramClass.setNotice_writer(getNotice_writer());
		paramClass.setNotice_subject(getNotice_subject());
		paramClass.setNotice_content(getNotice_content());
		paramClass.setNotice_file_orgname(getNotice_file_orgname());
		paramClass.setNotice_file_savname(getNotice_file_savname());

		sqlMapper.insert("insertNotice", paramClass);

		if (getUpload() != null) {
			resultClass = (NoticeVO) sqlMapper.queryForObject("ANselectLastNo");

			String file_name = "file_" + resultClass.getNotice_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setNotice_no(resultClass.getNotice_no());
			paramClass.setNotice_file_orgname(getUploadFileName());
			paramClass.setNotice_file_savname(file_name + "." + file_ext);

			sqlMapper.update("ANupdateFile", paramClass);
		}

		return SUCCESS;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getNotice_state() {
		return notice_state;
	}

	public void setNotice_state(int notice_state) {
		this.notice_state = notice_state;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_file_orgname() {
		return notice_file_orgname;
	}

	public void setNotice_file_orgname(String notice_file_orgname) {
		this.notice_file_orgname = notice_file_orgname;
	}

	public String getNotice_file_savname() {
		return notice_file_savname;
	}

	public void setNotice_file_savname(String notice_file_savname) {
		this.notice_file_savname = notice_file_savname;
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

	public NoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(NoticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public NoticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(NoticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}

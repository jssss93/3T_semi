package user.review;

import java.io.Reader;


import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

import user.review.ReviewVO;

public class WriteAction extends ActionSupport{

	public static Reader reader; //���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private ReviewVO paramClass; //�Ķ���͸� ������ ��ü
	private ReviewVO resultClass; //���� ��� ���� ������ ��ü

	private int currentPage; //���� ������
	
	private int REV_no;
	private String REV_subject;
	private String REV_name;
	private String REV_passwd;
	private String REV_content;
	private String REV_file_orgname; //���ε� ������ ���� �̸�
	private String REV_file_savname; //������ ������ ���ε� ������ �̸�. ���� ��ȣ�� �����Ѵ�.
	Calendar today = Calendar.getInstance(); 
	private Date REV_regdate;
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\Java\\upload\\"; //���ε� ���.
	
	// ������
		public WriteAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}
		
		public String form() throws Exception {
			//��� ��.
			return SUCCESS;
		}
		
		public String execute() throws Exception {
			//�Ķ���Ϳ� ����Ʈ ��ü ����.
			paramClass = new ReviewVO();
			resultClass = new ReviewVO();

			// ����� �׸� ����.
			paramClass.setREV_subject(getREV_subject());
			paramClass.setREV_name(getREV_name());
			paramClass.setREV_passwd(getREV_passwd());
			paramClass.setREV_content(getREV_content());
			paramClass.setREV_regdate(today.getTime());

			// ��� ���� ����.
			sqlMapper.insert("review-insertReview", paramClass);

			// ÷�������� �����ߴٸ� ������ ���ε��Ѵ�.
			if (getUpload() != null) {

				//����� �� ��ȣ ��������.
				resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectLastNo");

				//���� ������ ����� ���� �̸��� Ȯ���� ����.
				String file_name = "file_" + resultClass.getREV_no();
				String file_ext = getUploadFileName().substring(
						getUploadFileName().lastIndexOf('.') + 1,
						getUploadFileName().length());

				//������ ���� ����.
				File destFile = new File(fileUploadPath + file_name + "."
						+ file_ext);
				FileUtils.copyFile(getUpload(), destFile);

				//���� ���� �Ķ���� ����.
				paramClass.setREV_no(resultClass.getREV_no());
				paramClass.setREV_file_orgname(getUploadFileName());		//���� ���� �̸�
				paramClass.setREV_file_savname(file_name + "." + file_ext);	//������ ������ ���� �̸�

				//���� ���� ������Ʈ.
				sqlMapper.update("review-updateFile", paramClass);
			}

			return SUCCESS;
		}

		public Calendar getToday() {
			return today;
		}

		public void setToday(Calendar today) {
			this.today = today;
		}

		public int getREV_no() {
			return REV_no;
		}
		public void setREV_no(int REV_no) {
			this.REV_no = REV_no;
		}
		public String getREV_subject() {
			return REV_subject;
		}
		public void setREV_subject(String REV_subject) {
			this.REV_subject = REV_subject;
		}
		public String getREV_name() {
			return REV_name;
		}
		public void setREV_name(String REV_name) {
			this.REV_name = REV_name;
		}
		public String getREV_passwd() {
			return REV_passwd;
		}
		public void setREV_passwd(String REV_passwd) {
			this.REV_passwd = REV_passwd;
		}
		public String getREV_content() {
			return REV_content;
		}
		public void setREV_content(String REV_content) {
			this.REV_content = REV_content;
		}
		public String getREV_file_orgname() {
			return REV_file_orgname;
		}
		public void setREV_file_orgname(String REV_file_orgname) {
			this.REV_file_orgname = REV_file_orgname;
		}
		public String getREV_file_savname() {
			return REV_file_savname;
		}
		public void setREV_file_savname(String REV_file_savname) {
			this.REV_file_savname = REV_file_savname;
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

		public ReviewVO getParamClass() {
			return paramClass;
		}

		public void setParamClass(ReviewVO paramClass) {
			this.paramClass = paramClass;
		}

		public ReviewVO getResultClass() {
			return resultClass;
		}

		public void setResultClass(ReviewVO resultClass) {
			this.resultClass = resultClass;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
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
		
		
		public Date getREV_regdate() {
			return REV_regdate;
		}
		public void setREV_regdate(Date REV_regdate) {
			this.REV_regdate = REV_regdate;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

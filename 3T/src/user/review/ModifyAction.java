package user.review;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class ModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass; // �Ķ���͸� ������ ��ü
	private ReviewVO resultClass; // ���� ��� ���� ������ ��ü

	private int currentPage; // ���� ������

	private int REV_no;
	private String REV_subject;
	private String REV_name;
	private String REV_passwd;
	private String REV_content;
	private String old_file;

	private File upload; // ���� ��ü
	private String uploadContentType; // ������ Ÿ��
	private String uploadFileName; // ���� �̸�
	private String fileUploadPath = "C:\\Users\\ȣ��\\Desktop\\git\\3TT\\3T\\WebContent\\upload\\"; // ���ε� ���.

	// ������
	public ModifyAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �Խñ� ����
	public String execute() throws Exception {

		// �Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();

		// ������ �׸� ����.
		paramClass.setREV_no(getREV_no());
		paramClass.setREV_subject(getREV_subject());
		paramClass.setREV_name(getREV_name());
		paramClass.setREV_passwd(getREV_passwd());
		paramClass.setREV_content(getREV_content());

		// �ϴ� �׸� �����Ѵ�.
		sqlMapper.update("review-updateReview", paramClass);

		// ������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
		if (getUpload() != null) {

			// ���� ������ ����� ���� �̸��� Ȯ���� ����.
			String file_name = "review_" + getREV_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			// ���� ���� ����
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();

			// �� ���� ���ε�
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			// ���� ���� �Ķ���� ����.
			paramClass.setREV_file_orgname(getUploadFileName());
			paramClass.setREV_file_savname(file_name + "." + file_ext);

			// ���� ���� ������Ʈ.
			sqlMapper.update("review-updateFile", paramClass);
		}

		// ������ ������ view �������� �̵�.
		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());

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

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
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

}
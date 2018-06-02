package user.review;

import com.opensymphony.xwork2.ActionSupport;

import user.review.ReviewVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class DeleteAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass; // �Ķ���͸� ������ ��ü
	private ReviewVO resultClass; // ���� ��� ���� ������ ��ü

	private int currentPage; // ���� ������

	private String fileUploadPath = "C:\\upload\\";

	private int REV_no;

	public DeleteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �Խñ� �� ����
	public String execute() throws Exception {

		// �Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();

		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());

		// ���� ���� ����
		File deleteFile = new File(fileUploadPath + resultClass.getREV_file_savname());
		deleteFile.delete();

		// ������ �׸� ����.
		paramClass.setREV_no(getREV_no());

		// ���� ���� ����.
		sqlMapper.update("review-DeleteReview", paramClass);

		return SUCCESS;
	}

	public int getREV_no() {
		return REV_no;
	}

	public void setREV_no(int REV_no) {
		this.REV_no = REV_no;
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

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

}

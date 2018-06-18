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

	private Review_CommentVO cClass = new Review_CommentVO();
	private Review_CommentVO cResult = new Review_CommentVO();

	private int currentPage; // ���� ������

	private String fileUploadPath = "C:\\Users\\ȣ��\\Desktop\\git\\3T\\3T\\WebContent\\upload\\";

	private int REV_no;

	private int REV_C_no;

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

	public String execute2() throws Exception {
		cClass = new Review_CommentVO();
		cResult = new Review_CommentVO();

		cClass.setREV_C_no(getREV_C_no());
		System.out.println("getREV_C_no" + getREV_C_no());

		sqlMapper.update("deleteComment", cClass);

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

	public Review_CommentVO getcClass() {
		return cClass;
	}

	public void setcClass(Review_CommentVO cClass) {
		this.cClass = cClass;
	}

	public Review_CommentVO getcResult() {
		return cResult;
	}

	public void setcResult(Review_CommentVO cResult) {
		this.cResult = cResult;
	}

	public int getREV_C_no() {
		return REV_C_no;
	}

	public void setREV_C_no(int REV_C_no) {
		this.REV_C_no = REV_C_no;
	}

}

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

	private ReviewVO paramClass; // 파라미터를 저장할 객체
	private ReviewVO resultClass; // 쿼리 결과 값을 저장할 객체

	private int currentPage; // 현재 페이지

	private String fileUploadPath = "C:\\upload\\";

	private int REV_no;

	public DeleteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시글 글 삭제
	public String execute() throws Exception {

		// 파라미터와 리절트 객체 생성.
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();

		// 해당 번호의 글을 가져온다.
		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());

		// 서버 파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getREV_file_savname());
		deleteFile.delete();

		// 삭제할 항목 설정.
		paramClass.setREV_no(getREV_no());

		// 삭제 쿼리 수행.
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

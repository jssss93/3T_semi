package user.review;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;



public class ViewAction extends ActionSupport implements SessionAware {
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass = new ReviewVO(); // 파라미터를 저장할 객체
	private ReviewVO resultClass = new ReviewVO(); // 쿼리 결과 값을 저장할 객체

	private List<Review_CommentVO> commentlist = new ArrayList<Review_CommentVO>();

	private Review_CommentVO cClass = new Review_CommentVO();
	private Review_CommentVO cResult = new Review_CommentVO();

	private int currentPage;

	private int REV_no;
	private String REV_passwd;

	private int REV_C_no;
	private int REV_C_originno;
	private String REV_C_passwd;

	private String fileUploadPath = "C:\\Users\\호준\\Desktop\\git\\3T\\3T\\WebContent\\upload\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	public Map session;

	// 생성자
	public ViewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new ReviewVO();
		System.out.println(getREV_C_originno());

		if (getREV_C_originno() != 0) {
			paramClass.setREV_no(getREV_C_originno());

		} else {

			paramClass.setREV_no(getREV_no());
		}

		sqlMapper.update("review-updateReadHit", paramClass);

		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", paramClass.getREV_no());

		commentlist = sqlMapper.queryForList("commentSelectAll", paramClass.getREV_no()); // paramClass.getREV_no() 로
																							// 가져와야함
																							// getREV_C_no() 로 했을때 안가져옴
																							// 댓글

		return SUCCESS;
	}

	public String download() throws Exception {

		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());

		File fileInfo = new File(fileUploadPath + resultClass.getREV_file_savname());

		setContentLength(fileInfo.length());
		setContentDisposition("attachment;filename=" + URLEncoder.encode(resultClass.getREV_file_orgname(), "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getREV_file_savname()));

		return SUCCESS;
	}

	// 비밀번호 체크 폼
	public String checkForm() throws Exception {

		return SUCCESS;
	}

	// 비밀번호 체크 액션
	public String checkAction() throws Exception {

		// 비밀번호 입력값 파라미터 설정.
		paramClass.setREV_no(getREV_no());
		paramClass.setREV_passwd(getREV_passwd());

		// System.out.println("getREV_no" + getREV_no());
		 System.out.println("getREV_passwd" + getREV_passwd());

		// 현재 글의 비밀번호 가져오기.
		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectPassword", paramClass);

		if (resultClass == null)
			return ERROR;

		return SUCCESS;
	}

	public String checkAction2() throws Exception {

		//System.out.println("getREV_C_no" + getREV_C_no());
		//System.out.println("getREV_C_passwd" + getREV_C_passwd());
		//System.out.print("getREV_C_originno" + getREV_C_originno());

		cClass.setREV_C_no(getREV_C_no());
		cClass.setREV_C_passwd(getREV_C_passwd());
		cClass.setREV_C_originno(getREV_C_originno());
		cResult = (Review_CommentVO) sqlMapper.queryForObject("selectPassword2", cClass);

		if (cResult == null)
			return ERROR;

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ViewAction.sqlMapper = sqlMapper;
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

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public int getREV_no() {
		return REV_no;
	}

	public void setREV_no(int REV_no) {
		this.REV_no = REV_no;
	}

	public String getREV_passwd() {
		return REV_passwd;
	}

	public void setREV_passwd(String REV_passwd) {
		this.REV_passwd = REV_passwd;
	}

	public int getREV_C_originno() {
		return REV_C_originno;
	}

	public void setREV_C_originno(int REV_C_originno) {
		this.REV_C_originno = REV_C_originno;
	}

	public List<Review_CommentVO> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<Review_CommentVO> commentlist) {
		this.commentlist = commentlist;
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

	public String getREV_C_passwd() {
		return REV_C_passwd;
	}

	public void setREV_C_passwd(String REV_C_passwd) {
		this.REV_C_passwd = REV_C_passwd;
	}

}
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

	private ReviewVO paramClass; // 파라미터를 저장할 객체
	private ReviewVO resultClass; // 쿼리 결과 값을 저장할 객체

	private int currentPage; // 현재 페이지

	private int REV_no;
	private String REV_subject;
	private String REV_name;
	private String REV_passwd;
	private String REV_content;
	private String old_file;

	private File upload; // 파일 객체
	private String uploadContentType; // 컨텐츠 타입
	private String uploadFileName; // 파일 이름
	private String fileUploadPath = "C:\\Users\\호준\\Desktop\\git\\3TT\\3T\\WebContent\\upload\\"; // 업로드 경로.

	// 생성자
	public ModifyAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시글 수정
	public String execute() throws Exception {

		// 파라미터와 리절트 객체 생성.
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();

		// 수정할 항목 설정.
		paramClass.setREV_no(getREV_no());
		paramClass.setREV_subject(getREV_subject());
		paramClass.setREV_name(getREV_name());
		paramClass.setREV_passwd(getREV_passwd());
		paramClass.setREV_content(getREV_content());

		// 일단 항목만 수정한다.
		sqlMapper.update("review-updateReview", paramClass);

		// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
		if (getUpload() != null) {

			// 실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "review_" + getREV_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			// 이전 파일 삭제
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();

			// 새 파일 업로드
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			// 파일 정보 파라미터 설정.
			paramClass.setREV_file_orgname(getUploadFileName());
			paramClass.setREV_file_savname(file_name + "." + file_ext);

			// 파일 정보 업데이트.
			sqlMapper.update("review-updateFile", paramClass);
		}

		// 수정이 끝나면 view 페이지로 이동.
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
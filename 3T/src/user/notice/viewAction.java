package user.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.URLEncoder;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.notice.VO.NoticeVO;


public class viewAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private NoticeVO paramClass = new NoticeVO(); //파라미터를 저장할 객체
	private NoticeVO resultClass = new NoticeVO(); //쿼리 결과 값을 저장할 객체

	private int currentPage;
	private int notice_no;

	private String fileUploadPath = "C:\\Java\\upload\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// 생성자
	public viewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 상세보기
	public String execute() throws Exception {

		// 해당 번호의 글을 가져온다.
		resultClass = (NoticeVO) sqlMapper.queryForObject("usernotice-selectOne", getNotice_no());
		System.out.print("testtes"+resultClass.getNotice_writer());
		return SUCCESS;
	}
	public String download() throws Exception {

		// 해당 번호의 파일 정보를 가져온다.
		resultClass = (NoticeVO) sqlMapper.queryForObject("usernotice-selectOne", getNotice_no());
		
		// 파일 경로와 파일명을 file 객체에 넣는다.
		File fileInfo = new File(fileUploadPath + resultClass.getNotice_file_savname());

		// 다운로드 파일 정보 설정.
		setContentLength(fileInfo.length());
		setContentDisposition("attachment;filename="
				+ URLEncoder.encode(resultClass.getNotice_file_orgname(), "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath
				+ resultClass.getNotice_file_savname()));

		return SUCCESS;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	
}

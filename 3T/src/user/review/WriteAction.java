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
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;

import user.review.ReviewVO;
import admin.goods.VO.GoodsVO;

public class WriteAction extends ActionSupport implements SessionAware {

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private ReviewVO paramClass; // 파라미터를 저장할 객체
	private ReviewVO resultClass; // 쿼리 결과 값을 저장할 객체

	private GoodsVO goods_paramClass =new GoodsVO();
	private GoodsVO goods_resultClass=new GoodsVO();
	
	public Map session;

	private int currentPage; // 현재 페이지

	private int REV_no;
	private String REV_subject;
	private String REV_name;
	private String REV_passwd;
	private String REV_content;
	private String REV_file_orgname; // 업로드 파일의 원래 이름
	private String REV_file_savname; // 서버에 저장할 업로드 파일의 이름. 고유 번호로 구분한다.
	
	Calendar today = Calendar.getInstance();
	private Date REV_regdate;

	private String REV_member_id;
	private int REV_goods_no ;
	private String REV_goods_name;
	private String REV_goods_img;
	private int goods_no;

	private File upload; // 파일 객체
	private String uploadContentType; // 컨텐츠 타입
	private String uploadFileName; // 파일 이름
	private String fileUploadPath = "C:\\Users\\호준\\Desktop\\git\\3TT\\3T\\WebContent\\upload\\"; // 업로드 경로.

	private int REV_ref;
	private int REV_re_step;
	private int REV_re_level;

	boolean reply = false;

	// 생성자
	public WriteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	public String form() throws Exception {
		// 등록 폼.
		return SUCCESS;
	}
	public String form1() throws Exception
	{	

		goods_paramClass.setGoods_no(getGoods_no());
		goods_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", getGoods_no());
		
		return SUCCESS;
		
		
	}

	public String reply() throws Exception {
		reply = true;
		resultClass = new ReviewVO();

		resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());
		resultClass.setREV_subject("[답변] " + resultClass.getREV_subject());
		resultClass.setREV_passwd("");
		resultClass.setREV_name("");
		resultClass.setREV_content("");
		resultClass.setREV_file_orgname(null);
		resultClass.setREV_file_savname(null);

		return SUCCESS;

	}

	public String execute() throws Exception {
		// 파라미터와 리절트 객체 생성.
		session.get("M_ID");
		System.out.println(getREV_passwd());
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();

		if (REV_ref == 0) {
			paramClass.setREV_re_step(0);
			paramClass.setREV_re_level(0);
		} else {

			paramClass.setREV_ref(getREV_ref());
			paramClass.setREV_re_step(getREV_re_step());
			sqlMapper.update("review-updateReplyStep", paramClass);

			paramClass.setREV_re_step(getREV_re_step() + 1);
			paramClass.setREV_re_level(getREV_re_level() + 1);
			paramClass.setREV_ref(getREV_ref());
		}

		// 등록할 항목 설정.
		paramClass.setREV_subject(getREV_subject());
		paramClass.setREV_name(getREV_name());
		paramClass.setREV_passwd(getREV_passwd());
		paramClass.setREV_content(getREV_content());
		paramClass.setREV_regdate(today.getTime());

		paramClass.setREV_member_id(getREV_member_id()); // 아이디
		goods_paramClass.setGoods_no(getGoods_no());
		System.out.println("getGoods_no())s"+getGoods_no());
		System.out.println("goods_paramClass"+goods_paramClass);
		goods_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", getGoods_no());
		System.out.println("goods_resultClass.goods"+goods_resultClass);
		System.out.println("goods_resultClass.getGoods_no()"+goods_resultClass.getGoods_no());
		paramClass.setREV_goods_no(goods_resultClass.getGoods_no());
		System.out.println("paramClass"+paramClass);
		paramClass.setREV_goods_name(goods_resultClass.getGoods_name());
		paramClass.setREV_goods_img(goods_resultClass.getGoods_file_savname().split(",")[0]);

		// 등록 쿼리 수행.

		if (REV_ref == 0)
			sqlMapper.insert("review-insertReview", paramClass);
		else
			sqlMapper.insert("review-insertReviewReply", paramClass);

		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {

			// 등록한 글 번호 가져오기.
			resultClass = (ReviewVO) sqlMapper.queryForObject("review-selectLastNo");

			// 실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + resultClass.getREV_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			// 서버에 파일 저장.
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			// 파일 정보 파라미터 설정.
			paramClass.setREV_no(resultClass.getREV_no());
			paramClass.setREV_file_orgname(getUploadFileName()); // 원래 파일 이름
			paramClass.setREV_file_savname(file_name + "." + file_ext); // 서버에 저장한 파일 이름

			// 파일 정보 업데이트.
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

	public String getREV_member_id() {
		return REV_member_id;
	}

	public void setREV_member_id(String REV_member_id) {
		this.REV_member_id = REV_member_id;
	}

	public int getREV_goods_no() {
		return REV_goods_no;
	}

	public void setREV_goods_no(int REV_goods_no) {
		this.REV_goods_no = REV_goods_no;
	}

	public int getREV_ref() {
		return REV_ref;
	}

	public void setREV_ref(int REV_ref) {
		this.REV_ref = REV_ref;
	}

	public int getREV_re_step() {
		return REV_re_step;
	}

	public void setREV_re_step(int REV_re_step) {
		this.REV_re_step = REV_re_step;
	}

	public int getREV_re_level() {
		return REV_re_level;
	}

	public void setREV_re_level(int REV_re_level) {
		this.REV_re_level = REV_re_level;
	}

	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}

	public GoodsVO getGoods_paramClass() {
		return goods_paramClass;
	}

	public void setGoods_paramClass(GoodsVO goods_paramClass) {
		this.goods_paramClass = goods_paramClass;
	}

	public GoodsVO getGoods_resultClass() {
		return goods_resultClass;
	}

	public void setGoods_resultClass(GoodsVO goods_resultClass) {
		this.goods_resultClass = goods_resultClass;
	}

	public String getREV_goods_name() {
		return REV_goods_name;
	}

	public void setREV_goods_name(String REV_goods_name) {
		this.REV_goods_name = REV_goods_name;
	}

	public String getREV_goods_img() {
		return REV_goods_img;
	}

	public void setREV_goods_img(String REV_goods_img) {
		this.REV_goods_img = REV_goods_img;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	

}

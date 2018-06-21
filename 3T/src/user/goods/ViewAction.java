package user.goods;

import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import user.qa.QaVO;
import user.review.ReviewVO;

public class ViewAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<GoodsVO> rplist = new ArrayList<GoodsVO>();
	private List<GoodsVO> list = new ArrayList<GoodsVO>();
	private List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
	private List<QaVO> qaList = new ArrayList<QaVO>();

	private GoodsVO paramClass = new GoodsVO();
	private GoodsVO resultClass = new GoodsVO();
	private ReviewVO reviewClass = new ReviewVO();
	private QaVO qaClass = new QaVO();


	private int currentPage = 0;

	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	private int Goods_no;

	// 받아올 리뷰 정보
	private int REV_no;
	private String REV_subject;
	private String REV_name;
	private String REV_passwd;
	private String REV_content;
	private String REV_file_orgname;
	private String REV_file_savname;
	private int REV_readcnt;
	private Date REV_regdate;
	private int REV_ref;
	private int REV_re_step;
	private int REV_re_level;
	private String REV_member_id;
	private int REV_goods_no;
	Calendar today = Calendar.getInstance();

	// 받아올 qna 정보
	private int qa_no;
	private String qa_special_no;
	private String qa_subject;
	private String qa_name;
	private String qa_passwd;
	private String qa_content;
	private int qa_readcnt;
	private Date qa_regdate;
	private int qa_ref;
	private int qa_re_step;
	private int qa_re_level;
	private int qa_level;
	private String qa_file_orgname;
	private String qa_file_savname;
	private String qa_make_public;
	private int qa_category_no;
	private String qa_member_id;

	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	// 占쏢세븝옙占쏙옙
	public String execute() throws Exception {

		paramClass.setGoods_no(getGoods_no());

		sqlMapper.update("goods-updateReadcnt", paramClass);

		list = sqlMapper.queryForList("review-selectAll2", getGoods_no());

		qaList = sqlMapper.queryForList("qaView-selectAll2", getGoods_no());

		resultClass = (GoodsVO) sqlMapper.queryForObject("goods-selectOne", getGoods_no());

		rplist = sqlMapper.queryForList("goods-selectRP", getGoods_no());

		return SUCCESS;
	}

	public void setReviewClass(ReviewVO reviewClass) {
		this.reviewClass = reviewClass;
	}

	public String reviewWrite() throws Exception {

		reviewClass.setREV_no(getREV_no());
		reviewClass.setREV_subject(getREV_subject());
		reviewClass.setREV_content(getREV_content());

		reviewClass.setREV_regdate(today.getTime());
		sdf.format(REV_regdate);
		System.out.println(sdf.format(today.getTime()));
		reviewClass.setREV_regdate(REV_regdate);

		reviewClass.setREV_goods_no(getREV_goods_no());

		sqlMapper.insert("user.review.Review_Write", reviewClass);

		return SUCCESS;

	}

	public String ModifyAction() throws Exception {

		return SUCCESS;
	}

	public String DeleteAction() throws Exception {

		System.out.println("~~" + getREV_no());
		// 해당 번호의 글을 가져온다
		reviewClass = (ReviewVO) sqlMapper.queryForObject("review-selectOne", getREV_no());
		// 삭제할 항목 설정
		reviewClass.setREV_no(getREV_no());
		// 삭제 쿼리 수행
		sqlMapper.update("user.review.Review_DeleteAction", reviewClass);
		return SUCCESS;
	}

	public String qaWrite() throws Exception {

		qaClass.setQA_NO(getQa_no());
		qaClass.setQA_SUBJECT(getQa_subject());
		qaClass.setQA_CONTENT(getQa_content());

		reviewClass.setREV_regdate(today.getTime());
		sdf.format(qa_regdate);
		System.out.println(sdf.format(today.getTime()));
		reviewClass.setREV_regdate(qa_regdate);

		qaClass.setQA_NO(getGoods_no());

		sqlMapper.insert("user.qa.qa_writeCommentAction", qaClass);

		return SUCCESS;
	}

	public String DeleteAction1() throws Exception {

		System.out.println("~~" + getQa_no());
		// 해당 번호의 글을 가져온다
		qaClass = (QaVO) sqlMapper.queryForObject("qa.qaView", getQa_no());
		// 삭제할 항목 설정
		qaClass.setQA_NO(getQa_no());
		// 삭제 쿼리 수행
		sqlMapper.update("user.qa.qa_deleteAction1", qaClass);
		return SUCCESS;
	}

	public int getGoods_no() {
		return Goods_no;
	}

	public void setGoods_no(int goods_no) {
		Goods_no = goods_no;
	}

	public GoodsVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(GoodsVO paramClass) {
		this.paramClass = paramClass;
	}

	public GoodsVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(GoodsVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<GoodsVO> getRplist() {
		return rplist;
	}

	public void setRplist(List<GoodsVO> rplist) {
		this.rplist = rplist;
	}

	public List<GoodsVO> getList() {
		return list;
	}

	public void setList(List<GoodsVO> list) {
		this.list = list;
	}

	public List<ReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public List<QaVO> getQaList() {
		return qaList;
	}

	public void setQaList(List<QaVO> qaList) {
		this.qaList = qaList;
	}

	public QaVO getQaClass() {
		return qaClass;
	}

	public void setQaClass(QaVO qaClass) {
		this.qaClass = qaClass;
	}

	public int getREV_no() {
		return REV_no;
	}

	public void setREV_no(int rEV_no) {
		REV_no = rEV_no;
	}

	public String getREV_subject() {
		return REV_subject;
	}

	public void setREV_subject(String rEV_subject) {
		REV_subject = rEV_subject;
	}

	public String getREV_name() {
		return REV_name;
	}

	public void setREV_name(String rEV_name) {
		REV_name = rEV_name;
	}

	public String getREV_passwd() {
		return REV_passwd;
	}

	public void setREV_passwd(String rEV_passwd) {
		REV_passwd = rEV_passwd;
	}

	public String getREV_content() {
		return REV_content;
	}

	public void setREV_content(String rEV_content) {
		REV_content = rEV_content;
	}

	public String getREV_file_orgname() {
		return REV_file_orgname;
	}

	public void setREV_file_orgname(String rEV_file_orgname) {
		REV_file_orgname = rEV_file_orgname;
	}

	public String getREV_file_savname() {
		return REV_file_savname;
	}

	public void setREV_file_savname(String rEV_file_savname) {
		REV_file_savname = rEV_file_savname;
	}

	public int getREV_readcnt() {
		return REV_readcnt;
	}

	public void setREV_readcnt(int rEV_readcnt) {
		REV_readcnt = rEV_readcnt;
	}

	public Date getREV_regdate() {
		return REV_regdate;
	}

	public void setREV_regdate(Date rEV_regdate) {
		REV_regdate = rEV_regdate;
	}

	public int getREV_ref() {
		return REV_ref;
	}

	public void setREV_ref(int rEV_ref) {
		REV_ref = rEV_ref;
	}

	public int getREV_re_step() {
		return REV_re_step;
	}

	public void setREV_re_step(int rEV_re_step) {
		REV_re_step = rEV_re_step;
	}

	public int getREV_re_level() {
		return REV_re_level;
	}

	public void setREV_re_level(int rEV_re_level) {
		REV_re_level = rEV_re_level;
	}

	public String getREV_member_id() {
		return REV_member_id;
	}

	public void setREV_member_id(String rEV_member_id) {
		REV_member_id = rEV_member_id;
	}

	public int getREV_goods_no() {
		return REV_goods_no;
	}

	public void setREV_goods_no(int rEV_goods_no) {
		REV_goods_no = rEV_goods_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public String getQa_special_no() {
		return qa_special_no;
	}

	public void setQa_special_no(String qa_special_no) {
		this.qa_special_no = qa_special_no;
	}

	public String getQa_subject() {
		return qa_subject;
	}

	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}

	public String getQa_name() {
		return qa_name;
	}

	public void setQa_name(String qa_name) {
		this.qa_name = qa_name;
	}

	public String getQa_passwd() {
		return qa_passwd;
	}

	public void setQa_passwd(String qa_passwd) {
		this.qa_passwd = qa_passwd;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public int getQa_readcnt() {
		return qa_readcnt;
	}

	public void setQa_readcnt(int qa_readcnt) {
		this.qa_readcnt = qa_readcnt;
	}

	public Date getQa_regdate() {
		return qa_regdate;
	}

	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}

	public int getQa_ref() {
		return qa_ref;
	}

	public void setQa_ref(int qa_ref) {
		this.qa_ref = qa_ref;
	}

	public int getQa_re_step() {
		return qa_re_step;
	}

	public void setQa_re_step(int qa_re_step) {
		this.qa_re_step = qa_re_step;
	}

	public int getQa_re_level() {
		return qa_re_level;
	}

	public void setQa_re_level(int qa_re_level) {
		this.qa_re_level = qa_re_level;
	}

	public int getQa_level() {
		return qa_level;
	}

	public void setQa_level(int qa_level) {
		this.qa_level = qa_level;
	}

	public String getQa_file_orgname() {
		return qa_file_orgname;
	}

	public void setQa_file_orgname(String qa_file_orgname) {
		this.qa_file_orgname = qa_file_orgname;
	}

	public String getQa_file_savname() {
		return qa_file_savname;
	}

	public void setQa_file_savname(String qa_file_savname) {
		this.qa_file_savname = qa_file_savname;
	}

	public String getQa_make_public() {
		return qa_make_public;
	}

	public void setQa_make_public(String qa_make_public) {
		this.qa_make_public = qa_make_public;
	}

	public int getQa_category_no() {
		return qa_category_no;
	}

	public void setQa_category_no(int qa_category_no) {
		this.qa_category_no = qa_category_no;
	}

	public String getQa_member_id() {
		return qa_member_id;
	}

	public void setQa_member_id(String qa_member_id) {
		this.qa_member_id = qa_member_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public ReviewVO getReviewClass() {
		return reviewClass;
	}

}
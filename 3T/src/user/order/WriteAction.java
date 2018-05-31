package user.order;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WriteAction extends ActionSupport {
	
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private OrderVO paramClass; //파라미터를 저장할 객체
	private OrderVO resultClass; //쿼리 결과 값을 저장할 객체

	private List<OrderVO> list = new ArrayList<OrderVO>();;	 
	
	private int totalCount; // 총 게시물의 수
	
	private String ORDER_NAME;
	private String ORDER_ZIPCODE;
	private String ORDER_ADDRESS1;
	private String ORDER_ADDRESS2;
	private String ORDER_PHONE1;
	private String ORDER_PHONE2;
	private String ORDER_PHONE3;
	private String ORDER_EMAIL1;
	private String ORDER_EMAIL2;
	private String RECIPIENT_CHOICE;
	private String RECIPIENT_NAME;
	private String RECIPIENT_ZIPCODE;
	private String RECIPIENT_PHONE1;
	private String RECIPIENT_PHONE2;
	private String RECIPIENT_PHONE3;
	private String RECIPIENT_ADDRESS1;
	private String RECIPIENT_ADDRESS2;
	private String PAYMENT;
	private String DEPOSIT_NAME;
	private String DEPOSIT_BANK;
	private Date ORDER_REGDATE;
	private int ORDER_TOTAL;
	private int ORDER_PRICE;
	private String ORDER_MEMBER_ID;
	private String ORDER_GOODS_NO;
	private String ORDER_GOODS_INFO;
	private int ORDER_GOODS_COUNT;
	Calendar today = Calendar.getInstance(); //오늘 날짜 구하기.
	
	// 생성자
	public WriteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시판 LIST 액션
	public String form() throws Exception {
		// 모든 글을 가져와 list에 넣는다.
		list = sqlMapper.queryForList("order-selectAll");
		totalCount = list.size(); // 전체 글 갯수를 구한다.
		return SUCCESS;
	}
	public String execute() throws Exception {

		//파라미터와 리절트 객체 생성.
		paramClass = new OrderVO();
		resultClass = new OrderVO();

		// 등록할 항목 설정.
		//paramClass.setSubject(getSubject());
		//paramClass.setRegdate(today.getTime());
		paramClass.setORDER_NAME(getORDER_NAME());
		paramClass.setORDER_ZIPCODE(getORDER_ZIPCODE());
		paramClass.setORDER_ADDRESS1(getORDER_ADDRESS1());
		paramClass.setORDER_ADDRESS2(getORDER_ADDRESS2());
		paramClass.setORDER_PHONE1(getORDER_PHONE1());
		paramClass.setORDER_PHONE2(getORDER_PHONE2());
		paramClass.setORDER_PHONE3(getORDER_PHONE3());
		paramClass.setORDER_EMAIL1(getORDER_EMAIL1());
		paramClass.setORDER_EMAIL2(getORDER_EMAIL2());
		paramClass.setRECIPIENT_CHOICE(getRECIPIENT_CHOICE());
		paramClass.setRECIPIENT_NAME(getRECIPIENT_NAME());
		paramClass.setRECIPIENT_ZIPCODE(getRECIPIENT_ZIPCODE());
		paramClass.setRECIPIENT_ADDRESS1(getRECIPIENT_ADDRESS1());
		paramClass.setRECIPIENT_ADDRESS2(getRECIPIENT_ADDRESS2());
		paramClass.setRECIPIENT_PHONE1(getRECIPIENT_PHONE1());
		paramClass.setRECIPIENT_PHONE2(getRECIPIENT_PHONE2());
		paramClass.setRECIPIENT_PHONE3(getRECIPIENT_PHONE3());
		paramClass.setPAYMENT(getPAYMENT());
		paramClass.setDEPOSIT_NAME(getDEPOSIT_NAME());
		paramClass.setDEPOSIT_BANK(getDEPOSIT_BANK());
		paramClass.setORDER_REGDATE(today.getTime());
		paramClass.setORDER_TOTAL(getORDER_TOTAL());
		paramClass.setORDER_MEMBER_ID(getORDER_MEMBER_ID());
		paramClass.setORDER_GOODS_NO(getORDER_GOODS_NO());
		paramClass.setORDER_GOODS_INFO(getORDER_GOODS_INFO());
		paramClass.setORDER_GOODS_COUNT(getORDER_GOODS_COUNT());
		
		
		// 등록 쿼리 수행.
		sqlMapper.insert("order-insertBoard", paramClass);
		return SUCCESS;
	}
	public List<OrderVO> getList() {
		return list;
	}

	public void setList(List<OrderVO> list) {
		this.list = list;
	}

	public String getORDER_NAME() {
		return ORDER_NAME;
	}

	public void setORDER_NAME(String oRDER_NAME) {
		ORDER_NAME = oRDER_NAME;
	}

	public String getORDER_ZIPCODE() {
		return ORDER_ZIPCODE;
	}

	public void setORDER_ZIPCODE(String oRDER_ZIPCODE) {
		ORDER_ZIPCODE = oRDER_ZIPCODE;
	}

	

	
	public String getRECIPIENT_CHOICE() {
		return RECIPIENT_CHOICE;
	}

	public void setRECIPIENT_CHOICE(String rECIPIENT_CHOICE) {
		RECIPIENT_CHOICE = rECIPIENT_CHOICE;
	}

	public String getRECIPIENT_NAME() {
		return RECIPIENT_NAME;
	}

	public void setRECIPIENT_NAME(String rECIPIENT_NAME) {
		RECIPIENT_NAME = rECIPIENT_NAME;
	}

	public String getRECIPIENT_ZIPCODE() {
		return RECIPIENT_ZIPCODE;
	}

	public void setRECIPIENT_ZIPCODE(String rECIPIENT_ZIPCODE) {
		RECIPIENT_ZIPCODE = rECIPIENT_ZIPCODE;
	}

	public String getPAYMENT() {
		return PAYMENT;
	}

	public void setPAYMENT(String pAYMENT) {
		PAYMENT = pAYMENT;
	}

	public String getDEPOSIT_NAME() {
		return DEPOSIT_NAME;
	}

	public void setDEPOSIT_NAME(String dEPOSIT_NAME) {
		DEPOSIT_NAME = dEPOSIT_NAME;
	}

	public String getDEPOSIT_BANK() {
		return DEPOSIT_BANK;
	}

	public void setDEPOSIT_BANK(String dEPOSIT_BANK) {
		DEPOSIT_BANK = dEPOSIT_BANK;
	}

	public Date getORDER_REGDATE() {
		return ORDER_REGDATE;
	}

	public void setORDER_REGDATE(Date oRDER_REGDATE) {
		ORDER_REGDATE = oRDER_REGDATE;
	}


	public int getORDER_TOTAL() {
		return ORDER_TOTAL;
	}

	public void setORDER_TOTAL(int oRDER_TOTAL) {
		ORDER_TOTAL = oRDER_TOTAL;
	}

	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}

	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}

	public String getORDER_MEMBER_ID() {
		return ORDER_MEMBER_ID;
	}

	public void setORDER_MEMBER_ID(String oRDER_MEMBER_ID) {
		ORDER_MEMBER_ID = oRDER_MEMBER_ID;
	}

	public String getORDER_GOODS_NO() {
		return ORDER_GOODS_NO;
	}

	public void setORDER_GOODS_NO(String oRDER_GOODS_No) {
		ORDER_GOODS_NO = oRDER_GOODS_No;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
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

	public OrderVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(OrderVO paramClass) {
		this.paramClass = paramClass;
	}

	public OrderVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(OrderVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getORDER_ADDRESS1() {
		return ORDER_ADDRESS1;
	}

	public void setORDER_ADDRESS1(String oRDER_ADDRESS1) {
		ORDER_ADDRESS1 = oRDER_ADDRESS1;
	}

	public String getORDER_ADDRESS2() {
		return ORDER_ADDRESS2;
	}

	public void setORDER_ADDRESS2(String oRDER_ADDRESS2) {
		ORDER_ADDRESS2 = oRDER_ADDRESS2;
	}

	public String getRECIPIENT_ADDRESS1() {
		return RECIPIENT_ADDRESS1;
	}

	public void setRECIPIENT_ADDRESS1(String rECIPIENT_ADDRESS1) {
		RECIPIENT_ADDRESS1 = rECIPIENT_ADDRESS1;
	}

	public String getRECIPIENT_ADDRESS2() {
		return RECIPIENT_ADDRESS2;
	}

	public void setRECIPIENT_ADDRESS2(String rECIPIENT_ADDRESS2) {
		RECIPIENT_ADDRESS2 = rECIPIENT_ADDRESS2;
	}

	public String getORDER_PHONE1() {
		return ORDER_PHONE1;
	}

	public void setORDER_PHONE1(String oRDER_PHONE1) {
		ORDER_PHONE1 = oRDER_PHONE1;
	}

	public String getORDER_PHONE2() {
		return ORDER_PHONE2;
	}

	public void setORDER_PHONE2(String oRDER_PHONE2) {
		ORDER_PHONE2 = oRDER_PHONE2;
	}

	public String getORDER_PHONE3() {
		return ORDER_PHONE3;
	}

	public void setORDER_PHONE3(String oRDER_PHONE3) {
		ORDER_PHONE3 = oRDER_PHONE3;
	}

	public String getORDER_EMAIL1() {
		return ORDER_EMAIL1;
	}

	public void setORDER_EMAIL1(String oRDER_EMAIL1) {
		ORDER_EMAIL1 = oRDER_EMAIL1;
	}

	public String getORDER_EMAIL2() {
		return ORDER_EMAIL2;
	}

	public void setORDER_EMAIL2(String oRDER_EMAIL2) {
		ORDER_EMAIL2 = oRDER_EMAIL2;
	}

	public String getRECIPIENT_PHONE1() {
		return RECIPIENT_PHONE1;
	}

	public void setRECIPIENT_PHONE1(String rECIPIENT_PHONE1) {
		RECIPIENT_PHONE1 = rECIPIENT_PHONE1;
	}

	public String getRECIPIENT_PHONE2() {
		return RECIPIENT_PHONE2;
	}

	public void setRECIPIENT_PHONE2(String rECIPIENT_PHONE2) {
		RECIPIENT_PHONE2 = rECIPIENT_PHONE2;
	}

	public String getRECIPIENT_PHONE3() {
		return RECIPIENT_PHONE3;
	}

	public void setRECIPIENT_PHONE3(String rECIPIENT_PHONE3) {
		RECIPIENT_PHONE3 = rECIPIENT_PHONE3;
	}

	public String getORDER_GOODS_INFO() {
		return ORDER_GOODS_INFO;
	}

	public void setORDER_GOODS_INFO(String oRDER_GOODS_INFO) {
		ORDER_GOODS_INFO = oRDER_GOODS_INFO;
	}

	public int getORDER_GOODS_COUNT() {
		return ORDER_GOODS_COUNT;
	}

	public void setORDER_GOODS_COUNT(int oRDER_GOODS_COUNT) {
		ORDER_GOODS_COUNT = oRDER_GOODS_COUNT;
	}


}
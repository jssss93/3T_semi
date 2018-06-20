package user.order;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.basket.BasketVO;
import admin.goods.VO.GoodsVO;
import admin.member.VO.MemberVO;
import user.qa.QaVO;
import user.wishlist.WishlistVO;

public class WriteAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private OrderVO paramClass;
	private OrderVO resultClass;

	private MemberVO m_paramClass = new MemberVO();
	private MemberVO m_resultClass = new MemberVO();
	
	public Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	private List<BasketVO> B_List = new ArrayList<BasketVO>();
	private List basket_List=new ArrayList();

	private int basket_Pay_List;
	private int basket_PayTotal_List;
	private int basket_PayGOODS_COUNT;
	
	private static int PayList_price;
	private static int PayList_Total;
	private static int PayList_totalCount;

	private String ORDER_NAME;
	private String ORDER_ZIPCODE;
	private String ORDER_ADDRESS1;
	private String ORDER_ADDRESS2;
	private String ORDER_PHONE1;
	private String ORDER_PHONE2;
	private String ORDER_PHONE3;
	private String ORDER_EMAIL1;
	private String ORDER_EMAIL2;

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
	private String ORDER_TOTAL;
	private int ORDER_PRICE;
	private String ORDER_MEMBER_ID;
	private String ORDER_GOODS_NO;
	private String ORDER_GOODS_NAME;
	private String ORDER_GOODS_COUNT;
	private String ORDER_IMG;
	private String ORDER_STATE;
	Calendar today = Calendar.getInstance();
	
	private Integer PayTotal_List;
	private Integer Pay_List;
	private Integer Pay_GOODS_COUNT;
	
	
	private String[] chk;
	private static String[] writechk;
	
	private int basket_no;
	private GoodsVO goods_paramClass =new GoodsVO();
	private GoodsVO goods_resultClass=new GoodsVO();
	private int goods_no;
	private BasketVO basket_paramClass = new BasketVO();
	private BasketVO basket_resultClass = new BasketVO();
	private int BASKET_NO; // 상품 번호
	private int a; //상품 가격
	private int b; //총 가격
	private int c; //수량
	public WriteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String paylist() throws Exception{
		a=PayList_price;
		b=PayList_Total;
		c=PayList_totalCount;
		return SUCCESS;
	}
	public String form() throws Exception {

		System.out.println("!!!!!!!(getChk()!!!!!!!"+getChk());
		
		writechk=getChk();
		if (getChk() != null) {
			for (int i = 0; i < this.getChk().length; i++) {
				
				String chkValue =this.getChk()[i];
				B_List = sqlMapper.queryForList("basket-orderselect", Integer.parseInt(chkValue));
				Pay_List = (int)sqlMapper.queryForObject("basket-pay_or",Integer.parseInt(chkValue));
		  		PayTotal_List = (int) sqlMapper.queryForObject("basket-paytotal_or",Integer.parseInt(chkValue));
		  		Pay_GOODS_COUNT = (int) sqlMapper.queryForObject("basket-paygoodscount",Integer.parseInt(chkValue));
		  		
				basket_List.addAll(B_List);
				basket_Pay_List=Pay_List+basket_Pay_List;
				basket_PayTotal_List=PayTotal_List+basket_PayTotal_List;
				basket_PayGOODS_COUNT=Pay_GOODS_COUNT+basket_PayGOODS_COUNT;
			}
		} else {
			B_List = sqlMapper.queryForList("basket-orderselect", getBasket_no());
		}
		PayList_price=basket_Pay_List;
		PayList_Total=basket_PayTotal_List;
		PayList_totalCount=basket_PayGOODS_COUNT;
		
		m_paramClass.setM_id(ActionContext.getContext().getSession().get("M_ID").toString());
		m_resultClass = (MemberVO) sqlMapper.queryForObject("AMselectOne_ID", m_paramClass);
		
	
		return SUCCESS;
	}
	
	public int getBasket_PayGOODS_COUNT() {
		return basket_PayGOODS_COUNT;
	}

	public void setBasket_PayGOODS_COUNT(int basket_PayGOODS_COUNT) {
		this.basket_PayGOODS_COUNT = basket_PayGOODS_COUNT;
	}

	public static int getPayList_totalCount() {
		return PayList_totalCount;
	}

	public static void setPayList_totalCount(int payList_totalCount) {
		PayList_totalCount = payList_totalCount;
	}

	public Integer getPay_GOODS_COUNT() {
		return Pay_GOODS_COUNT;
	}

	public void setPay_GOODS_COUNT(Integer pay_GOODS_COUNT) {
		Pay_GOODS_COUNT = pay_GOODS_COUNT;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getPayList_price() {
		return PayList_price;
	}

	public void setPayList_price(int payList_price) {
		PayList_price = payList_price;
	}

	public int getPayList_Total() {
		return PayList_Total;
	}

	public void setPayList_Total(int payList_Total) {
		PayList_Total = payList_Total;
	}

	public int getBasket_Pay_List() {
		return basket_Pay_List;
	}

	public void setBasket_Pay_List(int basket_Pay_List) {
		this.basket_Pay_List = basket_Pay_List;
	}

	public int getBasket_PayTotal_List() {
		return basket_PayTotal_List;
	}

	public void setBasket_PayTotal_List(int basket_PayTotal_List) {
		this.basket_PayTotal_List = basket_PayTotal_List;
	}

	public List getBasket_List() {
		return basket_List;
	}

	public void setBasket_List(List basket_List) {
		this.basket_List = basket_List;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public String execute() throws Exception {
		paramClass = new OrderVO();
		resultClass = new OrderVO();
		String write_goods_name = "";
		String write_goods_no = "";
		String write_goods_count = "";
		String write_goods_img = "";
		String write_goods_total = "";
		System.out.println("writechk!!!" + writechk);
		if (writechk != null) {
				for (int i = 0; i < this.writechk.length; i++) {
					
					String chkValue1 =this.writechk[i];
					System.out.println("!!!!!!!(chkValue1@@@@@@@@@2"+chkValue1);
					B_List = sqlMapper.queryForList("basket-orderselect", Integer.parseInt(chkValue1));
					System.out.println("!!!!!!!!"+B_List.size());
										
						BasketVO test=(BasketVO) B_List.get(0);
						write_goods_name= write_goods_name+test.getBASKET_NAME()+",";
						write_goods_no= write_goods_no+test.getBASKET_GOODS_NO()+",";
						write_goods_count=write_goods_count+test.getBASKET_QUANTITY()+",";
						write_goods_img=write_goods_img+test.getBASKET_GOODS_IMG()+",";
						write_goods_total=write_goods_total+test.getBASKET_GOODS_AMOUNT()*test.getBASKET_QUANTITY()+",";
				}
				paramClass.setORDER_NAME(getORDER_NAME());
				paramClass.setORDER_ZIPCODE(getORDER_ZIPCODE());
				paramClass.setORDER_ADDRESS1(getORDER_ADDRESS1());
				paramClass.setORDER_ADDRESS2(getORDER_ADDRESS2());
				paramClass.setORDER_PHONE1(getORDER_PHONE1());
				paramClass.setORDER_PHONE2(getORDER_PHONE2());
				paramClass.setORDER_PHONE3(getORDER_PHONE3());
				paramClass.setORDER_EMAIL1(getORDER_EMAIL1());
				paramClass.setORDER_EMAIL2(getORDER_EMAIL2());

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
				paramClass.setORDER_TOTAL(write_goods_total);
				paramClass.setORDER_MEMBER_ID(getORDER_MEMBER_ID());
				paramClass.setORDER_GOODS_NO(write_goods_no);
				paramClass.setORDER_GOODS_NAME(write_goods_name);
				paramClass.setORDER_GOODS_COUNT(write_goods_count);
				paramClass.setORDER_IMG(write_goods_img);
				paramClass.setORDER_STATE(getORDER_STATE());

				sqlMapper.insert("order-insertBoard", paramClass);
	} 
		paramClass.setORDER_NAME(getORDER_NAME());
		paramClass.setORDER_ZIPCODE(getORDER_ZIPCODE());
		paramClass.setORDER_ADDRESS1(getORDER_ADDRESS1());
		paramClass.setORDER_ADDRESS2(getORDER_ADDRESS2());
		paramClass.setORDER_PHONE1(getORDER_PHONE1());
		paramClass.setORDER_PHONE2(getORDER_PHONE2());
		paramClass.setORDER_PHONE3(getORDER_PHONE3());
		paramClass.setORDER_EMAIL1(getORDER_EMAIL1());
		paramClass.setORDER_EMAIL2(getORDER_EMAIL2());

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
		paramClass.setORDER_GOODS_NAME(getORDER_GOODS_NAME());
		paramClass.setORDER_GOODS_COUNT(getORDER_GOODS_COUNT());
		paramClass.setORDER_IMG(getORDER_IMG());
		paramClass.setORDER_STATE(getORDER_STATE());

		sqlMapper.insert("order-insertBoard", paramClass);
		

		return SUCCESS;
	}

	public static String[] getWritechk() {
		return writechk;
	}

	public static void setWritechk(String[] writechk) {
		WriteAction.writechk = writechk;
	}

	public BasketVO getBasket_paramClass() {
		return basket_paramClass;
	}

	public void setBasket_paramClass(BasketVO basket_paramClass) {
		this.basket_paramClass = basket_paramClass;
	}

	public BasketVO getBasket_resultClass() {
		return basket_resultClass;
	}

	public void setBasket_resultClass(BasketVO basket_resultClass) {
		this.basket_resultClass = basket_resultClass;
	}

	public int getBASKET_NO() {
		return BASKET_NO;
	}

	public void setBASKET_NO(int bASKET_NO) {
		BASKET_NO = bASKET_NO;
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

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String[] getChk() {
		return chk;
	}

	public void setChk(String[] chk) {
		this.chk = chk;
	}

	public Integer getPayTotal_List() {
		return PayTotal_List;
	}

	public void setPayTotal_List(Integer payTotal_List) {
		PayTotal_List = payTotal_List;
	}

	public Integer getPay_List() {
		return Pay_List;
	}

	public void setPay_List(Integer pay_List) {
		Pay_List = pay_List;
	}

	public MemberVO getM_paramClass() {
		return m_paramClass;
	}

	public void setM_paramClass(MemberVO m_paramClass) {
		this.m_paramClass = m_paramClass;
	}

	public MemberVO getM_resultClass() {
		return m_resultClass;
	}

	public void setM_resultClass(MemberVO m_resultClass) {
		this.m_resultClass = m_resultClass;
	}

	public String getORDER_STATE() {
		return ORDER_STATE;
	}

	public void setORDER_STATE(String oRDER_STATE) {
		ORDER_STATE = oRDER_STATE;
	}

	public List<BasketVO> getB_List() {
		return B_List;
	}

	public void setB_List(List<BasketVO> b_List) {
		B_List = b_List;
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

	public String getORDER_IMG() {
		return ORDER_IMG;
	}

	public void setORDER_IMG(String oRDER_IMG) {
		ORDER_IMG = oRDER_IMG;
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

	public String getORDER_TOTAL() {
		return ORDER_TOTAL;
	}

	public void setORDER_TOTAL(String oRDER_TOTAL) {
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

	public void setORDER_GOODS_NO(String oRDER_GOODS_NO) {
		ORDER_GOODS_NO = oRDER_GOODS_NO;
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

	public String getORDER_GOODS_NAME() {
		return ORDER_GOODS_NAME;
	}

	public void setORDER_GOODS_NAME(String oRDER_GOODS_NAME) {
		ORDER_GOODS_NAME = oRDER_GOODS_NAME;
	}

	public String getORDER_GOODS_COUNT() {
		return ORDER_GOODS_COUNT;
	}

	public void setORDER_GOODS_COUNT(String oRDER_GOODS_COUNT) {
		ORDER_GOODS_COUNT = oRDER_GOODS_COUNT;
	}


}
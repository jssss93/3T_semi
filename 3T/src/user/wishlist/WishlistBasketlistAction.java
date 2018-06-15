package user.wishlist;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.basket.VO.BasketVO;
import admin.goods.VO.GoodsVO;




public class WishlistBasketlistAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private WishlistVO W_paramClass;
	private WishlistVO W_resultClass;
	
	private BasketVO b_paramClass;
	private BasketVO b_resultClass;
	public Map session;

	private int W_NO;
	private String W_MEMBER_ID;//사용자 ID 
	private String W_GOODS_NAME;//상품명
	private int  W_GOODS_AMOUNT;//상품가격
	private String W_GOODS_IMG;//이미지
	private int  W_TOTAL;//총가격
	private int W_GOODS_NO;//상품 번호
	private String W_GOODS_SIZE;//사이즈
	private String W_GOODS_COLOR;//컬러
	
	private String[] chk;
	
	public WishlistBasketlistAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String execute() throws Exception {
		
		System.out.println("wishlist에서 basket으로 gogo");
		//파라미터와 리절트 객체 생성.
		W_paramClass = new WishlistVO();
		W_resultClass = new WishlistVO();
		
		b_paramClass=new BasketVO();
		b_resultClass=new BasketVO();

		/*W_paramClass.setW_NO(getW_NO());
		W_resultClass = (WishlistVO) sqlMapper.queryForObject("wishlist-selectone", getW_NO());*/
		System.out.println("getChk() "+getChk());
		System.out.println("W_resultClass "+W_resultClass);
		
		if (getChk() != null) {
			for (int i = 0; i < this.getChk().length; i++) {
				String chkValue = this.getChk()[i];
				W_paramClass.setW_NO(Integer.parseInt(chkValue));
				W_resultClass = (WishlistVO)sqlMapper.queryForObject("wishlist-selectone",W_paramClass.getW_NO());
				
				// 등록할 항목 설정.
				b_paramClass.setBasket_member_id(W_resultClass.getW_MEMBER_ID());
				b_paramClass.setBasket_name(W_resultClass.getW_GOODS_NAME());
				b_paramClass.setBasket_goods_amount(W_resultClass.getW_GOODS_AMOUNT());
				b_paramClass.setBasket_goods_img(W_resultClass.getW_GOODS_IMG());
				b_paramClass.setBasket_quantity(W_resultClass.getW_TOTAL());//수량
				b_paramClass.setBasket_goods_no(W_resultClass.getW_GOODS_NO());
				b_paramClass.setBasket_goods_size(W_resultClass.getW_GOODS_SIZE());
				b_paramClass.setBasket_goods_color(W_resultClass.getW_GOODS_COLOR());

				System.out.println("getW_MEMBER_ID "+W_resultClass.getW_MEMBER_ID());
				System.out.println("wishlist에서 basket으로 gogob_paramClass"+b_paramClass);
				// 등록 쿼리 수행.
				sqlMapper.insert("insertBasket", b_paramClass);

			}
		} else {
			W_resultClass = (WishlistVO) sqlMapper.queryForObject("wishlist-selectone", getW_NO());
		}
		
		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String[] getChk() {
		return chk;
	}

	public void setChk(String[] chk) {
		this.chk = chk;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		WishlistBasketlistAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		WishlistBasketlistAction.sqlMapper = sqlMapper;
	}

	public WishlistVO getW_paramClass() {
		return W_paramClass;
	}

	public void setW_paramClass(WishlistVO w_paramClass) {
		W_paramClass = w_paramClass;
	}

	public WishlistVO getW_resultClass() {
		return W_resultClass;
	}

	public void setW_resultClass(WishlistVO w_resultClass) {
		W_resultClass = w_resultClass;
	}

	public BasketVO getB_paramClass() {
		return b_paramClass;
	}

	public void setB_paramClass(BasketVO b_paramClass) {
		this.b_paramClass = b_paramClass;
	}

	public BasketVO getB_resultClass() {
		return b_resultClass;
	}

	public void setB_resultClass(BasketVO b_resultClass) {
		this.b_resultClass = b_resultClass;
	}

	public int getW_NO() {
		return W_NO;
	}

	public void setW_NO(int w_NO) {
		W_NO = w_NO;
	}

	public String getW_MEMBER_ID() {
		return W_MEMBER_ID;
	}

	public void setW_MEMBER_ID(String w_MEMBER_ID) {
		W_MEMBER_ID = w_MEMBER_ID;
	}

	public String getW_GOODS_NAME() {
		return W_GOODS_NAME;
	}

	public void setW_GOODS_NAME(String w_GOODS_NAME) {
		W_GOODS_NAME = w_GOODS_NAME;
	}

	public int getW_GOODS_AMOUNT() {
		return W_GOODS_AMOUNT;
	}

	public void setW_GOODS_AMOUNT(int w_GOODS_AMOUNT) {
		W_GOODS_AMOUNT = w_GOODS_AMOUNT;
	}

	public String getW_GOODS_IMG() {
		return W_GOODS_IMG;
	}

	public void setW_GOODS_IMG(String w_GOODS_IMG) {
		W_GOODS_IMG = w_GOODS_IMG;
	}

	public int getW_TOTAL() {
		return W_TOTAL;
	}

	public void setW_TOTAL(int w_TOTAL) {
		W_TOTAL = w_TOTAL;
	}

	public int getW_GOODS_NO() {
		return W_GOODS_NO;
	}

	public void setW_GOODS_NO(int w_GOODS_NO) {
		W_GOODS_NO = w_GOODS_NO;
	}

	public String getW_GOODS_SIZE() {
		return W_GOODS_SIZE;
	}

	public void setW_GOODS_SIZE(String w_GOODS_SIZE) {
		W_GOODS_SIZE = w_GOODS_SIZE;
	}

	public String getW_GOODS_COLOR() {
		return W_GOODS_COLOR;
	}

	public void setW_GOODS_COLOR(String w_GOODS_COLOR) {
		W_GOODS_COLOR = w_GOODS_COLOR;
	}

	
	
}

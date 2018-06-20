package user.goods;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.basket.VO.BasketVO;
import admin.goods.VO.GoodsVO;
import admin.member.VO.MemberVO;

public class AddCartAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public Map session;

	private List<GoodsVO> G_List = new ArrayList<GoodsVO>();
	private List<MemberVO> M_List = new ArrayList<MemberVO>();

	private MemberVO m_paramClass = new MemberVO();
	private MemberVO m_resultClass = new MemberVO();

	private GoodsVO g_paramClass = new GoodsVO();
	private GoodsVO g_resultClass = new GoodsVO();

	private BasketVO b_paramClass = new BasketVO();

	private List<BasketVO> B_List = new ArrayList<BasketVO>();
	
	private int PayTotal_List;
	private int Pay_List ;
	
	private int sgoods_cnt;
	private String sgoods_size;
	private String m_id;
	private int goods_no;
	private int basket_quantity;

	public AddCartAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {

		/*
		 * m_paramClass.setM_id(ActionContext.getContext().getSession().get("M_ID").
		 * toString()); m_resultClass = (MemberVO)
		 * sqlMapper.queryForObject("AMselectOne_ID", m_paramClass);
		 */
		/*
		 * g_paramClass.setGoods_no(getGoods_no()); G_List
		 * =sqlMapper.queryForList("AGselectOne",g_paramClass);
		 */

		g_paramClass.setGoods_no(getGoods_no());
		g_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", getGoods_no());
        System.out.println("getGoods_no "+getGoods_no());
		b_paramClass.setBasket_member_id(ActionContext.getContext().getSession().get("M_ID").toString());
		b_paramClass.setBasket_goods_amount(g_resultClass.getGoods_price());
		b_paramClass.setBasket_goods_size(getSgoods_size());
		b_paramClass.setBasket_goods_color(g_resultClass.getGoods_color());
		b_paramClass.setBasket_goods_img(g_resultClass.getGoods_file_savname().split(",")[0]);
		b_paramClass.setBasket_quantity(getSgoods_cnt());
		b_paramClass.setBasket_name(g_resultClass.getGoods_name());
		b_paramClass.setBasket_goods_no(g_resultClass.getGoods_no());

		sqlMapper.insert("insertBasket", b_paramClass);


		B_List = sqlMapper.queryForList("basket-selectM", b_paramClass);
       
        //장바구니 계산 
      		Pay_List = (int)sqlMapper.queryForObject("basket-pay",b_paramClass.getBasket_member_id());
      		PayTotal_List = (int) sqlMapper.queryForObject("basket-paytotal",b_paramClass.getBasket_member_id());
		
		return SUCCESS;

	}





	public int getPayTotal_List() {
		return PayTotal_List;
	}

	public void setPayTotal_List(int payTotal_List) {
		PayTotal_List = payTotal_List;
	}

	public int getPay_List() {
		return Pay_List;
	}

	public void setPay_List(int pay_List) {
		Pay_List = pay_List;
	}

	public List<BasketVO> getB_List() {
		return B_List;
	}

	public void setB_List(List<BasketVO> b_List) {
		B_List = b_List;
	}

	public BasketVO getB_paramClass() {
		return b_paramClass;
	}

	public void setB_paramClass(BasketVO b_paramClass) {
		this.b_paramClass = b_paramClass;
	}

	public int getBasket_quantity() {
		return basket_quantity;
	}

	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<GoodsVO> getG_List() {
		return G_List;
	}

	public void setG_List(List<GoodsVO> g_List) {
		G_List = g_List;
	}

	public List<MemberVO> getM_List() {
		return M_List;
	}

	public void setM_List(List<MemberVO> m_List) {
		M_List = m_List;
	}

	public GoodsVO getG_paramClass() {
		return g_paramClass;
	}

	public void setG_paramClass(GoodsVO g_paramClass) {
		this.g_paramClass = g_paramClass;
	}

	public GoodsVO getG_resultClass() {
		return g_resultClass;
	}

	public void setG_resultClass(GoodsVO g_resultClass) {
		this.g_resultClass = g_resultClass;
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

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getSgoods_cnt() {
		return sgoods_cnt;
	}

	public void setSgoods_cnt(int sgoods_cnt) {
		this.sgoods_cnt = sgoods_cnt;
	}

	public String getSgoods_size() {
		return sgoods_size;
	}

	public void setSgoods_size(String sgoods_size) {
		this.sgoods_size = sgoods_size;
	}
	
	
}

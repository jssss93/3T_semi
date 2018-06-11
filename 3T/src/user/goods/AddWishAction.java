package user.goods;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import user.wishlist.WishlistVO;

public class AddWishAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public Map session;
	
	private GoodsVO g_paramClass = new GoodsVO();
	private GoodsVO g_resultClass = new GoodsVO();
	
	private WishlistVO w_paramClass = new WishlistVO();
	
	private int sgoods_cnt;
	private String m_id;
	private int goods_no;
	
	public AddWishAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		g_paramClass.setGoods_no(getGoods_no());
		g_resultClass = (GoodsVO) sqlMapper.queryForObject("goods-selectOne", getGoods_no());
		
		w_paramClass.setW_MEMBER_ID(ActionContext.getContext().getSession().get("M_ID").toString());
		w_paramClass.setW_GOODS_NAME(g_resultClass.getGoods_name());
		w_paramClass.setW_GOODS_AMOUNT(g_resultClass.getGoods_price());
		w_paramClass.setW_GOODS_IMG(g_resultClass.getGoods_file_savname().split(",")[0]);
		w_paramClass.setW_TOTAL(getSgoods_cnt());
		
		sqlMapper.insert("insertWishList", w_paramClass);
		
		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public WishlistVO getW_paramClass() {
		return w_paramClass;
	}

	public void setW_paramClass(WishlistVO w_paramClass) {
		this.w_paramClass = w_paramClass;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public int getSgoods_cnt() {
		return sgoods_cnt;
	}

	public void setSgoods_cnt(int sgoods_cnt) {
		this.sgoods_cnt = sgoods_cnt;
	}
	
	

}

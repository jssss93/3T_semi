package admin.sales;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import admin.member.VO.MemberVO;
import admin.order.GraphUtil;
import admin.order.VO.OrderVO;

public class RecentlyAction extends ActionSupport implements SessionAware {

	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<GoodsVO> list_goods_best = new ArrayList<GoodsVO>();
	private List<GoodsVO> list_goods_new = new ArrayList<GoodsVO>();
	private List<MemberVO> list_member_best = new ArrayList<MemberVO>();
	private List<MemberVO> list_member_new = new ArrayList<MemberVO>();
	private  List<OrderVO> list_order = new ArrayList<OrderVO>();
	private Map<Date,Integer> MapOrder= new HashMap<Date, Integer>();
	private String jsonData = "";
	
	public RecentlyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {

		
		MapOrder=(HashMap)sqlMapper.queryForMap("AOselectDT_recentSday",null, "ORDER_REGDATE", "SUM(ORDER_TOTAL)");
		jsonData = GraphUtil.getJsonData(MapOrder);
		
		return SUCCESS;
	}



	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public Map<Date, Integer> getMapOrder() {
		return MapOrder;
	}

	public void setMapOrder(Map<Date, Integer> mapOrder) {
		MapOrder = mapOrder;
	}

	

	public List getList_order() {
		return list_order;
	}

	public void setList_order(List<OrderVO> list_order) {
		this.list_order = list_order;
	}

	public List<GoodsVO> getList_goods_new() {
		return list_goods_new;
	}

	public void setList_goods_new(List<GoodsVO> list_goods_new) {
		this.list_goods_new = list_goods_new;
	}

	public List<MemberVO> getList_member_new() {
		return list_member_new;
	}

	public void setList_member_new(List<MemberVO> list_member_new) {
		this.list_member_new = list_member_new;
	}

	public List<GoodsVO> getList_goods_best() {
		return list_goods_best;
	}

	public void setList_goods_best(List<GoodsVO> list_goods_best) {
		this.list_goods_best = list_goods_best;
	}

	public List<MemberVO> getList_member_best() {
		return list_member_best;
	}

	public void setList_member_best(List<MemberVO> list_member_best) {
		this.list_member_best = list_member_best;
	}
}

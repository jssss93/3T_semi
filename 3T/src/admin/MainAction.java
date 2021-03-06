package admin;

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

public class MainAction extends ActionSupport implements SessionAware {

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
	private Map<Date,Integer> MapOrder=new HashMap<Date,Integer>();
	
	private String jsonData = "";

	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {

		list_goods_best = sqlMapper.queryForList("AGselectAll_best");
		list_goods_new = sqlMapper.queryForList("AGselectAll_new");
		list_member_best = sqlMapper.queryForList("AMselectAll_best");
		list_member_new = sqlMapper.queryForList("AMselectAll_new");
		MapOrder=(Map)sqlMapper.queryForMap("AOselectDT_3",null, "ORDER_REGDATE", "SUM(ORDER_TOTAL)");
		jsonData = GraphUtil.getJsonData(MapOrder);
		return SUCCESS;
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
	
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
}

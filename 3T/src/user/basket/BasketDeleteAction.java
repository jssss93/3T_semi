package user.basket;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class BasketDeleteAction extends ActionSupport implements SessionAware {

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	private GoodsVO g_resultClass = new GoodsVO();

	public GoodsVO getG_resultClass() {
		return g_resultClass;
	}

	public void setG_resultClass(GoodsVO g_resultClass) {
		this.g_resultClass = g_resultClass;
	}

	public Map session;

	private String[] chk;

	private int basket_no;
	private int goods_no;

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public BasketDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	public String execute() throws Exception {
		g_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", getGoods_no());
		System.out.println("getBASKET_NO :" + getBasket_no());
		System.out.println("getChk :" + getChk());
		if (getChk() != null) {
			for (int i = 0; i < this.getChk().length; i++) {
				String chkValue = this.getChk()[i];
				sqlMapper.delete("basketdelete", Integer.parseInt(chkValue));

			}
		} else {
			sqlMapper.delete("basketdelete", getBasket_no());
		}

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		BasketDeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		BasketDeleteAction.sqlMapper = sqlMapper;
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

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

}

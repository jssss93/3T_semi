package user.wishlist;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class WishlistDeleteAction extends ActionSupport implements SessionAware{
	private static Reader reader;
	private static SqlMapClient sqlMapper;
	

	private Map session;

	private String[] chk;
	private int W_NO;

	public WishlistDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println("getW_NO :" + getW_NO());
		System.out.println("getChk :" + getChk());
		if (getChk() != null) {
			for (int i = 0; i < this.getChk().length; i++) {
				String chkValue = this.getChk()[i];
				sqlMapper.delete("wishlistdelete", Integer.parseInt(chkValue));

			}
		} else {
			sqlMapper.delete("wishlistdelete", getW_NO());
		}

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		WishlistDeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		WishlistDeleteAction.sqlMapper = sqlMapper;
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

	public int getW_NO() {
		return W_NO;
	}

	public void setW_NO(int w_NO) {
		W_NO = w_NO;
	}

}

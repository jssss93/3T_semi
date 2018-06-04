package admin.member.coupon;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class CouponAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private CouponVO paramClass;

	private String m_id_f;
	private String m_coupon_content_f;
	
	public CouponAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new CouponVO();

		paramClass.setM_id(getM_id_f());
		paramClass.setM_coupon_content(getM_coupon_content_f());

		sqlMapper.insert("giveCoupon", paramClass);

		return SUCCESS;
	}

	public CouponVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(CouponVO paramClass) {
		this.paramClass = paramClass;
	}

	public String getM_id_f() {
		return m_id_f;
	}

	public void setM_id_f(String m_id_f) {
		this.m_id_f = m_id_f;
	}

	public String getM_coupon_content_f() {
		return m_coupon_content_f;
	}

	public void setM_coupon_content_f(String m_coupon_content_f) {
		this.m_coupon_content_f = m_coupon_content_f;
	}

}

package admin.member;

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
import admin.member.VO.MemberVO;
import admin.member.coupon.CouponVO;
import admin.member.coupon.PagingAction;
import admin.member.msg.MsgVO;

public class ViewAction extends ActionSupport implements SessionAware {
	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass = new MemberVO();
	private MemberVO resultClass = new MemberVO();

	private int currentPage;

	private int m_no;

	
	private List<CouponVO> list = new ArrayList<CouponVO>();
	private List<MsgVO> list2 = new ArrayList<MsgVO>();
	
	
	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setM_no(getM_no());

		resultClass = (MemberVO) sqlMapper.queryForObject("AMselectOne", getM_no());
		
		list = sqlMapper.queryForList("AM_COUPONselectAll");
		list2 = sqlMapper.queryForList("AM_MSGselectAll");

		

		return SUCCESS;
	}

	public MemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(MemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public MemberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(MemberVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<CouponVO> getList() {
		return list;
	}

	public void setList(List<CouponVO> list) {
		this.list = list;
	}

	public List<MsgVO> getList2() {
		return list2;
	}

	public void setList2(List<MsgVO> list2) {
		this.list2 = list2;
	}

	
	
}

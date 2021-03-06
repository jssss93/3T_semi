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
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.basket.VO.BasketVO;

public class ListAction extends ActionSupport implements SessionAware {

	private BasketVO paramClass = new BasketVO();

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	public Map session;

	private List<BasketVO> B_List = new ArrayList<BasketVO>();
	private Integer PayTotal_List;
	private Integer Pay_List ;
	
	// 생성자
	public ListAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시판 LIST 액션
	public String execute() throws Exception {

		// 모든 글을 가져와 list에 넣는다.
		paramClass.setBasket_member_id(ActionContext.getContext().getSession().get("M_ID").toString());
		// 모든 글을 가져와 list에 넣는다.
		B_List = sqlMapper.queryForList("basket-selectM",paramClass);
		//장바구니 계산 
		Pay_List = (Integer)sqlMapper.queryForObject("basket-pay",paramClass.getBasket_member_id());
		PayTotal_List = (Integer) sqlMapper.queryForObject("basket-paytotal",paramClass.getBasket_member_id());
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

	public BasketVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(BasketVO paramClass) {
		this.paramClass = paramClass;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListAction.sqlMapper = sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<BasketVO> getB_List() {
		return B_List;
	}

	public void setB_List(List<BasketVO> b_List) {
		B_List = b_List;
	}

}
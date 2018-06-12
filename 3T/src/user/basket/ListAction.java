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

import admin.member.VO.MemberVO;

public class ListAction extends ActionSupport implements SessionAware {

	private Map session;

	public Map getSession() {
		return session;
	}

	private BasketVO paramClass = new BasketVO();

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<BasketVO> list = new ArrayList<BasketVO>();

	// 생성자
	public ListAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시판 LIST 액션
	public String execute() throws Exception {
		paramClass.setBASKET_MEMBER_ID(ActionContext.getContext().getSession().get("M_ID").toString());
		// 모든 글을 가져와 list에 넣는다.
		list = sqlMapper.queryForList("basket-selectM");

		return SUCCESS;
	}

	public List<BasketVO> getList() {
		return list;
	}

	public void setList(List<BasketVO> list) {
		this.list = list;
	}

}
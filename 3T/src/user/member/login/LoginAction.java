package user.member.login;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.member.MemberVO;

public class LoginAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass;
	private MemberVO resultClass;

	private String M_ID;
	private String M_PASSWD;

	private int M_ADMIN;
	private Date regdate;

	private int chkno;

	private Map session;

	Calendar today = Calendar.getInstance();

	public LoginAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");

		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	public String login() throws Exception {

		paramClass = new MemberVO();

		paramClass.setM_ID(getM_ID());
		paramClass.setM_PASSWD(getM_PASSWD());

		resultClass = (MemberVO) sqlMapper.queryForObject("member.searchpw", getM_ID());

		if (resultClass != null) {
			if (resultClass.getM_PASSWD().equals(getM_PASSWD())) {

				ActionContext context = ActionContext.getContext();
				session = context.getSession();
				session.put("M_ID", resultClass.getM_ID());
				context.setSession(session);
				if (resultClass.getM_ADMIN() == 1) {
					
					
					
					
					
					
					return LOGIN;
					
					
					
					
				}
				return SUCCESS;
			}
		}
		return ERROR;

	}

	public String logout() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = (Map<String, String>) context.getSession();

		session.remove("M_ID");

		context.setSession(session);// 다시 session을 적용 시켜서 초기화 시켜야 한다.

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		LoginAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		LoginAction.sqlMapper = sqlMapper;
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

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public String getM_PASSWD() {
		return M_PASSWD;
	}

	public void setM_PASSWD(String m_PASSWD) {
		M_PASSWD = m_PASSWD;
	}

	public int getM_ADMIN() {
		return M_ADMIN;
	}

	public void setM_ADMIN(int m_ADMIN) {
		M_ADMIN = m_ADMIN;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getChkno() {
		return chkno;
	}

	public void setChkno(int chkno) {
		this.chkno = chkno;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

}

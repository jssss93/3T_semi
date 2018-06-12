package user.member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MemberFindPwAction extends ActionSupport implements SessionAware {

	private Map session;
	private String M_NAME;
	private String M_JUMIN1;
	private String M_JUMIN2;
	private String M_ID;

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass = new MemberVO();
	private MemberVO resultClass = new MemberVO();

	public String execute() throws Exception {
		return SUCCESS;
	}

	public MemberFindPwAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String find() throws Exception {

		paramClass.setM_JUMIN1(getM_JUMIN1());
		paramClass.setM_JUMIN2(getM_JUMIN2());
		paramClass.setM_ID(getM_ID());

		resultClass = (MemberVO) sqlMapper.queryForObject("member.findPw", paramClass);

		if(resultClass != null) {
			return SUCCESS;
		}else {
			return ERROR;
		}
		
}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getM_NAME() {
		return M_NAME;
	}

	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}

	public String getM_JUMIN1() {
		return M_JUMIN1;
	}

	public void setM_JUMIN1(String m_JUMIN1) {
		M_JUMIN1 = m_JUMIN1;
	}

	public String getM_JUMIN2() {
		return M_JUMIN2;
	}

	public void setM_JUMIN2(String m_JUMIN2) {
		M_JUMIN2 = m_JUMIN2;
	}

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		MemberFindPwAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MemberFindPwAction.sqlMapper = sqlMapper;
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

}

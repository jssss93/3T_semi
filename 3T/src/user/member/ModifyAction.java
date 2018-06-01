package user.member;



import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ModifyAction extends ActionSupport implements SessionAware{
	public static SqlMapClient sqlMapper; 
	public static Reader reader;

	private MemberVO paramClass = new MemberVO(); 
	private MemberVO resultClass = new MemberVO();

	


	private Map session;

	private String M_ID;
	private String M_PASSWD;
	private String m_PASSWD2;
	private String M_NAME;
	private String M_EMAIL1;
	private String M_EMAIL2;
	private String M_PHONE;
	private String M_ADDR1;
	private String M_ADDR2;
	private String M_ZIPCODE;
	private String M_JUMIN1;
	private String M_JUMIN2;
	private String ACCOUNT_NO;
	private String M_NAME_BANK;
	private String M_DEPOSITOR;


	public ModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		resultClass = (MemberVO) sqlMapper.queryForObject("member.searchpw",
				session.get("M_ID"));

		return SUCCESS;
	}


	public String modifyUpadte() throws Exception {

		paramClass.setM_ID((String)session.get("M_ID"));
		paramClass.setM_NAME(getM_NAME());
		paramClass.setM_PASSWD(getM_PASSWD());
		paramClass.setM_PASSWD2(getM_PASSWD2());
		paramClass.setM_ZIPCODE(getM_ZIPCODE());
		paramClass.setM_ADDR1(getM_ADDR1());
		paramClass.setM_ADDR2(getM_ADDR2());
		paramClass.setM_PHONE(getM_PHONE());
		paramClass.setM_EMAIL1(getM_EMAIL1());
		paramClass.setM_EMAIL2(getM_EMAIL2());
		paramClass.setACCOUNT_NO(getACCOUNT_NO());
		paramClass.setM_DEPOSITOR(getM_DEPOSITOR());
		paramClass.setM_NAME_BANK(getM_NAME_BANK());
		paramClass.setM_JUMIN1(getM_JUMIN1());
		paramClass.setM_JUMIN2(getM_JUMIN2());

		System.out.println("hihihihihihi");

		sqlMapper.update("member.memberUpdate", paramClass);
		
		
	

		
		return SUCCESS;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ModifyAction.sqlMapper = sqlMapper;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ModifyAction.reader = reader;
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



	public String getM_PASSWD2() {
		return m_PASSWD2;
	}

	public void setM_PASSWD2(String m_PASSWD2) {
		this.m_PASSWD2 = m_PASSWD2;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public String getM_EMAIL1() {
		return M_EMAIL1;
	}

	public void setM_EMAIL1(String m_EMAIL1) {
		M_EMAIL1 = m_EMAIL1;
	}
	

	public String getM_PHONE() {
		return M_PHONE;
	}

	public void setM_PHONE(String m_PHONE) {
		M_PHONE = m_PHONE;
	}

	public String getM_ADDR1() {
		return M_ADDR1;
	}

	public void setM_ADDR1(String m_ADDR1) {
		M_ADDR1 = m_ADDR1;
	}


	public String getM_ADDR2() {
		return M_ADDR2;
	}

	public void setM_ADDR2(String m_ADDR2) {
		M_ADDR2 = m_ADDR2;
	}

	public String getM_ZIPCODE() {
		return M_ZIPCODE;
	}

	public void setM_ZIPCODE(String m_ZIPCODE) {
		M_ZIPCODE = m_ZIPCODE;
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

	public String getACCOUNT_NO() {
		return ACCOUNT_NO;
	}

	public void setACCOUNT_NO(String aCCOUNT_NO) {
		ACCOUNT_NO = aCCOUNT_NO;
	}

	public String getM_NAME_BANK() {
		return M_NAME_BANK;
	}

	public void setM_NAME_BANK(String m_NAME_BANK) {
		M_NAME_BANK = m_NAME_BANK;
	}

	public String getM_DEPOSITOR() {
		return M_DEPOSITOR;
	}

	public void setM_DEPOSITOR(String m_DEPOSITOR) {
		M_DEPOSITOR = m_DEPOSITOR;
	}

	public String getM_NAME() {
		return M_NAME;
	}

	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}

	public String getM_EMAIL2() {
		return M_EMAIL2;
	}

	public void setM_EMAIL2(String m_EMAIL2) {
		M_EMAIL2 = m_EMAIL2;
	}
	
	


}

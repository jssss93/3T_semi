package user.member;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass;
	private MemberVO resultClass;

	private int M_NO;
	private String M_ID;
	private String M_PASSWD;
	private String M_PASSWD2;
	private String M_NAME;
	private String M_SEX;
	private String M_JUMIN1;
	private String M_JUMIN2;
	private String M_PHONE;
	private String M_EMAIL1;
	private String M_EMAIL2;
	private String M_ZIPCODE;
	private String M_ADDR1;
	private String M_ADDR2;
	private Date M_REGDATE;
	private String M_DEPOSITOR;
	private String M_NAME_BANK;
	private String ACCOUNT_NO;
	private int M_ADMIN;

	private int chkno;

	Calendar today = Calendar.getInstance();

	public MemberAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	public String join() throws Exception {
		paramClass = new MemberVO();

		paramClass.setM_NO(getM_NO());
		paramClass.setM_ID(getM_ID());
		paramClass.setM_PASSWD(getM_PASSWD());
		paramClass.setM_PASSWD2(getM_PASSWD2());
		paramClass.setM_SEX(getM_SEX());
		paramClass.setM_NAME(getM_NAME());
		paramClass.setM_JUMIN1(getM_JUMIN1());
		paramClass.setM_JUMIN2(getM_JUMIN2());
		paramClass.setM_PHONE(getM_PHONE());
		paramClass.setM_EMAIL1(getM_EMAIL1());
		paramClass.setM_EMAIL2(getM_EMAIL2());
		paramClass.setM_ZIPCODE(getM_ZIPCODE());
		paramClass.setM_ADDR1(getM_ADDR1());
		paramClass.setM_ADDR2(getM_ADDR2());
		paramClass.setM_DEPOSITOR(getM_DEPOSITOR());
		paramClass.setM_NAME_BANK(getM_NAME_BANK());
		paramClass.setACCOUNT_NO(getACCOUNT_NO());
		paramClass.setM_REGDATE(today.getTime());

		sqlMapper.insert("member.mInsert", paramClass);
		return SUCCESS;

	}

	public String findId() throws Exception {
		paramClass = new MemberVO();
		resultClass = new MemberVO();

		paramClass.setM_NAME(getM_NAME());
		paramClass.setM_EMAIL1(getM_EMAIL1());

		resultClass = (MemberVO) sqlMapper.queryForObject("member.findId", paramClass);

		if (resultClass == null)
			chkno = 0;
		else
			chkno = 1;

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		MemberAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MemberAction.sqlMapper = sqlMapper;
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

	public int getM_NO() {
		return M_NO;
	}

	public void setM_NO(int m_NO) {
		M_NO = m_NO;
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

	public String getM_PASSWD2() {
		return M_PASSWD2;
	}

	public void setM_PASSWD2(String m_PASSWD2) {
		M_PASSWD2 = m_PASSWD2;
	}

	public String getM_NAME() {
		return M_NAME;
	}

	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}

	public String getM_SEX() {
		return M_SEX;
	}

	public void setM_SEX(String m_SEX) {
		M_SEX = m_SEX;
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

	public String getM_PHONE() {
		return M_PHONE;
	}

	public void setM_PHONE(String m_PHONE) {
		M_PHONE = m_PHONE;
	}

	public String getM_EMAIL1() {
		return M_EMAIL1;
	}

	public void setM_EMAIL1(String m_EMAIL1) {
		M_EMAIL1 = m_EMAIL1;
	}

	public String getM_EMAIL2() {
		return M_EMAIL2;
	}

	public void setM_EMAIL2(String m_EMAIL2) {
		M_EMAIL2 = m_EMAIL2;
	}

	public String getM_ZIPCODE() {
		return M_ZIPCODE;
	}

	public void setM_ZIPCODE(String m_ZIPCODE) {
		M_ZIPCODE = m_ZIPCODE;
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

	public Date getM_REGDATE() {
		return M_REGDATE;
	}

	public void setM_REGDATE(Date m_REGDATE) {
		M_REGDATE = m_REGDATE;
	}

	public String getM_DEPOSITOR() {
		return M_DEPOSITOR;
	}

	public void setM_DEPOSITOR(String m_DEPOSITOR) {
		M_DEPOSITOR = m_DEPOSITOR;
	}

	public String getM_NAME_BANK() {
		return M_NAME_BANK;
	}

	public void setM_NAME_BANK(String m_NAME_BANK) {
		M_NAME_BANK = m_NAME_BANK;
	}

	public String getACCOUNT_NO() {
		return ACCOUNT_NO;
	}

	public void setACCOUNT_NO(String aCCOUNT_NO) {
		ACCOUNT_NO = aCCOUNT_NO;
	}

	public int getM_ADMIN() {
		return M_ADMIN;
	}

	public void setM_ADMIN(int m_ADMIN) {
		M_ADMIN = m_ADMIN;
	}

	public int getChkno() {
		return chkno;
	}

	public void setChkno(int chkno) {
		this.chkno = chkno;
	}

}

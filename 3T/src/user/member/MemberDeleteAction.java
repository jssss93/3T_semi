package user.member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import user.member.MemberVO;

public class MemberDeleteAction extends ActionSupport implements SessionAware{
	private String M_ID;
	private String M_NAME;
	private Map session;
	public static Reader reader; // 파일 스트림을 위함 reader
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper
											// 객체
	private MemberVO paramClass = new MemberVO(); // 파라미터를 저장할 객체
	private MemberVO resultClass = new MemberVO(); //쿼리결과 저장 객체
	
	public MemberDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	

	public String delete() throws Exception{
		
		paramClass.setM_ID((String)session.get("M_ID"));
		
		

			sqlMapper.delete("member.memberDelete", paramClass);
			
			return SUCCESS;
	}

	

	public static Reader getReader() {
		return reader;
	}



	public static void setReader(Reader reader) {
		MemberDeleteAction.reader = reader;
	}



	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}



	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MemberDeleteAction.sqlMapper = sqlMapper;
	}





	public String getM_ID() {
		return M_ID;
	}




	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}




	public String getM_NAME() {
		return M_NAME;
	}




	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
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




	public Map getSession() {
		return session;
	}



	public void setSession(Map session) {
		this.session = session;
	}
	
	
}

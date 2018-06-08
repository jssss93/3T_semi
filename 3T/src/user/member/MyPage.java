package user.member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;



public class MyPage extends ActionSupport implements SessionAware{
	
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public MyPage() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		return SUCCESS;
	}

	
	
	
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		MyPage.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MyPage.sqlMapper = sqlMapper;
	}
	
	
}



package user.member;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.IOException;
import java.io.Reader;

import user.member.MemberVO;

public class CheckIdAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MemberVO resultClass;
	
	// transfer data
	private String M_ID;
	private int chkNo;
	
	// construction
	public CheckIdAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		System.out.println(getM_ID());

		resultClass = new MemberVO();
		
		if(getM_ID() != null){
			resultClass = (MemberVO) sqlMapper.queryForObject("member.checkM_ID", getM_ID());		
		}
		
		if(resultClass == null) {
			chkNo = 0; 
		}
		else {
			chkNo = 1; 
		}
		
		System.out.println(getM_ID());
	
		return SUCCESS;
		
	}



	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CheckIdAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CheckIdAction.sqlMapper = sqlMapper;
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

	public int getChkNo() {
		return chkNo;
	}

	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}

	
}

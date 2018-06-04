package admin.member.msg;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MsgAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MsgVO paramClass;

	private String m_id_f;
	private String m_msg_content_f;

	public MsgAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new MsgVO();

		paramClass.setM_id(getM_id_f());
		paramClass.setM_msg_content(getM_msg_content_f());

		sqlMapper.insert("giveMsg", paramClass);

		return SUCCESS;
	}

	public MsgVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(MsgVO paramClass) {
		this.paramClass = paramClass;
	}

	public String getM_id_f() {
		return m_id_f;
	}

	public void setM_id_f(String m_id_f) {
		this.m_id_f = m_id_f;
	}

	public String getM_msg_content_f() {
		return m_msg_content_f;
	}

	public void setM_msg_content_f(String m_msg_content_f) {
		this.m_msg_content_f = m_msg_content_f;
	}

}

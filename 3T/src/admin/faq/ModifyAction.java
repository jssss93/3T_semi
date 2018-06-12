package admin.faq;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.faq.VO.FaqVO;
import admin.goods.VO.GoodsVO;

public class ModifyAction extends ActionSupport implements SessionAware {
	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private FaqVO paramClass;
	private FaqVO resultClass;

	private int currentPage;

	private int faq_no;
	private String faq_subject;
	private String faq_writer;
	private String faq_content;
	private String faq_member_id;

	public ModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {

		paramClass = new FaqVO();
		resultClass = new FaqVO();

		paramClass.setFaq_no(getFaq_no());
		paramClass.setFaq_subject(getFaq_subject());
		paramClass.setFaq_writer(getFaq_writer());
		paramClass.setFaq_content(getFaq_content());
		paramClass.setFaq_member_id(getFaq_member_id());

		sqlMapper.update("updateFaq", paramClass);

		resultClass = (FaqVO) sqlMapper.queryForObject("AFselectOne", getFaq_no());
		return SUCCESS;

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public FaqVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(FaqVO paramClass) {
		this.paramClass = paramClass;
	}

	public FaqVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(FaqVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_writer() {
		return faq_writer;
	}

	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_member_id() {
		return faq_member_id;
	}

	public void setFaq_member_id(String faq_member_id) {
		this.faq_member_id = faq_member_id;
	}

}

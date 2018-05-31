package user.faq;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.URLEncoder;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;




public class viewAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private FaqVO paramClass = new FaqVO(); //�Ķ���͸� ������ ��ü
	private FaqVO resultClass = new FaqVO(); //���� ��� ���� ������ ��ü

	private int currentPage;
	private int FAQ_NO;

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// ������
	public viewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �󼼺���
	public String execute() throws Exception {

		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (FaqVO) sqlMapper.queryForObject("userfaq-selectOne", getFAQ_NO());
		return SUCCESS;
	}
	

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
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

	public int getFAQ_NO() {
		return FAQ_NO;
	}

	public void setFAQ_NO(int fAQ_NO) {
		FAQ_NO = fAQ_NO;
	}


	
}

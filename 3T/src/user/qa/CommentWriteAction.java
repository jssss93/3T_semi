package user.qa;


import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;



public class CommentWriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private Qa_CommentVO paramClass;
	private Qa_CommentVO resultClass;

	private int QA_NO;
	private int currentPage;

	private String QA_NAME;
	private String QA_PASSWD;
	private String QA_CONTENT;
	private int QA_ORIGINNO;

	Calendar today = Calendar.getInstance();

	public CommentWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}

	public String execute() throws Exception {
		
		paramClass = new Qa_CommentVO();
		resultClass = new Qa_CommentVO();
		
		paramClass.setQA_ORIGINNO(getQA_ORIGINNO());
		paramClass.setQA_NAME(getQA_NAME());
		paramClass.setQA_PASSWD(getQA_PASSWD());	
		
		paramClass.setQA_CONTENT(getQA_CONTENT());
		paramClass.setQA_REGDATE(today.getTime());
		
		sqlMapper.insert("qa_insertComment", paramClass);
		

		return SUCCESS;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}	

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public Qa_CommentVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(Qa_CommentVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getQA_NO() {
		return QA_NO;
	}

	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}

	public String getQA_NAME() {
		return QA_NAME;
	}

	public void setQA_NAME(String qA_NAME) {
		QA_NAME = qA_NAME;
	}

	public String getQA_PASSWD() {
		return QA_PASSWD;
	}

	public void setQA_PASSWD(String qA_PASSWD) {
		QA_PASSWD = qA_PASSWD;
	}

	public String getQA_CONTENT() {
		return QA_CONTENT;
	}

	public void setQA_CONTENT(String qA_CONTENT) {
		QA_CONTENT = qA_CONTENT;
	}

	public int getQA_ORIGINNO() {
		return QA_ORIGINNO;
	}

	public void setQA_ORIGINNO(int qA_ORIGINNO) {
		QA_ORIGINNO = qA_ORIGINNO;
	}

	
}

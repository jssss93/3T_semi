package user.qa;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;


public class DeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QaVO paramClass;
	private QaVO resultClass;
	
	private Qa_CommentVO cClass = new Qa_CommentVO();
	private Qa_CommentVO cResult = new Qa_CommentVO();
	
	private int currentPage;
	private String fileUploadPath = "C:\\Java\\";
	
	private int QA_NO;
	
	public DeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new QaVO();
		resultClass = new QaVO();
		
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectOne", getQA_NO());
		
		File deleteFile = new File(fileUploadPath + resultClass.getQA_FILE_SAVNAME());
		deleteFile.delete();
		
		paramClass.setQA_NO(getQA_NO());
		
		sqlMapper.update("qa_deleteBoard",paramClass);
		
		return SUCCESS;
	}
	
	public String execute2() throws Exception {
		cClass = new Qa_CommentVO();
		cResult = new Qa_CommentVO();
		
		cClass.setQA_NO(getQA_NO());
		
		sqlMapper.update("qa_deleteComment",cClass);
		
		return SUCCESS;
	}

	public QaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(QaVO paramClass) {
		this.paramClass = paramClass;
	}

	public QaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(QaVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public int getQA_NO() {
		return QA_NO;
	}

	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}

}

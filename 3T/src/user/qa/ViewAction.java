package user.qa;

import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;



public class ViewAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QaVO paramClass = new QaVO();
	private QaVO resultClass = new QaVO();
	private List<Qa_CommentVO> commentlist = new ArrayList<Qa_CommentVO>();
	
	private Qa_CommentVO cClass = new Qa_CommentVO();
	private Qa_CommentVO cResult = new Qa_CommentVO();
	public Map session;
	
	private int currentPage;
	
	private int QA_NO;
	private int QA_ORIGINNO;
	
	private String QA_PASSWD;
	
	private String fileUploadPath = "C:\\git\\3T\\3T\\WebContent\\upload";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	private GoodsVO goods_paramClass =new GoodsVO();
	private GoodsVO goods_resultClass=new GoodsVO();
	private int goods_no;
	
	public ViewAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		
		paramClass.setQA_NO(getQA_NO());
		sqlMapper.update("qa_updateReadHit",paramClass);
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectOne", getQA_NO());
		
		commentlist = sqlMapper.queryForList("qa_commentSelectAll", getQA_NO());
		
		goods_paramClass.setGoods_no(resultClass.getQA_GOODS_NO());
		goods_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", resultClass.getQA_GOODS_NO());
		return SUCCESS;
	}
	
	public String download() throws Exception
	{
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectOne", getQA_NO());
		
		File fileInfo = new File(fileUploadPath + resultClass.getQA_FILE_SAVNAME());
		
		
		setContentLength(fileInfo.length());
		setContentDisposition("attachment; filename=" + URLEncoder.encode(resultClass.getQA_FILE_ORGNAME(),"UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getQA_FILE_SAVNAME()));
		
/*		
		File fileInfo = new File(fileUploadPath + fileDownloadName);
		setContentLength(fileInfo.length());
		setContentDisposition("attachment; filename="+URLEncoder.encode(fileDownloadName, "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath + fileDownloadName));
*/		
		return SUCCESS;
	}
	
	public GoodsVO getGoods_paramClass() {
		return goods_paramClass;
	}

	public void setGoods_paramClass(GoodsVO goods_paramClass) {
		this.goods_paramClass = goods_paramClass;
	}

	public GoodsVO getGoods_resultClass() {
		return goods_resultClass;
	}

	public void setGoods_resultClass(GoodsVO goods_resultClass) {
		this.goods_resultClass = goods_resultClass;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ViewAction.sqlMapper = sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String checkForm() throws Exception
	{
		return SUCCESS;
	}
	
	public String checkAction()	throws Exception
	{
		paramClass.setQA_NO(getQA_NO());
		paramClass.setQA_PASSWD(getQA_PASSWD());
	
		resultClass = (QaVO) sqlMapper.queryForObject("qa_selectPassword", paramClass);
		if(resultClass == null) {
			return ERROR;
			
		}
		return SUCCESS;
	}
	
	public String checkAction2()	throws Exception
	{
		cClass.setQA_NO(getQA_NO());
		cClass.setQA_PASSWD(getQA_PASSWD());
		cClass.setQA_ORIGINNO(getQA_ORIGINNO());
		cResult = (Qa_CommentVO) sqlMapper.queryForObject("qa_selectPassword2", cClass);
		
		if(cResult == null)
			return ERROR;
		
		return SUCCESS;
	}

	public int getQA_NO() {
		return QA_NO;
	}

	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}

	public int getQA_ORIGINNO() {
		return QA_ORIGINNO;
	}

	public void setQA_ORIGINNO(int qA_ORIGINNO) {
		QA_ORIGINNO = qA_ORIGINNO;
	}

	public List<Qa_CommentVO> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<Qa_CommentVO> commentlist) {
		this.commentlist = commentlist;
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

	public Qa_CommentVO getcClass() {
		return cClass;
	}

	public void setcClass(Qa_CommentVO cClass) {
		this.cClass = cClass;
	}

	public Qa_CommentVO getcResult() {
		return cResult;
	}

	public void setcResult(Qa_CommentVO cResult) {
		this.cResult = cResult;
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

	public String getQA_PASSWD() {
		return QA_PASSWD;
	}

	public void setQA_PASSWD(String qA_PASSWD) {
		QA_PASSWD = qA_PASSWD;
	}
	

}

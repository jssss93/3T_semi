package user.qa;

import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import org.apache.struts2.interceptor.SessionAware;

import java.io.Reader;
import java.io.IOException;

import java.net.*;

public class ListAction extends ActionSupport implements SessionAware{

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	
	private List<QaVO> list = new ArrayList<QaVO>();
	
	public Map session;
	
	private String searchKeyword;
	private int searchNum;
	

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	private GoodsVO g_paramClass = new GoodsVO();
	private GoodsVO g_resultClass = new GoodsVO();
	
	public ListAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();		
		
	}
	
	public String execute() throws Exception {
		
	
		
		if(getSearchKeyword() != null)
		{
			return search();
		}
		
		list = sqlMapper.queryForList("qa_selectAll");
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		

		list = list.subList(page.getStartCount(), lastCount);
	/*	g_paramClass.setGoods_no(getGoods_no());
		g_resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectOne", getGoods_no());*/
		return SUCCESS;
	}
	
	public String search() throws Exception {
		
		searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
		//System.out.println(searchKeyword);
		//System.out.println(searchNum);
		if(searchNum == 0){
			list = sqlMapper.queryForList("qa_selectSearchW", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("qa_selectSearchS", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 2){
			list = sqlMapper.queryForList("qa_selectSearchC", "%"+getSearchKeyword()+"%");	
		}
		
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}



	public GoodsVO getG_paramClass() {
		return g_paramClass;
	}

	public void setG_paramClass(GoodsVO g_paramClass) {
		this.g_paramClass = g_paramClass;
	}

	public GoodsVO getG_resultClass() {
		return g_resultClass;
	}

	public void setG_resultClass(GoodsVO g_resultClass) {
		this.g_resultClass = g_resultClass;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListAction.sqlMapper = sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}



	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public List<QaVO> getList() {
		return list;
	}

	public void setList(List<QaVO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	
	

}

package admin.order;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.member.VO.MemberVO;
import admin.order.VO.OrderVO;

public class ListAction extends ActionSupport implements SessionAware {

	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass = new MemberVO();
	private MemberVO resultClass_M = new MemberVO();
	private OrderVO resultClass = new OrderVO();
	
	private List<OrderVO> list = new ArrayList<OrderVO>();

	private String searchKeyword;
	private int searchNum;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	private int index = 0;

	private int order_no;
	private int order_total;
	private int m_total;
	private String m_id;
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {

		if (getSearchKeyword() != null) {
			return search();
		}

		list = sqlMapper.queryForList("AOselectAll");

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String execute1() throws Exception {

		index = 1;

		if (getSearchKeyword() != null) {
			return search();
		}

		list = sqlMapper.queryForList("AOselectAll1");

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String execute2() throws Exception {

		index = 2;

		if (getSearchKeyword() != null) {
			return search();
		}

		list = sqlMapper.queryForList("AOselectAll2");

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String execute3() throws Exception {

		index = 3;

		if (getSearchKeyword() != null) {
			return search();
		}

		list = sqlMapper.queryForList("AOselectAll3");

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String update1to2() throws Exception {

		
		sqlMapper.update("AOupdate1to2", getOrder_no());
		
		return SUCCESS;
	}

	public String update2to3() throws Exception {
		
		sqlMapper.update("AOupdate2to3", getOrder_no());
		
		resultClass=(OrderVO) sqlMapper.queryForObject("AOselectOne",getOrder_no());
		
		paramClass.setM_id(resultClass.getOrder_member_id());
		resultClass_M=(MemberVO) sqlMapper.queryForObject("AMselectOne_ID",paramClass);
		
		paramClass.setM_total(resultClass.getOrder_total());
		paramClass.setM_id(resultClass_M.getM_id());
		
		sqlMapper.update("AMupdate_total",paramClass);
		
		resultClass_M=(MemberVO) sqlMapper.queryForObject("AMselectOne_ID",paramClass);
		if(resultClass_M.getM_total()>100000) {
			sqlMapper.update("AMupdate_1to2",paramClass);
			if(resultClass_M.getM_total()>200000) {
				sqlMapper.update("AMupdate_2to3",paramClass);
			}
		}
		return SUCCESS;
	}

	public String search() throws Exception {

		// searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
		// System.out.println(searchKeyword); //System.out.println(searchNum);
		if (searchNum == 0) {
			list = sqlMapper.queryForList("AOselectSearchName", "%" + getSearchKeyword() + "%");
		}
		if (searchNum == 1) {
			list = sqlMapper.queryForList("AOselectSearchID", "%" + getSearchKeyword() + "%");
		}

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public MemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(MemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public MemberVO getResultClass_M() {
		return resultClass_M;
	}

	public void setResultClass_M(MemberVO resultClass_M) {
		this.resultClass_M = resultClass_M;
	}

	public OrderVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(OrderVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	

	public int getM_total() {
		return m_total;
	}

	public void setM_total(int m_total) {
		this.m_total = m_total;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List<OrderVO> getList() {
		return list;
	}

	public void setList(List<OrderVO> list) {
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

package user.goods;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class MainAction extends ActionSupport implements SessionAware{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public Map session;
	
	
	private List<GoodsVO> list = new ArrayList<GoodsVO>();
	private List<GoodsVO> list1 = new ArrayList<GoodsVO>();
	private List<GoodsVO> list2 = new ArrayList<GoodsVO>();

	
	private int currentPage = 1;
	private int totalCount;
	private int totalCount1;
	
	private int blockCount = 12;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int num = 0;

	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		
		session.get("M_ID");
		
		list = sqlMapper.queryForList("goods-selectAll");
		list1 = sqlMapper.queryForList("goods-selectNew");
		list2 = sqlMapper.queryForList("goods-selectBest");

		totalCount = list.size();
		totalCount1 = list1.size();
		

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	/*public String New() throws Exception {

		list1 = sqlMapper.queryForList("selectNew");

		totalCount = list1.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list1 = list1.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}*/

	public List<GoodsVO> getList() {
		return list;
	}

	public void setList(List<GoodsVO> list) {
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

	public pagingAction getPage() {
		return page;
	}

	public void setPage(pagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public List<GoodsVO> getList1() {
		return list1;
	}

	public void setList1(List<GoodsVO> list1) {
		this.list1 = list1;
	}

	public int getTotalCount1() {
		return totalCount1;
	}

	public void setTotalCount1(int totalCount1) {
		this.totalCount1 = totalCount1;
	}

	public List<GoodsVO> getList2() {
		return list2;
	}

	public void setList2(List<GoodsVO> list2) {
		this.list2 = list2;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	
	

	/*public List<GoodsVO> getList1() {
		return list1;
	}

	public void setList1(List<GoodsVO> list1) {
		this.list1 = list1;
	}
	*/

}

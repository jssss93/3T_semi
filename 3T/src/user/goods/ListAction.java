package user.goods;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class ListAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<GoodsVO> list = new ArrayList<GoodsVO>();
	private List<GoodsVO> list1 = new ArrayList<GoodsVO>();
	
	private int currentPage = 1;
	private int totalCount;
	
	private int blockCount = 12;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int num = 0;

	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String outer() throws Exception {

		list = sqlMapper.queryForList("select-All-outer");
		list1 = sqlMapper.queryForList("select-All-outer-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String suit() throws Exception {

		list = sqlMapper.queryForList("select-All-suit");
		list1 = sqlMapper.queryForList("select-All-suit-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String top() throws Exception {

		list = sqlMapper.queryForList("select-All-top");
		list1 = sqlMapper.queryForList("select-All-top-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String shirt() throws Exception {

		list = sqlMapper.queryForList("select-All-shirt");
		list1 = sqlMapper.queryForList("select-All-shirt-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String knit() throws Exception {

		list = sqlMapper.queryForList("select-All-knit");
		list1 = sqlMapper.queryForList("select-All-knit-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String bottom() throws Exception {

		list = sqlMapper.queryForList("select-All-bottom");
		list1 = sqlMapper.queryForList("select-All-bottom-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String shoes() throws Exception {

		list = sqlMapper.queryForList("select-All-shoes");
		list1 = sqlMapper.queryForList("select-All-shoes-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String acc() throws Exception {

		list = sqlMapper.queryForList("select-All-acc");
		list1 = sqlMapper.queryForList("select-All-acc-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String perfectline() throws Exception {

		list = sqlMapper.queryForList("select-All-perfectline");
		list1 = sqlMapper.queryForList("select-All-perfectline-best");

		totalCount = list.size();

		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public List<GoodsVO> getList() {
		return list;
	}

	public void setList(List<GoodsVO> list) {
		this.list = list;
	}

	public List<GoodsVO> getList1() {
		return list1;
	}

	public void setList1(List<GoodsVO> list1) {
		this.list1 = list1;
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
	
	
	
}
	
	
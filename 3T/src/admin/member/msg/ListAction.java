package admin.member.msg;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.member.coupon.CouponVO;

public class ListAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<MsgVO> list = new ArrayList<MsgVO>();

	private String searchKeyword;
	private int searchNum;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {

		/*
		 * if(getSearchKeyword() != null) { return search(); }
		 */

		list = sqlMapper.queryForList("AM_MSGselectAll");

		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	/*
	 * public String search() throws Exception {
	 * 
	 * //searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
	 * //System.out.println(searchKeyword); //System.out.println(searchNum);
	 * if(searchNum == 0){ list = sqlMapper.queryForList("selectSearchW",
	 * "%"+getSearchKeyword()+"%"); } if(searchNum == 1){ list =
	 * sqlMapper.queryForList("selectSearchS", "%"+getSearchKeyword()+"%"); }
	 * if(searchNum == 2){ list = sqlMapper.queryForList("selectSearchC",
	 * "%"+getSearchKeyword()+"%"); }
	 * 
	 * totalCount = list.size(); page = new pagingAction(currentPage, totalCount,
	 * blockCount, blockPage, searchNum, getSearchKeyword()); pagingHtml =
	 * page.getPagingHtml().toString();
	 * 
	 * int lastCount = totalCount;
	 * 
	 * if(page.getEndCount() < totalCount) lastCount = page.getEndCount() + 1;
	 * 
	 * list = list.subList(page.getStartCount(), lastCount); return SUCCESS; }
	 */

	public int getCurrentPage() {
		return currentPage;
	}

	public List<MsgVO> getList() {
		return list;
	}

	public void setList(List<MsgVO> list) {
		this.list = list;
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

package user.qa;


import com.opensymphony.xwork2.ActionSupport;

import user.qa.PagingAction2;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import admin.goods.VO.GoodsVO;



public class SearchGoods extends ActionSupport{
	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<GoodsVO> list2 = new ArrayList<GoodsVO>();
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction2 page; // 페이징 클래스
	
	private String searchKeyword;

	private int searchNum;
	private int num=0;
	
	private GoodsVO paramClass = new GoodsVO();
	private GoodsVO resultClass = new GoodsVO();
	private int goods_no;
	
	public SearchGoods() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	public String form() throws Exception {

		return SUCCESS;
	}
	public String execute() throws Exception{

		if(getSearchKeyword() != null)
		{
			return search();
		}
		
	list2 = sqlMapper.queryForList("goods-selectall1");
	 
	totalCount = list2.size(); // 전체 글 갯수를 구한다.
	// pagingAction 객체 생성.
	page = new PagingAction2(currentPage, totalCount, blockCount, blockPage, num, "");
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

	// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
	int lastCount = totalCount;

	// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면
	// lastCount를 +1 번호로 설정.
	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	
	paramClass.setGoods_no(getGoods_no());
	resultClass = (GoodsVO) sqlMapper.queryForObject("goods-selectOne", getGoods_no());
	// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
	list2 = list2.subList(page.getStartCount(), lastCount);
	
	
	return SUCCESS;
	}
	public String search() throws Exception {
		
		searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
		System.out.println(searchKeyword);
		//System.out.println(searchNum);
		if(searchNum == 0){
			list2 = sqlMapper.queryForList("selectSearchQ", "%"+getSearchKeyword()+"%");
		}
		
		
		totalCount = list2.size();
		page = new PagingAction2(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list2 = list2.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}
	
	public List<GoodsVO> getList2() {
		return list2;
	}
	public void setList2(List<GoodsVO> list2) {
		this.list2 = list2;
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
	public PagingAction2 getPage() {
		return page;
	}
	public void setPage(PagingAction2 page) {
		this.page = page;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public GoodsVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(GoodsVO paramClass) {
		this.paramClass = paramClass;
	}
	public GoodsVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(GoodsVO resultClass) {
		this.resultClass = resultClass;
	}
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	
	
}
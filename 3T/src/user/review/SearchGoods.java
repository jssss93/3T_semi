package user.review;


import com.opensymphony.xwork2.ActionSupport;

import user.review.PagingAction2;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import admin.goods.VO.GoodsVO;



public class SearchGoods extends ActionSupport{
	public static Reader reader; // ���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<GoodsVO> list2 = new ArrayList<GoodsVO>();
	
	private int currentPage = 1; // ���� ������
	private int totalCount; // �� �Խù��� ��
	private int blockCount = 10; // �� �������� �Խù��� ��
	private int blockPage = 5; // �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; // ����¡�� ������ HTML
	private PagingAction2 page; // ����¡ Ŭ����
	
	private String searchKeyword;

	private int searchNum;
	private int num=0;
	
	private GoodsVO paramClass = new GoodsVO();
	private GoodsVO resultClass = new GoodsVO();
	private int Goods_no;
	
	public SearchGoods() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	public String checkForm3() throws Exception {

		return SUCCESS;
	}
	public String execute() throws Exception{
		
			if(getSearchKeyword() != null)
			{
				return search();
			}
			
		list2 = sqlMapper.queryForList("goods-selectall1");
		 
		totalCount = list2.size(); // ��ü �� ������ ���Ѵ�.
		// pagingAction ��ü ����.
		page = new PagingAction2(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������
		// lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		
		paramClass.setGoods_no(getGoods_no());
		resultClass = (GoodsVO) sqlMapper.queryForObject("goods-selectOne", getGoods_no());
		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list2 = list2.subList(page.getStartCount(), lastCount);
		
		
		return SUCCESS;
	}
public String search() throws Exception {
		
		//searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
		//System.out.println(searchKeyword);
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
		return Goods_no;
	}
	public void setGoods_no(int goods_no) {
		Goods_no = goods_no;
	}
	
	
}
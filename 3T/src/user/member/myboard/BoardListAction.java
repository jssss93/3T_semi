package user.member.myboard;

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





public class BoardListAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<BoardVO> list = new ArrayList<BoardVO>();
	private List<BoardVO> list1 = new ArrayList<BoardVO>(); 

	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private BoardPagingAction page; 	// 페이징 클래스

	private String REV_MEMBER_ID;
	private String QA_MEMBER_ID;
	private Map session;

	
	// 생성자
	public BoardListAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시판 LIST 액션
	public String execute() throws Exception {
		// 모든 글을 가져와 list에 넣는다.

		// 수정할 항목 설정.
		
		REV_MEMBER_ID = (ActionContext.getContext().getSession().get("M_ID").toString());
		QA_MEMBER_ID = (ActionContext.getContext().getSession().get("M_ID").toString());

		
		list = sqlMapper.queryForList("myboard.review-selectAll1", REV_MEMBER_ID);
		list1 = sqlMapper.queryForList("myboard.review-selectAll2", QA_MEMBER_ID);

		totalCount = list.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체 생성.
		page = new BoardPagingAction(currentPage, totalCount, blockCount, blockPage); 
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
		//lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	
	public List<BoardVO> getList1() {
		return list1;
	}

	public void setList1(List<BoardVO> list1) {
		this.list1 = list1;
	}

	public String getREV_MEMBER_ID() {
		return REV_MEMBER_ID;
	}

	public void setREV_MEMBER_ID(String rEV_MEMBER_ID) {
		REV_MEMBER_ID = rEV_MEMBER_ID;
	}

	
	public String getQA_MEMBER_ID() {
		return QA_MEMBER_ID;
	}

	public void setQA_MEMBER_ID(String qA_MEMBER_ID) {
		QA_MEMBER_ID = qA_MEMBER_ID;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		BoardListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		BoardListAction.sqlMapper = sqlMapper;
	}

	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
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

	public BoardPagingAction getPage() {
		return page;
	}

	public void setPage(BoardPagingAction page) {
		this.page = page;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
	
	
	
}
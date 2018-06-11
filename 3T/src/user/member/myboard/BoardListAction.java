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
	
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<BoardVO> list = new ArrayList<BoardVO>();
	private List<BoardVO> list1 = new ArrayList<BoardVO>(); 

	
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private BoardPagingAction page; 	// ����¡ Ŭ����

	private String REV_MEMBER_ID;
	private String QA_MEMBER_ID;
	private Map session;

	
	// ������
	public BoardListAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �Խ��� LIST �׼�
	public String execute() throws Exception {
		// ��� ���� ������ list�� �ִ´�.

		// ������ �׸� ����.
		
		REV_MEMBER_ID = (ActionContext.getContext().getSession().get("M_ID").toString());
		QA_MEMBER_ID = (ActionContext.getContext().getSession().get("M_ID").toString());

		
		list = sqlMapper.queryForList("myboard.review-selectAll1", REV_MEMBER_ID);
		list1 = sqlMapper.queryForList("myboard.review-selectAll2", QA_MEMBER_ID);

		totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
		// pagingAction ��ü ����.
		page = new BoardPagingAction(currentPage, totalCount, blockCount, blockPage); 
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
		//lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
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
package admin.notice;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import admin.notice.VO.NoticeVO;

public class ViewAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private NoticeVO paramClass = new NoticeVO();
	private NoticeVO resultClass = new NoticeVO();

	private int currentPage;

	private int Notice_no;

	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setNotice_no(getNotice_no());

		resultClass = (NoticeVO) sqlMapper.queryForObject("ANselectOne", getNotice_no());

		return SUCCESS;
	}

	public NoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(NoticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public NoticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(NoticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNotice_no() {
		return Notice_no;
	}

	public void setNotice_no(int notice_no) {
		Notice_no = notice_no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}

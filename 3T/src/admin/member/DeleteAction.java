package admin.member;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import admin.member.VO.MemberVO;

public class DeleteAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass;
	private MemberVO resultClass;

	private int currentPage;
	private String fileUploadPath = "C:\\upload\\";

	private int m_no;

	public DeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new MemberVO();
		resultClass = new MemberVO();

		resultClass = (MemberVO) sqlMapper.queryForObject("AMselectOne", getM_no());

		paramClass.setM_no(getM_no());

		sqlMapper.update("deleteMember", paramClass);

		return SUCCESS;
	}

	public MemberVO getParamClass() {
		return paramClass;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public void setParamClass(MemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public MemberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(MemberVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

}

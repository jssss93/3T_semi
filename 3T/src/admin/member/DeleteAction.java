package admin.member;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class DeleteAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private GoodsVO paramClass;
	private GoodsVO resultClass;

	private int currentPage;
	private String fileUploadPath = "C:\\upload\\";

	private int goods_no;

	public DeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new GoodsVO();
		resultClass = new GoodsVO();

		resultClass = (GoodsVO) sqlMapper.queryForObject("selectOne", getGoods_no());

		File deleteFile = new File(fileUploadPath + resultClass.getGoods_file_savname());
		deleteFile.delete();

		paramClass.setGoods_no(getGoods_no());

		sqlMapper.update("deleteGoods", paramClass);

		return SUCCESS;
	}

	public GoodsVO getParamClass() {
		return paramClass;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
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

package admin.goods;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class ModifyAction extends ActionSupport implements SessionAware {
	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private GoodsVO paramClass;
	private GoodsVO resultClass;

	private int currentPage;

	private int goods_no;
	private String goods_name;
	private String goods_content;
	private String goods_color;
	private int goods_price;
	private String goods_size;

	private String goods_category;
	private int goods_totalcount;
	private String goods_related_product;

	private String goods_file_orgname;
	private String goods_file_savname;

	private String old_file;

	private String file_orgname = "";
	private String file_savname = "";

	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private String fileUploadPath = "C:\\upload\\";

	public ModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {
		paramClass = new GoodsVO();
		resultClass = new GoodsVO();

		paramClass.setGoods_no(getGoods_no());
		paramClass.setGoods_name(getGoods_name());
		paramClass.setGoods_content(getGoods_content());
		paramClass.setGoods_price(getGoods_price());
		paramClass.setGoods_color(getGoods_color());
		paramClass.setGoods_size(getGoods_size());
		paramClass.setGoods_category(getGoods_category());
		paramClass.setGoods_totalcount(getGoods_totalcount());
		paramClass.setGoods_related_product(getGoods_related_product());
		paramClass.setGoods_file_orgname(getGoods_file_orgname());
		paramClass.setGoods_file_savname(getGoods_file_savname());

		sqlMapper.update("updateGoods", paramClass);

		for (int i = 0; i < uploads.size(); i++) {
			resultClass = (GoodsVO) sqlMapper.queryForObject("AGselectLastNo");

			if (i > 0) {
				file_orgname = file_orgname + ",";
				file_savname = file_savname + ",";
			}

			file_orgname = file_orgname + getUploadsFileName().get(i);

			String file_name = "goods_" + resultClass.getGoods_no();
			String file_ext = getUploadsFileName().get(i).substring(getUploadsFileName().get(i).lastIndexOf('.') + 1,
					getUploadsFileName().get(i).length());
			file_savname = file_savname + file_name + "(" + (i + 1) + ")" + "." + file_ext;

			File destFile = new File(fileUploadPath + file_name + "(" + (i + 1) + ")" + "." + file_ext);
			FileUtils.copyFile(getUploads().get(i), destFile);

			paramClass.setGoods_no(resultClass.getGoods_no());
			paramClass.setGoods_file_orgname(file_orgname);
			paramClass.setGoods_file_savname(file_savname);

			sqlMapper.update("AGupdateFile", paramClass);
		}

		return SUCCESS;

	}

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_size() {
		return goods_size;
	}

	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}

	public String getGoods_category() {
		return goods_category;
	}

	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}

	public int getGoods_totalcount() {
		return goods_totalcount;
	}

	public void setGoods_totalcount(int goods_totalcount) {
		this.goods_totalcount = goods_totalcount;
	}

	public String getGoods_related_product() {
		return goods_related_product;
	}

	public void setGoods_related_product(String goods_related_product) {
		this.goods_related_product = goods_related_product;
	}

	public String getGoods_file_orgname() {
		return goods_file_orgname;
	}

	public void setGoods_file_orgname(String goods_file_orgname) {
		this.goods_file_orgname = goods_file_orgname;
	}

	public String getGoods_file_savname() {
		return goods_file_savname;
	}

	public void setGoods_file_savname(String goods_file_savname) {
		this.goods_file_savname = goods_file_savname;
	}

	public String getFile_orgname() {
		return file_orgname;
	}

	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}

	public String getFile_savname() {
		return file_savname;
	}

	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}

	public List<File> getUploads() {
		return uploads;
	}

	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}

	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

}

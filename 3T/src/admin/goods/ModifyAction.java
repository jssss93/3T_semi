package admin.goods;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class ModifyAction extends ActionSupport{

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
	
	private String goods_org_filename;
	private String goods_sav_filename;
	
	private String old_file;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\upload\\";
	
	public ModifyAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	public String execute() throws Exception
	{
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
		paramClass.setGoods_org_filename(getGoods_org_filename());
		paramClass.setGoods_sav_filename(getGoods_sav_filename());
		
		
		
		sqlMapper.update("updateGoods", paramClass);
		
		if(getUpload() != null)
		{
			String file_name = "file_" + getGoods_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') +1, getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setGoods_org_filename(getUploadFileName());
			paramClass.setGoods_sav_filename(file_name + "." + file_ext);
			
			sqlMapper.update("updateFile", paramClass);
			
			
			
		}
		
		resultClass = (GoodsVO) sqlMapper.queryForObject("selectOne", getGoods_no());
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

	public String getGoods_org_filename() {
		return goods_org_filename;
	}

	public void setGoods_org_filename(String goods_org_filename) {
		this.goods_org_filename = goods_org_filename;
	}

	public String getGoods_sav_filename() {
		return goods_sav_filename;
	}

	public void setGoods_sav_filename(String goods_sav_filename) {
		this.goods_sav_filename = goods_sav_filename;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	
	
}

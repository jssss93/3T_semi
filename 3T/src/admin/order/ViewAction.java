package admin.order;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;
import admin.order.VO.OrderVO;

public class ViewAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private OrderVO paramClass = new OrderVO();
	private OrderVO resultClass = new OrderVO();

	private int currentPage;

	private int order_no;

	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setOrder_no(getOrder_no());

		resultClass = (OrderVO) sqlMapper.queryForObject("AOselectOne", getOrder_no());

		return SUCCESS;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public OrderVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(OrderVO paramClass) {
		this.paramClass = paramClass;
	}

	public OrderVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(OrderVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}

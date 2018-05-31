package user.basket;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ListAction extends ActionSupport {
	
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<BasketVO> list = new ArrayList<BasketVO>();	 
	
	
	// ������
	public ListAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �Խ��� LIST �׼�
	public String execute() throws Exception {
		
		// ��� ���� ������ list�� �ִ´�.
		list = sqlMapper.queryForList("basket-selectAll");
		System.out.println("testtest1"+list);

		return SUCCESS;
	}
	
	public List<BasketVO> getList() {
		return list;
	}

	public void setList(List<BasketVO> list) {
		this.list = list;
	}



}
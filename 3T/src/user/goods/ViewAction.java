package user.goods;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.goods.VO.GoodsVO;

public class ViewAction extends ActionSupport {

   public static Reader reader;
   public static SqlMapClient sqlMapper;

   private GoodsVO paramClass = new GoodsVO();
   private GoodsVO resultClass = new GoodsVO();

   private int currentPage;

   private int Goods_no;
   
   /*private List<reviewBoardBean> reviewList = new ArrayList<reviewBoardBean>();
      private reviewBoardBean reviewClass = new reviewBoardBean();
      
      private List<qnaBoardBean> qnaList = new ArrayList<qnaBoardBean>();
      private qnaBoardBean qnaClass = new qnaBoardBean();*/

   public ViewAction() throws IOException {
      reader = Resources.getResourceAsReader("sqlMapConfig.xml");
      sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
      reader.close();
   }
    //�󼼺���
   public String execute() throws Exception {
      
      paramClass.setGoods_no(getGoods_no());
      
      sqlMapper.update("goods-updateReadcnt", paramClass);

      resultClass = (GoodsVO) sqlMapper.queryForObject("goods-selectOne", getGoods_no());

       /*reviewList = (List) sqlMapper.queryForList("review.selectAll", getGoods_no()); 
        qnaList = (List) sqlMapper.queryForList("qna.qnaListDetail", getGoods_no());*/
      
      return SUCCESS;
   }

   public int getGoods_no() {
      return Goods_no;
   }

   public void setGoods_no(int goods_no) {
      Goods_no = goods_no;
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
   
   
}
package user.goods;
public class pagingAction {

	private int currentPage;   // ?��?��?��?�댁�?
	private int totalCount;	 // ?��泥? 寃���臾? ?��
	private int totalPage;	 // ?��泥? ?��?�댁�? ?��
	private int blockCount;	 // ?�� ?��?�댁�??��  寃���臾쇱�� ?��
	private int blockPage;	 // ?�� ?��硫댁�� 蹂댁�ъ�? ?��?�댁�? ?��
	private int startCount;	 // ?�� ?��?�댁�??��?�� 蹂댁�ъ�? 寃���湲??�� ?��?�� 踰���
	private int endCount;	 // ?�� ?��?�댁�??��?�� 蹂댁�ъ�? 寃���湲??�� ?�� 踰���
	private int startPage;	 // ?��?�� ?��?�댁�?
	private int endPage;	 // 留��?留? ?��?�댁�?

	private StringBuffer pagingHtml;

	// ?��?�댁�? ?��?��?��
	public pagingAction(int currentPage, int totalCount, int blockCount,
			int blockPage) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		// ?��泥? ?��?�댁�? ?��
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// ?��?�� ?��?�댁�?媛? ?��泥? ?��?�댁�? ?��蹂대�� ?�щ�? ?��泥? ?��?�댁�? ?��濡? ?��?��
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// ?��?�� ?��?�댁�??�� 泥���怨? 留��?留? 湲??�� 踰��� 媛??��?�ㅺ�?.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// ?��?�� ?��?�댁�??? 留��?留? ?��?�댁�? 媛? 援ы��湲?.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 留��?留? ?��?�댁�?媛? ?��泥? ?��?�댁�? ?��蹂대�� ?�щ�? ?��泥? ?��?�댁�? ?��濡? ?��?��
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// ?��?�� block ?��?�댁�?
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a href=listouter.action?currentPage="
					+ (startPage - 1) + ">");
			pagingHtml.append("?��?��");
			pagingHtml.append("</a>");
		}

		pagingHtml.append("&nbsp;|&nbsp;");

		//?��?�댁�? 踰���.?��?�� ?��?�댁�??�� 鍮④�?��?�쇰�? 媛�議�?��怨? 留��щ�? ?��嫄?.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("&nbsp;<b> <font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			} else {
				pagingHtml
						.append("&nbsp;<a href='listouter.action?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append("'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}

			pagingHtml.append("&nbsp;");
		}

		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

		// ?��?�� block ?��?�댁�?
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a href=listouter.action?currentPage="
					+ (endPage + 1) + ">");
			pagingHtml.append("?��?��");
			pagingHtml.append("</a>");
		}
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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}
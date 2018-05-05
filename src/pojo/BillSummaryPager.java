package pojo;

import java.util.Date;

public class BillSummaryPager extends Pager {
	private Date beginDate;
	private Date endDate;
	private Date othDate;

	public Date getOthDate() {
		return othDate;
	}

	public void setOthDate(Date othDate) {
		this.othDate = othDate;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	

}

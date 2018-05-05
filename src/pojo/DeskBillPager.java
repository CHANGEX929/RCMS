package pojo;

import pojo.Pager;

import java.util.Date;

public class DeskBillPager extends Pager {
  private Date billDate;//账单日期

public Date getBillDate() {
	return billDate;
}

public void setBillDate(Date billDate) {
	this.billDate = billDate;
}

@Override
public String toString() {
	return "DeskBillPager [billDate=" + billDate + "]";
}

  
  
}

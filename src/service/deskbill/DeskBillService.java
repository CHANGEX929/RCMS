package service.deskbill;

import java.util.Date;
import java.util.List;

import pojo.BillSummary;
import pojo.BillSummaryPager;
import pojo.DeskBillPager;
import pojo.DeskInfo_detail;
import pojo.Deskbill;

public interface DeskBillService {
	/**
	 * 插入一条账单数据
	 * @param deskBill 返回带id值的账单
	 * @return
	 */
	public int addDeskBill(Deskbill deskBill);
	/**
	 * 插入一条账单详情
	 * @param deskbillDetail
	 * @return
	 */
	public int addDeskBillDetail(DeskInfo_detail deskInfo_detail);
	/**
	 * 动态查询桌位账单
	 */
	public List<Deskbill> getDekBills(DeskBillPager pager);
	
	/**
	 * 查询某一桌位账单详情
	 */
	public List<DeskInfo_detail> getDeskInfo_detailByDeskBillId(int id);
	/**
	 * 查询每日账单汇总
	 */
	public List<BillSummary> getBillSummarys(BillSummaryPager pager);
	/**
	 * 查询某天账单总数
	 */
	public int getCount(Date date);
	/**
	 * 查询BillSummary记录数
	 */
	public int getBillSummaryCount(BillSummaryPager pager);
	/**
	 * 让销售数目自增1
	 */
	public int sellDrink(String drinkBillCode,int count);

}

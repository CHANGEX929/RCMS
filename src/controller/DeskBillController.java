package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pojo.BillSummary;
import pojo.BillSummaryPager;
import pojo.Desk;
import pojo.DeskBillPager;
import pojo.DeskInfo_detail;
import pojo.Deskbill;
import service.desk.DeskService;
import service.deskbill.DeskBillService;
import tools.BillCodeUtil;
import tools.PagerTools;
import tools.RedisUtil;

import com.alibaba.fastjson.JSON;

@Controller
public class DeskBillController {
	@Autowired
	private DeskBillService deskBillService;
	@Resource(name="redisUtil")
	private RedisUtil redisUtil;
	@Autowired
	private DeskService deskService;
	
	
	// ajax结账
	@RequestMapping("/pay.do")
	@ResponseBody
	public Object pay(Deskbill deskBill) {
		deskBill.setBillCode(BillCodeUtil.getBillCode());// 设置账单编号为当前毫秒数
		deskBillService.addDeskBill(deskBill);//添加账单
		int deskBillId=deskBill.getId();//得到本次账单的id
		int deskId=deskBill.getDeskId();//得到该账单所属的桌位id
		Desk desk=deskService.getDeskById(deskId+"");//查询该ID的桌位
		String deskCode=desk.getDeskCode();//得到桌位编号
		//从缓存取出菜单列表，并且遍历账单列表一条一条插入账单详情
		List<DeskInfo_detail> deskDishes=redisUtil.getList(deskCode);//取出菜单列表
		if(deskDishes!=null){
			for (DeskInfo_detail deskInfo_detail : deskDishes) {
				if(deskInfo_detail.getDrinkBillCode()!=null && !deskInfo_detail.getDrinkBillCode().equals("")){//增加销售信息
					deskBillService.sellDrink(deskInfo_detail.getDrinkBillCode(),deskInfo_detail.getDishNum());
				}
				deskInfo_detail.setDeskBillId(deskBillId);
				deskBillService.addDeskBillDetail(deskInfo_detail);
			}
			//滞空桌位号码，删除缓存内数据
			redisUtil.del(deskCode);//删除缓存数据
			desk.setStatus(1);
			desk.setPeopleNum(0);
			deskService.updateDesk(desk);
		}
		return JSON.toJSONString("OK");
	}

	//今日账单
	@RequestMapping("/todayBill.html")
	public String showTodayBill(HttpSession session, Model model, DeskBillPager pager, BillSummaryPager bpager){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		int totalCount=deskBillService.getCount(new Date());//查询当天账单总条数
		bpager.setOpr("today");//设置查询类型
		bpager.setFirstData(0);
		bpager.setPageSize(1);
		pager.setBillDate(new Date());//设置日期为当天
		pager.setTotalCount(totalCount);//设置总数
		pager.setPageSize(PagerTools.deskBillPagerSize);//设置每一页数据量
		pager.count();//格式化数据
		model.addAttribute("billSummarys", deskBillService.getBillSummarys(bpager));//当天账单汇总
		List<Deskbill> deskBills=deskBillService.getDekBills(pager);//分页查询
		pager.setList(deskBills);//将数据保存在pager对象内
		model.addAttribute("deskBillpager", pager);
		return "/bill/bill";
	}
	//ajax加载桌位账单详情
	@RequestMapping("/getBillDetail.do")
	@ResponseBody
	public Object getBillDetail(Deskbill deskbill){
		List<DeskInfo_detail> deskInfo_details=null;
		if(deskbill!=null){
			deskInfo_details=deskBillService.getDeskInfo_detailByDeskBillId(deskbill.getId());
		}
		return JSON.toJSONString(deskInfo_details);
	}
		
	//日账单
	@RequestMapping("/dateBill.html")
	public String showDateBill(HttpSession session,Model model,BillSummaryPager bpager){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		if(bpager.getBeginDate()!=null && bpager.getEndDate()==null){//当只填写了开始日期时单独查询这天的账单
			bpager.setOpr("otherday");
			bpager.setOthDate(bpager.getBeginDate());
			bpager.setTotalCount(1);//给pager设置总数据量
			bpager.setPageSize(PagerTools.billSummaryPagerSize);//设置页面大小
			bpager.count();//格式化数据
		}else if(bpager.getBeginDate()!=null && bpager.getEndDate()!=null){//都填写了
			int  billSummaryCount=deskBillService.getBillSummaryCount(bpager);//得到总数据量
			bpager.setTotalCount(billSummaryCount);//给pager设置总数据量
			bpager.setPageSize(PagerTools.billSummaryPagerSize);//设置页面大小
			bpager.count();//格式化数据
		}else{//都没填写
			bpager.setOpr("date");
			int  billSummaryCount=deskBillService.getBillSummaryCount(bpager);//得到总数据量
			bpager.setTotalCount(billSummaryCount);//给pager设置总数据量
			bpager.setPageSize(PagerTools.billSummaryPagerSize);//设置页面大小
			bpager.count();//格式化数据
		}
		bpager.setList(deskBillService.getBillSummarys(bpager));
		model.addAttribute("bpager", bpager);
		return "/bill/datebill";
	}
	
	//日详情
	@ResponseBody
	@RequestMapping("/ajax")
	public ModelAndView ajax(ModelAndView m,DeskBillPager dpager,BillSummaryPager bpager){
		int totalCount=deskBillService.getCount(dpager.getBillDate());//查询当天账单总条数
		bpager.setOpr("otherday");//设置查询类型
		bpager.setFirstData(0);
		bpager.setPageSize(1);
		dpager.setTotalCount(totalCount);//设置总数
		dpager.setPageSize(PagerTools.deskBillPagerSize);//设置每一页数据量
		dpager.count();//格式化数据
		Map map=new HashMap();
		map.put("billSummarys",  deskBillService.getBillSummarys(bpager));//当天账单汇总
		List<Deskbill> deskBills=deskBillService.getDekBills(dpager);//分页查询
		dpager.setList(deskBills);//将数据保存在pager对象内
		m.setViewName("/bill/dateDetail");
		map.put("deskBillpager", dpager);
		m.addAllObjects(map);
		m.addObject("a", "CHANGEX");
		return m;
	}

	//ajax查看账单曲线
	@RequestMapping("/chart.do")
	@ResponseBody
	public Object showDateChart(BillSummaryPager bpager){
		List<BillSummary> billSummarys=deskBillService.getBillSummarys(bpager);
		return JSON.toJSONString(billSummarys);
	};


	//月账单
	@RequestMapping("/monthBill.html")
	public String showMonthBill(HttpSession session,Model model,BillSummaryPager bpager){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		bpager.setOpr("month");
		int  billSummaryCount=deskBillService.getBillSummaryCount(bpager);//得到总数据量
		bpager.setTotalCount(billSummaryCount);//给pager设置总数据量
		bpager.setPageSize(PagerTools.billSummaryPagerSize);//设置页面大小
		bpager.count();//格式化数据
		bpager.setList(deskBillService.getBillSummarys(bpager));
		model.addAttribute("bpager", bpager);
		return "/bill/monthbill";
	}
	//年账单
	@RequestMapping("/yearBill.html")
	public String showYearBill(HttpSession session, Model model, BillSummaryPager bpager){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		bpager.setOpr("year");
		int  billSummaryCount=deskBillService.getBillSummaryCount(bpager);//得到总数据量
		bpager.setTotalCount(billSummaryCount);//给pager设置总数据量
		bpager.setPageSize(PagerTools.billSummaryPagerSize);//设置页面大小
		bpager.count();//格式化数据
		bpager.setList(deskBillService.getBillSummarys(bpager));
		model.addAttribute("bpager", bpager);
		return "/bill/yearbill";
	}
}

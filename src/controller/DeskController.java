package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import dao.dish.DishMapper;

import org.springframework.web.servlet.ModelAndView;
import pojo.*;

import pojo.dish.Dishes;
import pojo.DeskPager;
import pojo.Pager;
import service.desk.DeskService;
import tools.PagerTools;
import tools.RedisUtil;

@Controller
public class DeskController {
	@Autowired
	private DeskService deskService;
	@Resource(name="redisUtil")
	private RedisUtil redisUtil;
	@Autowired
	private DishMapper dishMapper;
	
	
	//显示桌位列表页面
	@RequestMapping(value="/desklist.html")
	public String showDeskList(Model model, HttpSession session, @RequestParam(required=false)String show){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		List<Desk> desks=deskService.getDesks();
		model.addAttribute("desks", desks);
		if(!"desk".equals(show)){
			return "redirect:desklist.html?show=desk";
		}else{
			return "/desk/desklist";
		}		
	}
	//桌位详情页面
	@RequestMapping(value="/deskinfo.html")
	public String showDeskInfo(@RequestParam(required=false)String id,Model model,HttpSession session){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		Desk desk=null;
		int status=0;
		String deskCode=null;
		if(id!=null && id!=""){
			desk=deskService.getDeskById(id);
		}
		if(desk!=null){
			status=desk.getStatus();
			deskCode=desk.getDeskCode();
		}
		if(status==1){//如果桌位状态为空
			if(deskCode!=null && deskCode!=""){//传过来的桌位编号不为空时
				redisUtil.del(deskCode);//删除缓存内的桌位菜单信息
			}
		}else if(status==2){//如果桌位状态为未买单
			if(deskCode!=null && deskCode!=""){//传过来的桌位编号不为空时
				List<DeskInfo_detail> deskDish=redisUtil.getList(deskCode);//从缓存取出当前桌位的点菜信息
				Double totalMoney=0.0;//总计
				if (deskDish==null || deskDish.size()==0) {
					deskDish=new ArrayList<DeskInfo_detail>();
					redisUtil.addList(deskCode, deskDish);
				}
				for (int i = 0; i < deskDish.size(); i++) {
					if(deskDish.get(i).getCost()!=null){
						totalMoney+=deskDish.get(i).getCost();
					}			
				}
				model.addAttribute("totalMoney", totalMoney);
				model.addAttribute("deskDish", deskDish);
			}
		}
		List dishes=redisUtil.getList("allDishes");//先从缓存中查询
		if(dishes == null || dishes.size()==0){//如果缓存中没有则从数据库查
			dishes=dishMapper.getDish();
			redisUtil.addList("allDishes",dishes);
		}
		Dishes dishesUtil=Dishes.getDishes();//菜单工具类
		dishesUtil.setAllDish(dishes);//将查询出来的菜品放在工具类中
		dishesUtil.count();//格式化菜品（分类）
		//session.setAttribute("dishUtil",dishesUtil);
		model.addAttribute("desk", desk);
		return "/desk/deskinfo";
	}
	
	//ajax点菜
	@RequestMapping("/selectDish.do")
	@ResponseBody
	public Object selectDish(DeskInfo_detail deskInfo_detail,@RequestParam(required=false)String deskCode){
		List<DeskInfo_detail> deskDish=redisUtil.getList(deskCode);
		if(deskDish==null){
			deskDish=new ArrayList<DeskInfo_detail>();
			System.out.println("------------------------------新建桌位号"+deskCode+"菜单列表------------------------------");
		}
		boolean addFlag=true;//标记是否有相同的菜品，默认为true表名不存在相同菜名
		for (int i = 0; i < deskDish.size(); i++) {
			if(deskDish.get(i).getDishName().equals(deskInfo_detail.getDishName())){//如果存在相同的菜品
				int oldNum=deskDish.get(i).getDishNum();//得到原来的数目
				String newContent=deskInfo_detail.getContent();
				int newNum=oldNum+deskInfo_detail.getDishNum();//将新添加的数目和原来的数目相加得到新数目
				deskDish.get(i).setDishNum(newNum);//修改数目
				deskDish.get(i).setCost(newNum*deskDish.get(i).getPrice());//修改小计
				deskDish.get(i).setContent(newContent);
				addFlag=false;//存在相同的，将标记设置为false
				break;
			}
		}
		if(addFlag){//如果不存在相同的菜品，addFlag的值为true
			deskDish.add(deskInfo_detail);
		}		
		redisUtil.addList(deskCode, deskDish);//更新缓存
		return JSON.toJSONString(deskDish);
	}
	
	//更改桌位状态
	@RequestMapping("/changeStatus.do")
	@ResponseBody
	public Object changeDeskStatus(Desk desk){
		boolean flag=false;
		if(desk!=null){
			if(desk.getStatus()!=null && desk.getStatus()!=2 ){
				desk.setStatus(2);
				flag=deskService.updateDeskStatus(desk);
			}else{
				return JSON.toJSONString("OK");
			}
		}	
		if(flag){
			return JSON.toJSONString("OK");
		}else{
			return JSON.toJSONString("NO");
		}
	}
	
	//更改桌位
	@RequestMapping("/changeDesk.do")
	@ResponseBody
	public Object changeDesk(Desk desk){
		boolean flag=deskService.updateDesk(desk);
		String str="";
		if(flag){
			str="true";
		}else{
			str="false";
		}
		return JSON.toJSONString(str);
	}
	
	
	//更改菜品
	@RequestMapping("/updateDish.do")
	@ResponseBody
	public Object updateDish(DeskInfo_detail deskInfo_detail,@RequestParam(required=false)String deskCode){
		List<DeskInfo_detail> deskDish=redisUtil.getList(deskCode);
		for (int i = 0; i < deskDish.size(); i++) {
			if(deskDish.get(i).getDishName().equals(deskInfo_detail.getDishName())){//找到相同的菜品
				String newContent=deskInfo_detail.getContent();//得到新的备注
				int newNum=deskInfo_detail.getDishNum();//得到修改过后的数目
				deskDish.get(i).setDishNum(newNum);//修改数目
				deskDish.get(i).setCost(newNum*deskDish.get(i).getPrice());//修改小计
				deskDish.get(i).setContent(newContent);//修改备注
				redisUtil.addList(deskCode, deskDish);//更新缓存
				break;
			}
		}
		return JSON.toJSONString(deskDish);
	}
	
	//删除菜品
	@RequestMapping("/delDish.do")
	@ResponseBody
	public Object delDish(DeskInfo_detail deskInfo_detail,@RequestParam(required=false)String deskCode){
		List<DeskInfo_detail> deskDish=redisUtil.getList(deskCode);
		for (int i = 0; i < deskDish.size(); i++) {
			if(deskDish.get(i).getDishName().equals(deskInfo_detail.getDishName())){//找到相同的菜品
				deskDish.remove(i);//删除该菜品
				redisUtil.addList(deskCode, deskDish);//更新缓存
				break;
			}
		}
		return JSON.toJSONString(deskDish);
	}


	@ResponseBody
	@RequestMapping("/alldish.do")
	public ModelAndView showAlldish(ModelAndView modelAndView,
	Pager pager
	){
		Dishes dishes=Dishes.getDishes();
		if("allDish".equals(pager.getOpr())){
			pager.setTotalCount(dishes.getAllDishCount());
			pager.setPageSize(PagerTools.dishMenuPagerSize);
			pager.count();
			List<Dish> list=dishes.getAllDish(pager);
			pager.setList(list);
		}else if("soup".equals(pager.getOpr())){
			pager.setTotalCount(dishes.getSoupsCount());
			pager.setPageSize(PagerTools.dishMenuPagerSize);
			pager.count();
			List<Dish> list=dishes.getSoups(pager);
			pager.setList(list);
		}else if("fry".equals(pager.getOpr())){
			pager.setTotalCount(dishes.getFrysCount());
			pager.setPageSize(PagerTools.dishMenuPagerSize);
			pager.count();
			List<Dish> list=dishes.getFrys(pager);
			pager.setList(list);
		}else if("other".equals(pager.getOpr())){
			pager.setTotalCount(dishes.getOthersCount());
			pager.setPageSize(PagerTools.dishMenuPagerSize);
			pager.count();
			List<Dish> list=dishes.getOthers(pager);
			pager.setList(list);
		}else if("drink".equals(pager.getOpr())){
			pager.setTotalCount(dishes.getDrinksCount());
			pager.setPageSize(PagerTools.dishMenuPagerSize);
			pager.count();
			List<Dish> list=dishes.getDrinks(pager);
			pager.setList(list);
		}
		modelAndView.setViewName("/desk/dishMenu/allDish");
		modelAndView.addObject("pager",pager);
		return modelAndView;
	}


	//桌位维护
	//添加桌位 ajax验证
	@ResponseBody
	@RequestMapping("/deskCodeIsExist.do")
	public Object deskCodeIsExist(@RequestParam(required =false) String deskCode){
		boolean flag=deskService.isExist(deskCode);
		return flag?JSON.toJSONString("1"):JSON.toJSONString("0");
	}

	//添加桌位
	@ResponseBody
	@RequestMapping("/addDesk.do")
	public Object addDesk(Desk desk){
		System.out.println("~~~~~~~~~~~~~~~~~~~~~添加桌位："+desk.getDeskCode()+"~~~~~~~~~~~~~~~~~~~~~");
		boolean flag=deskService.addDesk(desk);
		if(flag){
			System.out.println("~~~~~~~~~~~~~~~~~~~~~添加桌位："+desk.getDeskCode()+"成功~~~~~~~~~~~~~~~~~~~~~");
		}else{
			System.out.println("~~~~~~~~~~~~~~~~~~~~~添加桌位："+desk.getDeskCode()+"失败~~~~~~~~~~~~~~~~~~~~~");
		}
		return flag?JSON.toJSONString("1"):JSON.toJSONString("0");
	}

	//ajax分页加载桌位
	@ResponseBody
	@RequestMapping("/ajaxShowDesk.do")
	public ModelAndView ajaxShowDesk(DeskPager pager, ModelAndView modelAndView){
		modelAndView.setViewName("/daily/desk/deskList");
		pager.setPageSize(PagerTools.delDishListPagerSize);
		pager.setTotalCount(deskService.getTotalCount(pager));
		pager.count();
		pager.setList(deskService.getDesksByPager(pager));
		modelAndView.addObject("pager",pager);
		return modelAndView;
	}

	//删除桌位
	@ResponseBody
	@RequestMapping("/delDesk.do")
	public Object delDesk(@RequestParam(required=false) String id){
		int data=deskService.delDesk(id);
		return JSON.toJSONString(data);
	}

	//更改桌位
	@ResponseBody
	@RequestMapping("/alertDesk.do")
	public Object delDesk(Desk desk){
		boolean data=deskService.updateDesk(desk);
		return JSON.toJSONString(data?"1":"0");
	}


}

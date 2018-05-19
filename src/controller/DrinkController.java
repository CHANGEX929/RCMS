package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pojo.*;
import service.drink.ProviderService;
import tools.BillCodeUtil;
import tools.PagerTools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.util.List;

@Controller
public class DrinkController {
    @Autowired
    private ProviderService providerService;

    @RequestMapping("/drink.html")
    public String drink(HttpSession session) {
        if(session.getAttribute("user")==null){//权限控制
            return "redirect:login.html";
        }
        return "/drink/drink";
    }

    ;

    //加载供应下拉列表
    @RequestMapping("/loadProviderSelect.do")
    @ResponseBody
    public Object loadProviderSelect() {
        return JSON.toJSONString(providerService.getProvider());
    }

    ;

    //加载进货信息
    @RequestMapping("/loadDrinkBill.do")
    @ResponseBody
    public ModelAndView loadDrinkBill(ModelAndView modelAndView, DrinkBillPager pager) {
        int totalCount = providerService.getDrinkBillCount(pager);
        if (totalCount != 0) {
            pager.setTotalCount(totalCount);
        } else {
            pager.setTotalCount(1);
        }
        pager.setPageSize(PagerTools.drinkBillPagerSize);
        pager.count();
        pager.setList(providerService.getDrinkBill(pager));
        modelAndView.addObject("pager", pager);
        modelAndView.setViewName("/drink/ajaxJinhuoList");
        return modelAndView;
    }

    //加载进货信息
    @RequestMapping("/loadDrinkBillCode.do")
    @ResponseBody
    public Object loadDrinkBillCode(DrinkBillPager pager) {
        int totalCount = providerService.getDrinkBillCount(pager);
        if (totalCount != 0) {
            pager.setTotalCount(totalCount);
        } else {
            pager.setTotalCount(1);
        }
        pager.setPageSize(100);
        pager.count();
        List<Drinkbill> drinkBills=providerService.getDrinkBill(pager);
        return JSON.toJSONString(drinkBills);
    }

    //del删除进货信息
    @RequestMapping("/delDrinkBill.do")
    @ResponseBody
    public Object delDrinkBill(@RequestParam(required = false) String id) {
        providerService.delDrinkSellBill(id);
        return JSON.toJSONString(providerService.delDrinkBill(id));
    }


    //del删除销售信息
    @RequestMapping("/delDrinkSellBill.do")
    @ResponseBody
    public Object delDrinkSellBill(@RequestParam(required = false) String id) {
        return JSON.toJSONString(providerService.delDrinkSellBill(id));
    }

    //更新进货信息
    @RequestMapping("/updateDrinkBill.do")
    @ResponseBody
    public Object delDrinkBill(Drinkbill drinkbill) {
        drinkbill.setIsPay(2);
        return JSON.toJSONString(providerService.updateDrinkBill(drinkbill));
    }

    ;

    //添加进货信息
    @RequestMapping("/addDrinkBill.do")
    @ResponseBody
    public Object addDrinkBill(Drinkbill drinkbill, DrinkSellBill drinkSellBill) {
        String drinkBillCode = BillCodeUtil.getBillCode();
        drinkbill.setDrinbillCode(drinkBillCode);
        int addDrinkBillFlag = providerService.addDrinkBill(drinkbill);
        drinkSellBill.setDrinkbillId(drinkbill.getId());
        drinkSellBill.setDrinkBillCode(drinkBillCode);
        int addDrinkSellBillFlag = providerService.addDrinkSellBill(drinkSellBill);
        return "{\"addDrinkBillFlag\":\"" + addDrinkBillFlag + "\",\"addDrinkSellBillFlag\":\"" + addDrinkSellBillFlag + "\"}";
    }

    //加载销售信息
    @RequestMapping("/loadDrinkSellBill.do")
    @ResponseBody
    public ModelAndView loadDrinkSellBill(ModelAndView modelAndView, DrinkBillPager pager) {
        int totalCount = providerService.getDrinkSellBillCount(pager);
        if (totalCount != 0) {
            pager.setTotalCount(totalCount);
        } else {
            pager.setTotalCount(1);
        }
        pager.setPageSize(PagerTools.drinkBillPagerSize);
        pager.count();
        pager.setList(providerService.getDrinkSellBill(pager));
        modelAndView.addObject("pager", pager);
        modelAndView.setViewName("/drink/sellList");
        return modelAndView;
    }

    //加载销售信息
    @RequestMapping("/loadSuplusDrinkBill.do")
    @ResponseBody
    public ModelAndView loadSuplusDrinkBill(ModelAndView modelAndView, DrinkBillPager pager) {
        int totalCount = providerService.getDrinkSellBillCount(pager);
        if (totalCount != 0) {
            pager.setTotalCount(totalCount);
        } else {
            pager.setTotalCount(1);
        }
        pager.setPageSize(PagerTools.drinkBillPagerSize);
        pager.count();
        pager.setList(providerService.getSuplusDrinkBill(pager));
        modelAndView.addObject("pager", pager);
        modelAndView.setViewName("/drink/suplusDrinkBillList");
        return modelAndView;
    }

    //添加供应商
    @RequestMapping("/addProvider.do")
    @ResponseBody
    public Object addProvider(Provider provider){
        return JSON.toJSONString(providerService.addProvider(provider));
    }
    //验证供应商是否存在
    @RequestMapping("/isProExist.do")
    @ResponseBody
    public Object isProExist(@RequestParam(required = false) String proName){
        return JSON.toJSONString(providerService.isProExist(proName));
    }
    //加载供应商列表
    @RequestMapping("/showProviderList.do")
    public ModelAndView showProviderList(ModelAndView modelAndView,Pager pager){
        pager.setTotalCount(providerService.getTotalCount(pager));
        pager.setPageSize(3);
        pager.count();
        if("".equals(pager.getOpr()) || pager.getOpr()==null){
            modelAndView.addObject("provider",providerService.getProviderList(pager).get(0));
            modelAndView.setViewName("daily/provider/updateProvider");
        }else{
            pager.setList(providerService.getProviderList(pager));
            modelAndView.setViewName("daily/provider/providerList");
            modelAndView.addObject("pager",pager);
        }
        return modelAndView;
    }
    //删除供应商
    @RequestMapping("/delProviderById.do")
    @ResponseBody
    public Object delProviderById(Pager pager){
        return JSON.toJSONString(providerService.delProviderById(pager));
    }
    //更改供应商
    @RequestMapping("/updateProvider.do")
    @ResponseBody
    public Object updateProvider(Provider provider){
        return JSON.toJSONString(providerService.updateProvider(provider));
    }
}

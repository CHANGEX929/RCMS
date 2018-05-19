package dao.drink;

import pojo.*;

import java.util.List;

public interface ProviderMapper {
    /**
     * 查询供应商
     */
    public List<Provider> getProvider();

    /**
     * 查询进货列表
     */
    public List<Drinkbill> getDrinkBill(DrinkBillPager pager);
    /**
     * 查询进货列表数目
     */
    public int getDrinkBillCount(DrinkBillPager pager);
    /**
     * 删除进货信息
     */
    public int delDrinkBill(String id);
    /**
     * 更新进货信息
     */
    public int updateDrinkBill(Drinkbill drinkbill);
    /**
     * 添加进货信息
     */
    public int addDrinkBill(Drinkbill drinkbill);
    /**
     * 添加销售信息
     */
    public int addDrinkSellBill(DrinkSellBill drinkSellBill);
    /**
     * 查询销售信息
     */
    public List<DrinkSellBill> getDrinkSellBill(DrinkBillPager drinkBillPager);
    /**
     * 查询销售信息数目
     */
    public int getDrinkSellBillCount(DrinkBillPager drinkBillPager);
    /**
     * 删除销售信息
     */
    public int delDrinkSellBill(String id);
    /**
     * 查询剩余信息
     */
    public List<SuplusDrinkBill>  getSuplusDrinkBill(DrinkBillPager drinkBillPager);

    /**
     * 添加供应商
     */
    public int addProvider(Provider provider);

    //验证供应商是否存在
    public int isProExist(String proName);

    //查询供应商
    public List<Provider> getProviderList(Pager pager);
    //查询总数量
    public int getTotalCount(Pager pager);
    //删除供应商
    public int delProviderById(Pager pager);
    //更新供应商
    public int updateProvider(Provider provider);
}

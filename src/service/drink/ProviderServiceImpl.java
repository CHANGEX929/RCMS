package service.drink;

import dao.drink.ProviderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.*;

import java.util.List;
@Service
public class ProviderServiceImpl implements ProviderService{
    @Autowired
    private ProviderMapper providerMapper;
    /**
     * 查询供应商
     */
    public List<Provider> getProvider(){
     return providerMapper.getProvider();
    };

    @Override
    public List<Drinkbill> getDrinkBill(DrinkBillPager pager) {
        return providerMapper.getDrinkBill(pager);
    }

    @Override
    public int getDrinkBillCount(DrinkBillPager pager) {
        return providerMapper.getDrinkBillCount(pager);
    }

    @Override
    public int delDrinkBill(String id) {
        return providerMapper.delDrinkBill(id);
    }

    @Override
    public int updateDrinkBill(Drinkbill drinkbill) {
        return providerMapper.updateDrinkBill(drinkbill);
    }

    @Override
    public int addDrinkBill(Drinkbill drinkbill) {
        return providerMapper.addDrinkBill(drinkbill);
    }

    @Override
    public int addDrinkSellBill(DrinkSellBill drinkSellBill) {
        return providerMapper.addDrinkSellBill(drinkSellBill);
    }

    @Override
    public List<DrinkSellBill> getDrinkSellBill(DrinkBillPager drinkBillPager) {
        return providerMapper.getDrinkSellBill(drinkBillPager);
    }

    @Override
    public int getDrinkSellBillCount(DrinkBillPager drinkBillPager) {
        return providerMapper.getDrinkSellBillCount(drinkBillPager);
    }

    @Override
    public int delDrinkSellBill(String id) {
        return providerMapper.delDrinkSellBill(id);
    }
    /**
     * 查询剩余信息
     */
    @Override
    public List<SuplusDrinkBill>  getSuplusDrinkBill(DrinkBillPager drinkBillPager){
        return providerMapper.getSuplusDrinkBill(drinkBillPager);
    };

    @Override
    public int addProvider(Provider provider) {
        return providerMapper.addProvider(provider);
    }

    @Override
    public int isProExist(String proName) {
        return providerMapper.isProExist(proName);
    }

    @Override
    public List<Provider> getProviderList(Pager pager) {
        return providerMapper.getProviderList(pager);
    }

    @Override
    public int getTotalCount(Pager pager) {
        return providerMapper.getTotalCount(pager);
    }

    @Override
    public int delProviderById(Pager pager) {
        return providerMapper.delProviderById(pager);
    }

    @Override
    public int updateProvider(Provider provider) {
        return providerMapper.updateProvider(provider);
    }
}

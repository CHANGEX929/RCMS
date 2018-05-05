package pojo.dish;

import pojo.Dish;
import pojo.Pager;

import java.util.ArrayList;
import java.util.List;

public class Dishes {
    private static Dishes dishes = new Dishes();
    private List<Dish> allDish;//全部菜品
    private List<Dish> soups = new ArrayList<>();//汤类
    private List<Dish> frys = new ArrayList<>();//炒菜
    private List<Dish> others = new ArrayList<>();//其它
    private List<Dish> drinks = new ArrayList<>();//酒水

    private Dishes() {
    }

    public static Dishes getDishes() {
        return dishes;
    }

    //格式化数据
    public void count() {
        if (allDish == null || allDish.size() == 0) {
            return;
        }
        soups.removeAll(soups);
        frys.removeAll(frys);
        others.removeAll(others);
        drinks.removeAll(drinks);
        for (Dish dish : allDish) {
            int dishType = dish.getType();
            switch (dishType) {
                case 1:
                    soups.add(dish);
                    break;
                case 2:
                    frys.add(dish);
                    break;
                case 3:
                    drinks.add(dish);
                    break;
                case 4:
                    others.add(dish);
                    break;
            }
        }
    }

    public Integer getAllDishCount() {
        if (allDish == null) {
            return 0;
        }
        return allDish.size();
    }

    public Integer getOthersCount() {
        count();
        if (others == null) {
            return 0;
        }
        return others.size();
    }

    public Integer getDrinksCount() {
        count();
        if (drinks == null) {
            return 0;
        }
        return drinks.size();
    }

    public Integer getFrysCount() {
        count();
        if (frys != null) {
            return frys.size();
        }
        return 0;
    }

    public Integer getSoupsCount() {
        count();
        if (soups == null) {
            return 0;
        }
        return soups.size();
    }

    public List<Dish> getAllDish(Pager pager) {
        count();
        List<Dish> list = new ArrayList<>();
        for (int i = pager.getFirstData(); i < pager.getFirstData() + pager.getPageSize(); i++) {
            if (allDish.size() <= i) {
                break;
            }
            if (allDish.get(i) != null) {
                list.add(allDish.get(i));
            }
        }
        return list;
    }

    public void setAllDish(List<Dish> allDish) {
        this.allDish = allDish;
    }

    public List<Dish> getSoups(Pager pager) {
        count();
        List<Dish> list = new ArrayList<>();
        for (int i = pager.getFirstData(); i < pager.getFirstData() + pager.getPageSize(); i++) {
            if (soups.size() <= i) {
                break;
            }
            if (soups.get(i) != null) {
                list.add(soups.get(i));
            }
        }
        return list;
    }


    public List<Dish> getFrys(Pager pager) {
        count();
        List<Dish> list = new ArrayList<>();
        for (int i = pager.getFirstData(); i < pager.getFirstData() + pager.getPageSize(); i++) {
            if (frys.size() <= i) {
                break;
            }
            if (frys.get(i) != null) {
                list.add(frys.get(i));
            }
        }
        return list;
    }


    public List<Dish> getOthers(Pager pager) {
        count();
        List<Dish> list = new ArrayList<>();
        for (int i = pager.getFirstData(); i < pager.getFirstData() + pager.getPageSize(); i++) {
            if (others.size() <= i) {
                break;
            }
            if (others.get(i) != null) {
                list.add(others.get(i));
            }
        }
        return list;
    }


    public List<Dish> getDrinks(Pager pager) {
        count();
        List<Dish> list = new ArrayList<>();
        for (int i = pager.getFirstData(); i < pager.getFirstData() + pager.getPageSize(); i++) {
            if (drinks.size() <= i) {
                break;
            }
            if (drinks.get(i) != null) {
                list.add(drinks.get(i));
            }
        }
        return list;
    }

}

package service.dish;

import java.util.List;

import pojo.Dish;

public interface DishService {
	/**
	 * 查询所有菜品
	 * @return
	 */
	public List<Dish> getDish();
	/**
	 * 根据菜品Id查询菜品
	 * @param id
	 * @return
	 */
	public Dish getDishById(String id);
	/**
	 * 添加菜品
	 */
	public boolean addDish(Dish dish);
	/**
	 * 查看菜名是否存在
	 */
	public boolean isExist(String dishName);
	/**
	 * 根据ID删除菜品
	 */
	public boolean delDishById(String id);
}

package dao.desk;

import java.util.List;

import pojo.Desk;
import pojo.DeskPager;

public interface DeskMapper {
	/**
	 * 查询所有桌位
	 * @return
	 */
	public List<Desk> getDesks();
	
	/**
	 * 更改桌位状态
	 * @return
	 */
	public int updateDeskStatus(Desk desk);
	/**
	 * 更改桌位信息
	 * @param desk
	 * @return
	 */
	public int updateDesk(Desk desk);
	/**
	 * 通过id查询桌位
	 * @param id
	 * @return
	 */
	public Desk getDeskById(String id);

	/**
	 * 判断桌位编号是否存在
	 * @param deskCode
	 * @return
	 */
	public int isExist(String deskCode);

	/**
	 * 添加桌位
	 * @param desk
	 * @return
	 */
	public int addDesk(Desk desk);
	/**
	 * 分页查询Desk
	 */
	public List<Desk> getDesksByPager(DeskPager pager);
	/**
	 * 查询总记录数
	 */
	public int getTotalCount(DeskPager pager);
	/**
	 * 删除桌位
	 */
	public int delDesk(String id);
}

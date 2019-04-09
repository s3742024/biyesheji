package service;

import java.util.ArrayList;

import bean.Contact;
import bean.HouseBase;
import bean.HouseImage;
import bean.Purchase;
import bean.SellInfo;
import dao.BuyDao;
import dao.TransactionDao;
import dao.UserDao;

public class TransactionService {
	/**
	 * 
	 * @description 插入卖房信息和交易信息
	 * @param nickname 用户昵称
	 * @param password 用户密码
	 * @return 1=匹配成功，0=账号封禁，-1=没有找到或出错
	 */
	public Boolean InputHouseBaseInfo(String nickname, HouseBase houseBase) {
		String userid = UserDao.QueryUserBydNickName(nickname);
		if (TransactionDao.InputHouseBaseInfo(userid, houseBase))
			return true;
		else {
			return false;
		}
	}

	/**
	 * 
	 * @description 根据用户昵称获取房屋基本信息
	 * @param nickName 昵称
	 * @return sellInfo数组 ，为空或异常返回null
	 */
	public SellInfo[] GetHouseBases(String nickName) {
		String userid = UserDao.QueryUserBydNickName(nickName);
		ArrayList<SellInfo> sellInfoList = TransactionDao.QueryInfosByUserId(userid);
		if (sellInfoList != null) {
			SellInfo[] sellInfos = new SellInfo[sellInfoList.size()];
			for (int i = 0; i < sellInfoList.size(); i++) {
				sellInfos[i] = (SellInfo) sellInfoList.get(i);
			}
			return sellInfos;
		}
		return null;
	}

	/**
	 * 
	 * @description 根据交易id获取交易信息和房屋基本信息
	 * @param sellInfoId 交易id
	 * @return sellInfo 对应的sell_info的bean里面包含houseBase的bean，null没有查询到和出现异常
	 */
	public SellInfo GetHouseBase(String sellInfoId) {
		SellInfo sellInfo=TransactionDao.QuerySellInfoById(sellInfoId);
		return sellInfo;
	}

	/**
	 * 
	 * @description 插入卖房信息和交易信息
	 * @param sellInfo 卖出信息 里面有houseBase 基本信息
	 * @param nickname 用户昵称
	 * @return true=成功 false=失败
	 */
	public Boolean updateHouseInfo(SellInfo sellInfo, String nickname) {
		String userid = UserDao.QueryUserBydNickName(nickname);
		sellInfo.setSellUserId(userid);
		Boolean isSuccess = TransactionDao.updateHouseInfo(sellInfo);
		return isSuccess;
	}
	/**
	 * 
	 * @description 更改卖房信息
	 * @param sellInfo 的bean
	 * @return true=成功 false=失败
	 */
	public Boolean editHouseInfo(SellInfo sellInfo) {
		Boolean isSuccess = TransactionDao.editHouseInfo(sellInfo);
		return isSuccess;
	}
	/**
	 * @description 添加houseImage信息
	 * @param houseImage的bean类 是类数组
	 * @return true=成功 false=失败
	 */
	public Boolean updateHouseImages(ArrayList<HouseImage> houseImageList) {
		if (houseImageList == null) 
			return false;
		HouseImage[] houseImages = new HouseImage[houseImageList.size()];
		for (int i = 0; i < houseImageList.size(); i++) {
			houseImages[i] = (HouseImage) houseImageList.get(i);
		}
		Boolean isSuccess = TransactionDao.updateHouseImages(houseImages);
		if (isSuccess)
			return true;
		else {
			return false;
		}	
	}
	/**
	 * 
	 * @description 获得所有卖房信息，不排序
	 * @param page 第几页
	 * @param num 每页几条数据
	 * @return sellInfo 对应的sell_info的数组，null没有查询到和出现异常
	 */
	public SellInfo[] QuerySellInfo(int page,int num) {
		ArrayList<SellInfo> sellInfoList = BuyDao.QuerySellInfo(page, num);
		if (sellInfoList != null) {
			SellInfo[] sellInfos = new SellInfo[sellInfoList.size()];
			for (int i = 0; i < sellInfoList.size(); i++) {
				sellInfos[i] = (SellInfo) sellInfoList.get(i);
			}
			return sellInfos;
		}
		return null;
	}
	/**
	 * 
	 * @description 给a_contact_info s_purchase_info添加新的记录
	 * @param Purchase 买房申请bean类 包含 Contact类
	 * @param nickname 用户昵称
	 * @return 返回找到的卖房者联系人信息 null为添加出错或查询出错
	 */
	public Contact InputPurchaseInfo(Purchase purchase,String nickname) {
		String userid = UserDao.QueryUserBydNickName(nickname);
		if(userid==null)
			return null;
		
		purchase.setpurchaseUserId(userid);
		Boolean isSuccess = BuyDao.InputPurchaseInfo(purchase);
		if(isSuccess) {
			Contact contact=BuyDao.QueryContactBySellInfoId(purchase.getsellInfoId());
			return contact;
		}else
			return null;
	}
}

package service;

import java.util.ArrayList;

import bean.HouseBase;
import bean.SellInfo;
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
	public Boolean InputHouseBaseInfo(String nickname,HouseBase houseBase) {
		String userid=UserDao.QueryUserBydNickName(nickname);
		if(TransactionDao.InputHouseBaseInfo(userid,houseBase))
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
		String userid=UserDao.QueryUserBydNickName(nickName);
		ArrayList<SellInfo> sellInfoList=TransactionDao.QueryUserBydNickName(userid);
		if(sellInfoList!=null) {
			SellInfo[] sellInfos=new SellInfo[sellInfoList.size()];  
			for(int i=0;i<sellInfoList.size();i++){  
				sellInfos[i]=(SellInfo)sellInfoList.get(i);  
			}  
			return sellInfos;
		}
		return null;
	}
	/**
	 * 
	 * @description 插入卖房信息和交易信息
	 * @param sellInfo 卖出信息 里面有houseBase 基本信息
	 * param sellInfo 用户昵称
	 * @return true=成功 false=失败
	 */
	public Boolean updateHouseInfo(SellInfo sellInfo,String nickname) {
		String userid=UserDao.QueryUserBydNickName(nickname);
		sellInfo.setSellUserId(userid);
		Boolean isSuccess=TransactionDao.updateHouseInfo(sellInfo);
		if(isSuccess)
			return true;
		else {
			return false;
		}
	}
}

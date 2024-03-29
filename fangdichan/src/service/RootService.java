package service;

import java.util.ArrayList;

import bean.Contact;
import bean.HouseBase;
import bean.Purchase;
import bean.RealInfo;
import bean.SellAudit;
import bean.SellInfo;
import bean.User;
import dao.ManagerDao;
import dao.TransactionDao;
import dao.UserDao;

public class RootService {
	public ArrayList<User> QueryAllUser(){
		ArrayList<User> Users=UserDao.QueryAllUser();
		if(Users!=null) {
			return Users;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 修改用户个人信息 可改的为用户权限和管理员备注
	 * @param 用户的bean
	 * @return true=成功 false=失败
	 */
	public boolean UpdateUserInfo(User user) {
		if(UserDao.UpdateUserInfo(user)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 
	 * @description 查询所有个人资料 
	 * @return realInfo的bean类的数组 没有查询到和出现异常为null
	 */
	public ArrayList<RealInfo> queryPersonalData(){
		ArrayList<RealInfo> realInfo=UserDao.queryPersonalData();
		if(realInfo!=null) {
			return realInfo;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 获取所有房屋基本信息
	 * @return sellInfo houseBase的bean的数组，null没有查询到和出现异常
	 */
	public ArrayList<HouseBase> QueryAllHouseBase(){
		ArrayList<HouseBase> houseBases=TransactionDao.QueryAllHouseBase();
		if(houseBases!=null) {
			return houseBases;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 获取所有待审核信息
	 * @return sellInfo的bean的数组，null没有查询到和出现异常
	 */
	public ArrayList<SellInfo> QueryAllToBeAudited(){
		ArrayList<SellInfo> sellInfos=TransactionDao.QueryAllToBeAudited();
		if(sellInfos!=null) {
			return sellInfos;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 插入审核信息
	 * @param sellAudit的bean类
	 * @return true=成功 false=失败
	 */
	public boolean updateSellAudit(SellAudit sellAudit) {
		if(ManagerDao.updateSellAudit(sellAudit)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 
	 * @description 根据用户昵称获取所有审核信息
	 * @param userid 用户的id
	 * @return SellAudit的bean的数组，每个里面有sellInfo的子类,null没有查询到和出现异常
	 */
	public ArrayList<SellAudit> queryAuditedByNickname(String nickname){
		String userid = UserDao.QueryUserBydNickName(nickname);
		ArrayList<SellAudit> sellAudits=ManagerDao.QueryAuditedById(userid);
		if(sellAudits!=null) {
			return sellAudits;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 查询所有联系人信息
	 * @return contact的数组，null为出错或者没有查询到
	 */
	public ArrayList<Contact> queryAllContact(){
		ArrayList<Contact> contacts=ManagerDao.queryAllContact();
		if(contacts!=null) {
			return contacts;
		}else {
			return null;
		}
	}
	
	/**
	 * 
	 * @description 判断管理员登陆是否成功
	 * @param nickname 用户昵称
	 * @param password 用户密码
	 * @return true=找到,false=没找到
	 */
	public Boolean ManagerLoginCheck(String nickname, String password) {
		Boolean issuccess = ManagerDao.QueryManagerByPasswordAndNickName(nickname, password);
		return issuccess;
	}
	
	/**
	 * @description 根据管理员id获取对应审核信息
	 * @param 管理员id
	 * @return SellAudit的数组，false为出错或没找到
	 */
	public ArrayList<SellAudit> QuerySellAuditById(String manager_id){
		ArrayList<SellAudit> sellAudits=ManagerDao.QuerySellAuditById(manager_id);
		if(sellAudits!=null) {
			return sellAudits;
		}else {
			return null;
		}
	}
	/**
	 * @description 获取所有申请买房信息
	 * @return Purchase的bean的数组，null没有查询到和出现异常
	 */
	public ArrayList<Purchase> QueryPurchase(){
		ArrayList<Purchase> purchases=ManagerDao.QueryPurchase();
		if(purchases!=null) {
			return purchases;
		}else {
			return null;
		}
	}
}

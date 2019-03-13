package service;

import bean.RealInfo;
import bean.User;
import dao.UserDao;

public class UserService {
	/**
	 * 
	 * @description 判断用户登陆是否成功
	 * @param nickname 用户昵称
	 * @param password 用户密码
	 * @return 1=匹配成功，0=账号封禁，-1=没有找到或出错
	 */
	public int UserLoginCheck(String nickname, String password) {
		User user = UserDao.QueryUserByPasswordAndNickName(nickname, password);
		if (user != null) {
			if ("0".equals(user.getUserType())) {
				return 0;
			} else
				return 1;
		}
		return -1;
	}

	public boolean EditPassword(String nickname, String password) {
		return UserDao.UpdatePwdByNickname(nickname, password);
	}

	/**
	 * 
	 * @description 更新用户昵称，先查找是否存在
	 * @param nickname 原本的昵称
	 * @param alterNickname 修改后的昵称
	 * @return 1=修改成功；0=昵称存在；-1=其他错误
	 */
	public int UpdateNickname(String nickname,String alterNickname) {
		if(UserDao.ExistNickname(nickname)){//没有重复的
			if(UserDao.UpdateNickname(nickname, alterNickname)) {
				return 1;
			}else {
				return -1;
			}
		}else {
			return 0;
		}
	}
	/**
	 * 
	 * @description 完善用户信息，先查找是否存在，已存在则不能添加
	 * @param nickname 昵称
	 * @param realInfo 封装的bean
	 * @return 1=添加成功；0=已存在；-1=其他错误
	 */
	public int UpdateRealInfo(String nickname,RealInfo realInfo) {
		if(UserDao.ExistRealInfo(nickname)){//没有重复的
			if(UserDao.UpdateRealInfo(nickname,realInfo)) {
				return 1;
			}else {
				return -1;
			}
		}else {
			return 0;
		}
	}
	/**
	 * 
	 * @description 查找是否存在用户realInfo
	 * @param nickname 昵称
	 * @return true=没有记录，false=有记录
	 */
	public boolean CheckRealInfo(String nickname) {
		if(UserDao.ExistRealInfo(nickname)){//没有记录
			return true;
		}else {
			return false;
		}
	}
	
}

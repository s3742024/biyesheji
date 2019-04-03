package dao;

import java.util.ArrayList;

import bean.SellInfo;

public class t {
	public static void main(String[] args) {
		//UserDao.UpdateNickname("ahlxkj", "yxzt");
		//System.out.println(UserDao.ExistNickname("yxzt")); 

		//System.out.println(MurmurHash.hash64(UUID.randomUUID().toString()));
		 
//            String uuid = UUIDUtils.getUUID();  
//            System.out.println(uuid);   
//		ArrayList<HouseBase> houseBases=TransactionDao.QueryUserBydNickName("98d48a61262f4015898a940ae29219ee");
//		HouseBase houseBase;
//		  for (int i = 0; i < houseBases.size(); i++) {
//			  houseBase = (HouseBase)houseBases.get(i);
//		   System.out.println(houseBase.getDetailPosition());
//		  }
//		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));// new Date()为获取当前系统时间
		ArrayList<SellInfo> sellInfos = BuyDao.QuerySellInfoById(1, 4);
		System.out.println(sellInfos);
	}
}

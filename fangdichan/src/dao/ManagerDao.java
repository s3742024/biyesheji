package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Contact;
import bean.Purchase;
import bean.SellAudit;
import bean.SellInfo;
import util.JDBCUtils;

public class ManagerDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static boolean res = false;
	private static int result = 0;
	
	/**
	 * 
	 * @description 插入审核信息
	 * @param sellAudit的bean类
	 * @return true=成功 false=失败
	 */
	public static boolean updateSellAudit(SellAudit sellAudit) {
		try {
			String sql = "insert into s_sell_audit values(?,?,?,?,?,?)";
			Object[] params = { sellAudit.getSellAuditId(),
					sellAudit.getSellInfoId(),
					sellAudit.getAuditDate(),
					sellAudit.getAuditStatus(),
					sellAudit.getAuditorId(),
					sellAudit.getAuditorRemark()};
			res = JDBCUtils.executeUpdate(sql, params);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(null);
		}
	}
	/**
	 * 
	 * @description 根据用户id获取所有审核信息
	 * @param userid 用户的id
	 * @return SellAudit的bean的数组，每个里面有sellInfo的子类,null没有查询到和出现异常
	 */
	public static ArrayList<SellAudit> QueryAuditedById(String userid) {
		try {
			String sql = "select * from s_sell_audit,s_sell_info where sell_user_id=? and s_sell_info.sell_info_id=s_sell_audit.sell_info_id";
			Object[] params = { userid };
			rs = JDBCUtils.executeQuery(sql, params);
			ArrayList<SellAudit> sellAudits = new ArrayList<SellAudit>();
			while (rs.next()) {// 找到
				String sell_info_id = rs.getString("sell_info_id");
				String house_base_id = rs.getString("house_base_id");
				String sell_title = rs.getString("sell_title");
				String sell_date = rs.getString("sell_date");
				String sell_user_id = rs.getString("sell_user_id");
				String sell_price = rs.getString("sell_price");
				String sell_point = rs.getString("sell_point");
				String sell_mentality = rs.getString("sell_mentality");
				String contact_info_id = rs.getString("contact_info_id");
				SellInfo sellInfo = new SellInfo(sell_info_id, house_base_id, sell_title, sell_date, sell_user_id, sell_price, sell_point, sell_mentality, contact_info_id);
				

				String sell_audit_id = rs.getString("sell_audit_id");
				String audit_date = rs.getString("audit_date");
				String audit_status = rs.getString("audit_status");
				String auditor_id = rs.getString("auditor_id");
				String auditor_remark = rs.getString("auditor_remark");
				SellAudit sellAudit = new SellAudit(sell_audit_id, sell_info_id, audit_date, audit_status, auditor_id, auditor_remark, sellInfo);
				sellAudits.add(sellAudit);
			}
			if (sellAudits.size() == 0)
				return null;
			else
				return sellAudits;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 查询所有联系人信息
	 * @return contact的数组，null为出错或者没有查询到
	 */
	public static ArrayList<Contact>  queryAllContact() {
		try {
			String sql = "select * from a_contact_info";
			rs = JDBCUtils.executeQuery(sql,null);
			ArrayList<Contact> contacts = new ArrayList<Contact>();
			while (rs.next()) {// 找到
				String contactinfoId = rs.getString("contact_info_id");
				String contactCall = rs.getString("contact_call");
				String contactPhone = rs.getString("contact_phone");
				Contact contact = new Contact(contactinfoId,contactCall,contactPhone);
				contacts.add(contact);
			}
			if (contacts.size() == 0)
				return null;
			else
				return contacts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 根据昵称获和密码获得用户信息
	 * @param 用户昵称
	 * @param 用户密码
	 * @return true=找到,false=没找到
	 */
	public static Boolean QueryManagerByPasswordAndNickName(String manager_nickname, String manager_password) {
		try {
			String sql = "select * from a_manager where manager_nickname = ? and manager_password = ?";
			Object[] params = { manager_nickname, manager_password };
			rs = JDBCUtils.executeQuery(sql, params);
			if (rs.next()) {// 找到
				return true;
			} else {// 没有找到
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 根据管理员id获取对应审核信息
	 * @param 管理员id
	 * @return SellAudit的数组，false为出错或没找到
	 */
	public static ArrayList<SellAudit> QuerySellAuditById(String manager_id) {
		try {
			String sql = "select * from s_sell_audit where auditor_id = ?";
			Object[] params = { manager_id };
			rs = JDBCUtils.executeQuery(sql, params);
			ArrayList<SellAudit> sellAudits = new ArrayList<SellAudit>();
			while (rs.next()) {// 找到
				String sellAuditId = rs.getString("sell_audit_id");
				String sellInfoId = rs.getString("sell_info_id");
				String auditDate = rs.getString("audit_date");
				String auditStatus = rs.getString("audit_status");
				String auditorId = rs.getString("auditor_id");
				String auditorRemark = rs.getString("auditor_remark");
				SellAudit sellAudit = new SellAudit(sellAuditId,sellInfoId,auditDate,auditStatus,auditorId,auditorRemark);
				sellAudits.add(sellAudit);
			}
			if (sellAudits.size() == 0)
				return null;
			else
				return sellAudits;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 获取所有申请买房信息
	 * @return Purchase的bean的数组，null没有查询到和出现异常
	 */
	public static ArrayList<Purchase> QueryPurchase() {
		try {
			String sql = "select * from s_purchase_info";
			rs = JDBCUtils.executeQuery(sql, null);
			ArrayList<Purchase> purchases = new ArrayList<Purchase>();
			while (rs.next()) {// 找到
				String purchase_application_id = rs.getString("purchase_application_id");
				String sell_info_id = rs.getString("sell_info_id");
				String apply_date = rs.getString("apply_date");
				String purchase_user_id = rs.getString("purchase_user_id");
				String contact_info_id = rs.getString("contact_info_id");
				String purchase_remarks = rs.getString("purchase_remarks");;
				Purchase purchase = new Purchase(purchase_application_id, sell_info_id, apply_date, purchase_user_id, contact_info_id, purchase_remarks);
				purchases.add(purchase);
			}
			if (purchases.size() == 0)
				return null;
			else
				return purchases;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
}

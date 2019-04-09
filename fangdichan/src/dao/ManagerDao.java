package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Contact;
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
}

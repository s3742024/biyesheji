package bean;

import util.UUIDUtils;

public class SellAudit {
	private String sellAuditId;
	private String sellInfoId;
	private String auditDate;
	private String auditStatus;
	private String auditorId;
	private String auditorRemark;
	private SellInfo sellInfo;
	public String getSellAuditId() {
		return sellAuditId;
	}
	public void setSellAuditId(String sellAuditId) {
		this.sellAuditId = sellAuditId;
	}
	public String getSellInfoId() {
		return sellInfoId;
	}
	public void setSellInfoId(String sellInfoId) {
		this.sellInfoId = sellInfoId;
	}
	public String getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(String auditDate) {
		this.auditDate = auditDate;
	}
	public String getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}
	public String getAuditorId() {
		return auditorId;
	}
	public void setAuditorId(String auditorId) {
		this.auditorId = auditorId;
	}
	public SellInfo getSellInfo() {
		return sellInfo;
	}
	public void setSellInfo(SellInfo sellInfo) {
		this.sellInfo = sellInfo;
	}
	public String getAuditorRemark() {
		return auditorRemark;
	}
	public void setAuditorRemark(String auditorRemark) {
		this.auditorRemark = auditorRemark;
	}
	public SellAudit(String sellAuditId, String sellInfoId, String auditDate, String auditStatus, String auditorId, String auditorRemark) {
		super();
		this.sellAuditId = sellAuditId;
		this.sellInfoId = sellInfoId;
		this.auditDate = auditDate;
		this.auditStatus = auditStatus;
		this.auditorId = auditorId;
		this.auditorRemark = auditorRemark;
	}
	public SellAudit(String sellInfoId, String auditDate, String auditStatus, String auditorId, String auditorRemark) {
		super();
		this.sellAuditId = UUIDUtils.getUUID();;
		this.sellInfoId = sellInfoId;
		this.auditDate = auditDate;
		this.auditStatus = auditStatus;
		this.auditorId = auditorId;
		this.auditorRemark = auditorRemark;
	}
	public SellAudit(String sellAuditId, String sellInfoId, String auditDate, String auditStatus, String auditorId, String auditorRemark, SellInfo sellInfo) {
		super();
		this.sellAuditId = sellAuditId;
		this.sellInfoId = sellInfoId;
		this.auditDate = auditDate;
		this.auditStatus = auditStatus;
		this.auditorId = auditorId;
		this.auditorRemark = auditorRemark;
		this.sellInfo = sellInfo;
	}
	
}

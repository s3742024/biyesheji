package bean;

import util.UUIDUtils;

public class Purchase {
	private String purchaseApplicationId;
	private String sellInfoId;
	private String applyDate;
	private String purchaseUserId;
	private String contactInfoId;
	private String purchaseRemarks;
	private Contact contact;
	public String getpurchaseApplicationId() {
		return purchaseApplicationId;
	}
	public void setpurchaseApplicationId(String purchaseApplicationId) {
		this.purchaseApplicationId = purchaseApplicationId;
	}
	public String getsellInfoId() {
		return sellInfoId;
	}
	public void setsellInfoId(String sellInfoId) {
		this.sellInfoId = sellInfoId;
	}
	public String getapplyDate() {
		return applyDate;
	}
	public void setapplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getpurchaseUserId() {
		return purchaseUserId;
	}
	public void setpurchaseUserId(String purchaseUserId) {
		this.purchaseUserId = purchaseUserId;
	}
	public String getcontactInfoId() {
		return contactInfoId;
	}
	public void setcontactInfoId(String contactInfoId) {
		this.contactInfoId = contactInfoId;
	}
	public String getpurchaseRemarks() {
		return purchaseRemarks;
	}
	public void setpurchaseRemarks(String purchaseRemarks) {
		this.purchaseRemarks = purchaseRemarks;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
	public Purchase(String purchaseApplicationId, String sellInfoId, String applyDate, String purchaseUserId, String contactInfoId, String purchaseRemarks) {
		super();
		this.purchaseApplicationId = purchaseApplicationId;
		this.sellInfoId = sellInfoId;
		this.applyDate = applyDate;
		this.purchaseUserId = purchaseUserId;
		this.contactInfoId = contactInfoId;
		this.purchaseRemarks = purchaseRemarks;
	}
	public Purchase(String sellInfoId, String applyDate, String purchaseUserId, String purchaseRemarks) {
		super();
		this.purchaseApplicationId=UUIDUtils.getUUID();
		this.sellInfoId = sellInfoId;
		this.applyDate = applyDate;
		this.purchaseUserId = purchaseUserId;
		this.purchaseRemarks = purchaseRemarks;
	}
	
}

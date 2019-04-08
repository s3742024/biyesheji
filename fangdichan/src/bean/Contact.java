package bean;

import util.UUIDUtils;

public class Contact {
	private String contactinfoId;
	private String contactCall;
	private String contactPhone;
	public String getContactinfoId() {
		return contactinfoId;
	}
	public void setContactinfoId(String contactinfoId) {
		this.contactinfoId = contactinfoId;
	}
	public String getContactCall() {
		return contactCall;
	}
	public void setContactCall(String contactCall) {
		this.contactCall = contactCall;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public Contact(String contactCall, String contactPhone) {
		super();
		this.contactinfoId=UUIDUtils.getUUID();
		this.contactCall = contactCall;
		this.contactPhone = contactPhone;
	}
	public Contact(String contactinfoId, String contactCall, String contactPhone) {
		super();
		this.contactinfoId = contactinfoId;
		this.contactCall = contactCall;
		this.contactPhone = contactPhone;
	}

}

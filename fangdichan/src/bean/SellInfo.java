package bean;

import util.UUIDUtils;

public class SellInfo{
	public SellInfo() {
		super();
	}

	
	public SellInfo(String sellInfoId, String houseBaseId, String sellTitle, String sellDate, String sellUserId, String sellPrice, String sellPoint, String sellMentality, String contactInfoId,
			HouseBase houseBase) {
		super();
		this.sellInfoId = sellInfoId;
		this.houseBaseId = houseBaseId;
		this.sellTitle = sellTitle;
		this.sellDate = sellDate;
		this.sellUserId = sellUserId;
		this.sellPrice = sellPrice;
		this.sellPoint = sellPoint;
		this.sellMentality = sellMentality;
		this.contactInfoId = contactInfoId;
		this.houseBase = houseBase;
	}


	public SellInfo(String houseBaseId, String sellTitle, String sellDate, String sellUserId, String sellPrice, String sellPoint, String sellMentality, String contactInfoId) {
		super();
		this.sellInfoId=UUIDUtils.getUUID();
		this.houseBaseId = houseBaseId;
		this.sellTitle = sellTitle;
		this.sellDate = sellDate;
		this.sellUserId = sellUserId;
		this.sellPrice = sellPrice;
		this.sellPoint = sellPoint;
		this.sellMentality = sellMentality;
		this.contactInfoId = contactInfoId;
	}


	public SellInfo(String sellInfoId, String houseBaseId, String sellTitle, String sellDate, String sellUserId, String sellPrice, String sellPoint, String sellMentality, String contactInfoId) {
		super();
		this.sellInfoId = sellInfoId;
		this.houseBaseId = houseBaseId;
		this.sellTitle = sellTitle;
		this.sellDate = sellDate;
		this.sellUserId = sellUserId;
		this.sellPrice = sellPrice;
		this.sellPoint = sellPoint;
		this.sellMentality = sellMentality;
		this.contactInfoId = contactInfoId;
	}


	public String getSellInfoId() {
		return sellInfoId;
	}
	public void setSellInfoId(String sellInfoId) {
		this.sellInfoId = sellInfoId;
	}
	public String getHouseBaseId() {
		return houseBaseId;
	}
	public void setHouseBaseId(String houseBaseId) {
		this.houseBaseId = houseBaseId;
	}
	public String getSellTitle() {
		return sellTitle;
	}
	public void setSellTitle(String sellTitle) {
		this.sellTitle = sellTitle;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}
	public String getSellUserId() {
		return sellUserId;
	}
	public void setSellUserId(String sellUserId) {
		this.sellUserId = sellUserId;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getSellPoint() {
		return sellPoint;
	}
	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}
	public String getSellMentality() {
		return sellMentality;
	}
	public void setSellMentality(String sellMentality) {
		this.sellMentality = sellMentality;
	}
	public String getContactInfoId() {
		return contactInfoId;
	}
	public void setContactInfoId(String contactInfoId) {
		this.contactInfoId = contactInfoId;
	}

	public HouseBase getHouseBase() {
		return houseBase;
	}
	public void setHouseBase(HouseBase houseBase) {
		this.houseBase = houseBase;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
	private String sellInfoId;
	private String houseBaseId;
	private String sellTitle;
	private String sellDate;
	private String sellUserId;
	private String sellPrice;
	private String sellPoint;
	private String sellMentality;
	private String contactInfoId;
	private HouseBase houseBase;
	private Contact contact;
	
}

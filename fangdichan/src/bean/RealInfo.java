package bean;

import util.UUIDUtils;

public class RealInfo {
	private String realInfoId;
	private String realInfoName;
	private String idCardNum;
	private String occupation;
	public RealInfo(String realInfoName, String idCardNum, String occupation) {
		super();
		this.realInfoId=UUIDUtils.getUUID();
		this.realInfoName = realInfoName;
		this.idCardNum = idCardNum;
		this.occupation = occupation;
	}
	public String getRealInfoId() {
		return realInfoId;
	}
	public void setRealInfoId(String realInfoId) {
		this.realInfoId = realInfoId;
	}
	public String getRealInfoName() {
		return realInfoName;
	}
	public void setRealInfoName(String realInfoName) {
		this.realInfoName = realInfoName;
	}
	public String getIdCardNum() {
		return idCardNum;
	}
	public void setIdCardNum(String idCardNum) {
		this.idCardNum = idCardNum;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
}

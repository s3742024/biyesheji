package bean;

import util.UUIDUtils;

public class HouseBase {
	private String houseBaseId;
	private String pId;
	private String detailPosition;
	public HouseBase(String pId, String detailPosition, String maxFloorNum, String constructionArea, String houseLayout, String houseOrientation, String houseType, String decorationDegree,
			String mortgageStatus, String completionDate, String eastLongitude, String northLatitude) {
		super();
		this.houseBaseId=UUIDUtils.getUUID();
		this.pId = pId;
		this.detailPosition = detailPosition;
		this.maxFloorNum = maxFloorNum;
		this.constructionArea = constructionArea;
		this.houseLayout = houseLayout;
		this.houseOrientation = houseOrientation;
		this.houseType = houseType;
		this.decorationDegree = decorationDegree;
		this.mortgageStatus = mortgageStatus;
		this.completionDate = completionDate;
		this.eastLongitude = eastLongitude;
		this.northLatitude = northLatitude;
	}
	public HouseBase(String houseBaseId, String pId, String detailPosition, String maxFloorNum, String constructionArea, String houseLayout, String houseOrientation, String houseType,
			String decorationDegree, String mortgageStatus, String completionDate, String eastLongitude, String northLatitude) {
		super();
		this.houseBaseId = houseBaseId;
		this.pId = pId;
		this.detailPosition = detailPosition;
		this.maxFloorNum = maxFloorNum;
		this.constructionArea = constructionArea;
		this.houseLayout = houseLayout;
		this.houseOrientation = houseOrientation;
		this.houseType = houseType;
		this.decorationDegree = decorationDegree;
		this.mortgageStatus = mortgageStatus;
		this.completionDate = completionDate;
		this.eastLongitude = eastLongitude;
		this.northLatitude = northLatitude;
	}
	
	public HouseBase() {
		// TODO Auto-generated constructor stub
	}
	public String getHouseBaseId() {
		return houseBaseId;
	}
	public void setHouseBaseId(String houseBaseId) {
		this.houseBaseId = houseBaseId;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getDetailPosition() {
		return detailPosition;
	}
	public void setDetailPosition(String detailPosition) {
		this.detailPosition = detailPosition;
	}
	public String getMaxFloorNum() {
		return maxFloorNum;
	}
	public void setMaxFloorNum(String maxFloorNum) {
		this.maxFloorNum = maxFloorNum;
	}
	public String getConstructionArea() {
		return constructionArea;
	}
	public void setConstructionArea(String constructionArea) {
		this.constructionArea = constructionArea;
	}
	public String getHouseLayout() {
		return houseLayout;
	}
	public void setHouseLayout(String houseLayout) {
		this.houseLayout = houseLayout;
	}
	public String getHouseOrientation() {
		return houseOrientation;
	}
	public void setHouseOrientation(String houseOrientation) {
		this.houseOrientation = houseOrientation;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public String getDecorationDegree() {
		return decorationDegree;
	}
	public void setDecorationDegree(String decorationDegree) {
		this.decorationDegree = decorationDegree;
	}
	public String getMortgageStatus() {
		return mortgageStatus;
	}
	public void setMortgageStatus(String mortgageStatus) {
		this.mortgageStatus = mortgageStatus;
	}
	public String getCompletionDate() {
		return completionDate;
	}
	public void setCompletionDate(String completionDate) {
		this.completionDate = completionDate;
	}
	public String getEastLongitude() {
		return eastLongitude;
	}
	public void setEastLongitude(String eastLongitude) {
		this.eastLongitude = eastLongitude;
	}
	public String getNorthLatitude() {
		return northLatitude;
	}
	public void setNorthLatitude(String northLatitude) {
		this.northLatitude = northLatitude;
	}
	private String maxFloorNum;
	private String constructionArea;
	private String houseLayout;
	private String houseOrientation;
	private String houseType;
	private String decorationDegree;
	private String mortgageStatus;
	private String completionDate;
	private String eastLongitude;
	private String northLatitude;
}

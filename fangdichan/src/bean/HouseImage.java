package bean;

import util.UUIDUtils;

public class HouseImage {
	private String houseImageId;
	private String imageUrl;
	private String imageType;
	private String imageRamarks;
	private String houseBaseId;
	public String getHouseImageId() {
		return houseImageId;
	}
	public void setHouseImageId(String houseImageId) {
		this.houseImageId = houseImageId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
	}
	public String getImageRamarks() {
		return imageRamarks;
	}
	public void setImageRamarks(String imageRamarks) {
		this.imageRamarks = imageRamarks;
	}
	public String getHouseBaseId() {
		return houseBaseId;
	}
	public void setHouseBaseId(String houseBaseId) {
		this.houseBaseId = houseBaseId;
	}
	public HouseImage(String houseImageId, String imageUrl, String imageType, String imageRamarks, String houseBaseId) {
		super();
		this.houseImageId = houseImageId;
		this.imageUrl = imageUrl;
		this.imageType = imageType;
		this.imageRamarks = imageRamarks;
		this.houseBaseId = houseBaseId;
	}
	public HouseImage(String imageUrl, String imageType, String imageRamarks, String houseBaseId) {
		super();
		this.houseImageId =UUIDUtils.getUUID();
		this.imageUrl = imageUrl;
		this.imageType = imageType;
		this.imageRamarks = imageRamarks;
		this.houseBaseId = houseBaseId;
	}

}

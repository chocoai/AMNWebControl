package com.amani.model;



/**
 * PapercardId generated by MyEclipse - Hibernate Tools
 */

public class CardchangecostrateId  implements java.io.Serializable {


    // Fields    

     private String compid;
     private String projecttypeid;
     private String cardtypeno;
     private String acounttypeno;
     public CardchangecostrateId(String compid, String projecttypeid ,String cardtypeno ,String acounttypeno) {
         this.compid = compid;
         this.projecttypeid = projecttypeid;
         this.cardtypeno = cardtypeno;
         this.acounttypeno = acounttypeno;
     }
     public CardchangecostrateId() {
     }
	public String getCompid() {
		return compid;
	}
	public void setCompid(String compid) {
		this.compid = compid;
	}
	public String getProjecttypeid() {
		return projecttypeid;
	}
	public void setProjecttypeid(String projecttypeid) {
		this.projecttypeid = projecttypeid;
	}
	public String getCardtypeno() {
		return cardtypeno;
	}
	public void setCardtypeno(String cardtypeno) {
		this.cardtypeno = cardtypeno;
	}
	public String getAcounttypeno() {
		return acounttypeno;
	}
	public void setAcounttypeno(String acounttypeno) {
		this.acounttypeno = acounttypeno;
	}
	

}
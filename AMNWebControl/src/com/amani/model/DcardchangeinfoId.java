package com.amani.model;

import java.math.BigDecimal;



/**
 * PapercardId generated by MyEclipse - Hibernate Tools
 */

public class DcardchangeinfoId  implements java.io.Serializable {


    // Fields    

     private String changecompid;
     private String changebillid;
     private String oldcardno;
     
     public DcardchangeinfoId()
     {
    	 
     }
     public String getChangecompid() {
		return changecompid;
	}
	public void setChangecompid(String changecompid) {
		this.changecompid = changecompid;
	}
	public String getChangebillid() {
		return changebillid;
	}
	public void setChangebillid(String changebillid) {
		this.changebillid = changebillid;
	}
	public DcardchangeinfoId(String changecompid, String changebillid ,String oldcardno) {
         this.changecompid = changecompid;
         this.changebillid = changebillid;
         this.oldcardno=oldcardno;
     }
	public String getOldcardno() {
		return oldcardno;
	}
	public void setOldcardno(String oldcardno) {
		this.oldcardno = oldcardno;
	}
    
}
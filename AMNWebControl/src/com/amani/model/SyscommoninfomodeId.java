package com.amani.model;



/**
 * PapercardId generated by MyEclipse - Hibernate Tools
 */

public class SyscommoninfomodeId  implements java.io.Serializable {


    // Fields    

     private String modeid;
     private Integer modetype;



    // Constructors

    /** default constructor */
    public SyscommoninfomodeId() {
    }

    
    /** full constructor */
    public SyscommoninfomodeId(String modeid, int modetype) {
        this.modeid = modeid;
        this.modetype = modetype;
     
    }


	public String getModeid() {
		return modeid;
	}


	public void setModeid(String modeid) {
		this.modeid = modeid;
	}


	public Integer getModetype() {
		return modetype;
	}


	public void setModetype(Integer modetype) {
		this.modetype = modetype;
	}


}
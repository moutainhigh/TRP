package com.fdays.tsms.policy._entity;



/**
 * IndicatorStatistics generated by hbm2java
 */


public class _IndicatorStatistics 

  extends org.apache.struts.action.ActionForm implements Cloneable
 {
	private static final long serialVersionUID = 1L;

    // Fields    

     protected long id;
     protected String carrier;
     protected String flightCode;
     protected String flightCodeExcept;
     protected String flightPoint;
     protected String flightPointExcept;
     protected String flightClass;
     protected String flightClassExcept;
     protected Long travelType;
     protected Long ticketType;
     protected java.sql.Timestamp beginDate;
     protected java.sql.Timestamp endDate;
     protected Long isAmount;
     protected Long isAward;
     protected Long isHighClass;
     protected Long status;
     protected String remark;
     protected com.fdays.tsms.policy.AirlinePolicyAfter airlinePolicyAfter;

     // Constructors
   
    // Property accessors


    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    


    public String getCarrier() {
        return this.carrier;
    }
    
    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }
    


    public String getFlightCode() {
        return this.flightCode;
    }
    
    public void setFlightCode(String flightCode) {
        this.flightCode = flightCode;
    }
    


    public String getFlightCodeExcept() {
        return this.flightCodeExcept;
    }
    
    public void setFlightCodeExcept(String flightCodeExcept) {
        this.flightCodeExcept = flightCodeExcept;
    }
    


    public String getFlightPoint() {
        return this.flightPoint;
    }
    
    public void setFlightPoint(String flightPoint) {
        this.flightPoint = flightPoint;
    }
    


    public String getFlightPointExcept() {
        return this.flightPointExcept;
    }
    
    public void setFlightPointExcept(String flightPointExcept) {
        this.flightPointExcept = flightPointExcept;
    }
    


    public String getFlightClass() {
        return this.flightClass;
    }
    
    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }
    


    public String getFlightClassExcept() {
        return this.flightClassExcept;
    }
    
    public void setFlightClassExcept(String flightClassExcept) {
        this.flightClassExcept = flightClassExcept;
    }
    


    public Long getTravelType() {
        return this.travelType;
    }
    
    public void setTravelType(Long travelType) {
        this.travelType = travelType;
    }
    


    public Long getTicketType() {
        return this.ticketType;
    }
    
    public void setTicketType(Long ticketType) {
        this.ticketType = ticketType;
    }
    


    public java.sql.Timestamp getBeginDate() {
        return this.beginDate;
    }
    
    public void setBeginDate(java.sql.Timestamp beginDate) {
        this.beginDate = beginDate;
    }
    


    public java.sql.Timestamp getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(java.sql.Timestamp endDate) {
        this.endDate = endDate;
    }
    


    public Long getIsAmount() {
        return this.isAmount;
    }
    
    public void setIsAmount(Long isAmount) {
        this.isAmount = isAmount;
    }
    


    public Long getIsAward() {
        return this.isAward;
    }
    
    public void setIsAward(Long isAward) {
        this.isAward = isAward;
    }
    


    public Long getIsHighClass() {
        return this.isHighClass;
    }
    
    public void setIsHighClass(Long isHighClass) {
        this.isHighClass = isHighClass;
    }
    


    public Long getStatus() {
        return this.status;
    }
    
    public void setStatus(Long status) {
        this.status = status;
    }
    


    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    


    public com.fdays.tsms.policy.AirlinePolicyAfter getAirlinePolicyAfter() {
        return this.airlinePolicyAfter;
    }
    
    public void setAirlinePolicyAfter(com.fdays.tsms.policy.AirlinePolicyAfter airlinePolicyAfter) {
        this.airlinePolicyAfter = airlinePolicyAfter;
    }
    




  // The following is extra code specified in the hbm.xml files

  public Object clone()
  {
    Object o = null;
    try
    {
      o = super.clone();
    }
    catch (CloneNotSupportedException e)
    {
      e.printStackTrace();
    }
    return o;
}

private String thisAction="";
 public String getThisAction()
 {
     return thisAction;
 }


public void setThisAction(String thisAction)
 {
     this.thisAction=thisAction;
 }

private int index=0;
 public int getIndex()
 {
     return index;
 }


public void setIndex(int index)
 {
     this.index=index;
 }
 





  // end of extra code specified in the hbm.xml files


}


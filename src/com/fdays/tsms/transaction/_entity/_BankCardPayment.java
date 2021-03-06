package com.fdays.tsms.transaction._entity;



/**
 * BankCardPayment generated by hbm2java
 */


public class _BankCardPayment 

  extends org.apache.struts.action.ActionForm implements Cloneable
 {
	private static final long serialVersionUID = 1L;

    // Fields    

     protected long id;
     protected String userName;
     protected java.math.BigDecimal account1;
     protected java.math.BigDecimal account2;
     protected java.math.BigDecimal account3;
     protected java.math.BigDecimal account4;
     protected java.math.BigDecimal account5;
     protected java.math.BigDecimal account6;
     protected java.math.BigDecimal account7;
     protected java.math.BigDecimal account8;
     protected java.math.BigDecimal account9;
     protected java.math.BigDecimal account10;
     protected java.math.BigDecimal account11;
     protected java.math.BigDecimal account12;
     protected java.math.BigDecimal account13;
     protected java.math.BigDecimal account14;
     protected java.math.BigDecimal account15;
     protected java.math.BigDecimal account16;
     protected java.math.BigDecimal subtotal;
     protected java.math.BigDecimal total;
     protected Long currUserId;
     protected String sessionId;
     protected java.sql.Timestamp banlanceDate;

     // Constructors
   
    // Property accessors


    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    


    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    


    public java.math.BigDecimal getAccount1() {
        return this.account1;
    }
    
    public void setAccount1(java.math.BigDecimal account1) {
        this.account1 = account1;
    }
    


    public java.math.BigDecimal getAccount2() {
        return this.account2;
    }
    
    public void setAccount2(java.math.BigDecimal account2) {
        this.account2 = account2;
    }
    


    public java.math.BigDecimal getAccount3() {
        return this.account3;
    }
    
    public void setAccount3(java.math.BigDecimal account3) {
        this.account3 = account3;
    }
    


    public java.math.BigDecimal getAccount4() {
        return this.account4;
    }
    
    public void setAccount4(java.math.BigDecimal account4) {
        this.account4 = account4;
    }
    


    public java.math.BigDecimal getAccount5() {
        return this.account5;
    }
    
    public void setAccount5(java.math.BigDecimal account5) {
        this.account5 = account5;
    }
    


    public java.math.BigDecimal getAccount6() {
        return this.account6;
    }
    
    public void setAccount6(java.math.BigDecimal account6) {
        this.account6 = account6;
    }
    


    public java.math.BigDecimal getAccount7() {
        return this.account7;
    }
    
    public void setAccount7(java.math.BigDecimal account7) {
        this.account7 = account7;
    }
    


    public java.math.BigDecimal getAccount8() {
        return this.account8;
    }
    
    public void setAccount8(java.math.BigDecimal account8) {
        this.account8 = account8;
    }
    


    public java.math.BigDecimal getAccount9() {
        return this.account9;
    }
    
    public void setAccount9(java.math.BigDecimal account9) {
        this.account9 = account9;
    }
    


    public java.math.BigDecimal getAccount10() {
        return this.account10;
    }
    
    public void setAccount10(java.math.BigDecimal account10) {
        this.account10 = account10;
    }
    


    public java.math.BigDecimal getAccount11() {
        return this.account11;
    }
    
    public void setAccount11(java.math.BigDecimal account11) {
        this.account11 = account11;
    }
    


    public java.math.BigDecimal getAccount12() {
        return this.account12;
    }
    
    public void setAccount12(java.math.BigDecimal account12) {
        this.account12 = account12;
    }
    


    public java.math.BigDecimal getAccount13() {
        return this.account13;
    }
    
    public void setAccount13(java.math.BigDecimal account13) {
        this.account13 = account13;
    }
    


    public java.math.BigDecimal getAccount14() {
        return this.account14;
    }
    
    public void setAccount14(java.math.BigDecimal account14) {
        this.account14 = account14;
    }
    


    public java.math.BigDecimal getAccount15() {
        return this.account15;
    }
    
    public void setAccount15(java.math.BigDecimal account15) {
        this.account15 = account15;
    }
    


    public java.math.BigDecimal getAccount16() {
        return this.account16;
    }
    
    public void setAccount16(java.math.BigDecimal account16) {
        this.account16 = account16;
    }
    


    public java.math.BigDecimal getSubtotal() {
        return this.subtotal;
    }
    
    public void setSubtotal(java.math.BigDecimal subtotal) {
        this.subtotal = subtotal;
    }
    


    public java.math.BigDecimal getTotal() {
        return this.total;
    }
    
    public void setTotal(java.math.BigDecimal total) {
        this.total = total;
    }
    


    public Long getCurrUserId() {
        return this.currUserId;
    }
    
    public void setCurrUserId(Long currUserId) {
        this.currUserId = currUserId;
    }
    


    public String getSessionId() {
        return this.sessionId;
    }
    
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
    


    public java.sql.Timestamp getBanlanceDate() {
        return this.banlanceDate;
    }
    
    public void setBanlanceDate(java.sql.Timestamp banlanceDate) {
        this.banlanceDate = banlanceDate;
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



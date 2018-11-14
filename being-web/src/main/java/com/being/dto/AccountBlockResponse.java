package com.being.dto;

import java.io.Serializable;

public class AccountBlockResponse implements Serializable{
  /**
   * 
   */
  private static final long serialVersionUID = 1L;
  private String userAddress;
  private String balance;
  public String getUserAddress() {
    return userAddress;
  }
  public void setUserAddress(String userAddress) {
    this.userAddress = userAddress;
  }
  public String getBalance() {
    return balance;
  }
  public void setBalance(String balance) {
    this.balance = balance;
  }
  
  
}

package beans;


public class User {

  private String userName;
  private String userSex;
  private String userPhone;
  private int userState;
  private String userPassword;
  private int userType;
  private int userMember;
  private double userBalance;
  private String userArea;
  private int userAge;
  private String userPreferences;

  public User(String userName, String userSex, String userPhone, String userPassword, String userArea, int userAge, String userPreferences) {
    this.userName = userName;
    this.userSex = userSex;
    this.userPhone = userPhone;
    this.userPassword = userPassword;
    this.userArea = userArea;
    this.userAge = userAge;
    this.userPreferences = userPreferences;
  }

  public User() {
  }

  public User(String userName, String userPassword) {
    this.userName = userName;
    this.userPassword = userPassword;
  }

  public User( String userName, String userPhone, String userPassword, String userArea, String userPreferences) {
    this.userName = userName;
    this.userPhone = userPhone;
    this.userPassword = userPassword;
    this.userArea = userArea;
    this.userPreferences = userPreferences;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserSex() {
    return userSex;
  }

  public void setUserSex(String userSex) {
    this.userSex = userSex;
  }


  public String getUserPhone() {
    return userPhone;
  }

  public void setUserPhone(String userPhone) {
    this.userPhone = userPhone;
  }


  public String getUserPassword() {
//    System.out.println("set useerPassword");
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }


  public double getUserBalance() {
    return userBalance;
  }

  public void setUserBalance(double userBalance) {
    this.userBalance = userBalance;
  }


  public String getUserArea() {
    return userArea;
  }

  public void setUserArea(String userArea) {
    this.userArea = userArea;
  }

  public int getUserState() {
    return userState;
  }

  public void setUserState(int userState) {
    this.userState = userState;
  }

  public int getUserType() {
    return userType;
  }

  public void setUserType(int userType) {
    this.userType = userType;
  }

  public int getUserMember() {
    return userMember;
  }

  public void setUserMember(int userMember) {
    this.userMember = userMember;
  }

  public int getUserAge() {
    return userAge;
  }

  public void setUserAge(int userAge) {
    this.userAge = userAge;
  }

  public String getUserPreferences() {
    return userPreferences;
  }

  public void setUserPreferences(String userPreferences) {
    this.userPreferences = userPreferences;
  }

//  @Override
//  public String toString() {
//    return "User{" +
//            "userName='" + userName + '\'' +
//            ", userPassword='" + userPassword + '\'' +
//            '}';
//  }

  @Override
  public String toString() {
    return "User{" +
            "userName='" + userName + '\'' +
            ", userSex='" + userSex + '\'' +
            ", userPhone='" + userPhone + '\'' +
            ", userState=" + userState +
            ", userPassword='" + userPassword + '\'' +
            ", userType=" + userType +
            ", userMember=" + userMember +
            ", userBalance=" + userBalance +
            ", userArea='" + userArea + '\'' +
            ", userAge=" + userAge +
            ", userPreferences='" + userPreferences + '\'' +
            '}';
  }
}

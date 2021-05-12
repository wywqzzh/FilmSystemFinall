package beans;


public class Cinema {

  private String cinemaId;
  private String cinemaName;
  private String cinemaAddress;
  private String cinemaphone;

  public Cinema() {
  }

  public Cinema(String cinemaId, String cinemaName, String cinemaAddress, String cinemaphone) {
    this.cinemaId = cinemaId;
    this.cinemaName = cinemaName;
    this.cinemaAddress = cinemaAddress;
    this.cinemaphone = cinemaphone;
  }

  public String getCinemaId() {
    return cinemaId;
  }

  public void setCinemaId(String cinemaId) {
    this.cinemaId = cinemaId;
  }


  public String getCinemaName() {
    return cinemaName;
  }

  public void setCinemaName(String cinemaName) {
    this.cinemaName = cinemaName;
  }


  public String getCinemaAddress() {
    return cinemaAddress;
  }

  public void setCinemaAddress(String cinemaAddress) {
    this.cinemaAddress = cinemaAddress;
  }


  public String getCinemaphone() {
    return cinemaphone;
  }

  public void setCinemaphone(String cinemaphone) {
    this.cinemaphone = cinemaphone;
  }

  @Override
  public String toString() {
    return "Cinema{" +
            "cinemaId='" + cinemaId + '\'' +
            ", cinemaName='" + cinemaName + '\'' +
            ", cinemaAddress='" + cinemaAddress + '\'' +
            ", cinemaphone='" + cinemaphone + '\'' +
            '}';
  }
}

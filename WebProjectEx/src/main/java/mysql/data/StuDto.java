package mysql.data;

import java.sql.Timestamp;

public class StuDto {
   private String num;
   private String name;
   private String photo;
   private String hp;
   private String addr;
   private Timestamp writeday;
   //변수들이 private이기 때문에 setter, getter 메서드를 통해서 
   //다른 곳에서 데이터를 넣어줌.
   public String getNum() {
      return num;
   }
   public void setNum(String num) {
      this.num = num;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPhoto() {
      return photo;
   }
   public void setPhoto(String photo) {
      this.photo = photo;
   }
   public String getHp() {
      return hp;
   }
   public void setHp(String hp) {
      this.hp = hp;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public Timestamp getWriteday() {
      return writeday;
   }
   public void setWriteday(Timestamp writeday) {
      this.writeday = writeday;
   } 

}
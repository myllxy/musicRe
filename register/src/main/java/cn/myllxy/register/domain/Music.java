package cn.myllxy.register.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author nsu_zk
 * @create 2019-12-01 13:26
 */
@Entity
@Table(name = "music")
public class Music extends BaseDomain {
    private String name;
    private String author;
    private String adress;
    private String backgroundImg;

    @Override
    public String toString() {
        return "Music{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", adress='" + adress + '\'' +
                ", backgroundImg='" + backgroundImg + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getBackgroundImg() {
        return backgroundImg;
    }

    public void setBackgroundImg(String backgroundImg) {
        this.backgroundImg = backgroundImg;
    }

    public Music() {
    }

    public Music(String name, String author, String adress, String backgroundImg) {

        this.name = name;
        this.author = author;
        this.adress = adress;
        this.backgroundImg = backgroundImg;
    }
}

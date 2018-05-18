/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "ApprovalLevel")
@NamedQuery(name = "ApprovalLevel.findAll",
        query = "SELECT r FROM ApprovalLevel r order by approvalLevelId desc")
public class ApprovalLevel implements Serializable {
 private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "approvalLevelId")
    private int approvalLevelId;
    @Column(name = "levelName")
    private String levelName;
    @Column(name = "levelNumber")
    private int levelNumber;

    @ManyToOne
    @JoinColumn(name = "userCategory")
    private UserCategory userCategory;

    public int getApprovalLevelId() {
        return approvalLevelId;
    }

    public void setApprovalLevelId(int approvalLevelId) {
        this.approvalLevelId = approvalLevelId;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    public int getLevelNumber() {
        return levelNumber;
    }

    public void setLevelNumber(int levelNumber) {
        this.levelNumber = levelNumber;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public UserCategory getUserCategory() {
        return userCategory;
    }

    public void setUserCategory(UserCategory userCategory) {
        this.userCategory = userCategory;
    }

  
 

 
}

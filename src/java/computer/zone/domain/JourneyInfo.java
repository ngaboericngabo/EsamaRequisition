/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author RTAP4
 */
@Entity
@Table(name = "JourneyInfo")
@NamedQuery(name = "JourneyInfo.findAll",
        query = "SELECT r FROM JourneyInfo r order by journeyId desc")
public class JourneyInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "journeyId")
    private int journeyId;
    
    @Column(name = "startingKm")
    private int startingKm;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "recordingDate")
    private Date recordingDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "biginningDate")
    private Date beginningDate;

    @Column(name = "beginningTime")
    private String beginningTime;

    @Column(name = "commentOnVehicle")
    private String commentOnVehicle;

    @Column(name = "journeyType")
    private String journeyType;

    @ManyToOne
    @JoinColumn(name = "requisition")
    private Requisition requistion;

    @ManyToOne
    @JoinColumn(name = "users")
    private Users users;

    public Requisition getRequistion() {
        return requistion;
    }

    public void setRequistion(Requisition requistion) {
        this.requistion = requistion;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public int getJourneyId() {
        return journeyId;
    }

    public void setJourneyId(int journeyId) {
        this.journeyId = journeyId;
    }

    public int getStartingKm() {
        return startingKm;
    }

    public void setStartingKm(int startingKm) {
        this.startingKm = startingKm;
    }

    public Date getBeginningDate() {
        return beginningDate;
    }

    public void setBeginningDate(Date beginningDate) {
        this.beginningDate = beginningDate;
    }

    public String getCommentOnVehicle() {
        return commentOnVehicle;
    }

    public void setCommentOnVehicle(String commentOnVehicle) {
        this.commentOnVehicle = commentOnVehicle;
    }


    public Date getRecordingDate() {
        return recordingDate;
    }

    public void setRecordingDate(Date recordingDate) {
        this.recordingDate = recordingDate;
    }

    public String getBeginningTime() {
        return beginningTime;
    }

    public void setBeginningTime(String beginningTime) {
        this.beginningTime = beginningTime;
    }

    public String getJourneyType() {
        return journeyType;
    }

    public void setJourneyType(String journeyType) {
        this.journeyType = journeyType;
    }

}

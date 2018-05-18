/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.domain;

import java.util.Date;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Requisition")
@NamedQuery(name = "Requisition.findAll",
        query = "SELECT r FROM Requisition r order by requisitionId desc")
public class Requisition implements Serializable {
   private static final long serialVersionUID = 100888L;
 
    @Id
    @GeneratedValue
    @Column(name = "requisitionId")
    private int requisitionId;
    
    @Column(name = "requisitionNumber")
    private String requisitionNumber;
    
    
      @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "requisitionDate")
    private Date requisitionDate;
    @Column(name = "destination")
    private String destination;
    @Column(name = "purpose")
    private String purpose;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "requisitionDateIn")
    private Date requisitionDateIn;
   
    @Column(name = "requisitionTimeIn")
    private String requisitionTimeIn;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "requisitionDateOut")
    private Date requisitionDateOut;

    @Column(name = "requisitionTimeOut")
    private String requisitionTimeOut;
    @Column(name = "cost")
    private float cost;
    
     @Column(name = "totalDuration")
    private String totalDuration;
   
    @Column(name = "totalMileage")
    private int totalMileage;
    
    @ManyToOne
    @JoinColumn(name = "vehicle")
    private Vehicle vehicle;
    @ManyToOne
    @JoinColumn(name = "requester")
    private Users requester;
    @ManyToOne
    @JoinColumn(name = "driver")
    private Users driver;
    
    @ManyToOne
    @JoinColumn(name = "loginUser")
    private Users loginUser;
    @ManyToOne
    @JoinColumn(name = "approvalLevel")
    private ApprovalLevel approvalLevel;

    @ManyToOne
    @JoinColumn(name = "typeOfRequest")
    private TypeOfRequest typeOfRequest;
    
        @ManyToOne
    @JoinColumn(name = "supervisor")
    private Users supervisor;
    
    @Column(name="status")
    private String status;

    public int getRequisitionId() {
        return requisitionId;
    }

    public void setRequisitionId(int requisitionId) {
        this.requisitionId = requisitionId;
    }

    public Date getRequisitionDate() {
        return requisitionDate;
    }

    public void setRequisitionDate(Date requisitionDate) {
        this.requisitionDate = requisitionDate;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public Date getRequisitionDateIn() {
        return requisitionDateIn;
    }

    public void setRequisitionDateIn(Date requisitionDateIn) {
        this.requisitionDateIn = requisitionDateIn;
    }



    public Date getRequisitionDateOut() {
        return requisitionDateOut;
    }

    public void setRequisitionDateOut(Date requisitionDateOut) {
        this.requisitionDateOut = requisitionDateOut;
    }



    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public Users getRequester() {
        return requester;
    }

    public void setRequester(Users requester) {
        this.requester = requester;
    }

  

    public Users getLoginUser() {
        return loginUser;
    }

    public void setLoginUser(Users loginUser) {
        this.loginUser = loginUser;
    }

    public ApprovalLevel getApprovalCode() {
        return approvalLevel;
    }

    public void setApprovalCode(ApprovalLevel approvalLevel) {
        this.approvalLevel = approvalLevel;
    }

    public TypeOfRequest getTypeOfRequest() {
        return typeOfRequest;
    }

    public void setTypeOfRequest(TypeOfRequest typeOfRequest) {
        this.typeOfRequest = typeOfRequest;
    }

 

  
    public ApprovalLevel getApprovalLevel() {
        return approvalLevel;
    }

    public void setApprovalLevel(ApprovalLevel approvalLevel) {
        this.approvalLevel = approvalLevel;
    }

    public String getRequisitionNumber() {
        return requisitionNumber;
    }

    public void setRequisitionNumber(String requisitionNumber) {
        this.requisitionNumber = requisitionNumber;
    }

    public String getRequisitionTimeIn() {
        return requisitionTimeIn;
    }

    public void setRequisitionTimeIn(String requisitionTimeIn) {
        this.requisitionTimeIn = requisitionTimeIn;
    }

    public String getRequisitionTimeOut() {
        return requisitionTimeOut;
    }

    public void setRequisitionTimeOut(String requisitionTimeOut) {
        this.requisitionTimeOut = requisitionTimeOut;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Users getDriver() {
        return driver;
    }

    public void setDriver(Users driver) {
        this.driver = driver;
    }

    public int getTotalMileage() {
        return totalMileage;
    }

    public void setTotalMileage(int totalMileage) {
        this.totalMileage = totalMileage;
    }

    public Users getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Users supervisor) {
        this.supervisor = supervisor;
    }

    public String getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(String totalDuration) {
        this.totalDuration = totalDuration;
    }

 



}

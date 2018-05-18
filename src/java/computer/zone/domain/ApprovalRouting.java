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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;

@Entity
@Table(name = "ApprovalRouting")
@NamedQuery(name = "ApprovalRouting.findAll",
        query = "SELECT r FROM ApprovalRouting r order by rountingId desc")
public class ApprovalRouting implements Serializable {
 private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "rountingId")
    private int rountingId;
    @Column(name = "status")
    private String status;
    
   
    @Column(name = "approveDate")
 @Temporal(javax.persistence.TemporalType.DATE)
     private Date approvedDate;
   
    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name = "requisition")
    private Requisition requisition;

    @ManyToOne
    @JoinColumn(name = "users")
    private Users users;

    public int getRountingId() {
        return rountingId;
    }

    public void setRountingId(int rountingId) {
        this.rountingId = rountingId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getApprovedDate() {
        return approvedDate;
    }

    public void setApprovedDate(Date approvedDate) {
        this.approvedDate = approvedDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Requisition getRequisition() {
        return requisition;
    }

    public void setRequisition(Requisition requisition) {
        this.requisition = requisition;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

 

}

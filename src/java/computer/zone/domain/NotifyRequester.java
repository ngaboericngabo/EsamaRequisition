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
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author RTAP4
 */

@Entity
@Table(name = "NotifyRequester")
@NamedQuery(name = "NotifyRequester.findAll",
        query = "SELECT r FROM NotifyRequester r order by noficationId desc")
public class NotifyRequester implements Serializable{
      private static final long serialVersionUID = 1L; 
    @Id
    @GeneratedValue
    @Column(name = "noficationId")
    private int noficationId;
    
    
    @Column(name="notification")
    private String notification;
    
    @Column(name="subjetc")
    private String subject;
    
    @Column(name="Level")
    private int level;

    public int getNoficationId() {
        return noficationId;
    }

    public void setNoficationId(int noficationId) {
        this.noficationId = noficationId;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    
    
    
    
}

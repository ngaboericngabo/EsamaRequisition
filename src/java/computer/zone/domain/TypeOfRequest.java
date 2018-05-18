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

@Entity
@Table(name = "TypeOfRequest")
@NamedQuery(name = "TypeOfRequest.findAll",
        query = "SELECT r FROM TypeOfRequest r order by typeOfRequestId desc")
public class TypeOfRequest implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "typeOfRequestId")
    private int typeOfRequestId;
    @Column(name = "typeOfRequestName")
    private String typeOfRequestName;

    public int getTypeOfRequestId() {
        return typeOfRequestId;
    }

    public void setTypeOfRequestId(int typeOfRequestId) {
        this.typeOfRequestId = typeOfRequestId;
    }

    public String getTypeOfRequestName() {
        return typeOfRequestName;
    }

    public void setTypeOfRequestName(String typeOfRequestName) {
        this.typeOfRequestName = typeOfRequestName;
    }

}

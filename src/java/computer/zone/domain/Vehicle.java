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
@Table(name = "Vehicle")
@NamedQuery(name = "Vehicle.findAll",
        query = "SELECT r FROM Vehicle r order by vehicleId desc")
public class Vehicle implements Serializable {
private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @Column(name = "vehicleId")
    private int vehicleId;
    @Column(name = "plateNumber")
    private String plateNumber;
    @Column(name = "vehicleType")
    private String VehicleType;
    @Column(name = "status")
    private String status;
    @Column(name = "comment")
    private String comment;

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getVehicleType() {
        return VehicleType;
    }

    public void setVehicleType(String VehicleType) {
        this.VehicleType = VehicleType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}

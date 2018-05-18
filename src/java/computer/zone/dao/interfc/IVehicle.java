/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.Vehicle;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IVehicle {
     public Vehicle saveVehicle(Vehicle vehicle);
        public List<Vehicle> getListVehicle();
         public Vehicle getVehicleById(int vehicleId,String primaryKeyclomunName);
         public Vehicle UpdateVehicle(Vehicle vehicle); 
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.common.DbConstant;
import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IVehicle;
import computer.zone.domain.Vehicle;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class VehicleImpl  extends AbstractDao<Long, Vehicle>  implements IVehicle,DbConstant{

    @Override
    public Vehicle saveVehicle(Vehicle vehicle) {
      return saveIntable(vehicle); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Vehicle> getListVehicle() {
      return (List<Vehicle>)(Object)getModelList(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Vehicle getVehicleById(int vehicleId, String primaryKeyclomunName) {
  return (Vehicle)getModelById(vehicleId, primaryKeyclomunName); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Vehicle UpdateVehicle(Vehicle vehicle) {
        return updateIntable(vehicle);//To change body of generated methods, choose Tools | Templates.
    }
      public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

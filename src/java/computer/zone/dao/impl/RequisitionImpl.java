/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IRequisition;
import computer.zone.domain.Requisition;
import java.util.List;


public class RequisitionImpl  extends AbstractDao<Long, Requisition> implements IRequisition{

    @Override
    public Requisition saveRequisition(Requisition requisition) {
       return saveIntable(requisition);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Requisition> getListRequisition() {
     return (List<Requisition>)(Object)getModelList(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Requisition getRequisitionById(int requisitionId, String primaryKeyclomunName) {
       return (Requisition)getModelById(requisitionId, primaryKeyclomunName) ;//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Requisition UpdateRequisition(Requisition requisition) {
     return updateIntable(requisition); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
      public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

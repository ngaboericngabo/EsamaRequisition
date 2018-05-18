/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IDepartment;
import computer.zone.domain.Departement;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class DepartementImpl  extends AbstractDao<Long,Departement> implements IDepartment {

    @Override
    public Departement saveDepartment(Departement departement) {
     return saveIntable(departement); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Departement> getListDepartment() {
        return (List<Departement>)(Object)getModelList();//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Departement getDepartmentById(int departementId, String primaryKeyclomunName) {
       return (Departement)getModelById(departementId, primaryKeyclomunName);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Departement UpdateDepartment(Departement departement) {
        return updateIntable(departement); //To change body of generated methods, choose Tools | Templates.
    }
     public boolean  createTable(){
    creatingNewTable();
    return true;
    } 
}

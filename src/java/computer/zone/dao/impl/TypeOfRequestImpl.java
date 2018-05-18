/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.ITypeOfRequest;
import computer.zone.domain.TypeOfRequest;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class TypeOfRequestImpl  extends AbstractDao<Long, TypeOfRequest>  implements ITypeOfRequest{

    @Override
    public TypeOfRequest saveTypeOfRequest(TypeOfRequest typeOfRequest) {
        return saveIntable(typeOfRequest); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TypeOfRequest> getListTypeOfRequest() {
     return (List<TypeOfRequest>)(Object)getModelList(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TypeOfRequest getTypeOfRequestById(int typeOfRequestId, String primaryKeyclomunName) {
        return  (TypeOfRequest)(Object)getModelById(typeOfRequestId, primaryKeyclomunName);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TypeOfRequest UpdateUsers(TypeOfRequest typeOfRequest) {
        return updateIntable(typeOfRequest); //To change body of generated methods, choose Tools | Templates.
    }

     public boolean  createTable(){
    creatingNewTable();
    return true;
    }
    
}

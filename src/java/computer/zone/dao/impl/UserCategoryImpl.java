/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IuserCategory;
import computer.zone.domain.UserCategory;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class UserCategoryImpl extends  AbstractDao<Long, UserCategory> implements  IuserCategory {

    @Override
    public UserCategory saveUsercategory(UserCategory usercategory) {
        return saveIntable(usercategory);
    }

    @Override
    public List<UserCategory> getListUsercategory() {
           return (List<UserCategory>)(Object)getModelList();  //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UserCategory UpdateUsercategory(UserCategory usercategory) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

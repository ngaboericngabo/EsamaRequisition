/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IApprovalLevel;
import computer.zone.domain.ApprovalLevel;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class ApprovalLevelImpl extends AbstractDao<Long, ApprovalLevel>  implements  IApprovalLevel{

    @Override
    public ApprovalLevel saveApprovalLevel(ApprovalLevel approvalLevel) {
     return saveIntable(approvalLevel); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ApprovalLevel> getListApprovalLevel() {
       return (List<ApprovalLevel>)(Object)getModelList();
    }

    @Override
    public ApprovalLevel gettApprovalLevelById(int approvalLevel, String primaryKeyclomunName) {
        return (ApprovalLevel)getModelById(approvalLevel,primaryKeyclomunName);
 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ApprovalLevel UpdateApprovalLevel(ApprovalLevel approvalLevel) {
        return updateIntable(approvalLevel); //To change body of generated methods, choose Tools | Templates.
    }
    
      public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IApprovalRouting;
import computer.zone.domain.ApprovalRouting;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class ApprovalRoutingImpl extends AbstractDao<Long, ApprovalRouting> implements IApprovalRouting {

    @Override
    public ApprovalRouting saveApprovalRouting(ApprovalRouting approvalRouting) {
        return saveIntable(approvalRouting);
    }

    @Override
    public List<ApprovalRouting> getListApprovalRouting() {
        return (List<ApprovalRouting>) (Object) (getModelList());
    }

    @Override
    public ApprovalRouting getApprovalRoutingById(int approvalRoutingId, String primaryKeyclomunName) {

        return (ApprovalRouting) getModelById(approvalRoutingId, primaryKeyclomunName);
    }

    @Override
    public ApprovalRouting UpdateApprovalRouting(ApprovalRouting approvalRouting) {
        return updateIntable(approvalRouting);
    }
  public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.ApprovalRouting;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IApprovalRouting {
     public ApprovalRouting saveApprovalRouting(ApprovalRouting approvalRouting);
        public List<ApprovalRouting> getListApprovalRouting();
         public ApprovalRouting getApprovalRoutingById(int approvalRoutingId,String primaryKeyclomunName);
         public ApprovalRouting UpdateApprovalRouting(ApprovalRouting approvalRouting);
}

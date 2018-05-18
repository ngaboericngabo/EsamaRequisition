/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.ApprovalLevel;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IApprovalLevel {
        public ApprovalLevel saveApprovalLevel(ApprovalLevel approvalLevel);
        public List<ApprovalLevel> getListApprovalLevel();
         public ApprovalLevel gettApprovalLevelById(int approvalLevel,String primaryKeyclomunName);
         public ApprovalLevel UpdateApprovalLevel(ApprovalLevel approvalLevel); 
}

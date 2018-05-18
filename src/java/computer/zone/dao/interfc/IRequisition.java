/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.Requisition;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IRequisition {
         public Requisition saveRequisition(Requisition requisition);
        public List<Requisition> getListRequisition();
         public Requisition getRequisitionById(int requisitionId,String primaryKeyclomunName);
         public Requisition UpdateRequisition(Requisition requisition);
}

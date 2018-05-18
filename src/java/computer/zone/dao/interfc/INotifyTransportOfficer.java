/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.NotifyTransportOfficer;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface INotifyTransportOfficer {
       public NotifyTransportOfficer saveNotifyTransportOfficer(NotifyTransportOfficer notifyTransportOfficer);
        public List<NotifyTransportOfficer> getListNotifyTransportOfficer();
         public NotifyTransportOfficer getNotifyTransportOfficerById(int notifyTransportOfficerId,String primaryKeyclomunName);
         public NotifyTransportOfficer UpdateNotifyTransportOfficer(NotifyTransportOfficer notifyTransportOfficer); 
}

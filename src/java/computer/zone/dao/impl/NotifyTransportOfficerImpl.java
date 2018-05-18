/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.INotifyTransportOfficer;
import computer.zone.domain.NotifyTransportOfficer;
import java.util.List;


public class NotifyTransportOfficerImpl extends AbstractDao<Long, NotifyTransportOfficer> implements INotifyTransportOfficer {

    @Override
    public NotifyTransportOfficer saveNotifyTransportOfficer(NotifyTransportOfficer notifyTransportOfficer) {
      return saveIntable(notifyTransportOfficer); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<NotifyTransportOfficer> getListNotifyTransportOfficer() {
          return (List<NotifyTransportOfficer>)(Object)getModelList(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NotifyTransportOfficer getNotifyTransportOfficerById(int notifyTransportOfficerId, String primaryKeyclomunName) {
        return (NotifyTransportOfficer)getModelById(notifyTransportOfficerId, primaryKeyclomunName) ; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NotifyTransportOfficer UpdateNotifyTransportOfficer(NotifyTransportOfficer notifyTransportOfficer) {
        return updateIntable(notifyTransportOfficer); //To change body of generated methods, choose Tools | Templates.
    }
    
}

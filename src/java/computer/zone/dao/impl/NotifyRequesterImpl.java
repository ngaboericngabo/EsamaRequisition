/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.INotifyRequester;
import computer.zone.domain.NotifyRequester;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class NotifyRequesterImpl extends AbstractDao<Long, NotifyRequester> implements INotifyRequester {

    @Override
    public NotifyRequester saveNotifyRequester(NotifyRequester notifyRequester) {
       return saveIntable(notifyRequester); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<NotifyRequester> getListNotifyRequester() {
         return (List<NotifyRequester>)(Object)getModelList();  //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NotifyRequester getNotifyRequesterById(int notifyRequesterId, String primaryKeyclomunName) {
           return (NotifyRequester)getModelById(notifyRequesterId, primaryKeyclomunName); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NotifyRequester UpdateNotifyRequester(NotifyRequester notifyRequester) {
       return updateIntable(notifyRequester); //To change body of generated methods, choose Tools | Templates.
    }
    
}

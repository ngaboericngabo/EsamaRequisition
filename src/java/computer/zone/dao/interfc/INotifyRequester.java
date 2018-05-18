/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.NotifyRequester;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface INotifyRequester {
    public NotifyRequester saveNotifyRequester(NotifyRequester notifyRequester);
        public List<NotifyRequester> getListNotifyRequester();
         public NotifyRequester getNotifyRequesterById(int notifyRequesterId,String primaryKeyclomunName);
         public NotifyRequester UpdateNotifyRequester(NotifyRequester notifyRequester); 
}

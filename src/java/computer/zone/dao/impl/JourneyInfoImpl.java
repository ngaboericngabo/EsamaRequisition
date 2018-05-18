/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.impl;

import computer.zone.dao.generic.AbstractDao;
import computer.zone.dao.interfc.IJourneyInfo;
import computer.zone.domain.JourneyInfo;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public class JourneyInfoImpl extends  AbstractDao<Long, JourneyInfo>  implements IJourneyInfo{

    @Override
    public JourneyInfo saveJourneyInfo(JourneyInfo journeyInfo) {
   return saveIntable(journeyInfo); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<JourneyInfo> getListJourneyInfo() {
        return (List<JourneyInfo>)(Object)getModelList(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public JourneyInfo getJourneyInfoById(int journeyInfoId, String primaryKeyclomunName) {
        return (JourneyInfo)getModelById(journeyInfoId, primaryKeyclomunName); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public JourneyInfo UpdateJourneyInfo(JourneyInfo journeyInfo) {
      return updateIntable(journeyInfo); //To change body of generated methods, choose Tools | Templates.
    }
      public boolean  createTable(){
    creatingNewTable();
    return true;
    }
}

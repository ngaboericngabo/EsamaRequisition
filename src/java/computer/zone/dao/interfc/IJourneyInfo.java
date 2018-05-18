/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.dao.interfc;

import computer.zone.domain.JourneyInfo;
import computer.zone.domain.Users;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IJourneyInfo {

    public JourneyInfo saveJourneyInfo(JourneyInfo journeyInfo);

    public List<JourneyInfo> getListJourneyInfo();

    public JourneyInfo getJourneyInfoById(int journeyInfoId, String primaryKeyclomunName);

    public JourneyInfo UpdateJourneyInfo(JourneyInfo journeyInfo);
}

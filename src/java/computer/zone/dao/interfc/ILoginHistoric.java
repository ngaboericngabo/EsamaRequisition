/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.LoginHistoric;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface ILoginHistoric {
     public LoginHistoric saveLoginHistoric(LoginHistoric loginHistoric);
        public List<LoginHistoric> getListLoginHistoric();
         public LoginHistoric getLoginHistoricById(int loginHistoricId,String primaryKeyclomunName);
         public LoginHistoric UpdateLoginHistoric(LoginHistoric loginHistoric); 
         public String getMachineIp();
       
}

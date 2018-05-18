/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.TypeOfRequest;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface ITypeOfRequest {
  public TypeOfRequest saveTypeOfRequest(TypeOfRequest typeOfRequest);
        public List<TypeOfRequest> getListTypeOfRequest();
         public TypeOfRequest getTypeOfRequestById(int typeOfRequestId,String primaryKeyclomunName);
         public TypeOfRequest UpdateUsers(TypeOfRequest typeOfRequest);  
}

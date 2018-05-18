/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.dao.interfc;

import computer.zone.domain.Departement;
import java.util.List;

/**
 *
 * @author RTAP4
 */
public interface IDepartment {
     public Departement saveDepartment(Departement departement);
        public List<Departement> getListDepartment();
         public Departement getDepartmentById(int departementId,String primaryKeyclomunName);
         public Departement UpdateDepartment(Departement departement);
}

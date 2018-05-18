/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.controller;


import computer.zone.common.DbConstant;
import computer.zone.dao.impl.VehicleImpl;
import computer.zone.domain.Vehicle;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.LoggerFactory;

/**
 *
 * @author CZT
 */
@WebServlet(name = "VehicleController", urlPatterns = {"/VehicleController"})
public class VehicleController extends HttpServlet implements DbConstant{
VehicleImpl vehimpl= new VehicleImpl();
        private static final transient org.slf4j.Logger LOGGER= LoggerFactory.getLogger(VehicleController.class);


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vehicle veh= new Vehicle();

    String vehicletype=request.getParameter("vehicletype");
    String plateno=request.getParameter("plateno");
    
    String comment=request.getParameter("comment");

        veh.setVehicleType(vehicletype);
        veh.setPlateNumber(plateno);
        veh.setStatus(AVAILABLE);
        veh.setComment(comment);
          try{
      vehimpl.saveIntable(veh);
        response.sendRedirect("mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp?msg=Vehicle have been created successfull");
       }catch(Exception ex){
            
            response.sendRedirect("mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp?error=Fail to create new Vehicle");
       }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

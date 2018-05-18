/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RTAP4
 */
@WebServlet(name = "RequesterVehicleController", urlPatterns = {"/RequesterVehicleController"})
public class RequesterVehicleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vid=request.getParameter("vehicleId");
  PrintWriter n=response.getWriter();
   //response.sendRedirect("mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp?error=User Name has been used by onther user");
      response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?vehicleId="+vid);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}

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
@WebServlet(name = "ApproverForm_TransportController", urlPatterns = {"/ApproverForm_TransportController"})
public class ApproverForm_TransportController extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  String rin=request.getParameter("requisitionId");
  PrintWriter n=response.getWriter();

      response.sendRedirect("mainPage.jsp?view=RequisitionForm_TransportOfficer.jsp?requisitionId="+rin);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}

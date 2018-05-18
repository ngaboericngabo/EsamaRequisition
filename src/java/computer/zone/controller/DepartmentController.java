/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.controller;

import computer.zone.dao.impl.DepartementImpl;
import computer.zone.domain.Departement;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DepartmentController", urlPatterns = {"/DepartmentController"})
public class DepartmentController extends HttpServlet {
 DepartementImpl depimpl= new DepartementImpl();
        private static final transient org.slf4j.Logger LOGGER= LoggerFactory.getLogger(DepartmentController.class);
        
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                Departement dep= new Departement();

    String departement=request.getParameter("departement");

        dep.setDepartementName(departement);
          try{
      depimpl.saveDepartment(dep);
        response.sendRedirect("mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp?msg=Department have been created successfull");
       }catch(Exception ex){
            
            response.sendRedirect("mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp?error=Fail to create new department");
       }
    }

 
}

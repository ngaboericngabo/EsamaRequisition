/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.controller;

import computer.zone.common.DbConstant;
import computer.zone.common.Formating;

import computer.zone.dao.impl.LoginHistoricImpl;
import computer.zone.dao.impl.LoginImpl;
import computer.zone.dao.impl.UserImpl;

import computer.zone.domain.LoginHistoric;
import computer.zone.domain.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.LoggerFactory;

/**
 *
 * @author RTAP4
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet implements DbConstant {
    /*Declaretion of Logger which useed to log error message on sever side this must be defined in all controller classes only chance the controller name in getLogger method*/

    private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    /*Defination or cretion of instace object for the deoClass to access or enject deao method*/
    LoginImpl loginDao = new LoginImpl();
    LoginImpl loginDao1 = new LoginImpl();
    UserImpl usersImpl = new UserImpl();
   
    LoginHistoricImpl historic=new LoginHistoricImpl();
    Formating fmt=new Formating();
    /*Define de class name as constat to be used in logger method */
    private String CLASSNAME = "LoginController :: ";
    /*Definition of all common variables*/
    boolean isValidCredential;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
try{
        PrintWriter print = response.getWriter();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String p=loginDao1.criptPassword(password);
        Users user = new Users();
 
        HttpSession session = request.getSession();
        System.out.println("step 0");   
        isValidCredential = loginDao.checkUserNameAndPasswod(userName, loginDao1.criptPassword(password));
              System.out.println("step 1");
              try{
   user = usersImpl.getModelWithMyHQL(new String[]{USERNAME,PASSWORD}, new Object[]{
                     userName, loginDao1.criptPassword(password)}, SELECT_USERS);
            if((user.getStatus()).equals(ACTIVE)) {}else{isValidCredential=false; }  
    System.out.println("step 3");
              }catch(Exception jj){
              System.out.println("errrrrrrrrrroorrrrrrrrrrrr");
               System.out.println(jj.getMessage());
               jj.printStackTrace();
              }
//Check if the account is locked 
        if (isValidCredential) {
          
       
            try {
                     System.out.println("step 222");
                       LOGGER.info(CLASSNAME+"Loging start");
           
                  LoginHistoric his=new LoginHistoric();
             System.out.println("step 1");
           his.setHistoricId(0);
           his.setIpAddress( historic.getMachineIp());
          his.setLoginTimeIn(new Date());
               System.out.println("step 11");
           his.setUsers(user);
              session.setAttribute("userSession", user);
             
                 Object a= historic.saveIntable(his);
            session.setAttribute("loginID", a);
             LOGGER.info(CLASSNAME+"Loging Save Login Historic");
               System.out.println("step 111");
       user.setLoginStatus(ONLINE);
       usersImpl.updateIntable(user);
        
              
                    LOGGER.info(CLASSNAME+"Creating Seeeions {}",user.getFname());
            } catch (Exception ex) {
            LOGGER.info(CLASSNAME+"Loging Fail whene login",ex.getMessage());
            ex.printStackTrace();
            }

           
   
            if (user.getUserCategory().getUserCatid() == 1) {//ADMIN

                response.sendRedirect("mainPage.jsp?view=AdminPage.jsp");

            } else if (user.getUserCategory().getUserCatid() == 2) {//APPROVER //Supervisor UNDER APPROVER
             
                        response.sendRedirect("mainPage.jsp?view=sideBar.jsp");
                } 
                
                else if (user.getUserCategory().getUserCatid() == 3) {//TransportOfficer UNDER APPROVER
                    response.sendRedirect("mainPage.jsp?view=sideBar.jsp");
                } else if (user.getUserCategory().getUserCatid()  == 4) {//Director UNDER APPROVER
                    response.sendRedirect("mainPage.jsp?view=sideBar.jsp");
                } else if (user.getUserCategory().getUserCatid() == 5) {//Requester
 response.sendRedirect("mainPage.jsp?view=RequesterTabs.jsp");
            } else if (user.getUserCategory().getUserCatid() ==  6) {//Driver
                    response.sendRedirect("mainPage.jsp?view=DriverTabs.jsp");
            }

        }else{
        response.sendRedirect("login.jsp?msg=Invalid Username or password !");
        
        }
        
}catch(Exception hh){
    System.out.println(hh.getMessage());
    System.out.println("loginIn error");
hh.printStackTrace();
 response.sendRedirect("login.jsp?msg=Invalid Username or password !");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.controller;

import computer.zone.common.DbConstant;
import static computer.zone.common.DbConstant.ACTIVE;
import static computer.zone.common.DbConstant.DEPID;
import static computer.zone.common.DbConstant.OFFLINE;
import static computer.zone.common.DbConstant.SELECT_DEPARTMENT;
import static computer.zone.common.DbConstant.SELECT_USERCATEGORY;
import static computer.zone.common.DbConstant.USERCATID;
import computer.zone.dao.impl.DepartementImpl;
import computer.zone.dao.impl.LoginImpl;
import computer.zone.dao.impl.UserCategoryImpl;
import computer.zone.dao.impl.UserImpl;
import computer.zone.domain.Departement;
import computer.zone.domain.UserCategory;
import computer.zone.domain.Users;
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
@WebServlet(name = "UpadateUser", urlPatterns = {"/UpadateUser"})
public class UpadateUser extends HttpServlet implements DbConstant {
    UserCategoryImpl uscat = new UserCategoryImpl();
   UserImpl userimpl=new UserImpl();
   DepartementImpl depImpl = new DepartementImpl();
 
     private String CLASSNAME = "UserController :: ";
        private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                  LoginImpl loginDao = new LoginImpl();
        Users u=new Users();
        UserCategory cat= new UserCategory();
         Departement dep= new Departement();
         String userId=request.getParameter("userId");
       String fname=request.getParameter("fname");
       String lname=request.getParameter("lname");
       String email=request.getParameter("email");
       String password="pass123";
       String address=request.getParameter("address");
       String phone=request.getParameter("phone");
       String userName=request.getParameter("userName");
       int userCategory=Integer.parseInt(request.getParameter("userCategory"));
       int departement=Integer.parseInt(request.getParameter("departement"));
       try {
           cat = uscat.getModelWithMyHQL(new String[]{USERCATID}, new Object[]{userCategory}, SELECT_USERCATEGORY);
       } catch (Exception ex) {
            LOGGER.info(CLASSNAME+":::Select userscategory fail",ex.getMessage());
       }
       try {
           dep = depImpl.getModelWithMyHQL(new String[]{DEPID}, new Object[]{departement}, SELECT_DEPARTMENT);
       } catch (Exception ex) {
            LOGGER.info(CLASSNAME+":::Select departement  fail",ex.getMessage());
            ex.printStackTrace();
       }
        try{
       u.setUserId(Integer.parseInt(userId));
       u.setAddress(address);
       u.setEmail(email);
       u.setLname(lname);
       u.setPassword(loginDao.criptPassword(password));
       u.setPhone(phone);
       u.setUserName(userName);
       u.setLoginStatus(OFFLINE);
       u.setStatus(ACTIVE);
       u.setFname(fname);
       u.setUserCategory(cat);
       u.setDepartement(dep);
      
      userimpl.updateIntable(u);
        response.sendRedirect("mainPage.jsp?menuPage=listOfUsers.jsp&view=AdminPage.jsp?msg=User updated successfully");
       }catch(Exception ex){
           ex.printStackTrace();
                       LOGGER.info(CLASSNAME+"::Create user fail",ex.getMessage());
            response.sendRedirect("mainPage.jsp?menuPage=listOfUsers.jsp&view=AdminPage.jsp?error=User Name has been used by onther user");
       }
    
    }

 

}

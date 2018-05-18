/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.controller;

import computer.zone.common.DbConstant;
import static computer.zone.common.DbConstant.APPROVED;
import computer.zone.common.SendEmail;
import computer.zone.dao.impl.ApprovalLevelImpl;
import computer.zone.dao.impl.ApprovalRoutingImpl;

import computer.zone.dao.impl.RequisitionImpl;
import computer.zone.dao.impl.UserImpl;
import computer.zone.dao.impl.VehicleImpl;
import computer.zone.domain.ApprovalLevel;
import computer.zone.domain.ApprovalRouting;

import computer.zone.domain.Requisition;
import computer.zone.domain.UserCategory;
import computer.zone.domain.Users;
import computer.zone.domain.Vehicle;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RTAP4
 */
@WebServlet(name = "ApproverByDirectorOfficerCntroller", urlPatterns = {"/ApproverByDirectorOfficerCntroller"})
public class ApproverByDirectorOfficerCntroller extends HttpServlet implements DbConstant{

    Requisition req = new Requisition();
    RequisitionImpl reqImpl = new RequisitionImpl();
    Users us = new Users();
    UserImpl usImpl = new UserImpl();

    ApprovalLevel apl = new ApprovalLevel();
    ApprovalLevelImpl aplImpl = new ApprovalLevelImpl();

    ApprovalRouting apr = new ApprovalRouting();
    ApprovalRoutingImpl aprImpl = new ApprovalRoutingImpl();

    Vehicle v = new Vehicle();
    VehicleImpl vImpl = new VehicleImpl();
     List<Users>users=new ArrayList<Users>();
       UserImpl userImpl=new UserImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users person = new Users();

        person = (Users) session.getAttribute("userSession");
        String reqFrm = request.getParameter("requisitionId");
        String comment = request.getParameter("comment");

        try {
            req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqFrm)}, "from Requisition");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            apl = aplImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{person.getUserCategory()}, "from ApprovalLevel");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //Update requistion Status and change the approver level
        req.setStatus(APPROVEDBYDIRECTOR);
        
        if(req.getRequester().getUserCategory().getUserCatid()==2){
           req.setStatus(INPROGRESS);
        
        }else{
             req.setStatus(APPROVEDBYDIRECTOR);
        
        }
       req.setApprovalLevel(apl);
        // req.setCost(cost);
   
     reqImpl.UpdateRequisition(req);
          //Save in approver rounting TABLE
        apr.setApprovedDate(new Date());
        apr.setRequisition(req);
        apr.setComment(comment);
        apr.setUsers(person);
        apr.setStatus(APPROVED);

        apr = aprImpl.saveIntable(apr);

      //Update Vehicle Status
      /*
         v=req.getVehicle();
         v.setStatus(BOOKED);
         vImpl.UpdateVehicle(v);
         */
        /*
         Notification 
         */
           if(req.getRequester().getUserCategory().getUserCatid()!=2){
        String notifcationMsg = "<html>\n"
                + "<title>Mail</title>\n"
                + "<head>\n"
                + "<style>\n"
                + "body {\n"
                + "	font-family:\"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", \"DejaVu Sans\", \"Verdana\", \"sans-serif\";\n"
                + "	font-weight: 400;\n"
                + "	color: #333;\n"
                + "	font-size:13px;\n"
                + "	line-height:1.4em;\n"
                + "	margin-left:20px;\n"
                + "	margin-top:10px;\n"
                + "}\n"
                + ".labelbold{font-weight:bold;}\n"
                + "table{font-size:13px; border-collapse: collapse;}\n"
                + "table, th, td  {border: 1px solid black;}\n"
                + "a {color: #00779a;}\n"
                + ".generated{font-size:12px; font-weight: 500;}\n"
                + ".footer{font-size:11px; text-align:justify;line-height:1.2em;}\n"
                + "</style>\n"
                + "\n"
                + "\n"
                + "<body>\n"
                + "Dear " + req.getRequester().getFname() + "</br>\n"
                + " \n"
                + "<p>We refer to your Requisition and advise the status of the application below.</p>\n"
                + " \n"
                + "   <p>\n"
                + "<table width=\"50%\" border=\"5px\">\n"
                + "  <tbody>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approvel level</td>\n"
                + "      <td>\n"
                + "		  " + apl.getLevelName() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                  + "	<tr>\n"
                + "      <td class=\"labelbold\">Driver</td>\n"
                + "      <td>\n"
                + "		  " + req.getDriver().getFname() + " "+req.getDriver().getLname()+ "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                    + "	<tr>\n"
                + "      <td class=\"labelbold\">Driver</td>\n"
                + "      <td>\n"
                + "		  " + req.getDriver().getPhone() +"\n"
                + "	  </td>\n"
                + "    </tr>\n"
                     + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approved Date: </td>\n"
                + "      <td>" + apr.getApprovedDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Status: </td>\n"
                + "      <td>" + apr.getStatus() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Remarks:</td>\n"
                + "      <td>\n"
                + "		  " + apr.getComment() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	\n"
                + "  </tbody>\n"
                + "</table>\n"
                + "</p>\n"
                + " <p>\n"
                + "</br>\n"
                + "If you have any query or require further information please contact : " + person.getPhone() + " \n"
                + "</p>\n"
                + "\n"
                + "<p>\n"
                + "Assuring you of our best services. Done By " + person.getFname() + " " + person.getUserCategory().getUsercategoryName() + "\n"
                + "</p>\n"
                + "\n"
                + "</br>\n"
                + "Regards </br>\n"
                + "\n"
                + "</br>\n"
                + "This email was generated automatically. Please do not respond. \n"
                + "</br>\n"
                + "</br></br>DISCLAIMER</br><br><p style=\"font-family: 'Courier New',Courier,mono;font-size: 10pt;\">The information contained in this email is intended to inform the recipient(s) and represents private, confidential or privileged content. This information should not be reproduced , redistributed or shared directly or indirectly in any form to any other person. If you are not the addressee mentioned , you are hereby notified  that any dissemination, copying, distribution or taking any action in relation to the contents of this email or any attachments is strictly prohibited and unlawful.\n"
                + "</p>\n"
                + "\n"
                + "</body>\n"
                + "</html>";
        String notifcationDriverMsg = "<html>\n"
                + "<title>Mail</title>\n"
                + "<head>\n"
                + "<style>\n"
                + "body {\n"
                + "	font-family:\"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", \"DejaVu Sans\", \"Verdana\", \"sans-serif\";\n"
                + "	font-weight: 400;\n"
                + "	color: #333;\n"
                + "	font-size:13px;\n"
                + "	line-height:1.4em;\n"
                + "	margin-left:20px;\n"
                + "	margin-top:10px;\n"
                + "}\n"
                + ".labelbold{font-weight:bold;}\n"
                + "table{font-size:13px; border-collapse: collapse;}\n"
                + "table, th, td  {border: 1px solid black;}\n"
                + "a {color: #00779a;}\n"
                + ".generated{font-size:12px; font-weight: 500;}\n"
                + ".footer{font-size:11px; text-align:justify;line-height:1.2em;}\n"
                + "</style>\n"
                + "\n"
                + "\n"
                + "<body>\n"
                + "Dear  " + req.getDriver().getUserCategory().getUsercategoryName()+" :: "+ req.getDriver().getFname() + "</br>\n"
                + " \n"
                + "<p>We refer to your Requisition and advise the status of the application below.</p>\n"
                + " \n"
                + "   <p>\n"
                + "<table width=\"50%\" border=\"5px\">\n"
                + "  <tbody>\n"
                 + "	<tr>\n"
                + "      <td class=\"labelbold\">Requester</td>\n"
                + "      <td>\n"
                + "		  " + req.getRequester().getFname() +" "+ req.getRequester().getLname()  + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Requisition Date: </td>\n"
                + "      <td>" + req.getRequisitionDate() + " </td>\n"
                + "    </tr>  \n"
                         + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
             + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Depurture time</td>\n"
                + "      <td>" + req.getRequisitionTimeIn() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approved Date: </td>\n"
                + "      <td>" + apr.getApprovedDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Destination</td>\n"
                + "      <td>" + req.getDestination() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approved Date: </td>\n"
                + "      <td>" + apr.getApprovedDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Status: </td>\n"
                + "      <td>" + apr.getStatus() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Remarks:</td>\n"
                + "      <td>\n"
                + "		  " + apr.getComment() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	\n"
                + "  </tbody>\n"
                + "</table>\n"
                + "</p>\n"
                  + " <p></br><a href='http://dig-archive:6080/EsamaRequisition_V1/'>CLICK HERE TO LOG IN</a> </p>"
                     
                + " <p>\n"
                + "</br>\n"
                + "If you have any query or require further information please contact : " + person.getPhone() + " \n"
                + "</p>\n"
                + "\n"
                + "<p>\n"
                + "Assuring you of our best services. Done By " + person.getFname() + " " + person.getUserCategory().getUsercategoryName() + "\n"
                + "</p>\n"
                + "\n"
                + "</br>\n"
                + "Regards </br>\n"
                + "\n"
                + "</br>\n"
                + "This email was generated automatically. Please do not respond. \n"
                + "</br>\n"
                + "</br></br>DISCLAIMER</br><br><p style=\"font-family: 'Courier New',Courier,mono;font-size: 10pt;\">The information contained in this email is intended to inform the recipient(s) and represents private, confidential or privileged content. This information should not be reproduced , redistributed or shared directly or indirectly in any form to any other person. If you are not the addressee mentioned , you are hereby notified  that any dissemination, copying, distribution or taking any action in relation to the contents of this email or any attachments is strictly prohibited and unlawful.\n"
                + "</p>\n"
                + "\n"
                + "</body>\n"
                + "</html>";

        SendEmail j = new SendEmail();
 try {
            j.sendEmail(req.getRequester().getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationMsg);
             j.sendEmail(req.getDriver().getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationDriverMsg);
            
            System.out.println("Msg Send Successfully");
        } catch (Exception mm) {

            mm.printStackTrace();
        }

        response.sendRedirect("mainPage.jsp?view=sideBar.jsp?msg=Requisition Approved  successfully");

    }
    else{
           String notifcationMsg = "<html>\n"
                + "<title>Mail</title>\n"
                + "<head>\n"
                + "<style>\n"
                + "body {\n"
                + "	font-family:\"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", \"DejaVu Sans\", \"Verdana\", \"sans-serif\";\n"
                + "	font-weight: 400;\n"
                + "	color: #333;\n"
                + "	font-size:13px;\n"
                + "	line-height:1.4em;\n"
                + "	margin-left:20px;\n"
                + "	margin-top:10px;\n"
                + "}\n"
                + ".labelbold{font-weight:bold;}\n"
                + "table{font-size:13px; border-collapse: collapse;}\n"
                + "table, th, td  {border: 1px solid black;}\n"
                + "a {color: #00779a;}\n"
                + ".generated{font-size:12px; font-weight: 500;}\n"
                + ".footer{font-size:11px; text-align:justify;line-height:1.2em;}\n"
                + "</style>\n"
                + "\n"
                + "\n"
                + "<body>\n"
                + "Dear " + req.getRequester().getFname() + "</br>\n"
                + " \n"
                + "<p>We refer to your Requisition and advise the status of the application below.</p>\n"
                + " \n"
                + "   <p>\n"
                + "<table width=\"50%\" border=\"5px\">\n"
                + "  <tbody>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approvel level</td>\n"
                + "      <td>\n"
                + "		  " + apl.getLevelName() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Approved Date: </td>\n"
                + "      <td>" + apr.getApprovedDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Status: </td>\n"
                + "      <td>" + apr.getStatus() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Remarks:</td>\n"
                + "      <td>\n"
                + "		  " + apr.getComment() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	\n"
                + "  </tbody>\n"
                + "</table>\n"
                + "</p>\n"
                + " <strong >Your request is waiting approval from the transport officer </strong>"
                + " <p>\n"
                + "If you have any query or require further information please contact" + person.getPhone() + " \n"
                + "</p>\n"
                + "\n"
                + "<p>\n"
                + "Assuring you of our best services. Done By " + person.getFname() + " :::" + person.getUserCategory().getUsercategoryName() + "\n"
                + "</p>\n"
                + "\n"
                + "Regards </br>\n"
                + "\n"
                + "</br>\n"
                + "This email was generated automatically. Please do not respond. \n"
                + "</br>\n"
                + "</br></br>DISCLAIMER</br><br><p style=\"font-family: 'Courier New',Courier,mono;font-size: 10pt;\">The information contained in this email is intended to inform the recipient(s) and represents private, confidential or privileged content. This information should not be reproduced , redistributed or shared directly or indirectly in any form to any other person. If you are not the addressee mentioned , you are hereby notified  that any dissemination, copying, distribution or taking any action in relation to the contents of this email or any attachments is strictly prohibited and unlawful.\n"
                + "</p>\n"
                + "\n"
                + "</body>\n"
                + "</html>";
        SendEmail j = new SendEmail();

        try {
            j.sendEmail(req.getRequester().getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationMsg);
            System.out.println("Msg Send Successfully");
        } catch (Exception mm) {

            mm.printStackTrace();
        }
//end notification
             try {
             
               UserCategory uscat= new UserCategory();
               uscat.setUserCatid(3);
           users = userImpl.getUserListByCat(uscat);
        } catch (Exception ex) {
            ex.printStackTrace();
         
        }
        
        //nojtification of transport officer
               if(  users!=null){
                for(int i=0;i<users.size();i++){
        String notifcationMsgtransport = "<html>\n"
                + "<title>Mail</title>\n"
                + "<head>\n"
                + "<style>\n"
                + "body {\n"
                + "	font-family:\"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", \"DejaVu Sans\", \"Verdana\", \"sans-serif\";\n"
                + "	font-weight: 400;\n"
                + "	color: #333;\n"
                + "	font-size:13px;\n"
                + "	line-height:1.4em;\n"
                + "	margin-left:20px;\n"
                + "	margin-top:10px;\n"
                + "}\n"
                + ".labelbold{font-weight:bold;}\n"
                + "table{font-size:13px; border-collapse: collapse;}\n"
                + "table, th, td  {border: 1px solid black;}\n"
                + "a {color: #00779a;}\n"
                + ".generated{font-size:12px; font-weight: 500;}\n"
                + ".footer{font-size:11px; text-align:justify;line-height:1.2em;}\n"
                + "</style>\n"
                + "\n"
                + "\n"
                + "<body>\n"
                + "Dear "+users.get(i).getUserCategory().getUsercategoryName()+" :: " + users.get(i).getFname() + "</br>\n"
                + " \n"
                + "<p>New Requisition Details .</p>\n"
                + " \n"
                + "   <p>\n"
                + "<table width=\"50%\" border=\"5px\">\n"
                + "  <tbody>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Requested by Supervisor </td>\n"
                + "      <td>\n"
                + "		  " + req.getRequester().getFname() +" "+ req.getRequester().getLname()  + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Requisition Date: </td>\n"
                + "      <td>" + req.getRequisitionDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Destination</td>\n"
                + "      <td>" + req.getDestination() + " </td>\n"
                + "    </tr>\n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">type</td>\n"
                + "      <td>\n"
                + "		  " + req.getTypeOfRequest().getTypeOfRequestName() + "\n"
                + "	  </td>\n"
                + "    </tr>\n"
                + "	\n"
                + "  </tbody>\n"
                + "</table>\n"
                + "</p>\n"
               
                 + " <p></br><a href='http://dig-archive:6080/EsamaRequisition_V1/'>CLICK HERE TO LOG IN</a> </p>"
                + " <p>\n"
                + "If you have any query or require further information please contact Requester " + person.getPhone() + " \n"
                + "</p>\n"
                + "\n"
                + "<p>\n"
                + "Assuring you of our best services. Done By " + person.getFname() + " :::" + person.getUserCategory().getUsercategoryName() + "\n"
                + "</p>\n"
                + "\n"
                + "<p>Regards</p> </br>\n"
                + "\n"
                + "</br>\n"
                + "This email was generated automatically. Please do not respond. \n"
                + "</br>\n"
                + "</br></br>DISCLAIMER</br><br><p style=\"font-family: 'Courier New',Courier,mono;font-size: 10pt;\">The information contained in this email is intended to inform the recipient(s) and represents private, confidential or privileged content. This information should not be reproduced , redistributed or shared directly or indirectly in any form to any other person. If you are not the addressee mentioned , you are hereby notified  that any dissemination, copying, distribution or taking any action in relation to the contents of this email or any attachments is strictly prohibited and unlawful.\n"
                + "</p>\n"
                + "\n"
                + "</body>\n"
                + "</html>";
       
      
        try {
          
            j.sendEmail(users.get(i).getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationMsgtransport);
            System.out.println("Msg Send Successfully to "+users.get(i).getEmail());
            
           
            
        } catch (Exception mm) {

            mm.printStackTrace();
        }}}  
                response.sendRedirect("mainPage.jsp?view=sideBar.jsp?msg=Requisition Approved  successfully");

           }
}
}

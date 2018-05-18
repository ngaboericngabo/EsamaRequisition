/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.controller;

import computer.zone.common.DbConstant;
import static computer.zone.common.DbConstant.APPROVED;
import computer.zone.common.Formating;
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
import java.util.Date;
import java.util.List;
import java.util.Random;
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
@WebServlet(name = "ApproverByTransportOfficerCntroller", urlPatterns = {"/ApproverByTransportOfficerCntroller"})
public class ApproverByTransportOfficerCntroller extends HttpServlet implements DbConstant {

    private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ApproverByTransportOfficerCntroller.class);

          Users user = new Users();
      UserImpl userImpl=new UserImpl();
    
    Requisition req = new Requisition();
    RequisitionImpl reqImpl = new RequisitionImpl();
    Formating fmt = new Formating();

    ApprovalLevel apl = new ApprovalLevel();
    ApprovalLevelImpl aplImpl = new ApprovalLevelImpl();

    ApprovalRouting apr = new ApprovalRouting();
    ApprovalRoutingImpl aprImpl = new ApprovalRoutingImpl();

    Vehicle v = new Vehicle();
    VehicleImpl vImpl = new VehicleImpl();
    private String CLASSNAME = "ApproverByTransportOfficerCntroller :: ";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users person = new Users();

        Users dr = new Users();
        UserImpl drImpl = new UserImpl();
        boolean valid = true;
        person = (Users) session.getAttribute("userSession");
        String reqFrm = request.getParameter("requisitionId");
        String comment = request.getParameter("comment");
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        int driver = Integer.parseInt(request.getParameter("driverId"));
        float cost = Float.parseFloat(request.getParameter("cost"));
        try {
            v = vImpl.getModelWithMyHQL(new String[]{"vehicleId"}, new Object[]{vehicleId}, "from Vehicle");

        } catch (Exception ex) {
            LOGGER.info(CLASSNAME + " GETTING VEHICLE LEVEL ERROR", ex.getMessage());
        }
        try {
            req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqFrm)}, "from Requisition");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            dr = drImpl.getModelWithMyHQL(new String[]{"userId"}, new Object[]{driver}, "from  Users");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

                   //Checking if The vehicle is not available for the requested date this can be used at transport officer
        try {
            List<Requisition> h;
            h = (List<Requisition>) reqImpl.getListByDateBewteenOtherCriteria("requisitionDateIn", (req.getRequisitionDateIn()), (req.getRequisitionDateOut()), new String[]{"vehicle"}, new Object[]{v});

            if (h.size() > 0) {
                response.sendRedirect("mainPage.jsp?view=RequisitionForm_TransportOfficer.jsp?error=The vehicle is not available for the requested requisition  date  ");
                valid = false;
                return;
            }
        } catch (Exception jj) {
        }

        if (valid) {
            try {
                apl = aplImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{person.getUserCategory()}, "from ApprovalLevel");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            //Update requistion Status and change the approver level
            String reqN = generateRequisitionNumber() + (req.getRequisitionId());
            req.setStatus(APPROVED);
            req.setApprovalLevel(apl);
            req.setCost(cost);
            req.setRequisitionNumber(reqN);
            req.setVehicle(v);
            req.setDriver(dr);
            reqImpl.UpdateRequisition(req);

          //Save in approver rounting TABLE
            apr.setApprovedDate(new Date());
            apr.setRequisition(req);
            apr.setComment(comment);
            apr.setUsers(person);
            apr.setStatus(APPROVED);

            aprImpl.saveIntable(apr);

      //Update Vehicle Status
     /* 
             v=req.getVehicle();
             v.setStatus(BOOKED);
             vImpl.UpdateVehicle(v);
             */
      //notification
                        if(req.getTypeOfRequest().getTypeOfRequestId()==3){
                try {
               UserCategory uscat= new UserCategory();
               uscat.setUserCatid(4);
            user = userImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{uscat}, "from Users");
        } catch (Exception ex) {
            ex.printStackTrace();
           
        } 
             String notifcationDirectorMsg = "<html>\n"
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
                    + "Dear "+user.getUserCategory().getUsercategoryName()+" :: " + user.getFname() + "</br>\n"
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
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Approvel level</td>\n"
                    + "      <td>\n"
                    + "		  " + req.getDriver().getFname() +" / "+ req.getDriver().getFname()  + "\n"
                    + "	  </td>\n"
                    + "    </tr>\n"
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Approved Date: </td>\n"
                    + "      <td>" + apr.getApprovedDate() + " </td>\n"
                    + "    </tr>  \n"
                          + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
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
                    + "If you have any query or require further information please contact " + person.getPhone() + " \n"
                    + "</p>\n"
                    + "\n"
                    + "<p>\n"
                    + "</br>\n"
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
   
                
                  SendEmail j1 = new SendEmail();

            try {
                j1.sendEmail(user.getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationDirectorMsg);
                System.out.println("Msg Send Successfully");
            } catch (Exception mm) {

                mm.printStackTrace();
            }
                
            }
            if(req.getTypeOfRequest().getTypeOfRequestId()==2){
                try {
               UserCategory uscat= new UserCategory();
               uscat.setUserCatid(4);
            user = userImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{uscat}, "from Users");
        } catch (Exception ex) {
            ex.printStackTrace();
           
        } 
             String notifcationDirectorMsg = "<html>\n"
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
                    + "Dear "+user.getUserCategory().getUsercategoryName()+" :: " + user.getFname() + "</br>\n"
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
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Approvel level</td>\n"
                    + "      <td>\n"
                    + "		  " + req.getDriver().getFname() +" / "+ req.getDriver().getFname()  + "\n"
                    + "	  </td>\n"
                    + "    </tr>\n"
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Approved Date: </td>\n"
                    + "      <td>" + apr.getApprovedDate() + " </td>\n"
                    + "    </tr>  \n"
                          + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
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
                    + "If you have any query or require further information please contact " + person.getPhone() + " \n"
                    + "</p>\n"
                    + "\n"
                    + "<p>\n"
                    + "</br>\n"
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
   
                
                  SendEmail j1 = new SendEmail();

            try {
                j1.sendEmail(user.getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationDirectorMsg);
                System.out.println("Msg Send Successfully");
            } catch (Exception mm) {

                mm.printStackTrace();
            }
                
            }
            

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
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Driver</td>\n"
                    + "      <td>\n"
                    + "		  " + req.getDriver().getFname() +" / "+ req.getDriver().getLname()  + "\n"
                    + "	  </td>\n"
                    + "    </tr>\n"
                    + "	<tr>\n"
                    + "      <td class=\"labelbold\">Phone</td>\n"
                    + "      <td>\n"
                    + "		  " + req.getDriver().getPhone()  + "\n"
                    + "	  </td>\n"
                    + "    </tr>\n"
                      + "    </tr>\n"
                                      + "	<tr>\n"
                + "      <td class=\"labelbold\">Vehicle Plate Number </td>\n"
                + "      <td>" + req.getVehicle().getPlateNumber() + " </td>\n"
                + "    </tr>  \n"
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
                    + "If you have any query or require further information please contact " + person.getPhone() + " \n"
                    + "</p>\n"
                    + "\n"
                    + "<p>\n"
                    + "</br>\n"
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
            
             if(req.getTypeOfRequest().getTypeOfRequestId()==1){
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
                + "Dear " + req.getDriver().getFname() + "</br>\n"
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
                + "      <td class=\"labelbold\">Vehicle Plate Number </td>\n"
                + "      <td>" + req.getVehicle().getPlateNumber() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Requisition Date: </td>\n"
                + "      <td>" + req.getRequisitionDate() + " </td>\n"
                + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Destination</td>\n"
                + "      <td>" + req.getDestination() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                         + "    </tr>  \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Purpose</td>\n"
                + "      <td>" + req.getPurpose() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
             + "    </tr>  \n"
                   + "	<tr>\n"
                + "      <td class=\"labelbold\">Depurture Date</td>\n"
                + "      <td>" + req.getRequisitionDateIn() + " </td>\n"
                + "    </tr>\n"
                + "   \n"
                + "	<tr>\n"
                + "      <td class=\"labelbold\">Return Date</td>\n"
                + "      <td>" + req.getRequisitionDateOut() + " </td>\n"
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
                try {
                j.sendEmail(req.getRequester().getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationMsg);
               
            } catch (Exception mm) {

                mm.printStackTrace();
            }
             try {
                j.sendEmail(req.getDriver().getEmail(), "WOLD VISION REQUISITION STATUS ",notifcationDriverMsg );
                System.out.println("Msg Send Successfully");
            } catch (Exception mm) {

                mm.printStackTrace();
            }
             }
     

           
            response.sendRedirect("mainPage.jsp?view=sideBar.jsp?msg=Requisition Approved  successfully");
        }
    }

    public String generateRequisitionNumber() {
        long last = 0;
        String requisitionDateId = null;
        int auto = 0;

        String y = null;
        String m = null;
        String d = null;
        String hr = null;
        String min = null;
        String sec = null;
        try {
            Random rand = new Random();
            auto = rand.nextInt(10);
            String thedate[] = fmt.getCurrentMysqlDateFormt().split(" ");
            String theTime[] = thedate[1].split(":");
            String YMD[] = thedate[0].split("-");
            y = YMD[0].substring(2, 4);
            m = YMD[1];
            d = YMD[2];
            hr = theTime[0];
            min = theTime[1];
            sec = theTime[2];
            requisitionDateId = "R" + d + m + y;
        } catch (Exception j) {

        }

        return requisitionDateId;

    }
}

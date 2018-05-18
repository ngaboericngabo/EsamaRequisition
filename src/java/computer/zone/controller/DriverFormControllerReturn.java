/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.controller;

import computer.zone.common.DbConstant;
import computer.zone.common.Formating;
import computer.zone.common.SendEmail;
import computer.zone.dao.impl.JourneyInfoImpl;
import computer.zone.dao.impl.RequisitionImpl;
import computer.zone.dao.impl.UserImpl;
import computer.zone.dao.impl.VehicleImpl;
import computer.zone.domain.JourneyInfo;
import computer.zone.domain.Requisition;
import computer.zone.domain.UserCategory;
import computer.zone.domain.Users;
import computer.zone.domain.Vehicle;
import java.io.IOException;
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
@WebServlet(name = "DriverFormControllerReturn", urlPatterns = {"/DriverFormControllerReturn"})
public class DriverFormControllerReturn extends HttpServlet implements DbConstant {

    private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(DriverFormController.class);
    Formating fmt = new Formating();
    JourneyInfo j = new JourneyInfo();
    JourneyInfo jo = new JourneyInfo();
    JourneyInfoImpl jImpl = new JourneyInfoImpl();
    Vehicle v = new Vehicle();
    VehicleImpl vImpl = new VehicleImpl();
    Requisition req = new Requisition();
    RequisitionImpl reqImpl = new RequisitionImpl();
        UserImpl userImpl=new UserImpl();
    private String CLASSNAME = "DriverFormController :: ";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean valid = true;
        String biginningDate = request.getParameter("departureDate");
        String beginningTime = request.getParameter("departureTime");
        String startingKm = request.getParameter("startingKm");
        String journeyType = request.getParameter("journeyType");
        String commentOnVehicle = request.getParameter("comment");
        String reqId = request.getParameter("reqId");
        int statKm = 0;
        Long staTimDate=0L;
        
         int rutKm = 0;
        Long rutTimDate=0L;
        Users person = new Users();
        HttpSession session = request.getSession();
        person = (Users) session.getAttribute("userSession");
        try {
            req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqId)}, "from Requisition");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            v = vImpl.getModelWithMyHQL(new String[]{"vehicleId"}, new Object[]{req.getVehicle().getVehicleId()}, "from Vehicle");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            jo = jImpl.getModelWithMyHQL(new String[]{"requisition","journeyType"}, new Object[]{req,"departure"}, "from JourneyInfo");
            statKm = jo.getStartingKm();
            staTimDate=jo.getBeginningDate().getTime();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
        
        if (jo == null) {
            response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?requisitionId=" + req.getRequisitionId() + "&error=The NOT yet Record the departure information ,please fill out first the departure info");
            valid = false;
            return;
        }

        if (jo.getJourneyType().equals(RETURN)) {
            response.sendRedirect("mainPage.jsp?view=RequisitionDeparture.jsp?requisitionId=" + req.getRequisitionId() + "&error=The requisition already recorded for Return This Requisition has been closed!");
            valid = false;
            return;
        }

        if (jo.getStartingKm() > Integer.parseInt(startingKm)) {
            response.sendRedirect("mainPage.jsp?view=RequisitionReturn.jsp?requisitionId=" + req.getRequisitionId() + "&error=The Returnin Km can't be less than the departure Km ,please fill out again the return form !");
            valid = false;
            return;
        }
        if (valid) {
            try {
                j.setJourneyId(0);
                j.setBeginningDate(new Date());
                j.setCommentOnVehicle(commentOnVehicle);
                j.setJourneyType(journeyType);
                j.setRecordingDate(new Date());
                j.setRequistion(req);
                j.setUsers(person);
                j.setBeginningTime(beginningTime);
                j.setStartingKm(Integer.parseInt(startingKm));
                //save in Journey table
                j = jImpl.saveIntable(j);
                //update toatl Mileage
                int tot = Integer.parseInt(startingKm) - statKm;
                
                 try {
            jo = jImpl.getModelWithMyHQL(new String[]{"requisition","journeyType"}, new Object[]{req,"return"}, "from JourneyInfo");
            rutKm = jo.getStartingKm();
            rutTimDate=jo.getBeginningDate().getTime();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
                String totalDuration="";
                     
                if((rutTimDate-staTimDate)/3600000>0){
                totalDuration=((rutTimDate-staTimDate)/3600000)+" Hrs";
                }
                if( ((rutTimDate-staTimDate)/3600000<=0)&&((rutTimDate-staTimDate)/60000>0) ){
                 totalDuration=((rutTimDate-staTimDate)/60000)+" Min";
                }
                  if(((rutTimDate-staTimDate)/3600000<=0)&&((rutTimDate-staTimDate)/60000<=0 &&(rutTimDate-staTimDate/1000>0))) {
                 totalDuration=((rutTimDate-staTimDate)/1000)+" sec";
                }
 System.out.println((rutTimDate-staTimDate)+"return  total :::"+totalDuration);
                req.setTotalMileage(tot);
                req.setTotalDuration(totalDuration);
                reqImpl.UpdateRequisition(req);
                //update vehicle status
                v.setStatus(AVAILABLE);
                vImpl.UpdateVehicle(v);

                String notification = "<html>\n"
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
                        + "Dear Transport Officer,</br>\n"
                        + " \n"
                        + "<p>Please consider the below information to be updated on Journey  </p>\n"
                        + " \n"
                        + "   <p>\n"
                        + "<table width=\"50%\" border=\"5px\">\n"
                        + "  <tbody>\n"
                        + "    <tr>\n"
                        + "      <td class=\"labelbold\">Requisition Number: </td>\n"
                        + "      <td>" + req.getRequisitionNumber() + "</td>\n"
                        + "    </tr>\n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Driver: </td>\n"
                        + "      <td>" + person.getFname() + " </td>\n"
                        + "    </tr>  \n"
                        + "<tr>\n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Plate Number: </td>\n"
                        + "      <td>" + req.getVehicle().getPlateNumber() + "</td>\n"
                        + "    </tr>  \n"
                        + "<tr>\n"
                        + "      <td class=\"labelbold\">Joureny Date: </td>\n"
                        + "      <td>" + j.getRecordingDate() + " </td>\n"
                        + "    </tr>  \n"
                        + "<tr>\n"
                        + "      <td class=\"labelbold\">Joureny Type: </td>\n"
                        + "      <td>" + j.getJourneyType() + " </td>\n"
                        + "    </tr> \n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Starting Km: </td>\n"
                        + "      <td>" + j.getStartingKm() + "</td>\n"
                        + "    </tr>\n"
                        + "    </tr> \n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Comment on Vehicle: </td>\n"
                        + "      <td>" + j.getCommentOnVehicle() + "</td>\n"
                        + "    </tr>\n"
                        + "   \n"
                        + "	\n"
                        + "  </tbody>\n"
                        + "</table>\n"
                        + "</p>\n"
                        + " <p>\n"
                        + "If you have any query or require further information please contact " + person.getPhone() + "\n"
                        + "</p>\n"
                        + "\n"
                        + "<p>\n"
                        + "Assuring you of our best services. Done By " + person.getFname() + " :::" + person.getUserCategory().getUsercategoryName() + "\n"
                        + "</p>\n"
                        + "\n"
                        + "</br>\n"
                        + "Regards </br>\n"
                        + "</br>\n"
                        + "\n"
                        + "This email was generated automatically. Please do not respond. \n"
                        + "</br>\n"
                        + "</br></br>DISCLAIMER</br><br><p style=\"font-family: 'Courier New',Courier,mono;font-size: 10pt;\">The information contained in this email is intended to inform the recipient(s) and represents private, confidential or privileged content. This information should not be reproduced , redistributed or shared directly or indirectly in any form to any other person. If you are not the addressee mentioned , you are hereby notified  that any dissemination, copying, distribution or taking any action in relation to the contents of this email or any attachments is strictly prohibited and unlawful.\n"
                        + "</p>\n"
                        + "\n"
                        + "</body>\n"
                        + "</html>";

                SendEmail j = new SendEmail();
          Users us =new Users();
                UserCategory usc=new UserCategory();
                usc.setUserCatid(3);
                   try {
            us = userImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{usc}, "from Users");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
                try {
                    j.sendEmail(us.getEmail(), "WOLD VISION REQUISITION STATUS ", notification);
                    System.out.println("Msg Send to officer Successfully");
                } catch (Exception mm) {

                    mm.printStackTrace();
                }

                jo = null;
                req = null;
                j = null;
                response.sendRedirect("mainPage.jsp?view=DriverTabs.jsp?msg=Return from  Journey form submited succesfully !");
            } catch (Exception e) {
                e.printStackTrace();;
            }
        }
    }

}

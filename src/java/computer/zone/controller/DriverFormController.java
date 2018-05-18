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
@WebServlet(name = "DriverFormController", urlPatterns = {"/DriverFormController"})
public class DriverFormController extends HttpServlet implements DbConstant {

    private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(DriverFormController.class);
    Formating fmt = new Formating();
    JourneyInfo j = new JourneyInfo();
    JourneyInfo jou = new JourneyInfo();
    JourneyInfoImpl jImpl = new JourneyInfoImpl();
    Vehicle v = new Vehicle();
    VehicleImpl vImpl = new VehicleImpl();
    Requisition req = new Requisition();
    RequisitionImpl reqImpl = new RequisitionImpl();
    UserImpl userImpl=new UserImpl();
    private String CLASSNAME = "DriverFormController :: ";

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
           System.out.println("Here the error for vehicle selection:::");
            ex.printStackTrace();
        }

        try {
            j = jImpl.getModelWithMyHQL(new String[]{"requisition"}, new Object[]{req}, "from JourneyInfo");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (j != null) {
            response.sendRedirect("mainPage.jsp?view=RequisitionDeparture.jsp?requisitionId=" + req.getRequisitionId() + "&error=The requisition already recorded for departure!");
            valid = false;
            return;
        }
        if (valid) {
            try {
                jou.setCommentOnVehicle(commentOnVehicle);
                jou.setJourneyType(journeyType);
                jou.setRecordingDate(new Date());
                jou.setBeginningDate(new Date());
                jou.setRequistion(req);
                jou.setUsers(person);
                jou.setBeginningTime(beginningTime);
                jou.setStartingKm(Integer.parseInt(startingKm));
                jou = jImpl.saveIntable(jou);

                v.setStatus(BOOKED);
                vImpl.UpdateVehicle(v);
                
                Users us =new Users();
                UserCategory usc=new UserCategory();
                usc.setUserCatid(3);
                   try {
            us = userImpl.getModelWithMyHQL(new String[]{"userCategory"}, new Object[]{usc}, "from Users");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

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
                        + "      <td>" + jou.getRecordingDate() + " </td>\n"
                        + "    </tr>  \n"
                        + "<tr>\n"
                        + "      <td class=\"labelbold\">Joureny Type: </td>\n"
                        + "      <td>" + jou.getJourneyType() + " </td>\n"
                        + "    </tr> \n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Starting Km: </td>\n"
                        + "      <td>" + jou.getStartingKm() + "</td>\n"
                        + "    </tr>\n"
                        + "    </tr> \n"
                        + "	<tr>\n"
                        + "      <td class=\"labelbold\">Comment on Vehicle: </td>\n"
                        + "      <td>" + jou.getCommentOnVehicle() + "</td>\n"
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
                    j.sendEmail(us.getEmail(), "WOLD VISION REQUISITION STATUS ", notification);
                    System.out.println("Msg Send to officer Successfully");
                } catch (Exception mm) {

                    mm.printStackTrace();
                }
                j = null;
                v = null;
                req = null;

                response.sendRedirect("mainPage.jsp?view=DriverTabs.jsp?msg=Starting Journey form submited succesfully !");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Save journey error");
            }
        }
    }

}

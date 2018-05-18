/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computer.zone.controller;

import computer.zone.common.DbConstant;
import computer.zone.common.Formating;
import computer.zone.common.SendEmail;
import computer.zone.dao.impl.ApprovalLevelImpl;

import computer.zone.dao.impl.RequisitionImpl;
import computer.zone.dao.impl.TypeOfRequestImpl;
import computer.zone.dao.impl.UserImpl;
import computer.zone.dao.impl.VehicleImpl;
import computer.zone.domain.ApprovalLevel;

import computer.zone.domain.Requisition;
import computer.zone.domain.TypeOfRequest;
import computer.zone.domain.Users;
import computer.zone.domain.Vehicle;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "requestRequisitionController", urlPatterns = {"/requestRequisitionController"})
public class requestRequisitionController extends HttpServlet implements DbConstant {

    private static final transient org.slf4j.Logger LOGGER = LoggerFactory.getLogger(requestRequisitionController.class);

    UserImpl usersImpl = new UserImpl();
   
    Formating fmt = new Formating();
    Requisition req = new Requisition();
    RequisitionImpl reqImpl = new RequisitionImpl();
    ApprovalLevel apLevel = new ApprovalLevel();
    ApprovalLevelImpl apLevelImpl = new ApprovalLevelImpl();
   
    Vehicle vehicle = new Vehicle();
    VehicleImpl Veimpl = new VehicleImpl();

    TypeOfRequest tp = new TypeOfRequest();
    TypeOfRequestImpl typimpl = new TypeOfRequestImpl();
    private String CLASSNAME = "requestRequisitionController :: ";

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
boolean valid=true;

       
        String destination = request.getParameter("destination");
        String purpose = request.getParameter("purpose");
        String dateIn = request.getParameter("dateIn");
        String timeIn = request.getParameter("timeIn");
        String dateOut = request.getParameter("dateOut");
        String timeOut = request.getParameter("timeOut");
        String typeOfUse = request.getParameter("typeOfUse");
       
          long currentDate=0L;
        try {
            currentDate = new Date().getTime();
        } catch (Exception D) {
          
        }
     long departureDate=0L;
        try {
            departureDate = fmt.getFormtDateReturnMysqlFormat(dateIn).getTime();
        } catch (ParseException ex) {
          
        }
     long returnDate=0L;
        try {
            returnDate = fmt.getFormtDateReturnMysqlFormat(dateOut).getTime();
        } catch (ParseException ex) {
            Logger.getLogger(requestRequisitionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        if(returnDate==departureDate){
            try{
        if(fmt.getFormtTimeReturnMysqlFormat(timeIn).getTime()>=fmt.getFormtTimeReturnMysqlFormat(timeOut).getTime()){
        response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=The Departure Time can't be greater than the Return Time,please fill out again your requisition!");
        valid=false;
       return;
        }
             
       
            }catch(Exception tn){
            tn.printStackTrace();
            }
        }
        //Checking if The vehicle is not available for the requested date this can be used at transport officer
  /*
       try{
                 List<Requisition> h;
             h = (List<Requisition>) reqImpl.getListByDateBewteenOtherCriteria("requisitionDateIn", fmt.getFormtDateReturnMysqlFormat(dateIn), fmt.getFormtDateReturnMysqlFormat(dateOut),new String[]{"vehicle"}, new Object[]{vehicle});
          
      if(h.size()>0){
           response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=The vehicle is not available for the requested date ");
       valid=false;
       return;
      }
       }catch(Exception jj){
       }
        */
        if(typeOfUse==null){
       response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=Please Select  The Type Of Use,please fill out again your requisition!");
       valid=false;
       return;
        }
    
        if(fmt.getCurrentDateFormtNOTime().getTime()>departureDate ){
    response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=Please  Depurture Date can't be in Past date!,please fill out again your requisition! ");
         valid=false;
         return ;
        }
        if(fmt.getCurrentDateFormtNOTime().getTime()>returnDate){
    response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=Please Return Date can't be in Past date!,please fill out again your requisition ");
      valid=false;
      return ;
        }
        if(returnDate<departureDate){
    response.sendRedirect("mainPage.jsp?view=RequisitionForm.jsp?error=Please Return Date can't be before  Depurture  date!,please fill out again your requisition!");
         valid=false;
         return ;
        }
        
        int level = 1;
        
    

        try {
            apLevel = apLevelImpl.getModelWithMyHQL(new String[]{"approvalLevelId"}, new Object[]{level}, "from ApprovalLevel");

        } catch (Exception ex) {
            LOGGER.info(CLASSNAME + " GETING APPROVER LEVEL ERROR", ex.getMessage());
        }
    
        try {
            tp = typimpl.getModelWithMyHQL(new String[]{"typeOfRequestId"}, new Object[]{Integer.parseInt(typeOfUse)}, "from TypeOfRequest");

        } catch (Exception ex) {
            LOGGER.info(CLASSNAME + " GETTING VEHICLE LEVEL ERROR", ex.getMessage());
        }
        Users sup=new Users();
        try {
            sup = usersImpl.getModelWithMyHQL(new String[]{"userId"}, new Object[]{Integer.parseInt(request.getParameter("selectSupervisor"))}, "from Users");

        } catch (Exception ex) {
            LOGGER.info(CLASSNAME + " GETTING sup LEVEL ERROR", ex.getMessage());
        }
     
try{
    if(valid){
        req.setRequisitionId(0);
        req.setRequisitionNumber(null);
        req.setApprovalLevel(null);
        req.setDriver(null);
        req.setTotalMileage(0);
        req.setDestination(destination);
        req.setLoginUser(person);
        req.setPurpose(purpose);
        req.setRequester(person);
        req.setRequisitionDate(new Date());
        req.setRequisitionDateIn(fmt.getFormtDateReturnMysqlFormat(dateIn));
        req.setRequisitionDateOut(fmt.getFormtDateReturnMysqlFormat(dateOut));
        req.setRequisitionTimeIn(timeIn);
        req.setRequisitionTimeOut(timeOut);
        req.setTypeOfRequest(tp);
        req.setSupervisor(sup);
        req.setVehicle(null);
        req.setStatus(NOTYET);
        req = reqImpl.saveIntable(req);
        
        
                //nojtification
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
                + "Dear " + req.getSupervisor().getFname() + "</br>\n"
                + " \n"
                + "<p>New Requisition Details .</p>\n"
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
        SendEmail j = new SendEmail();

        try {
            j.sendEmail(req.getSupervisor().getEmail(), "WOLD VISION REQUISITION STATUS ", notifcationMsg);
            System.out.println("Msg Send Successfully");
        } catch (Exception mm) {

            mm.printStackTrace();
        }
//end notification
        
        
        
        response.sendRedirect("mainPage.jsp?view=successRequisition.jsp?reqn=" + req.getRequisitionId());
    }
}catch(Exception hh){
hh.printStackTrace();
System.out.println(hh.getMessage());
}
        /*
         approverImpl=null;
         usersImpl=null;
         req=null;
         reqImpl=null;
         apLevel=null;
         apLevelImpl=null;
         */
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
               requisitionDateId = "R" + d + m + y + hr + min + sec + auto + "1";
            last = reqImpl.getLastRecordId("SELECT max( i.requisitionId ) FROM Requisition i");
            requisitionDateId = "R" + d + m + y +(last+1);
        } catch (Exception j) {
            last = 1;
        }

        return requisitionDateId;

    }
}

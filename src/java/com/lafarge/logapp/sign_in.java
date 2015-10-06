/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lafarge.logapp;

import com.lafarge.members.EmployeesInfo;
import com.lafarge.members.EmployeesSigninSignoff;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author clementino
 */
@WebServlet(name = "sign_in", urlPatterns = {"/sign_in"})
public class sign_in extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.println("</body>");
            out.println("</html>");
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
        response.sendRedirect(request.getContextPath() + "/welcome.jsp");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        pw.println("<!DOCTYPE html>");
        pw.println("<html>");
        pw.println("<head>");
        pw.println("<title>App login</title>");
        pw.println("</head>");
        pw.println("<body>");
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String company = request.getParameter("company");
        boolean found = false;

        EmployeesSigninSignoff ess = new EmployeesSigninSignoff();
        EmployeesInfo eio = new EmployeesInfo();

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session sess = sessionFactory.openSession();
        sess.beginTransaction();
        Calendar cal = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        String context= "/welcome.jsp";
        try {
            Query query = sess.createQuery("from EmployeesInfo");
            List<EmployeesInfo> list = query.list();
            for (EmployeesInfo ei : list) {
                if (ei.getFullName().equalsIgnoreCase(fullName) && ei.getPhoneNumber().equals(phoneNumber) && ei.getAllowLogin().equalsIgnoreCase("yes")) {
                    fullName = fullName.toLowerCase();
                    found = true; 
                    pw.println(ei.getAllowLogin());
                    cal.setTime(ei.getPreviousOrientationDate());
                    if(cal.get(Calendar.YEAR) - now.get(Calendar.YEAR) > 0 && (cal.get(Calendar.MONTH)+1)-(now.get(Calendar.MONTH)+1) == 0 ){
                        ei.setAllowLogin("no");
                    }
                    context = "/welcome.jsp";
                }
                else if(ei.getFullName().equalsIgnoreCase(fullName) && ei.getPhoneNumber().equals(phoneNumber) && ei.getAllowLogin().equalsIgnoreCase("no")){
                    found = true; 
                    session.setAttribute("orientation", "orientationNeeded");
                    context = "/welcome.jsp";
                }
            }
            
            if (found == true) {
                ess.setFullName(fullName);
                ess.setPhoneNumber(phoneNumber);
                ess.setCompany(company);
                Date date = new Date();
                ess.setSignInTime(new Timestamp(date.getTime()));
                sess.save(ess);
            } 
//            else {
//                eio.setFullName(fullName);
//                eio.setPhoneNumber(phoneNumber);
//                eio.setCompany(company);
//                Date date = new Date();
//                eio.setPreviousOrientationDate(new Timestamp(date.getTime()));
//                eio.setAllowLogin("yes");
//                sess.save(eio);
//                ess.setFullName(fullName);
//                ess.setPhoneNumber(phoneNumber);
//                ess.setCompany(company);
//                ess.setSignInTime(new Timestamp(date.getTime()));
//                sess.save(ess);
//            }
        } finally {
            sess.getTransaction().commit();
            sess.close();
            session.setAttribute("sign_in", "signedin");
        }
        response.sendRedirect(request.getContextPath() + context);
        //response.setHeader("Refresh", "1000; URL=" + request.getContextPath() + context);
        processRequest(request, response);
    }

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

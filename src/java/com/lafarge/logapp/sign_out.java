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

/**
 *
 * @author clementino
 */
@WebServlet(name = "sign_out", urlPatterns = {"/sign_out"})
public class sign_out extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
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

        EmployeesSigninSignoff ess = new EmployeesSigninSignoff();

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session sess = sessionFactory.openSession();
        sess.beginTransaction();

        try {
            Query query = sess.createQuery("from EmployeesSigninSignoff");
            List<EmployeesSigninSignoff> list = query.list();
            for (EmployeesSigninSignoff ei : list) {
                if (ei.getPhoneNumber().equalsIgnoreCase(request.getParameter("logoutWorker"))) {
                    String hql = "delete from EmployeesSigninSignoff where phoneNumber = :pNumber";
                    Query q = sess.createQuery(hql);
                    q.setString("pNumber", request.getParameter("logoutWorker"));
                    q.executeUpdate();
                }
            }

        } finally {
            sess.getTransaction().commit();
            sess.close();
        }
        response.sendRedirect(request.getContextPath() + "/welcome.jsp");
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

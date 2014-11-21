/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lafarge.logapp;

import com.lafarge.members.Members;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
//import java.time.Instant;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * @author 300091186
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
        try (PrintWriter pw = response.getWriter()) {
            pw.println("</body>");
            pw.println("</html>");
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
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        if (session.getAttribute("userN") == null || (session.getAttribute("userN") == "")) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/welcome.jsp");
        }
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
        String userN = request.getParameter("userName");
        String passW = request.getParameter("password");

        Members mbs = new Members();
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session sess = sessionFactory.openSession();
        Transaction tx = sess.beginTransaction();
//        try {
//            Query query = sess.getNamedQuery("Members.findByUserName");
//            List<Members> list = query.list();
//            for (Members mem : list) {
//                System.out.println("List of Employees: " + mem.getUserName()+"");
//            }
//        } finally {
//            pw.println("<h4>lol3</h4>");
//            tx.commit();
//            sessionFactory.close();
//            //mbs = null;
//        }
//        response.setHeader("Refresh", "5; URL=" + request.getContextPath() + "/welcome.jsp");

        mbs = (Members) sess.get(Members.class, 1);

        if (mbs.getUserName().equalsIgnoreCase(userN) && mbs.getPassword().equals(passW)) {
            session.setAttribute("userN", userN);
            session.setAttribute("login", "loged");
            response.sendRedirect(request.getContextPath() + "/alerts.jsp");
            tx.commit();
            sessionFactory.close();
            mbs = null;
        } else {
            session.setAttribute("login", null);
            response.sendRedirect(request.getContextPath() + "/alerts.jsp");
        }
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

package org.codexdei.webapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet({"/create",""})
public class ProductRegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nameProduct = req.getParameter("nameproduct");
        Integer priceProduct = null;
        //Se debe colocar porque es un valor numerico y no lance error en el form el enviar el dato numerico
        try{
            priceProduct = Integer.valueOf(req.getParameter("priceproduct"));

        }catch (NumberFormatException e){
        }

        String manufacture = req.getParameter("manufacture");
        String[] category = req.getParameterValues("category");

        //Para validacion de errores
        Map<String,String> errors = new HashMap<>();

        //validaciones de los campos
        if (nameProduct == null || nameProduct.isBlank()){
            errors.put("nameproduct", "The name product cannot be null or empty");
        }
        if (priceProduct == null){
            errors.put("priceproduct", "The price product cannot empty");
        }
        if (manufacture == null || manufacture.isBlank()){
            errors.put("manufacture", "The manufacture product cannot empty");
        }
        if (category == null || category.length == 0){
            errors.put("category", "Please select a category");
        }

        resp.setContentType("text/html");

        if (errors.isEmpty()){

            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("       <title>Result Form</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("       <h1>Result Form</h1>");
                out.println("           <ul>");
                out.println("                <li>Name product: " + nameProduct + "</li>");
                out.println("                <li>Price product: " + priceProduct + "</li>");
                out.println("                <li>Manufacture: " + manufacture + "</li>");
                out.println("                <li>Category: <ul>");
                Arrays.asList(category).forEach(categ -> {
                    out.println("<li>" + categ + "</li>");
                });
                out.println("                                 </ul>");
                out.println("                </li>");
                out.println("           </ul>");
                out.println("   </body>");
                out.println("</html>");
            }
        }else {

            req.setAttribute("errors",errors);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }
}

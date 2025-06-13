<%--Directivas para que funciona el .jsp puesto que la version gratuita de intellij no brinda soporte, solo la de pago--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
   Map<String, String> errors = (Map<String,String>)request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Products</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>Form Products:</h2>

<%if( errors != null && errors.size() > 0){%>
<ul class="alert alert-danger mx-5 px-5">
    <%for(String error : errors.values()){%>
        <li> <%=error%> </li>
    <%}%>
</ul>
<%}%>

<!--Los nombres del "name" seran los mismo que estan en el servlet-->
<!--"id" para capturarlos para javascript-->
<!--"value" para el caso en el que se presenten errores en el form, el reiniciarse el form no se borren los datos correctos-->

    <div class="px-5">
        <form action="/webpp-form-products/create" method="post">
            <div class="row mb-3 ">
                <label for="nameproduct" class="col-form-label col-sm-2">Name Product:</label>
                <div class="col-sm-4">
                    <input type="text" name="nameproduct" id="nameprod" class="form-control" value="${param.nameproduct}" placeholder="Enter your name product" required>
                </div>
                <%
                    if(errors != null && errors.containsKey("nameproduct")){
                        out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("nameproduct") + "</small>");
                    }
                %>
            </div>
            <div class="row mb-3 ">
                <label for="priceproduct" class="col-form-label col-sm-2">Price Product:</label>
                <div class="col-sm-4">
                    <input type="number" name="priceproduct" id="priceprod" class="form-control" value="${param.priceproduct}" placeholder="Enter your price product" required>
                </div>
                <%
                    if(errors != null && errors.containsKey("priceproduct")){
                        out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("priceproduct") + "</small>");
                    }
                %>
            </div>
            <div class="row mb-3 ">
                <label for="manufacture" class="col-form-label col-sm-2">Manufacture:</label>
                <div class="col-sm-4">
                    <input type="text" name="manufacture" id="manufact" class="form-control" value="${param.manufacture}" minlength="4" maxlength="10" placeholder="Enter between 4 and 10 characters" required>
                </div>
                <%
                    if(errors != null && errors.containsKey("manufacture")){
                        out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("manufacture") + "</small>");
                    }
                %>
            </div>
            <div class="row mb-3 ">
                <label class="col-form-label col-sm-2">Category:</label>
                <div class="form-check col-sm-2">
                    <label for="category_food" class="form-check-label">Food</label>
                    <input type="radio" id="category_food" name="category" value="food" class="form-check-input" ${param.category.equals("food")? "checked" : ""}>
                </div>
                <div class="form-check col-sm-2">
                    <label for="category_appliance" class="form-check-label">Appliance</label>
                    <input type="radio" id="category_appliance" name="category" value="appliance" class="form-check-input" ${param.category.equals("appliance")? "checked" : ""}>
                </div>
                <div class="form-check col-sm-2">
                    <label for="category_toys" class="form-check-label">Toys</label>
                    <input type="radio" id="category_toys" name="category" value="toys" class="form-check-input" ${param.category.equals("toys")? "checked" : ""}>
                </div>
                <%
                    if(errors != null && errors.containsKey("category")){
                        out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("category") + "</small>");
                    }
                %>
            </div>
            <div class="row mb-3 ">
                        <input type="submit" value="Submit" class="btn btn-primary">
            </div>
        </form>
    </div>

</body>
</html>
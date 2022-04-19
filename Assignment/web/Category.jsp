<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Category</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Category</h1><hr>
                        <form class="row g-3 needs-validation mb-4" action="category?action=create" method="post" >
                            <div class="col-md-6">
                                <label for="categoryid" class="form-label">CategoryID</label>
                                <input type="text" class="form-control " id="categoryid" value="" name="categoryid" required="">
                                <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                            </div>
                            <div class="col-md-6">
                                <label for="categoryname" class="form-label">CategoryName</label>
                                <input type="text" class="form-control" id="categoryname" value="" required name="categoryname">
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit">Add Category</button>
                            </div>
                        </form>
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">CategoryID</th>
                                            <th class="text-center">CategoryName</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCategory}" var="ct">
                                            <tr>
                                                <td class="text-center">${ct.getCategoryID()}</td>
                                                <td class="text-center">${ct.getCategoryName()}</td>

                                                <td class="text-center">
                                                    <a href="category?action=edit&&CategoryID=${ct.getCategoryID()}"><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                    <a href="#" onclick="deleteCategory('${ct.getCategoryID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function deleteCategory(id) {
                        Swal.fire({
                            title: 'Are you sure?',
                            text: "You won't be able to revert this!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, delete it!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'category?action=delete&&CategoryID=' + id;
                            }
                        })
                    }
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>

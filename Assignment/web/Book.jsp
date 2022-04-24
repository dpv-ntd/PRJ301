<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Book</h1>               
                        <hr>

                        <div class="card mb-4">
                            <div class="card-header mb-4">
                                <a href="account?action=create" type="button" class="btn btn-outline-success">
                                    <i class="fa-solid fa-plus me-2"></i>Add Book
                                </a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Book ID</th>
                                            <th class="text-center">Book Name</th>
                                            <th class="text-center">Author</th>
                                            <th class="text-center">Publish Year</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listBook}" var="bo">
                                            <tr>
                                                <td class="text-center">${bo.getBookID()}</td>
                                                <td class="text-center">${bo.getBookName()}</td>
                                                <td class="text-center">${bo.getName()}</td>
                                                <td class="text-center">${bo.getDOB()}</td>
                                                <td class="text-center">${bo.getRole()== 1 ? "Adminstrator":"User"}</td>
                                                <c:choose>
                                                    <c:when test="${ac.getRole() == 1}">
                                                        <td class="text-center">
                                                            <a href="account?action=edit&&AccountID=${ac.getAccountID()}"><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                            <a><i class="fa-solid fa-square-xmark fa-lg me-2 ms-2"></i></a>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td class="text-center">
                                                            <a href="account?action=edit&&AccountID=${ac.getAccountID()}"><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                            <a href="#" onclick="deleteAccount('${ac.getAccountID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function deleteAccount(id) {
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
                                window.location.href = 'account?action=delete&&AccountID=' + id;
                            }
                        })
                    }
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>

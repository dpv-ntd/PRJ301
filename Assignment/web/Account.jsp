<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dashboard</title>
        <%@include file="Header.jsp" %>
    </head>
    <style>
        .feature-box {
            padding: 38px 30px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 29px 0 rgb(18 66 101 / 8%);
            transition: all 0.3s ease-in-out;
            border-radius: 8px;
            z-index: 1;
            width: 100%;
        }
        .feature-icon {
            font-size: 1.8em;
            margin-bottom: 1rem;
        }

        .feature-title {
            font-size: 1.5em;
            font-weight: 500;
            padding-bottom: 0.25rem;
            text-decoration: none;
            color: white;
        }
        .feature-content{
            font-size: 1em;
            font-weight: 500;
            padding-bottom: 0.25rem;
            text-decoration: none;
            color: white;
        }
    </style>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1><hr>
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #2EE27E">
                                    <div class="text-white">
                                        <i class="fa-solid fa-car feature-icon"></i>
                                        <div>
                                            <div class="feature-title">${Available}</div>
                                            <div class="feature-title">CHỖ ĐỖ XE</div>
                                            <div class="feature-content">CÒN TRỐNG</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>

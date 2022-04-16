<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link ${dashboard}" href="dashboard">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-house me-3"></i>Dashboard
                </a>
                <c:if test="${account.getRole() == 1}">
                    <a class="nav-link ${account}" href="account">
                        <div class="sb-nav-link-icon"></div>
                        <i class="fa-solid fa-user me-3"></i>Account
                    </a>
                </c:if>
                <a class="nav-link" href="book">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-book me-3"></i>Book
                </a>
                <a class="nav-link" href="reader">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-book-open-reader me-3"></i>Reader
                </a>
                <a class="nav-link" href="library-card">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-file-lines me-3"></i>Library Card
                </a>
                <a class="nav-link" href="category">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-filter me-3"></i>Category
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Login in as:</div>
            ${account.getRole() == 0 ? "User" : "Adminstrator"}
        </div>
    </nav>
</div>
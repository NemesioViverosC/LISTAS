<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.AsyncContext.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<sql:setDataSource 
    var="connection"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/accounting"
    user="root" password=""
    />
<sql:query var="result" dataSource="${connection}">
    SELECT number,name,handler FROM accounts WHERE handler=<%= request.getParameter("lista")%>
</sql:query>

<select id="lista2" name="lista2" >
    <c:forEach 
        var="values" 
        items="${result.rows}">
        <option>${values.name}</option>
    </c:forEach>
</select>
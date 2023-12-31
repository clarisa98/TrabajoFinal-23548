<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "proyectoFinal.java.Conexion" %>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("mail");
        String categoria = request.getParameter("categoria");
        String cantidad = request.getParameter("cantidad");

        // Excluye la columna 'id' de la inserción
        String sql = "INSERT INTO ticket (nombre, apellido, email, cantidad, categoria) VALUES (?, ?, ?, ?, ?)";

        Conexion myConexion= new Conexion();
        
        Connection cn =myConexion.conectar();
        PreparedStatement pstmt = null;

        

        try {
           

            pstmt = cn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, correo);
            pstmt.setInt(4, Integer.parseInt(cantidad));
            pstmt.setString(5, categoria);
           
            pstmt.executeUpdate();
           

          
        } catch (SQLException e) {
            out.println("No se pudieron enviar los datos. Error: " + e.getMessage());
            e.printStackTrace();
            while (e.getNextException() != null) {
                e = e.getNextException();
                out.println("Error adicional: " + e.getMessage());
                e.printStackTrace();
            }
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <jsp:include page="tickets.jsp"></jsp:include>
</body>
</html>
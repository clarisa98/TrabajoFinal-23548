<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "proyectoFinal.java.Conexion" %>

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
        String tema = request.getParameter("tema");

      
        String sql = "INSERT INTO oradores (nombre, apellido, tema) VALUES (?, ?, ?)";

		Conexion myConexion= new Conexion();
        
        Connection cn =myConexion.conectar();
        PreparedStatement pstmt = null;
        
        
       

        try {
            pstmt = cn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, tema);

            pstmt.executeUpdate();
           
            out.println("DATOS CARGADOS CORRECTAMENTE");
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
    <%
        response.sendRedirect("confirmacion.jsp"); // Reemplaza "confirmacion.jsp" con la página que desees mostrar después de la inserción.
    %>
</body>
</html>
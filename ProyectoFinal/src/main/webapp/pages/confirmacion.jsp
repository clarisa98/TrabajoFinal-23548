<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="proyectoFinal.java.Conexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Inserción</title>
</head>
<body>
    <h2>Confirmación de Inserción</h2>
    <p>Los datos se han insertado correctamente.</p>

    <h3>Registros actuales:</h3>
    
    <%
        Conexion myConexion = new Conexion();
        Connection cn = myConexion.conectar();
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = cn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM oradores");

            %>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Tema</th>
                </tr>
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td><%= rs.getString("apellido") %></td>
                        <td><%= rs.getString("tema") %></td>
                    </tr>
                <%
                }
                %>
            </table>
            <%
        } catch (SQLException e) {
            out.println("Error al realizar la consulta: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <p><a href="../index.html">Volver al Inicio</a></p>
</body>
</html>

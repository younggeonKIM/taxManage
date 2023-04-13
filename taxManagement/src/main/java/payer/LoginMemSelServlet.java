package payer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginMemSel.do")
public class LoginMemSelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginMemSelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("ID"); String pwd=request.getParameter("PWD");
		String select="select tax_id, tax_pwd from taxmem_tbl2021 where tax_id='"+id+"'";
		Connection con=null; Statement stmt=null; ResultSet rs=null; String resul="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			if(rs.next()) {
				String pwdInDB =rs.getString(2);
				if (pwdInDB.equals(pwd)) {
					resul="OK";
					System.out.println("로그인 성공");
					HttpSession sess=request.getSession();
					sess.setAttribute("LOGID", id);
				}else {
					resul="NOPWD";
					System.out.println("암호 불일치");
				}
			}else {
				resul="NOID";
				System.out.println("계정이 존재하지 않음.");
			}
			System.out.println(resul);
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch (Exception e) {
				
			}
		}
		response.sendRedirect("tax_login_res.jsp?R="+resul);
	}

}

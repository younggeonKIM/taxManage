package payer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memSelect.do")
public class MemSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemSelectServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession();
		String id=(String)sess.getAttribute("LOGID");
		if (id==null) {
			response.sendRedirect("tax_login.jsp?M=ADM");
		}
		else if (! id.contains("admin")) {
			response.sendRedirect("tax_login.jsp?M=ADM");
		} else {
			String select="select * from taxmem_tbl2021";
			Connection con=null; Statement stmt=null; ResultSet rs=null; 
			ArrayList al=new ArrayList();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				stmt=con.createStatement();
				rs=stmt.executeQuery(select);
				while(rs.next()) {
					Members mem=new Members();
					mem.setId(rs.getString(1));
					mem.setPwd(rs.getInt(2));
					mem.setName(rs.getString(3));
					al.add(mem);
				}
				System.out.println("회원 목록 조회에 성공");
			}catch(Exception e) {
				System.out.println("회원 목록 조회에 실패");
				e.printStackTrace();
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				}catch(Exception e) {}
			}
			request.setAttribute("AL", al);
			RequestDispatcher rd=request.getRequestDispatcher("memSelect.jsp");
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

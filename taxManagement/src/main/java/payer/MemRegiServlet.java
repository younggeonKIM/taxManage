package payer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memRegi.do")
public class MemRegiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemRegiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String id=(String)sess.getAttribute("LOGID"); 
		System.out.println(id);
		if(id==null) {
			String select="select payerno, payername from payer_tbl_2021 where payerno=(select max(payerno) from payer_tbl_2021) ";
			Connection con=null; Statement stmt=null; ResultSet rs=null; 
			Members mem=new Members();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				stmt=con.createStatement();
				rs=stmt.executeQuery(select);
				rs.next();
				mem.setId(rs.getString(1));
				mem.setName(rs.getString(2));
				
				System.out.println("등록을 위한 번호 얻는 것에 성공");
			}catch (Exception e) {
				System.out.println("등록을 위한 번호 얻는 것에 실패");
				e.printStackTrace();
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				} catch(Exception e) {}
			}
			request.setAttribute("MEM", mem);
			RequestDispatcher rd= request.getRequestDispatcher("memRegi.jsp");
			rd.forward(request, response);
			
			
		}  else if (id.contains("admin")) {
			String select="select payerno, payername from payer_tbl_2021 where payerno=(select max(payerno) from payer_tbl_2021) ";
			Connection con=null; Statement stmt=null; ResultSet rs=null; 
			Members mem=new Members();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				stmt=con.createStatement();
				rs=stmt.executeQuery(select);
				rs.next();
				mem.setId(rs.getString(1));
				mem.setName(rs.getString(2));
				System.out.println("등록을 위한 번호 얻는 것에 성공");
			}catch (Exception e) {
				System.out.println("등록을 위한 번호 얻는 것에 실패");
				e.printStackTrace();
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				} catch(Exception e) {}
			}
			request.setAttribute("MEM", mem);
			RequestDispatcher rd= request.getRequestDispatcher("memRegi.jsp");
			rd.forward(request, response);
		}
		else if (! "".equals(id) ) {
			response.sendRedirect("mem_inser_res.jsp?M=N");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

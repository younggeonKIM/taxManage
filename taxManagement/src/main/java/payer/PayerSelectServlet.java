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

@WebServlet("/payerSelect.do")
public class PayerSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayerSelectServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String id=(String)sess.getAttribute("LOGID");
		
		String num=request.getParameter("NUM");
		
		if(id.contains("admin")) {
			String select = "select payerno, payername, phone_no, address, "
					+"to_char(paydate, 'YYYY-MM-DD'), "
					+"to_char(duedate, 'YYYY-MM-DD'), pay_place "
					+"from payer_tbl_2021 where payerno ="+num;
			Connection con=null; Statement stmt=null; ResultSet rs=null;
			Payers payr=new Payers();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				stmt=con.createStatement();
				rs=stmt.executeQuery(select);
				rs.next();
				
				payr.setPayrno(rs.getInt(1));
				payr.setPayrnam(rs.getString(2));
				payr.setTel(rs.getString(3));
				payr.setAddr(rs.getString(4));
				payr.setPadate(rs.getString(5));
				payr.setDudate(rs.getString(6));
				payr.setPayplac(rs.getString(7));
				//상세 조회에 성공.
			}catch(Exception e) {
				System.out.println("상세 조회에 실패했습니다.");
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				}catch(Exception e) {
					
				}
			}
			request.setAttribute("PAYER", payr);
			RequestDispatcher rd=
					request.getRequestDispatcher("tax_Select.jsp");
			rd.forward(request, response);
			
			
		}else if (id.equals(num)) {
			String select = "select payerno, payername, phone_no, address, "
					+"to_char(paydate, 'YYYY-MM-DD'), "
					+"to_char(duedate, 'YYYY-MM-DD'), pay_place "
					+"from payer_tbl_2021 where payerno ="+num;
			Connection con=null; Statement stmt=null; ResultSet rs=null;
			Payers payr=new Payers();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				stmt=con.createStatement();
				rs=stmt.executeQuery(select);
				rs.next();
				
				payr.setPayrno(rs.getInt(1));
				payr.setPayrnam(rs.getString(2));
				payr.setTel(rs.getString(3));
				payr.setAddr(rs.getString(4));
				payr.setPadate(rs.getString(5));
				payr.setDudate(rs.getString(6));
				payr.setPayplac(rs.getString(7));
				//상세 조회에 성공.
			}catch(Exception e) {
				System.out.println("상세 조회에 실패했습니다.");
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				}catch(Exception e) {
					
				}
			}
			request.setAttribute("PAYER", payr);
			RequestDispatcher rd=
					request.getRequestDispatcher("tax_Select.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("tax_updat_res.jsp?M=N");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

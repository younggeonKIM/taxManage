package amount;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/amoSelect.do")
public class AmoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AmoSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("LOGID");
		String payno= request.getParameter("PYN");
		String payrnum=request.getParameter("PYRN");
		if(id==null) {
			response.sendRedirect("tax_login.jsp?M=Y");
		}else if (id.contains("admin")) {
					String select ="select * from amount_tbl_2021 where "+
							"payerno = ? and payno = ?";
			Connection con=null; PreparedStatement pstmt=null; 
			ResultSet rs =null; Amount amt=new Amount();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection
						("jdbc:oracle:thin:@127.0.0.1:1521/xe",
								"hr","hr");	
				pstmt=con.prepareStatement(select);
				pstmt.setInt(1, Integer.parseInt(payrnum));
				pstmt.setInt(2, Integer.parseInt(payno));
				rs=pstmt.executeQuery();
				rs.next();
				
				amt.setPayrnum(rs.getInt(1));
				amt.setPayno(rs.getInt(2));
				amt.setStdd(rs.getLong(3));
				amt.setRate(rs.getDouble(4));
				amt.setEstim(rs.getLong(5));
				amt.setDeduc(rs.getLong(6));
				amt.setPayed(rs.getLong(7));
				amt.setYear(rs.getString(8));
				//개인 상세 납부액 조회 성공
			}catch(Exception e) {
				System.out.println("개인 상세 납부액 조회가 실패");
				e.printStackTrace();
			}finally {
				try {
					con.close(); pstmt.close(); rs.close();
				}catch(Exception e) {}
			}
			request.setAttribute("AMT", amt);
			RequestDispatcher rd=
					request.getRequestDispatcher("amountUpDel.jsp");
			rd.forward(request, response);
		}
		
		else if (id.equals(payrnum)) {
			
			String select ="select * from amount_tbl_2021 where "+
							"payerno = ? and payno = ?";
			Connection con=null; PreparedStatement pstmt=null; 
			ResultSet rs =null; Amount amt=new Amount();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection
						("jdbc:oracle:thin:@127.0.0.1:1521/xe",
								"hr","hr");	
				pstmt=con.prepareStatement(select);
				pstmt.setInt(1, Integer.parseInt(payrnum));
				pstmt.setInt(2, Integer.parseInt(payno));
				rs=pstmt.executeQuery();
				rs.next();
				
				amt.setPayrnum(rs.getInt(1));
				amt.setPayno(rs.getInt(2));
				amt.setStdd(rs.getLong(3));
				amt.setRate(rs.getDouble(4));
				amt.setEstim(rs.getLong(5));
				amt.setDeduc(rs.getLong(6));
				amt.setPayed(rs.getLong(7));
				amt.setYear(rs.getString(8));
				//개인 상세 납부액 조회 성공
			}catch(Exception e) {
				System.out.println("개인 상세 납부액 조회가 실패");
				e.printStackTrace();
			}finally {
				try {
					con.close(); pstmt.close(); rs.close();
				}catch(Exception e) {}
			}
			request.setAttribute("AMT", amt);
			RequestDispatcher rd=
					request.getRequestDispatcher("amountUpDel.jsp");
			rd.forward(request, response);
		}
		else if (!id.equals(payrnum)) {
			response.sendRedirect("amt_updat_res.jsp?M=N");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

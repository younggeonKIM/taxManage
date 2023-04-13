package payer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/payerUpdate.do")
public class PayerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayerUpdateServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	String update(HttpServletRequest req) {
		String num=req.getParameter("NUM");
		String name=req.getParameter("NAME");
		String phone=req.getParameter("TEL");
		String addr=req.getParameter("ADDR");
		String padat=req.getParameter("PAYDAT");
		String dudat=req.getParameter("DUEDAT");
		String paplac=req.getParameter("PLACE");
		String update="update payer_tbl_2021 set payername=?, "
					+"phone_no=?, address=?, paydate=to_date(?, 'YYYY-MM-DD'), "
					+"duedate=to_date(?, 'YYYY-MM-DD'), pay_place=? "
					+"where payerno = ?";
		Connection con=null; PreparedStatement pstmt = null; 
		String resu="";
		System.out.println(update);
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setInt(7, Integer.parseInt(num));
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.setString(4, padat);
			pstmt.setString(5, dudat);
			pstmt.setString(6, paplac);
			pstmt.executeUpdate();
			resu="OK";
			//개인정보 수정에 성공.
		}catch(Exception e) {
			resu="NOK";
			System.out.println("개인정보 수정에 실패했습니다.");
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch (Exception e) {}
		}
		return resu;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR"); 
		String resul=update(request);
		response.sendRedirect("tax_updat_res.jsp?R="+resul);
	}
	
}
package amount;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/amountUpDel.do")
public class AmountUpDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AmountUpDelServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	String amountDelete(HttpServletRequest req) {
		String payr=req.getParameter("PAYRNO");
		String payno=req.getParameter("PAYNUM");
		String delete="delete from amount_tbl_2021 where "+
						"payerno=? and payno=?";
		Connection con=null; PreparedStatement pstmt=null;
		
		String resu="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");
			pstmt=con.prepareStatement(delete);
			pstmt.setInt(1, Integer.parseInt(payr));
			pstmt.setInt(2, Integer.parseInt(payno));
			System.out.println(delete);
			pstmt.executeUpdate();
			resu="OK";
			System.out.println("개인 상세 납부액 삭제에 성공");
		}catch (Exception e) {
			resu="NOK";
			e.printStackTrace();
			System.out.println("개인 상세 납부액 삭제에 실패");
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {
				
			}
		}
		return resu;
	}
	String amountUpdate(HttpServletRequest req) {
		String payr=req.getParameter("PAYRNO");
		String payno=req.getParameter("PAYNUM");
		String stdd=req.getParameter("STDD");
		String rate=req.getParameter("RATE");
		String estm=req.getParameter("ESTM");
		String dedu=req.getParameter("DEDUC");
		String payed=req.getParameter("PAYED");
		String year=req.getParameter("YEAR");
		
		String update="update amount_tbl_2021 set payerno=?, payno=?, "
					+"standard=?, taxrate=?, tax_estim=?, deduct=?, "
					+"tax_payed=?, year_belong=? where payerno=? "
					+"and payno=?";
		Connection con=null; PreparedStatement pstmt=null;
		String resu="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setInt(1, Integer.parseInt(payr));
			pstmt.setInt(2, Integer.parseInt(payno));
			pstmt.setLong(3, Long.parseLong(stdd));
			pstmt.setDouble(4, Double.parseDouble(rate));
			pstmt.setLong(5, Long.parseLong(estm));
			pstmt.setLong(6, Long.parseLong(dedu));
			pstmt.setLong(7, Long.parseLong(payed));
			pstmt.setString(8, year);
			pstmt.setInt(9, Integer.parseInt(payr));
			pstmt.setInt(10, Integer.parseInt(payno));
			System.out.println(update);
			pstmt.executeUpdate();
			resu="OK";
			System.out.println("개인 상세 납부액 수정에 성공");
		}catch (Exception e) {
			resu="NOK";
			e.printStackTrace();
			System.out.println("개인 상세 납부액 수정에 실패");
		}finally {
			try {
				con.close(); pstmt.close();
			}catch (Exception e) {
				
			}
		}
		return resu;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR"); 
		System.out.println("post");
		String btn=null; 
		btn=request.getParameter("BTN");
		String resup=""; String html="";
		String resdel="";
		if ("클릭".equals(btn)) {
			System.out.println("click");
			resup =amountUpdate(request);
			html="amt_updat_res.jsp?R="+resup;
		} 
		if ("삭제".equals(btn)) {
			System.out.println("delete");
			resdel= amountDelete(request);
			html="amt_delet_res.jsp?R="+resdel;
		}
		response.sendRedirect(html);
	}
}

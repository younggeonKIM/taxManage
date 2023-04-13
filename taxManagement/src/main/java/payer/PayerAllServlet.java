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

@WebServlet("/payerAll.do")
public class PayerAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PayerAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession();
		String logId=(String)sess.getAttribute("LOGID");
		if (logId==null) {
			response.sendRedirect("tax_login.jsp?M=Y");
		}else {
		String select="select payerno, payername, "
						+"to_char(paydate, 'YYYY-MM-DD'), "
						+"to_char(duedate, 'YYYY-MM-DD'), " 
						+"pay_place from "
						+"payer_tbl_2021";
		Connection con=null; Statement stmt=null; ResultSet rs =null;
		ArrayList al=new ArrayList();
		System.out.println(select);
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			while(rs.next()) {
				Payers payr=new Payers();
				payr.setPayrno(rs.getInt(1));
				payr.setPayrnam(rs.getString(2));
				payr.setPadate(rs.getString(3));
				payr.setDudate(rs.getString(4));
				payr.setPayplac(rs.getString(5));
				al.add(payr);
			}
			//조회 성공함
		}catch(Exception e) {
			System.out.println("조회에 실패했습니다.");
			e.printStackTrace();
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		request.setAttribute("AL", al);
		RequestDispatcher rd = request.getRequestDispatcher("payerAll.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
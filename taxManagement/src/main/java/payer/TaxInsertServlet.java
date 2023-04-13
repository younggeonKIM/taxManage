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

@WebServlet("/taxInsert.do")
public class TaxInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaxInsertServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("NUM");
		String name=request.getParameter("NAME");
		String tel=request.getParameter("TEL");
		String addr=request.getParameter("ADDR");
		String padate=request.getParameter("PADATE");
		String dudate=request.getParameter("DUDATE");
		String plac=request.getParameter("PLACE");
		String insert ="insert into payer_tbl_2021 values(?, ?, ?, ?,"+
						"to_date(?, 'YY/MM/DD'), to_date(?, 'YY/MM/DD'), ?)";
		String resu="";
		System.out.println(insert);
		Connection con=null; PreparedStatement pstmt=null; 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");	
			pstmt=con.prepareStatement(insert);
			pstmt.setInt(1, Integer.parseInt(num)); 
			pstmt.setString(2, name); 
			pstmt.setString(3, tel);
			pstmt.setString(4, addr); 
			pstmt.setString(5, padate); 
			pstmt.setString(6, dudate);
			pstmt.setString(7, plac);
			pstmt.executeUpdate();
			resu="OK";
			System.out.println("납세자 정보 등록이 성공");
		}catch(Exception e) {
			resu="NOK";
			System.out.println("납세자 정보 등록이 실패");
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		response.sendRedirect("tax_inser_res.jsp?R="+resu);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String num=request.getParameter("NUM");
		String name=request.getParameter("NAME");
		String tel=request.getParameter("TEL");
		String addr=request.getParameter("ADDR");
		String padate=request.getParameter("PADATE");
		String dudate=request.getParameter("DUDATE");
		String plac=request.getParameter("PLACE");
		String insert ="insert into payer_tbl_2021 values(?, ?, ?, ?,"+
						"to_date(?, 'YY/MM/DD'), to_date(?, 'YY/MM/DD'), ?)";
		String resu="";
		System.out.println(insert);
		Connection con=null; PreparedStatement pstmt=null; 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");	
			pstmt=con.prepareStatement(insert);
			pstmt.setInt(1, Integer.parseInt(num)); 
			pstmt.setString(2, name); 
			pstmt.setString(3, tel);
			pstmt.setString(4, addr); 
			pstmt.setString(5, padate); 
			pstmt.setString(6, dudate);
			pstmt.setString(7, plac);
			pstmt.executeUpdate();
			resu="OK";
			System.out.println("납세자 정보 등록이 성공");
		}catch(Exception e) {
			resu="NOK";
			System.out.println("납세자 정보 등록이 실패");
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		response.sendRedirect("tax_inser_res.jsp?R="+resu);
	}

}

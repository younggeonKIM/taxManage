package payer;

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

@WebServlet("/memInsert.do")
public class MemInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	String inserChekSelect(HttpServletRequest req) {
		String checId=req.getParameter("ID");
		String select="select tax_id from taxmem_tbl2021 where tax_id= ?";
		Connection con=null; PreparedStatement pstmt =null; ResultSet rs=null; String resId="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			pstmt=con.prepareStatement(select);
			pstmt.setString(1, checId);
			rs=pstmt.executeQuery();
			rs.next();
			resId=rs.getString(1);
			System.out.println("회원등록 전 아이디 중복 검사 후 결과는 중복임");
		}catch (Exception e) {
			System.out.println("회원등록 전 아이디 중복 검사 후 결과는 중복이 아님");
		}finally {
			try {
				con.close(); pstmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return resId;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id=request.getParameter("ID"); String pwd= request.getParameter("PWD"); 
		String name=request.getParameter("NAME"); String result=inserChekSelect(request); String resu="";
		System.out.println(result); System.out.println(id);
		if (result.equals(id)) {
			resu="DOUBL";
			
		} else if (! result.equals(id)) {
			String insert="insert into taxmem_tbl2021 values (?, ?, ?)";
			
			System.out.println(insert);
			Connection con=null; PreparedStatement pstmt=null; 
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
				pstmt=con.prepareStatement(insert);
				pstmt.setString(1, id); pstmt.setInt(2, Integer.parseInt(pwd)); pstmt.setString(3, name);
				pstmt.executeUpdate();
				System.out.println("회원 등록에 성공");
				resu="OK";
			}catch(Exception e) {
				System.out.println("회원 등록에 실패");
				resu="NOK";
			}finally {
				try {
					con.close(); pstmt.close();
				}catch (Exception e) {}
			}
		}
			request.setAttribute("RES", resu);
			RequestDispatcher rd=request.getRequestDispatcher("mem_inser_res.jsp");
			rd.forward(request, response);
		
	}
}

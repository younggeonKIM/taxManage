package amount;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

@WebServlet("/amountSelect.do")
public class AmountSelectServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public AmountSelectServlet() {
        super();
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	ArrayList byYearSelect(HttpServletRequest req) {
		String select="";
		String year=req.getParameter("YEAR");
		
		String name=req.getParameter("NAME");
		if (name.equals("")) {
			select ="select par.payername, "+ 
					"amt.* from amount_tbl_2021 amt, "+
					"payer_tbl_2021 par where amt.payerno= "+
					"par.payerno and amt.year_belong like '%"+year+
					"%'";
			
		}else if (! name.equals("")) {
			select="select par.payername, "+ 
					"amt.* from amount_tbl_2021 amt, "+
					"payer_tbl_2021 par where amt.payerno= "+
					"par.payerno and amt.year_belong like '%"+year+
					"%' and par.payername ='"+name+"'";
			if (year.equals("")) {
				select = "select par.payername, "+ 
						"amt.* from amount_tbl_2021 amt, "+
						"payer_tbl_2021 par where amt.payerno= "+
						"par.payerno and "
						+ "par.payername='"+name+"'";
			}
		}
		System.out.println(select);
		Connection con=null; Statement stmt=null; 
		ResultSet rs=null; ArrayList al=new ArrayList(); 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			while (rs.next()) {
				Join joi=new Join();
				joi.setName(rs.getString(1));
				joi.setPayrno(rs.getInt(2));
				joi.setPaynum(rs.getInt(3));
				joi.setStdd(rs.getLong(4));
				joi.setRate(rs.getDouble(5));
				joi.setEstm(rs.getLong(6));
				joi.setDeduc(rs.getLong(7));
				joi.setPayed(rs.getLong(8));
				joi.setYear(rs.getString(9));
				al.add(joi);
				
			}
			//연도 조회가 성공
		}catch (Exception e) {
			
			System.out.println("연도 조회가 실패했습니다.");
			e.printStackTrace();
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return al;
	}
	ArrayList byNumSelect(HttpServletRequest req) {
		String payrnum=req.getParameter("NUM");
		String select ="select * from amount_tbl_2021 where "+
						"payerno = ?";
		Connection con=null; PreparedStatement pstmt=null;
		ResultSet rs=null; ArrayList al=new ArrayList(); 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@127.0.0.1:1521/xe",
							"hr","hr");	
			pstmt=con.prepareStatement(select);
			pstmt.setInt(1, Integer.parseInt(payrnum));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Amount amt=new Amount();
				amt.setPayrnum(rs.getInt(1));
				amt.setPayno(rs.getInt(2));
				amt.setStdd(rs.getLong(3));
				amt.setRate(rs.getDouble(4));
				amt.setEstim(rs.getLong(5));
				amt.setDeduc(rs.getLong(6));
				amt.setPayed(rs.getLong(7));
				amt.setYear(rs.getString(8));
				al.add(amt);
				
			}
			
		}catch(Exception e) {
			System.out.println("번호 조회가 실패");
			e.printStackTrace();
			
		}finally {
			try {con.close(); pstmt.close(); rs.close();}
			catch(Exception e) {}
		}
		
		return al;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("EUC-KR");
			String btn=request.getParameter("btn");
			if(btn.equals("번호로 조회")) {
				ArrayList al=byNumSelect(request);
				request.setAttribute("AL", al);
				
				
			} else if (btn.equals("이름및연도별로 조회")) {
				ArrayList al=byYearSelect(request);
				request.setAttribute("ALL", al);
				
				
			}
			
	    	RequestDispatcher rd= 
					request.getRequestDispatcher("amt_Select.jsp");
	    	rd.forward(request, response);
	    	
			}
		
}

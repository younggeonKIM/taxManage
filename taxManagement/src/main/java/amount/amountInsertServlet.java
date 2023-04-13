package amount;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/amountInsert.do")
public class amountInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public amountInsertServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String payrno = request.getParameter("NUM");
//		String select="select payerno, payno, year_belong from amount_tbl_2021 where payerno = "
//				+ "(select max(payno) from amount_tbl_2021 where payerno=?)";
//				
//		Connection con=null; 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

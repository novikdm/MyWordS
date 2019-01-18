import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "MainPage")
public class MainPage extends HttpServlet {

//    DatabaseConnection databaseConnection = new DatabaseConnection();

    public MainPage() throws SQLException, ClassNotFoundException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        Word word = databaseConnection.getWord("work");
//        String reqTranslate = databaseConnection.translateForCheck(word.getTranslate1(), databaseConnection.getTranslate());
//        request.setAttribute("word", word);
//        request.setAttribute("translate", reqTranslate);

        request.setAttribute("checkedAnswer", 1);
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}

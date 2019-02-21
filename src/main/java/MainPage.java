import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


@WebServlet(name = "MainPage")
public class MainPage extends HttpServlet {


    DatabaseConnection databaseConnection = new DatabaseConnection();

    public MainPage() throws SQLException, ClassNotFoundException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        ArrayList<WordAndTranslate> listOfWords = databaseConnection.getNewTenWordsForCheck(10);
        JSONArray jsonArrayOfWords = new JSONArray();
        for (WordAndTranslate wt:
                listOfWords) {
            JSONObject obj = new JSONObject(wt);

            jsonArrayOfWords.put(obj);
        }
        request.setAttribute("arrayWord", jsonArrayOfWords);

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}

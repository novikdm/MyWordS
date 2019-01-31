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
        Word word = databaseConnection.getWord(databaseConnection.newWord());
        String reqTranslate = databaseConnection.translateForCheck(word.getTranslate1(), databaseConnection.getTranslate());
        request.setAttribute("word", word);
        request.setAttribute("translate", reqTranslate);
        request.setAttribute("checkedAnswer", 1);

        ArrayList<WordAndTranslate> listOfWords = databaseConnection.getNewTenWordsForCheck(3);
        request.setAttribute("listOfWords", listOfWords);

//        {
//            WordAndTranslate wordAndTranslate = listOfWords.get(0);
//
//        }

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}

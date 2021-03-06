import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddWord")
public class AddWord extends HttpServlet {

    DatabaseConnection databaseConnection = new DatabaseConnection();

    public AddWord() throws SQLException, ClassNotFoundException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");




        String word = request.getParameter("word");
        String translate1 = request.getParameter("translate1");
        String translate2 = request.getParameter("translate2");
        try{
             translate2 = translate2.length()>0 ? translate2 : null;
        }
        catch (Exception e){
            translate2 = null;
        }
        Word newWord = new Word(0, word, translate1, translate2);
        String resultOfSavingString = databaseConnection.saveNewWord(newWord);
        JSONObject resultOfSaving = new JSONObject();
        resultOfSaving.put("resultOfSaving", resultOfSavingString);
        request.setAttribute("resultOfSaving", resultOfSaving);


//        ---------------------
//        System.out.println("first");
//        Translate translate = TranslateOptions.getDefaultInstance().getService();
//        System.out.println("second");
//        Translation translation =
//                translate.translate(
//                        word,
//                        TranslateOption.sourceLanguage("en"),
//                        TranslateOption.targetLanguage("ru"));
//        System.out.println("third");
//        String translatedWord = translation.getTranslatedText();
//        System.out.println(translatedWord);
//        -----------------------


        request.getRequestDispatcher("/WEB-INF/pages/addWord.jsp").forward(request, response);

    }//не выходит, пока перевод(((

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject resultOfSaving = new JSONObject();
        resultOfSaving.put("resultOfSaving", false);
        request.setAttribute("resultOfSaving", resultOfSaving);
        request.getRequestDispatcher("/WEB-INF/pages/addWord.jsp").forward(request, response);
    }
}

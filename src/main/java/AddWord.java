import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddWord")
public class AddWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("first");
        String newword = request.getParameter("nword");
        Translate translate = TranslateOptions.getDefaultInstance().getService();
        System.out.println("second");
        Translation translation =
                translate.translate(
                        newword,
                        TranslateOption.sourceLanguage("en"),
                        TranslateOption.targetLanguage("ru"));
        System.out.println("third");
        String translatedWord = translation.getTranslatedText();
        System.out.println(translatedWord);
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

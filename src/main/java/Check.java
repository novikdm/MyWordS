import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Check")
public class Check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word = request.getParameter("word");
        if(request.getParameter("true") != null){
            System.out.println("True");
        }
        else{
            System.out.println("False");
        }



//        Проверка правильности

//        String word =request.getParametr("word");
//        String translate = =request.getParametr("translate");
//        Boolean correctAnswer = false;
//
//                String correctTranslate = DB.getTranslate(word, language);
//
//                if(request.getParametr("true") != Null && correctTranslate.equals(translate)) correctAnswer = true;
//        else if(request.getParametr("false") != Null && !correctTranslate.equals(translate)) correctAnswer = true;

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }


}

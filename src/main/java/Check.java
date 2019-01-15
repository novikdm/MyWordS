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
        String translate = request.getParameter("translate");
        boolean checkedAnswer = false;


        if(request.getParameter("true") != null && word.equals(translate)) checkedAnswer = true;
        else if(request.getParameter("false") != null && !word.equals(translate)) checkedAnswer = true;

//        if(request.getParameter("true") != null){
//            System.out.println("True");
//        }
//        else{
//            System.out.println("False");
//        }



//        Проверка правильности
//String word =request.getParametr("word");
//String translate = =request.getParametr("translate");
//Boolean correctAnswer = false;
//-----
//String correctTranslate = DB.getTranslate(word, language);
//----
//If(request.getParametr("true") != Null && correctTranslate.equals(translate)) correctAnswer = true;
//Else If(request.getParametr("false") != Null && !correctTranslate.equals(translate)) correctAnswer = true;
//
//



        request.setAttribute("checkedAnswer", checkedAnswer);
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }


}

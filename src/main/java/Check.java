import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Check")
public class Check extends HttpServlet {

    DatabaseConnection databaseConnection = new DatabaseConnection();

    public Check() throws SQLException, ClassNotFoundException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Word word = databaseConnection.getWord(request.getParameter("word"));
        String translate = request.getParameter("translate");
        boolean checkedAnswer = false;


        if(request.getParameter("true") != null && word.getTranslate1().equals(translate)) checkedAnswer = true;
        else if(request.getParameter("false") != null && !word.getTranslate1().equals(translate)) checkedAnswer = true;

        Word newWord = databaseConnection.getWord(databaseConnection.newWord());
        String reqTranslate = databaseConnection.translateForCheck(newWord.getTranslate1(), databaseConnection.getTranslate());
        request.setAttribute("word", newWord);
        request.setAttribute("translate", reqTranslate);


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

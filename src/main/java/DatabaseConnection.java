import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {
    private String url = "jdbc:mysql://localhost:3306/testddb?useSSL=false";
    private String login = "root";
    private  String password = "1234";
    private Connection connection;

    public DatabaseConnection() throws SQLException, ClassNotFoundException {
        System.out.println("first---------");
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("second---------");
        this.connection = DriverManager.getConnection(url, login, password);
        System.out.println("third---------");

    }
    public void save(String word, String translate){
        System.out.println("Error");
    }
    public Word getWord(String word){
        List<Word> wordList = new ArrayList<Word>();
        String sqlFindWord = "select * from words where word like '" + word + "';";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sqlFindWord);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String wordFromDB = resultSet.getString(2);
                String translate1 = resultSet.getString(3);
                String translate2 = resultSet.getString(4);

                Word wordSearch = new Word(id, wordFromDB, translate1, translate2);
                wordList.add(wordSearch);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wordList.size()==1 ? wordList.get(0) : null;
    }

    public ArrayList<String> getTranslate(){
        ArrayList<String> translateList = new ArrayList<String>();
        String sqlFindWord = "select translate1 from words";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sqlFindWord);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String translate1 = resultSet.getString(1);
                translateList.add(translate1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return translateList;
    }

    public String translateForCheck(String rightTranslate, ArrayList<String> listOfTranslate){
        String word = "А";
        if(Math.random()>0.5){
            int size = listOfTranslate.size();
            int index = (int) (Math.random() * 3);
            word = listOfTranslate.get(index);
        }
        else word = rightTranslate;

        return word;
    }


}

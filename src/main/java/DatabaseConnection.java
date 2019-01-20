

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {
    private String url = "jdbc:mysql://localhost:3306/testddb?useSSL=false";
    private String login = "root";
    private  String password = "1234";
    private Connection connection;

    public DatabaseConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.connection = DriverManager.getConnection(url, login, password);
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
        String sqlFindWord = "select translate1 from words";
        ArrayList<String> translateList = getListFromSqlQuery(sqlFindWord);
        return translateList;
    }

    public String translateForCheck(String rightTranslate, ArrayList<String> listOfTranslate){
        String word = "А";
        if(Math.random()>0.3){
            int size = listOfTranslate.size();
            int index = (int) (Math.random() * size);
            word = listOfTranslate.get(index);
        }
        else word = rightTranslate;

        return word;
    }

    public String newWord(){
        String sqlquery = "select word from words";
        ArrayList<String> wordList = getListFromSqlQuery(sqlquery);
        return wordList.get((int)(Math.random() * wordList.size()));
    }

    private ArrayList<String> getListFromSqlQuery(String sqlquery){
        ArrayList<String> list = new ArrayList<String>();
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sqlquery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String wordFromResultSet = resultSet.getString(1);
                list.add(wordFromResultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


}
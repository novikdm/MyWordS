

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatabaseConnection {
    private String url = "jdbc:mysql://localhost:3306/testddb?useUnicode=true&characterEncoding=UTF-8";
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
        String sqlFindWord = "select * from words where word like ?";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sqlFindWord);
            preparedStatement.setString(1, word);
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
            System.out.println("------------------");
            System.out.println("Exception in getWord in DatabaseConnection");
            System.out.println(e);
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
            System.out.println("------------------");
            System.out.println("Exception in newWord in DatabaseConnection");
            System.out.println(e);
        }
        return list;
    }



//    --------------------------------------------------

    public ArrayList<WordAndTranslate> getNewTenWordsForCheck(int quantityOfwords){
        ArrayList<WordAndTranslate> newTenWordsForCheck = null;
        ArrayList<Word> wordArray = new ArrayList<Word>();
        ArrayList<String> translates = new ArrayList<String>();
        String sqlquery = "select * from words";

        try{
            PreparedStatement preparedStatement = this.connection.prepareStatement(sqlquery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                wordArray.add(new Word(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4)
                ));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("------------------");
            System.out.println("Exception in getNewTenWordsForCheck in DatabaseConnection");
            System.out.println(e);
        }
        if(!wordArray.isEmpty()){
            newTenWordsForCheck = new ArrayList<WordAndTranslate>();
            for (int i =0; i<quantityOfwords; i++){
                int x = (int)(Math.random()*wordArray.size());
                int y = (int)(Math.random()*wordArray.size());
                int z = wordArray.size()/2;
                newTenWordsForCheck.
                        add(
                                new WordAndTranslate(
                                        wordArray.get(x),
                                        y>=z ? selectRightTranslate(wordArray.get(x)) : wordArray.get(y).getTranslate1()
                                )
                        );
            }
        }

        return newTenWordsForCheck;
    }
    private String selectRightTranslate(Word word){
        String resultTranslate = word.getTranslate1();
        if(Math.random()>0.5 && word.getTranslate2() != null) resultTranslate = word.getTranslate2();
        return resultTranslate;
    }

    public String saveNewWord(Word word) {
        String result = "Error";
        String engWord = word.getWord();
        String translate1 = word.getTranslate1();
        String translate2 = word.getTranslate2();
        Word newWord = getWord(engWord);
        String sqlQuery = "INSERT INTO testddb.words (word, translate1, translate2) VALUES (?, ?, ?)";
        if(newWord == null){
            try{
                PreparedStatement preparedStatement = this.connection.prepareStatement(sqlQuery);
                preparedStatement.setString(1, engWord);
                preparedStatement.setString(2, translate1);
                preparedStatement.setString(3, translate2);
                preparedStatement.executeUpdate();
                result = "Word: " + engWord + " save successfully!";
            }
            catch (SQLException e){
                System.out.println("------------------");
                System.out.println("Exception in saveNewWord in DatabaseConnection");
                System.out.println(e);
            }
        }
        else{
            result = "Word: " + engWord + " already exist!";
        }
        return result;
    }


}

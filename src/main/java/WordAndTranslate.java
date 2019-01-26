public class WordAndTranslate extends Word{
    private String translateForCheck;

    public WordAndTranslate(Word word, String translateForCheck) {
        super(word.getId(), word.getWord(), word.getTranslate1(), word.getTranslate2());
        this.translateForCheck = translateForCheck;
    }


    public String getTranslateForCheck() {
        return translateForCheck;
    }

    public void set(Word word, String translateForCheck){
        if(word != null){
            super.setId(word.getId());
            super.setWord (word.getWord());
            super.setTranslate1 (word.getTranslate1());
            super.setTranslate2 (word.getTranslate2());
        }
        else{
            super.setId(0);
            super.setWord("xxx");
            super.setTranslate1("ххх");
            super.setTranslate2("ххх");
        }
        this.translateForCheck =
                translateForCheck != null ?
                        translateForCheck :
                        "ххх";
    }
    public void set(int id, String word, String translate1, String translate2, String translateForCheck){
        if(word != null){
            super.setId(id);
            super.setWord(word);
            super.setTranslate1(translate1);
            super.setTranslate2(translate2);
        }
        else{
            super.setId(0);
            super.setWord("xxx");
            super.setTranslate1("ххх");
            super.setTranslate2("ххх");
        }
        this.translateForCheck =
                translateForCheck != null ?
                        translateForCheck :
                        "ххх";
    }
}

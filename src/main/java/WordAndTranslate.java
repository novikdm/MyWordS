public class WordAndTranslate {
    private Word word;
    private String translateForCheck;

    public WordAndTranslate(Word word, String translateForCheck) {
        this.word = word;
        this.translateForCheck = translateForCheck;
    }

    public Word getWord() {
        return word;
    }

    public String getTranslateForCheck() {
        return translateForCheck;
    }

    public void set(Word word, String translateForCheck){
        this.word =
                word != null ?
                        word :
                        new Word(0, "xxx", "ххх", "ххх") ;
        this.translateForCheck =
                translateForCheck != null ?
                        translateForCheck :
                        "ххх";
    }

}

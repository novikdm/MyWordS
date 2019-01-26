
public class Word {
    private int id;
    private String word;
    private String translate1;
    private String translate2;

    public Word(int id, String word, String translate1, String translate2) {
        this.id = id;
        this.word = word;
        this.translate1 = translate1;
        this.translate2 = translate2;
    }

    public Word(int id, String word, String translate1) {
        this.id = id;
        this.word = word;
        this.translate1 = translate1;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getTranslate1() {
        return translate1;
    }

    public void setTranslate1(String translate1) {
        this.translate1 = translate1;
    }

    public String getTranslate2() {
        return translate2;
    }

    public void setTranslate2(String translate2) {
        this.translate2 = translate2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Word{" +
                "word='" + word + '\'' +
                ", translate1='" + translate1 + '\'' +
                ", translate2='" + translate2 + '\'' +
                '}';
    }
}

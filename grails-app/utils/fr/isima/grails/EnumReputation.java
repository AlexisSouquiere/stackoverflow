package fr.isima.grails;

/**
 * Created by Cedric on 15/02/2016.
 */
public enum EnumReputation {
    QUESTION(3),
    ANSWER(5),
    COMMENT(1);

    final int score;

    private EnumReputation(int score) {
        this.score = score;
    }
}

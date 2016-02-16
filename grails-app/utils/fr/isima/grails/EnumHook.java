package fr.isima.grails;

/**
 * Created by Cedric on 16/02/2016.
 */
public enum EnumHook {
    //On the creation of a question
    QUESTION_CREATED(1),
    //On the creation of an answer
    ANSWER_CREATED(2);

    final int id;

    private EnumHook(int id) {
        this.id = id;
    }
}

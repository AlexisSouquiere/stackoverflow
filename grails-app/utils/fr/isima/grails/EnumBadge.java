package fr.isima.grails;

/**
 * Created by Cedric on 15/02/2016.
 */
public enum EnumBadge {
    FIRST_QUESTION(1),
    FIRST_ANSWER(2);

    final int id;

    private EnumBadge(int id) {
        this.id = id;
    }
}

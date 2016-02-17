//var casper = require('casper').create();

config.answerForm = {
    "description": "My answer",
};

/****************************************
 *          Create a question           *
 ****************************************/

casper.test.begin('Answer to a question', 5, function(test){
    test.comment('... Loading ' + config.routes.question + '...');
    casper.start(config.routes.question);
    casper.then(function () {
        test.assertHttpStatus(200, config.siteName + ' is up');
    });

    //Clic on the element first element of the questions list
    casper.then(function(){
        test.assertExists('.table tr');
        this.click('.table tr:first-child .question-link');
    });
    test.comment('... Clicking on the first question ...');

    // Click on the log in link
    casper.then(function () {
        test.assertUrlMatch(this.getCurrentUrl(), config.routes.questionShow);
        test.assertExists('.log-in-link');
        casper.capture('screenshots/createQuestion/1-topQuestion.png');
        this.click('.log-in-link');
    });

    // Fill log in form
    casper.then(function(){
        test.comment('... Log in ...');
        this.fill('form#loginForm', config.loginForm, false);
        casper.capture('screenshots/createQuestion/2-logIn.png');
    });

    casper.then(function(){
        this.click('#submit');
    });

    //Currently, the user is redirected to the root page. Must be changed

    //TO REMOVE
    casper.then(function(){
        casper.capture('screenshots/createQuestion/3-afterLogIn.png');
        test.comment('... Btn top question ...');
        this.click('.btn-top-question');
    });

    casper.then(function(){
        casper.capture('screenshots/createQuestion/4-topQuestion.png');
        test.comment('... Clicking on the first question ...');
        this.click('.table tr:first-child .question-link');
    });
    // -- TO REMOVE

    casper.then(function(){
        casper.capture('screenshots/createQuestion/5-question.png');
    });

    // Fill the answer form
    casper.then(function(){
        this.fill('form.answerForm', config.answerForm, false);
    });

    // Submit answer form
    casper.then(function(){
        this.click('.btn-save-answer');
    });

    // Assert that the answer has been created
    casper.then(function(){
        test.assertExists('.alert-success');
        test.comment('... Answer created ...');
        casper.capture('screenshots/createQuestion/6-answerCreated.png');
    });

    // Run all the tests defined above.
    casper.run(function(){
        test.done();
    });
});
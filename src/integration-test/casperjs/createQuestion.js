//var casper = require('casper').create();

config.questionForm = {
    "title": "Create question test",
    "description": "Lorem ipsum",
};

/****************************************
 *          Create a question           *
 ****************************************/

casper.test.begin('Create a question', 4, function(test){
    test.comment('... Loading ' + config.routes.question + '...');
    casper.start(config.routes.question);
    casper.then(function () {
        test.assertHttpStatus(200, config.siteName + ' is up');
    });

    //Clic on the element "Ask Question" in the header bar
    casper.then(function(){
        this.click('.btn-ask-question');
    });
    test.comment('... Clicking the Ask Question button...');

    // Fill log in form
    casper.then(function(){
        test.comment('... Log in ...');
        this.fill('form#loginForm', config.loginForm, false);
        casper.capture('screenshots/createQuestion/1-logIn.png');
    });

    casper.then(function(){
        this.click('#submit');
    });

    casper.then(function(){
        casper.capture('screenshots/createQuestion/2-questionForm.png');
        test.assertUrlMatch(this.getCurrentUrl(), config.routes.questionCreate);
    });

    // Fill the question form
    casper.then(function(){
        this.fill('form.form-question-create', config.questionForm, false);
    });

    // Submit question form
    casper.then(function(){
        this.click('.btn-save-question');
    });

    // Assert that the question has been created
    casper.then(function(){
        test.assertExists('.alert-success');
        test.assertUrlMatch(this.getCurrentUrl(), config.routes.questionShow);
        test.comment('... Question created ...');
        casper.capture('screenshots/createQuestion/3-questionCreated.png');
    });

    // Run all the tests defined above.
    casper.run(function(){
        test.done();
    });
});
//var casper = require('casper').create();


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
    casper.wait(500, function(){
        this.fill('form#loginForm', config.loginForm, false);
    });

    // Submit log in form
    casper.then(function(){
        this.click('#submit');
    });

    // Fill question form
    casper.wait(500, function(){
        test.assertUrlMatch(this.getCurrentUrl(), config.routes.questionCreate);
        test.comment('Create question form loaded');

        this.fill('form.form-question-create', {
            'title':        'Create question test',
        }, false);
        this.sendKeys('#title', casper.page.event.key.Tab , {keepFocus: true});
        this.sendKeys('#title', casper.page.event.key.Tab , {keepFocus: true});
        this.click('.btn-save-question');
    });

    casper.then(function () {
        test.assertHttpStatus(200, 'Question created');
    });

    casper.then(function () {
        test.assertUrlMatch(this.getCurrentUrl(), config.routes.questionShow);
        //test.assertExists('.alert-success');
    });

    casper.capture('screenshots/createQuestion.png');

    // Run all the tests defined above.
    casper.run(function(){
        test.done();
    });
});
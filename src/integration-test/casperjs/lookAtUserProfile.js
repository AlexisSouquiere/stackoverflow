//var casper = require('casper').create();

/****************************************
 *       Look at user profile           *
 ****************************************/

casper.test.begin('Look at user profile', 3, function(test){
    test.comment('... Loading ' + config.routes.question + '...');
    casper.start(config.routes.question);
    casper.then(function () {
        test.assertHttpStatus(200, config.siteName + ' is up');
    });

    //Clic on the Log In link
    casper.then(function(){
        test.assertExists('.login-link');
        this.click('.login-link');
    });
    test.comment('... Clicking on the Log In link ...');

    // Fill log in form
    casper.then(function(){
        test.comment('... Log in ...');
        this.fill('form#loginForm', config.loginForm, false);
        casper.capture('screenshots/lookAtUserProfile/1-logIn.png');
    });

    casper.then(function(){
        this.click('#submit');
    });

    casper.then(function(){
        casper.capture('screenshots/lookAtUserProfile/2-userLogged.png');
        test.comment('... Go to his profile ...');
        this.click('.my-profile');
    });

    casper.then(function(){
        casper.capture('screenshots/lookAtUserProfile/3-userProfile.png');
    });

    // Assertions
    casper.then(function(){
        test.assertEvalEquals(function() {
            return __utils__.findOne('h1').textContent;
        }, config.loginForm.username);
    });

    // Run all the tests defined above.
    casper.run(function(){
        test.done();
    });
});
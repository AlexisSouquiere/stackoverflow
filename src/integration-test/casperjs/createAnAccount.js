//var casper = require('casper').create();

config.registration = {
    "username": "jdoe",
    "email"   : "john.doe@mail.com",
    "password": "jdoe",
    "password2": "jdoe",
};

/****************************************
 *         Create an account            *
 ****************************************/

casper.test.begin('Create an account', 2, function(test){
    test.comment('... Loading ' + config.routes.question + '...');
    casper.start(config.routes.question);
    casper.then(function () {
        test.assertHttpStatus(200, config.siteName + ' is up');
    });

    //Clic on the Register link
    casper.then(function(){
        test.assertExists('.create-account');
        this.click('.create-account');
    });
    test.comment('... Clicking on the Register link ...');

    // Fill log in form
    casper.then(function(){
        test.comment('... Registration ...');
        this.fill('form#registerForm', config.registration, false);
        casper.capture('screenshots/createAnAccount/1-register.png');
    });

    casper.then(function(){
        this.click('#submit');
    });

    casper.then(function(){
        casper.capture('screenshots/createAnAccount/2-accountCreated.png');
    });

    // Run all the tests defined above.
    casper.run(function(){
        test.done();
    });
});
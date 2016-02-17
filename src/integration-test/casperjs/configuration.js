/**
 * Created by Cedric on 16/02/2016.
 */
/****************************************
 *             Configuration            *
 ****************************************/

var config = {
    baseUrl: 'http://localhost:8080',
    siteName : 'StackOverflow',
};

config.loginForm = {
    "username": "admin",
    "password": "admin",
};

config.routes = {
    question: config.baseUrl + '/question',
    questionCreate: config.baseUrl + '/question/create',
    questionShow: config.baseUrl + '/question/show/*',
}


/****************************************
 *             Casper Options           *
 ****************************************/

casper.options.viewportSize = { width: 1920, height: 1080 };
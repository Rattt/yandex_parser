'use strict';
var args = require('system').args;
var parseUrl = args[1];
var page = require('webpage').create();
page.settings.loadImages = false;
page.settings.resourceTimeout = 20000;
page.settings.userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36';
page.open(parseUrl, function (status) {
    page.viewportSize = { width: 1024, height: 900 };
    page.injectJs('http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js');
    if (status !== "success") {
        console.log("Unable to access network");
        phantom.exit();
    } else {
        setTimeout(function() {
            console.log(page.content);
            phantom.exit();
        }, 2000);
    }
});

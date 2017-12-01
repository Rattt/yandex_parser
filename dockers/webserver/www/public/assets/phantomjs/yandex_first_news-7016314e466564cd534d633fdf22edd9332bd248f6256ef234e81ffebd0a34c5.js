'use strict';
var page = require('webpage').create();
page.settings.loadImages = false;
page.settings.resourceTimeout = 20000;
page.settings.userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36';

page.open('https://yandex.ru/', function (status) {
    page.viewportSize = { width: 1024, height: 900 };
    page.injectJs('http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js');
    if (status !== "success") {
        console.log("Unable to access network");
        phantom.exit();
    } else {
        setTimeout(function() {
            var news = page.evaluate(function() {
                var _news = {};
                $('.b-news-list').find('li').each(function(i, value) {
                    var link = $(this).find('a');
                    var title = $.trim(link.text());
                    var url = $.trim(link.attr('href'));
                    _news[i] = {
                        title: title, 
                        url: url
                    };
                });
                return _news;
            });
            console.log(JSON.stringify(news));
            phantom.exit();
        }, 3000);
    }
});

page.onInitialized = function(){
    page.evaluate(function(){
        var isFunction = function(o) {
          return typeof o == 'function';
        };
        var bind,
          slice = [].slice,
          proto = Function.prototype,
          featureMap;
        featureMap = {
          'function-bind': 'bind'
        };
        function has(feature) {
          var prop = featureMap[feature];
          return isFunction(proto[prop]);
        }
        if (!has('function-bind')) {
          bind = function bind(obj) {
            var args = slice.call(arguments, 1),
              self = this,
              nop = function() {
              },
              bound = function() {
                return self.apply(this instanceof nop ? this : (obj || {}), args.concat(slice.call(arguments)));
              };
            nop.prototype = this.prototype || {};
            bound.prototype = new nop();
            return bound;
          };
          proto.bind = bind;
        }
    });
};

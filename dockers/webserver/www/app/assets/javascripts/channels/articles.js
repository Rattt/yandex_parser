
App.articles = App.cable.subscriptions.create('ArticlesChannel', {
    received: function(response) {
        var data = JSON.parse(response)
        $("h1").text(data.title);
        if (data.is_yandex) {
            $("p.ya").removeClass("hidden");
            $("p.no_ya").addClass("hidden");
        } else {
            $("p.no_ya").removeClass("hidden");
            $("p.ya").addClass("hidden");
        }

        $("h2").text(data.title);
        $("p.article_text").text(data.description);
    }
});
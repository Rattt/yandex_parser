# Yandex News
[![Code Climate](https://codeclimate.com/github/Rattt/yandex_parser.png)](https://codeclimate.com/github/Rattt/yandex_parser)
[![Build Status](https://travis-ci.org/Rattt/yandex_parser.svg?branch=master)](https://travis-ci.org/Rattt/yandex_parser) 

## Description
Реализуйте web-приложение (Rails проект), которое состоит из двух страниц: / и /admin. На странице / отображается первая главная новость из ленты Яндекса. Новость выводится в свободном виде, содержит дату, заголовок и аннотацию. Приложение фоновым скриптом периодически обновляет текущую главную новость. При обновлении главной новости в приложении она обновляется на всех открытых в текущий момент страницах /.
На странице /admin находится форма для ввода авторской новости. На форме расположены поле для ввода заголовка, поле для ввода аннотации, поле для ввода даты-времени и сабмит. Форма содержит разумные валидации. При сабмите авторская новость становится главной до наступления заданного времени. Т.е. до этого времени прочие новости игнорируются, вместо них на страницах / выводится авторская новость. Временем создания авторской новости считается время сабмита формы. Если существует действующая авторская новость, страница /admin загружается с уже заполненными полями. При сабмите авторской новости она, конечно же, сразу обновляется на всех открытых страницах /. При истечении времени действия авторской новости на всех страницах начинает отображаться актуальная на данный момент главная новость из ленты Яндекса.

Web-приложение должно корректно работать в браузерах IE и Chrome последних версий. Код должен быть покрыт тестами. Плюсом будет использование какого-либо JS-фреймворка на клиентской стороне, аккуратный внешний вид приложения.
Все необходимое для локального запуска приложения должно быть оформлено в виде Procfile-а для Foreman или в виде Dockerfile-а.


## Installation
* `docker-compose build`
* `docker-compose up -d`
* `docker exec testwork_web_1  bash -l -c "bundle exec rake db:migrate"`
* `docker exec testwork_web_1  bash -l -c "RAILS_ENV=test && bundle exec rspec spec"`

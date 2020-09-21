# URL Shortner Application

URL shortner application converts lengthy web URL to a short URL, which on accessing re-directs to original URL.

* System dependencies
  * [MongoDB 4.4](https://docs.mongodb.com/manual/administration/install-community "MongoDB")
  * ruby-2.7.1
  * rails 6.0.3.3
  * bundler 2.1.4

* How to run the test suite

```shell
bundle exec rspec
```

* Deployment instructions
  * Clone [repository](https://github.com/vivek099/url_shortner.git) and switch to branch **reach-24**
  * Install all system dependencies
  * bundle install
  * rails s

* Accessing application
  * Short URL can be created by accessing: http://127.0.0.1:3000
  * Application stats can be checked at: http://127.0.0.1:3000/stats

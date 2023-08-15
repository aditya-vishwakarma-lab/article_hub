## ArticleHub 

 An application to interact with articles, built with Ruby on Rails and HTML.





## Project Screen Shot(s)

![articles](https://github.com/aditya-vishwakarma-lab/article_hub/assets/86044019/9185668e-6a3a-4cbc-9211-8748dd28eadd)

![show_article](https://github.com/aditya-vishwakarma-lab/article_hub/assets/86044019/62e1833d-6619-4727-8261-022a1c98a6eb)



## Installation and Setup Instructions
 

Clone down this repository. You will need `ruby 3.1.3` installed globally on your machine.  

Installation:

`gem install rails -v 7.0.6`  

`bundle install`

To Start Server:

`rails start`

To Start Sidekiq server:

run `sidekiq` command in separate terminal tab

To Visit App:

`localhost:3000`  

## Reflection

This was a 2 week long project built during a job application. Project goals included showcasing my knowledge of Ruby on Rails technology and familiarizing myself with it.  

Originally I wanted to build an application that allowed users to perfomr CRUD operations on articles. I started this process by using the `rails new article_hub` boilerplate, then adding MVC for other models later.  

One of the main challenges I ran into was Authorisation and Authentication of user. This lead me to spend a few days on Devise and CanCanCan. Later I defined different devise models and abilities for all devise models to restrict controller method restrictions on users.

At the end of the day, the technologies implemented in this project are Ruby, Ruby on Rails and a significant amount of HTML and Bootstrap. I chose to use the default `HTML` templates for all webpages to minimize time spent on frontend development and instead focus on backend development accoding to the role I applied for. 

<h1>Manager Gitub Information</h1>

Features and Requirements:

A Rails application (backend only) that keeps track of the stars that a given user has in its Github repositories. This application must have an endpoint that receives a Github username and in the background searches the user's public repositories using Github's REST API (https://docs.github.com/en/rest/overview/resources-in-the-rest-api) and saves in a database their repository name and how many stars it has. You must use Sidekiq and we expect some tests using RSpec.

Dependencies

* Docker
* Docker-compose

*Build your enviorment*

```
docker-compose build
```

*Create your Data base*

```
docker-compose run web rake db:create db:migrate
```

*Run the project*

```
docker-compose up
```

http://0.0.0.0:3000

*Testing the project*

```
docker-compose run web rake spec PGUSER=postgres RAILS_ENV=test
```

*Colection Postman*

https://planetary-water-696254.postman.co/workspace/Projetos~db86da9f-6551-4319-b5d7-600686c7a370/collection/1158207-a6501abb-9894-4e6b-a5cf-606e21130e95?action=share&creator=1158207

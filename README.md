# ReadMe

This is an example application moving from working on rails monolith applications to a hexagonal architecture.
Is build with `Sinatra`, `Sequel`, `SQLite`, `Bunny`and `RSpec` for the testing.
This application assume you have `RabbitMQ` install in your computer.

## Setup
`brew install rabbitmq`
`bundle install`

## Run Migrations.
`sequel -m db/migrations sqlite://player_management.db`

## Start Server.
`shotgun --port=3000 server.rb`

## Endpoints
#### Teams
-   'GET /teams'
-   'POST /teams'
-   'GET /teams/:id'
-   'PATCH /teams/:id'
-   'DELETE /teams/:id'
-   'GET /teams/:id/players'
-   'GET /teams/:id/players?position=POSITION'
___________________________________________________________
#### Players
-   'GET ‘/players'
-   'GET /players?position=POSITION'
-   'POST /teams/:team_id/players'
-   'GET /teams/:team_id/players?position=POSITION'
-   'GET ‘/players/:id'
-   'PATCH /teams/:team_id/players/:id'
-   'DELETE /players/:id'
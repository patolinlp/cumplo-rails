![Cumplo Logo](/app/assets/images/logo.png)
# Tarea Cumplo | Patricio Valderrama

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Características

Esta tarea cuenta con las siguientes características:

* La pantalla principal cuenta con un filtro de rango de fechas.

* Al filtrar las fechas se obtienen datos como: UF, Dolar y TMC, historicamente entre las fechas.

* Los datos de la UF y el Dolar se muestran históricamente y gráficamente.

* Los datos de la TMC son mostrados en un gráfico de multilineas para los distintos tipos.

* Además se adicionan gráficos para los distintos tipos para su mejor entendimiento.

* Nuevamente se puede filtrar entre dos rangos de fecha, para obtener los datos nuevamente.

## Herramientas

Para esta tarea se utilizaron las siguientes herramientas:

* Ruby 2.4.1

* Rails 5.1.4

* Mysql 5.7.21

* Gráficos: Chartkick Gem

## Configuración

Para utilizar el proyecto deben clonarlo y después configurar la base de datos en config/database.yml:

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: patolinlp18
  socket: /var/run/mysqld/mysqld.sock

development:
  <<: *default
  database: rails_dev
```

después correr los siguientes comandos para crear y migrar la base de datos 

```
  rake db:create
  rake db:migrate
```






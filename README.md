# Palmtree
Ruby on Rails boilerplate project for JSON RESTful APIs  based on Rails 7, Ruby 3.0.1 and PostgreSQL database. It provides a web login for Admins via Devise gem, and a API authentication via JWT.
---
## Endpoints
### Login
You can login using an existing email and password. The token in the response is going to authenticate the user on future requests.
##### Example request:
#
```url
POST - localhost:3000/api/v1/login?email=user@mail.com&password=12345678
```
##### Example response:
#
```json
{
    "user": {
        "id": 1,
        "email": "user@mail.com",
        "created_at": "2021-11-15T01:37:34.476Z",
        "updated_at": "2021-11-15T01:37:34.476Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjQyMjk1NTU1fQ.w8uzNjNTPEnNEBALGxYXPgXofcTM4z90yI52Ii-C4NA"
}
```
#
---
### Sign Up
You can create new users. If the email is already taken, it will return a 422.
##### Example request:
#
```
POST - localhost:3000/api/v1/register?email=new_user@mail.comm&password=12345678
```
##### Example response:
#
```json
{
    "user": {
        "id": 2,
        "email": "new_user@mail.com",
        "created_at": "2021-11-15T01:37:34.476Z",
        "updated_at": "2021-11-15T01:37:34.476Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjQyMjk1NTU1fQ.w8uzNjNTPEnNEBALGxYXPgXofcTM4z90yI52Ii-C4NA"
}
```
#
---
### Products
This endpoint can be used to test the user authentication. Without the Bearer Token, you can not get the data.
##### Example Request:
#
```
GET - localhost:3000/api/v1/products
```
#
---
## Setup
- Clone the repo, or click the "Use this template" button.
- Install ruby 3.0.1 and postgreSQL
 - Create a .env file on the root of the project. In that file, define the DATABASE_URL that will be used by the database.yml
 It should look like this:
   ```env
   DATABASE_URL=postgres://{user}:{password}@{hostname}:{port}/{database-name}
   ```
   Change _user, password, hostname, port_ and _database-name_ for your values. Port is usually 5432.
  - Run ```rails db:create``` and ``` rails db:migrate```.
  - Run ``` rails s ```
You can now access localhost:3000. As the web is only for admins, registration is not allowed. You can login with the admin credentials defined in the seeds file. For that, you should run ```rails db:seed```
If bootstrap isn't loading properly, you may need to install webpacker, to do this, run ```rails webpacker:install```. You can delete the generated files.
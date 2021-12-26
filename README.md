# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Rest API for courses along with tutors

Clone project:
```
git clone git@github.com:amrata3003/rest_api.git
```
git pull origin master
```
bundle install

rails db:create
rails db:migrate

# Rest API Endpoints

GET Request - 
 GET http://localhost:3000/api/v1/courses
 Request Headers : Content-Type application/json

POST Request - 
  POST http://localhost:3000/api/v1/courses
  Request Headers : Content-Type application/json
  Body: 
      {
        "course": {
          "name": "course1",
          "credit": "6",
          "tutors_attributes": [
            {
              "first_name": "Tutor",
              "last_name": "First",
              "email": "Tutor1@yopmail.com"
            },
            {
              "first_name": "Tutor",
              "last_name": "Second",
              "email": "Tutor2@yopmail.com"
            }
          ]
        }
      }
#
#
### To Check Test coverage of rspec test cases
RUN rspec

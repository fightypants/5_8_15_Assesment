## Synopsis

This project sets out to create a Hair Salon CRM tool a. The following Ruby Gems were used.



gem('rspec')
gem('capybara')
gem('pry')
gem('sinatra')
gem('sinatra-contrib')
gem('pg')


## Motivation

The purpose of this project is to learn how to code at Epicodus!

## Installation
To install application:
Step 1 clone onto desktop from:
https://github.com/fightypants/5_8_15_Assesment.git

Step 2 create the following Database:
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
train_system=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylists_id int);
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

Step 3 run bundle install to create Gemfile.lock (ensure you the gems from the Synopsis installed before bundling)



## Tests

Run Rspec in bash


## Contributors

Kha le

## License

The MIT License (MIT)

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

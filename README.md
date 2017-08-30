# Jungle

A mini e-commerce application built with Rails

!["Screenshot of homepage"](https://github.com/liujohnson118/jungle-rails/blob/master/docs/homepage.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Technologies Used
* Rails 4.2
* PSQL
* Ruby, Javascript, CSS, SCSS, HTML, ERB
* RSpec testing
* Stripe payment API
* Automatic email

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Functionalities

#### Users (Shoppers)
1. The user can create an account using his/her first and last names, email address, and a password. The password is stored after being hashed.
2. The user can login to Jungle after creating an account.
3.
# Gringo Trail Blog

In 2016 I quit my job to backpack South America for three months. I built a
blog in rails to share my experiences with family and friends. I used this as an
opportunity to work with new gems such as Administrate. Right now some of the
pieces are hard-coded to data that is specific to me/my trip, such as the name
of the blog and the 'plan' section on the maps page, but this code could
theoretically be reused for another travel blog.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

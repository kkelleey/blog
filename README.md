# Gringo Trail Blog

In 2016 I quit my job to backpack South America for three months. I built a
blog in rails to share my experiences with family and friends. I used this as an
opportunity to work with new gems such as Administrate.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

Next, customize the site name and map configurations by updating
`config/site_information.yml`. [This site] is a good resource for finding the
latitude and longitude for the center of your map. Note that you'll need to
restart your server each time you change your config file in order to see the
changes.

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local
[This site]: http://mondeca.com/index.php/en/any-place-en

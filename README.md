# Blog Oudard Org

Here is a backup of my blog you'll be able to read [here](http://blog.oudard.org/ "Nicolas Oudard's blog")

## Run it locally

Define the DB password in .env file at the root of the project

  WORDPRESS_DB_PASSWORD="This is my password"
  MYSQL_ROOT_PASSWORD="This is my password"

To make it run locally, just run the docker-compose

  > docker-compose up -d

Then access it from your browser

http://localhost:8080

## Save the blog

To get the source, launch

  > ./backup.sh

the project was updated, you just need to push this new version

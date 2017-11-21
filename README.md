## Axes And Shoes

Easy way to rent shoes !

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
```
* Web server with URL rewriting
* PHP 7.0 or newer
* MySQL/MariaDB database containing a 'axesandshoes' database with the .sql file loaded in it 
* Composer globaly installed
```
### Installing and Running

In order to run the project, use he following commands

```
* composer install
* php -S 0.0.0.0:8081 -t public/
```

You'll need to go over the installation and insert the database information according to whatever you're using (database credentials mostly), and don't forget to enter 'axesandshoes' as the database name after creating it.

Afterwards, you need to import the .sql file at the root of the project in your axesandshoes database. You'll then have a testing account with a login 'elshobokshy' and a password '111111'.

Then, a server is running on your localhost:8081


## Built With

* [Awurth](https://github.com/awurth/Slim) - The slim php framework used

# Creators

* [Islam ELSHOBOKSHY](https://github.com/elshobokshy)
* [Louis CUNY](https://github.com/louis-cuny)
* [Alan DEMARBRE](https://github.com/demarbre1u)

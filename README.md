### Oil Trader

This is a project I have decided to complete in order to use my skills I have attained from Makers Academy. I enjoy coding the back-end hence have decided to make a trading game to be played in the command line. I will be putting this onto a website using sinatra and heroku in due course. But currently this code showcases some of what I can do with plane old Ruby and Rspec.

The game starts a user (or baron) with capital of 10,000 with which they can buy and sell oil. In order to buy or sell they must first do a price check to see how much the exchange in selling/buying for. The  using theis quoted_price they can execute the order. Users can only check prices 20 times at which point the game is over. All remaining barrels will be sold at cost. The aim of the game is to make as much money as possible.


### Tech

Ruby
Rspec


### How to use

Clone this repo:
```sh
$ git clone https://github.com/jamesascarter/OilTrader.git
```

Change into the directory:
```sh
$ cd OilTrader
```

To run the rspec tests:
```sh
$ rspec
```



To run the code:
```sh
$ irb
$ require './runner'
$ exchange = Exchange.new
$ James = Baron.new('James')
    
```

### Improvements currently working on:

* Add market crash event. Or just amendments to supply which will affect market prices.
* Allow user to choose number of barrels it buys. Currently it must buy all barrels at the reuired price.
* Use sinatra/heroku to make a web app
* Use database postgresql to store scores/player names.



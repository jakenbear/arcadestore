#INCLUDE CLASSES
class Initshop
require './store.rb'
require './location.rb'
require './product.rb'
require 'yaml/store'

storedb = YAML::Store.new "db.store"
productdb = YAML::Store.new "db.product"
locationdb = YAML::Store.new "db.location"

#Store Object creation
store = Store.new(1,"JAKE'S ARCADE GAMES AND STUFF", "Your number 1 source for classic video game machines.")

#Location Object creation
location1 = Location.new(1,"The Cabinet Farm","Toroto")
location2 = Location.new(2,"Classic Retro Works","New York")
location3 = Location.new(3,"Gamerama and Phone repair","Calgary")

#Product creation
prod1 = Product.new(1,"BURGER TIME",250,"Match the hamburgers to save the world.")
prod2 = Product.new(2,"GALAGA",375,"Space Aliens are coming for you.")
prod3 = Product.new(3,"PAPER BOY",425,"Deliver all of the newspapers")
prod4 = Product.new(4,"DIG DUG",300,"The classic digging classic.")
prod5 = Product.new(5,"DONKEY KONG",750,"Can you reach the top?")

store.add_location(location1.id)
store.add_location(location2.id)
store.add_location(location3.id)

#STORE DB WRITE
storedb.transaction do
  storedb["#{store.id}"] = store
end

#LOCATION DB WRITE
locationdb.transaction do
  locationdb["#{location1.id}"] = location1
  locationdb["#{location2.id}"] = location2
  locationdb["#{location3.id}"] = location3
end

#PRODUCT DB WRITE
productdb.transaction do
  productdb["#{prod1.id}"] = prod1
  productdb["#{prod2.id}"] = prod2
  productdb["#{prod3.id}"] = prod3
  productdb["#{prod4.id}"] = prod4
  productdb["#{prod5.id}"] = prod5
end

end #Init shop

#INCLUDE CLASSES
class Runshop
require './store.rb'
require './location.rb'
require './product.rb'
require './utils.rb'
require 'yaml/store'

# Initialize the store
stores= []
products = []
locations = []

#Load store from database files
Utils::load_store_database(stores,products,locations)
#PRINT OUT stores
Utils::fancy_store_print(stores)
Utils::fancy_products_print(products)
Utils::fancy_locations_print(locations)

#PERFORM OPERATIONS ON STORE - BEGIN
#locations[0][1].add_product_db(1,25)
locations[0][1].add_product_db(2,10)


#PERFORM OPERATIONS ON STORE - END

#print_db's
Utils::print_db(stores)
Utils::print_db(locations)
Utils::print_db(products)

#Write to Save file
Utils::save_store_database(stores,products,locations)

end #Run store class

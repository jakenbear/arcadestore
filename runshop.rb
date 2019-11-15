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

stores[0][1].add_location(1)
stores[0][1].add_location(2)
stores[0][1].add_location(3)
locations[0][1].add_product(1,8)
locations[0][1].add_product(2,10)
locations[1][1].add_product(2,7)
locations[1][1].add_product(3,12)
locations[1][1].add_product(4,20)
locations[2][1].add_product(5,2)
locations[2][1].add_product(6,3)

locations[0][1].remove_product(2,5)
locations[0][1].remove_product(2,50000)
frog = locations[0][1].get_qauntity(1)

#PERFORM OPERATIONS ON STORE - END
# Get a Location Specific Quantity for one product.
# location.get_qauntity(productID)

# Display Store INFO
# store.display_info

# Show all Inventory in a Store (All locations)
# store.show_store_inventory(locations)

#print_db's
Utils::print_db(stores)
Utils::print_db(locations)
Utils::print_db(products)

#TEST ZONE
stores[0][1].display_info
stores[0][1].display_info_detailed(locations,products)
stores[0][1].show_store_inventory_item(locations,products,2)
# def transfer_product(qty,id,from_loc,to_loc)
stores[0][1].transfer_product(5,1,locations[0][1],locations[1][1])
#stores[0][1].remove_location(3)
#Write to Save file
Utils::save_store_database(stores,products,locations)



end #Run store class

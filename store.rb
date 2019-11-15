#STORE CLASS
class Store
attr_accessor :id,:name,:description,:location_list
  def initialize(id,name,description)
    # Instance variables
    @id = id
    @name = name
    @description = description
    @location_list = []
    puts "NEW STORE CREATED: #{@name}, #{@description}"
  end

  #Print string!
  def to_s
    "Store Information: #{@id}, #{@name}, #{@description}, #{@location_list}"
  end

  #Display Info! - Simple
  def display_info
    puts "\n=======STORE INFO==========="
    puts "Store ID: #{@id}"
    puts "Store Name: #{@name}"
    puts "Description: #{@description}"
    puts "Location List: #{@location_list}"
  end

  #Display Info! - Detailed Breakdown
  def display_info_detailed(locations,products)
    puts "\n=======STORE INFO==========="
    puts "Store ID: #{@id}"
    puts "Store Name: #{@name}"
    puts "Description: #{@description}"
    puts "Location List: #{@location_list}"
    #Detailed Breakdown
    show_store_inventory(locations,products)
  end

  #DATABASE: Add Location!
  def add_location(id)
    found = @location_list.include?(id.to_s)
      if found == true
        puts "Location #{id} already associated with store."
      else
        @location_list.push id.to_s
        puts "Location #{id} added to store."
      end
  end

  #DATABASE: Remove Location!
  def remove_location(id)
    i = @location_list.find_index(id.to_s)
    if i == nil
      i = "Location Id: #{id} is not associated with this Store!"
    else
      @location_list.delete_at(i)
      puts "Removed Location Id: #{id} from Store!"
    end
  end

  #Database: Show Store inventory  -- all
  def show_store_inventory(locations,products)
    #Loop through Stores Location Id List
    puts "====== STORE INVENTORY CHECK ========"
    ind = 0
    for locid in @location_list
      prod_list = locations[ind][1].product_list
      prod_list.each do | product_id, quantity |
        pquery = Utils::product_name_query(product_id,products)
        pname = pquery[0]
        price = pquery[1]
        puts "Location: #{locid}, Product Id: #{product_id}, Product Name: #{pname}, Price: $#{price}, Quantity: #{quantity}"
      end
        ind += 1 #update index
    end #for
  end

  #Database: Show Store inventory  -- One ITEM
  def show_store_inventory_item(locations,products,itemid)
    #Loop through Stores Location Id List
    puts "====== STORE INVENTORY CHECK ===Id: #{itemid}====="
    ind = 0
    for locid in @location_list
      prod_list = locations[ind][1].product_list
      prod_list.each do | product_id, quantity |
        pquery = Utils::product_name_query(product_id,products)
        pname = pquery[0]
        price = pquery[1]
        if (itemid == product_id)
          puts "Location: #{locid}, Product Id: #{product_id}, Product Name: #{pname}, Price: $#{price}, Quantity: #{quantity}"
        end
      end
        ind += 1 #update index
    end #for
  end

  #Database: Transfer a Product from Location A to Location B
  def transfer_product(qty,id,from_loc,to_loc)
    from_stock = from_loc.get_qauntity(id)
    to_stock = to_loc.get_qauntity(id)
    puts "Action: Transfer #{qty} Product Id: #{id}"
    puts "From Location: #{from_loc}, #{from_stock} IN Stock."
    puts "  To Location: #{to_loc}, #{to_stock} IN Stock."
    #Check if transfer possible
    if (from_stock >= qty)
      rmv = from_loc.remove_product(id,qty)
      if rmv == 99
        puts "REMOVED #{qty} ITEMS - (ID:#{id}) from #{from_loc.name}"
      end
      to_loc.add_product(id,qty)
      puts "SENT #{qty} ITEMS - (ID:#{id}) to #{to_loc.name}"
    else
      puts "ERROR: Tried to transfer more items than you have!"
    end
  end

  #Transfer a product from location to location
  def transfer(qty,prod,from,to)
    #Ensure from location has product in Stock
    if (get_product_qauntity(from.id) >= qty)
      #remove product from from Store
      rmv = from.remove_product(prod,qty)
      if rmv == 99
        puts "REMOVED #{qty} ITEMS - (ID:#{prod.id}) from #{from.name}"
      end
      to.add_product(prod,qty)
      puts "SENT #{qty} ITEMS - (ID:#{prod.id}) to #{to.name}"
      #Report action
      #puts "Moved #{qty} items from #{from.name} to #{to.name}"
    else
      puts "ERROR: Tried to transfer more items than you have!"
    end
  end

end #end SHOP class

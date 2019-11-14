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

  def to_s
    "Store Information: #{@id}, #{@name}, #{@description}, #{@location_list}"
  end

  def display_info
    puts "\n=======STORE INFO==========="
    puts "Store ID: #{@id}"
    puts "Store Name: #{@name}"
    puts "Description: #{@description}"
    puts print_location_list()
  end

  def add_location(id)
    @location_list.push id.to_s
    #puts "Added Location ID: #{id.id}, #{id.name} to #{@name}"
  end

  def remove_location(location)
    #THIS WILL ONLY ALLOW YOU TO REMOVE A LOCATION IF LOCATION HAS NO STOCK
    items = 0 #start at 0
    for item in location.product_list
      items += item[1] #add to item totals
    end

    if items == 0
      @location_list.delete_if {|obj| obj.id == location.id}
      puts "REMOVED LOCATION ID: #{location.id}, #{location.name} From #{@name}"
    else
      puts "ERROR: Please transfer all inventory from #{location.name} before removing from #{@name}!"
    end
  end

  def purge_location(location)
    #THIS WILL PURGE LOCATION REGARDLESS OF INVENTORY
    @location_list.delete_if {|obj| obj.id == location.id}
    puts "PURGED LOCATION ID: #{location.id}, #{location.name} From #{@name}"
  end

  def get_product_qauntity(id)
    qty = 0
    for item in @location_list
      plist = item.product_list
      if plist[id] != nil
        qty += plist[id]
      end
    end

    return qty
  end

  def display_all_inventory
    for item in @location_list
      plist = item.product_list
      plist.each do |key, value|
        puts "#{item.name}, Product Id: #{key}, QTY: #{value}"
      end
    end
  end

  def print_location_list
    puts "\n=======LOCATION INFO==========="
    for item in @location_list
      puts "-----------------------"
      puts "Location Id: #{item.id}"
      puts "Location Name: #{item.name}"
      puts "Location City: #{item.city}"
      puts "Product List: #{item.product_list}"
    end
    puts "-----------------------"
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

  #Helper functions
  def show_global_item_total_in_store(store,prod)
    puts "TOTAL STOCK (All locations): #{prod.name}: #{store.get_product_qauntity(prod.id)} UNITS"
  end

  def get_global_item_total_in_store(store,prod)
      return store.get_product_qauntity(prod.id)
  end

  def show_global_item_total_in_location(location,prod)
    puts "#{location.name} - (ID:#{prod.id} - #{prod.name}) : #{location.get_local_qauntity(prod.id)} UNITS"
  end

  def get_global_item_total_in_location(location,prod)
    return location.get_local_qauntity(prod.id)
  end
end #end SHOP class

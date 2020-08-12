pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)

  new_hash = {}
  
  data.each do |attr_key, attr_val|
    
    attr_val.each do |type_key, type_val|
      
      type_val.each do |name|
        
        if !new_hash.include?(name)
          
          new_hash[name] = {
            :color => [],
            :gender => [],
            :lives => []
          }
          
        end
        
        new_hash[name][attr_key.to_sym] << type_key.to_s
          
      end
    end
  end
  
  new_hash

  #new_hash.collect do |name|
  #  data.each do |attr_key, attr_val|
  #    attr_val.each do |type_key, type_val|
  #      type_val.each do |name|
  #        if 

end

puts nyc_pigeon_organizer(pigeon_data)

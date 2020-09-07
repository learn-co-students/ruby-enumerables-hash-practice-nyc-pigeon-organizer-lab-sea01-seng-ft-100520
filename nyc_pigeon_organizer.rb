require 'pry'

def nyc_pigeon_organizer(data)
  # write your code here!
  name_array = []
  
  data.each_with_object ({}) do |(k, v), a|
    v.each_with_object ({}) do |(k, v), a|
      v.each { |name| name_array << name}
    end    
  end
  name_array.uniq!
  output_hash = Hash[name_array.collect {|item| [item, {
    :color => [],
    :gender => [],
    :lives => []
  }]}]
  data[:color].each do |k, v|
    output_hash.each do |k2, v2|
      output_hash[k2][:color] << k.to_s if v.include?(k2)
      
    end
  end
  data[:gender].each do |k, v|
    output_hash.each do |k2, v2|
      output_hash[k2][:gender] << k.to_s if v.include?(k2)
      
    end
  end
  data[:lives].each do |k, v|
    output_hash.each do |k2, v2|
      output_hash[k2][:lives] << k.to_s if v.include?(k2)
      
    end
  end

  output_hash
  
end
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
nyc_pigeon_organizer(pigeon_data)

require 'pry'
def nyc_pigeon_organizer(data)
  # Original hashes are `:color`, `:gender`, and `:lives`, with sub hashes of categories and values of names
  # need hashes of names with sub hashes of the above categories and values of categories

  values = []
  
  #gather data that will be the innermost keys for the final data structure
  internal_keys = data.map { |key,value| key }
  
  # Create a matrix of values for final hash [[color],[gender], [lives]] -> lives is a string all other symbols
  for i in 0...internal_keys.length 
    values[i] = data[internal_keys[i]].map { |key,value| key }
  end
  
  ## loop through all future values to crate an array of arrays of future external_keys e.g. pigeon names then collapse those arrays and kep only uniq names
  
    external_keys = []
    for i in 0...values[0].length
   external_keys <<  data[internal_keys[0]][values[0][i]]
    end
    external_keys = external_keys.flatten.uniq
  
  
  # Set up new data structure
  pigeon_list = {}
  external_keys.map do |key|
    pigeon_list[key] = {}
  end
  
  external_keys.map do |external_key|
    internal_keys.map do |internal_key|
      pigeon_list[external_key][internal_key] = []
    end
  end
  
  # fill in values
  for i in 0...internal_keys.length do
    for j in 0...values[i].length do
      data[internal_keys[i]][values[i][j]].map do |inner_quality| # -> mapping over "purple" key
        external_keys.map do |member|
          if inner_quality == member
            pigeon_list[member][internal_keys[i]] << values[i][j].to_s
          end
        end
      end
    end
  end
  pigeon_list
end

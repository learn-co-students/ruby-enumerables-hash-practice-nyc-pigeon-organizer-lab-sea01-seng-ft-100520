require 'pry'

def nyc_pigeon_organizer(data)
  final_results = data.each_with_object({}) do |(key, value), final_hash|
    value.each do |inner_key, names|
      names.each do |name|
        if !final_hash[name]
          final_hash[name] = {}
        end 
        if !final_hash[name][key]
          final_hash[name][key] = []
        end 
       final_hash[name][key].push(inner_key.to_s)
       end 
    end
  end 
end  










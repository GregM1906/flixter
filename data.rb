require 'active_support/all'

#data types
#numbers
num = 1
#decimals
f = 1.0
#strings
string = "Hello!"
#symbol
sym = :symbol
#arrays
array = []
#hash table (hash rocket "=>" is mapped)
hash = {
		1 => "One",
		2 => "Two",
		3 => "Three",
		4 => "Four"
	}

#puts hash.to_json.inspect
json_string = '{"1":"One","2":"Two","3":"Three"}'

parsed = ActiveSupport::JSON.decode(json_string)
puts parsed.inspect

puts parsed[1].inspect
puts hash[1].inspect
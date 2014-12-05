require './classes/unit.rb'
require './classes/map.rb'

Map.new(10, 10)

# Create an array to hold the list of units.
unitlist = []

# Create an initial unit and add it to the array.
unitlist.push(Unit.new(1, "Bob", "settler", {'x' => 1, 'y' => 1}))

# Create a variable to hold the currently selected unit. Set its initial state to
# the first slot in the new unitlist array.
selected = unitlist[0]

# Call a unit from the array with the keyword "selected"
selected.jrnl_write(1, "I can't wait to found a great civilization!")

# This line calls a list of each unit in the array.
#unitlist.each_with_index {|unit, i| puts "#{i}. #{unit.name} (#{unit.unit_type}) is at X:#{unit.location['x']},Y:#{unit.location['y']}"}

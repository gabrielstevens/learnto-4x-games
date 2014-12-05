require './classes/unit.rb'
require './classes/map.rb'

world = Map.new(10, 10)

# Create an array to hold the list of units.
unitlist = []

# Create a variable to hold the current turn.
turn = 1

# Create an initial unit and add it to the array.
unitlist.push(Unit.new(turn, "Bob", "settler", {'x' => 1, 'y' => 1}))

# Create a variable to hold the currently selected unit. Set its initial state to
# the first slot in the new unitlist array.
selected = unitlist[0]

# Call a unit from the array with the keyword "selected"
selected.jrnl_write(turn, "I can't wait to found a great civilization!")

# This line calls a list of each unit in the array.
#unitlist.each_with_index {|unit, i| puts "#{i}. #{unit.name} (#{unit.unit_type}) is at X:#{unit.location['x']},Y:#{unit.location['y']}"}

def move(turn, selected, world, direction)
  command = "On turn #{turn} I was commanded to lead my unit #{direction}. "
  case direction
  when "north"
    if selected.location['y'] == world.max_ns
      acknowledgement = "We were unable to go any farther north. "
    else
      selected.location['y'] += 1
      acknowledgement = "We moved north one tile. "
    end
  when "south"
    if selected.location['y'] == 1
      acknowledgement = "We were unable to go any farther south. "
    else
      selected.location['y'] -= 1
      acknowledgement = "We moved south one tile. "
    end
  when "east"
    if selected.location['x'] == world.max_ns
      selected.location['x'] = 1
    else
      selected.location['x'] += 1
    end
    acknowledgement = "We moved east one tile. "
  when "west"
    if selected.location['x'] == 1
      selected.location['x'] = world.max_ns
    else
      selected.location['x'] -= 1
    end
    acknowledgement = "We moved west one tile. "
  else
  end
  report = "Our location is X#{selected.location['x']}, Y#{selected.location['y']}."
  selected.jrnl_write(turn, command + acknowledgement + report)
end

move(turn, selected, world, "south")
#jrnl = selected.jrnl_read("all")
#puts jrnl['title']
#puts jrnl['content']

world.tile_neighbors(4,4)

# The Map class is responsible for setting the dimensions of the game board, for
# managing a coordinate system, for handling the tiles and ther properties, and
# for managing the viewable tiles of the board from the perspective of a unit
# occupying that tile.
class Map
  attr_reader :max_ns      # size_north-south
  attr_reader :max_ew      # size_east-west

  def initialize(tall, wide)
    @max_ns = tall
    @max_ew = wide

    (1..tall).each do |y|
      print "Row #{y}: Col 1"
      (2..wide).each do |x|
        print ".#{x}"
      end
      print "\n"
    end
  end
end

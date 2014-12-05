# The Map class is responsible for setting the dimensions of the game board, for
# managing a coordinate system, for handling the tiles and ther properties, and
# for managing the viewable tiles of the board from the perspective of a unit
# occupying that tile.
class Map
  attr_reader :max_ns   # maximum north-south size
  attr_reader :max_ew   # maximum east-west size
  attr_reader :tile     # the array of tiles

  def initialize(tall, wide)
    @max_ns = tall
    @max_ew = wide

    # Create an array of tiles with X/Y coordinates and a tile base type.
    @tile = []
    (1..tall).each do |y|
      (1..wide).each do |x|
        @tile.push({'x' => x, 'y' => y, 'base' => "ocean"})
      end
    end

    # Pick a spot to start a continent.
    rand_y = rand(3..tall - 2)
    rand_x = rand(3..wide - 2)
    continental_base = @tile.index({'x' => rand_x, 'y' => rand_y, 'base' => "ocean"})
    @tile[continental_base]['base'] = "land"

    # Now spiral around that spot, creating a larger land mass
    cur_tile = @tile.index()
  end

  def tile_neighbors(x, y)
    # First get the index of the tile with the given X & Y coordinates.
    cur_tile = @tile.index({'x' => x, 'y' => y, 'base' => /\A(...)\z/})
    puts "Current Tile: #{cur_tile}"
  end
end

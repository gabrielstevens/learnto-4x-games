# The "Unit" class allows us to create, manage, and destroy mobile units.
class Unit
  # These are the variables that need to be accessible from outside of the class.
  attr_reader :name
  attr_reader :unit_type
  attr_reader :location
  attr_reader :journal

  def initialize(turn, name, unit_type, location)
    @name = name
    @unit_type = unit_type
    @location = location
    @journal = []

    self.jrnl_write(turn, "I was born today!")
  end

  def jrnl_write(turn, entry)
    @journal.push({ 'turn' => turn, 'entry' => entry})
  end

  # jrnl_read takes one parameter which can be either "all" or "last" and returns
  # a hash with the keys "title" and "content".
  #
  # "all" retrieves the content of all journal entries most recent first
  # "last" retrieves only the most recent journal entry content
  #
  # Example:
  # jrnl = selected.jrnl_read("all")
  # puts jrnl['title']
  # puts jrnl['content']
  #
  def jrnl_read(what)
    case what
    when "all"
      title = "#{@name}\'s Journal"
      # The following line prints the journal oldest first.
      # @journal.each_with_index { |j, i| content = "Entry #{i} (Turn #{j['turn']})\n  #{j['entry']}\n\n" }

      # The following block prints the journal newest first.
      content = ""
      @journal.to_enum.with_index.reverse_each do | j, i |
        content += "Entry #{i} (turn #{j['turn']})\n #{j['entry']}\n\n"
      end
      content = content.chomp.chomp
    when "last"
      title = "#{@name}\'s Journal"
      content = "Entry #{@journal.count} (turn #{@journal.last['turn']})\n #{@journal.last['entry']}"
    else
      title = "Error!"
      content = "function \"jrnl_read(what)\" only accepts \"all\" or \"last\" as parameters."
    end

    return {'title' => title, 'content' => content}
  end
end

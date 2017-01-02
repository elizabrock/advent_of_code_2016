class Day1
  def self.run
    input = File.open('input/day1.txt', 'r').read()
    day1 = Day1.new(input)
    puts "  The shortest path to the destination is: #{day1.shortest_path_length}."
    puts "  Easter Bunny HQ is located at: #{day1.easter_bunny_hq_location.join(", ")}."
  end

  attr_reader :locations_traversed

  def initialize(directions)
    @current_direction = 'n'
    @locations_traversed = [[0, 0]]
    process_directions(directions)
  end

  def shortest_path_length
    current_location[0].abs + current_location[1].abs
  end

  def current_location
    locations_traversed.last
  end
  alias destination current_location

  def facing
    @current_direction
  end

  def easter_bunny_hq_location
    locations_traversed.detect do |location|
      locations_traversed.rindex(location) != locations_traversed.index(location)
    end
  end

  private

  def process_directions(directions)
    instructions = directions.split(", ")
    instructions.each do |instruction|
      rotate_to(instruction[0])
      travel_n(instruction[1..-1].to_i)
    end
  end

  @@rotations = { 'n' => { 'L' => 'w', 'R' => 'e' },
                  'e' => { 'L' => 'n', 'R' => 's' },
                  's' => { 'L' => 'e', 'R' => 'w' },
                  'w' => { 'L' => 's', 'R' => 'n' } }

  def rotate_to(direction)
    @current_direction = @@rotations[@current_direction][direction]
  end

  def travel_n(n)
    x, y = current_location
    x_range = x.upto(x)
    y_range = y.upto(y)
    case @current_direction
    when 'e'
      x_range = (x + 1).upto(x + n)
    when 'w'
      x_range = (x - 1).downto(x - n)
    when 'n'
      y_range = (y + 1).upto(y + n)
    when 's'
      y_range = (y - 1).downto(y - n)
    end
    x_range.each do |x|
      y_range.each do |y|
        @locations_traversed << [x, y]
      end
    end
  end
end

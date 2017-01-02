class Day1
  def self.run
    input = File.open('input/day1.txt', 'r').read()
    day1 = Day1.new(input)
    puts "  The shortest path to the destination is: #{day1.shortest_path_length}."
    puts "  Easter Bunny HQ is located at: #{day1.easter_bunny_hq_location.join(", ")}."
  end

  def initialize(directions)
    @x = 0
    @y = 0
    @current_direction = 'n'
    @traversed_locations = []
    process_directions(directions)
  end

  def shortest_path_length
    @x.abs + @y.abs
  end

  def current_location
    [@x, @y]
  end
  alias destination current_location

  def facing
    @current_direction
  end

  def easter_bunny_hq_location
    @traversed_locations.detect do |location|
      @traversed_locations.rindex(location) != @traversed_locations.index(location)
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
    old_location = current_location
    case @current_direction
    when 'n'
      @y += n
    when 'e'
      @x += n
    when 's'
      @y -= n
    when 'w'
      @x -= n
    end
    if @current_direction == 'n' or @current_location == 's'
      (old_location[1]...current_location[1]).each do |y|
        @traversed_locations << [@x, y]
      end
    elsif @current_direction == 'e' or @current_location == 'w'
      (old_location[0]...current_location[0]).each do |x|
        @traversed_locations << [x, @y]
      end
    end
    @traversed_locations << current_location
  end
end

class Day1
  def self.run
    input = File.open('input/day1.txt', 'r').read()
    day1 = Day1.new(input)
    puts "  The shortest path to the destination is: #{day1.shortest_path_length}."
  end

  def initialize(directions)
    @x = 0
    @y = 0
    @current_direction = 'n'
    process_directions(directions)
  end

  def shortest_path_length
    @x.abs + @y.abs
  end

  def destination
    [@x, @y]
  end

  def facing
    @current_direction
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
  end
end

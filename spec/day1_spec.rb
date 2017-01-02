require_relative "spec_helper"

describe Day1 do

  describe "shortest_path_length" do
    it "scenario 0" do
      expected = 0
      actual = Day1.new("R0").shortest_path_length
      actual.must_equal expected
    end

    it "scenario 1" do
      expected = 5
      actual = Day1.new("R2, L3").shortest_path_length
      actual.must_equal expected
    end

    it "scenario 2" do
      expected = 2
      actual = Day1.new("R2, R2, R2").shortest_path_length
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = 12
      actual = Day1.new("R5, L5, R5, R3").shortest_path_length
      actual.must_equal expected
    end

    it "scenario 4" do
      expected = 7
      actual = Day1.new("L5, R5, R3").shortest_path_length
      actual.must_equal expected
    end
  end

  describe "destination" do
    it "scenario 0" do
      expected = [0, 0]
      actual = Day1.new("R0").destination
      actual.must_equal expected
    end

    it "scenario 1" do
      expected = [2, 3]
      actual = Day1.new("R2, L3").destination
      actual.must_equal expected
    end

    it "scenario 2" do
      expected = [0, -2]
      actual = Day1.new("R2, R2, R2").destination
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = [10, 2]
      actual = Day1.new("R5, L5, R5, R3").destination
      actual.must_equal expected
    end

    it "scenario 4" do
      expected = [-2, 5]
      actual = Day1.new("L5, R5, R3").destination
      actual.must_equal expected
    end

    it "scenario 5" do
      expected = [0, 0]
      actual = Day1.new("L1, L1, L1, L1").destination
      actual.must_equal expected
    end

    it "scenario 6" do
      expected = [0, 0]
      actual = Day1.new("R1, R1, R1, R1").destination
      actual.must_equal expected
    end

    it "scenario 6" do
      expected = [100, -100]
      actual = Day1.new("R100, R100").destination
      actual.must_equal expected
    end
  end

  describe "easter_bunny_hq_location" do
    it "scenario 1" do
      expected = [4, 0]
      actual = Day1.new("R8, R4, R4, R8").easter_bunny_hq_location
      actual.must_equal expected
    end

    it "scenario 2" do
      # This is subject to interpretation but could as easily have been [2, -2]
      expected = [2, -1]
      actual = Day1.new("R2, R2, R2, L1, L2, L2").easter_bunny_hq_location
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = [2, -2]
      actual = Day1.new("R2, R2, R2, L0, L3").easter_bunny_hq_location
      actual.must_equal expected
    end
  end

  describe "facing" do
    it "scenario 0" do
      expected = 'e'
      actual = Day1.new("R0").facing
      actual.must_equal expected
    end

    it "scenario 1" do
      expected = 'n'
      actual = Day1.new("R2, L3").facing
      actual.must_equal expected
    end

    it "scenario 2" do
      expected = 'w'
      actual = Day1.new("R2, R2, R2").facing
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = 's'
      actual = Day1.new("R5, L5, R5, R3").facing
      actual.must_equal expected
    end

    it "scenario 4" do
      expected = 'e'
      actual = Day1.new("L5, R5, R3").facing
      actual.must_equal expected
    end
  end

  describe "locations_traversed" do
    it "scenario 2" do
      expected = [ # start by facing North
                   [0, 0],
                   # R2: rotate to East, go 2
                   [1, 0], [2, 0],
                   # R2: rotate to South, go 2
                   [2, -1], [2, -2],
                   # R2: rotate to West, go 2
                   [1, -2], [0, -2],
                   # L1: rotate to South, go 1
                   [0, -3],
                   # L2: rotate to East, go 2
                   [1, -3], [2, -3],
                   # L2: rotate to North, go 2
                   [2, -2], [2, -1]
                  ]
      actual = Day1.new("R2, R2, R2, L1, L2, L2").locations_traversed
      actual.must_equal expected
    end
  end
end

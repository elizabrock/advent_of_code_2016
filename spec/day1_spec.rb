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
end

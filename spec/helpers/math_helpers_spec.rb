require_relative '../../lib/helpers/math/math_helpers'

describe MathHelpers do
  it "should calculate distance using pythagoras theorem" do
    expect(MathHelpers.pythagoras_theorem(1, 2)).to eql(4.123105625617661)
  end
end

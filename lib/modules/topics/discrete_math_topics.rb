require_relative './demos/powers_demo'
require_relative './demos/shasum_demo'
require_relative './demos/algorithm_demo'

# DiscreteMath::Preliminary
module DiscreteMathTopics
  module PreliminaryMath
    include PowersDemo
    include ShasumDemo
    include AlgorithmDemo
  end
end

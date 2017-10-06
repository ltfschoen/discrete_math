require 'algorithms'
require 'faker'
require 'benchmark'
require_relative './lib/movie.rb'
require_relative '../../../../lib/utils/processing_spinner'

module AlgorithmDemo
  module Helpers
    def self.generate_movies_list_of_size(size)
      movies = []
      size.times do
        movies << Movie.new(Faker::Name.last_name, Faker::Name.name_with_middle)
      end
      movies
    end

    def self.generate_hash_for_movies(movies)
      hash = Hash.new
      movies.each_with_index do |movie, index|
        hash[movie.title] = movie.description
      end
      hash
    end

    def self.generate_treemap_for_movies(movies)
      map = Containers::RubyRBTreeMap.new
      movies.each do |movie|
        map.push(movie.title, movie.description)
      end
      map
    end

    def self.sort_all_movies
      Movie.all.sort
    end
  end

  def self.run_spinner(spinner)
    spinner.start_processing
  end

  def self.show_status_of_threads(threads)
    threads.each_with_index { |thread, index|
      puts "Thread #{index} status: #{thread.status ? 'OPEN' : 'CLOSED'}"
    }
  end

  def self.run
    n = 3000

    movies = AlgorithmDemo::Helpers.generate_movies_list_of_size(n)
    AlgorithmDemo::Helpers.sort_all_movies
    hash = AlgorithmDemo::Helpers.generate_hash_for_movies(movies)
    treemap = AlgorithmDemo::Helpers.generate_treemap_for_movies(movies)

    sample_key = Movie.all[-1].clone.title
    sample_value = Movie.all[-1].clone.description

    puts "Please wait, processing Big-O Benchmarks..."
    spinner = Utils::Spinner.new
    threads = []
    # Ruby Threads - https://ruby-doc.org/core-2.4.2/Thread.html
    spinner_thread = Thread.start { AlgorithmDemo.run_spinner(spinner) }
    benchmarking_thread = Thread.start {
      # O(1) - Benchmark Search/Lookup
      # References:
      #  - https://ruby-doc.org/stdlib-2.4.2/libdoc/benchmark/rdoc/Benchmark.html
      #  - https://stackoverflow.com/questions/1592649/examples-of-algorithms-which-has-o1-on-log-n-and-olog-n-complexities
      Benchmark.bm do |x|
        x.report { treemap.get(sample_key) } # RubyRBTreeMap
        x.report { hash[sample_key] } # Hash
      end

      # O(n) - Benchmark Delete
      Benchmark.bm do |x|
        x.report { treemap.delete(sample_key) } # RubyRBTreeMap
        x.report { hash.delete(sample_key) } # Hash
      end

      # O(n^2) - Benchmark Sort
      Benchmark.bm do |x|
        x.report { Algorithms::Sort.bubble_sort Movie.all } # Bubble Sort
        x.report { Movie.all.sort } # Object
      end

      # Stop spinner rotating
      spinner.stop_processing

      # Kill spinner thread
      Thread.kill(spinner_thread)
    }
    threads << spinner_thread
    threads << benchmarking_thread
    threads.each { |thread| thread.join }
    # AlgorithmDemo.show_status_of_threads(threads)
  end

end
require 'minitest/autorun'
require 'minitest/benchmark'
require_relative 'eratosthenes_prime_generator'
require_relative 'trial_division_prime_generator'

class TestMeme < Minitest::Benchmark
  
  def bench_my_prime_list_eratosthenes_generation
    assert_performance_power 0.45 do |n| # n is a range value
      EratosthenesPrimeGenerator.new.create_number_list(n)
    end
  end
  
  def bench_my_prime_list_trial_division_generation
    assert_performance_power 0.45 do |n| # n is a range value
      TrialDivisionPrimeGenerator.new.create_number_list(n)
    end
  end
  
end
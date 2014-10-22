require 'minitest/autorun'
require_relative 'eratosthenes_prime_generator'
require_relative 'trial_division_prime_generator'
require_relative 'multiplication_table_printer'

class TestPrimeGenerators < Minitest::Test
  
  def test_generators_zero_to_10
    (0..10).each do |i|
      eratos_list = EratosthenesPrimeGenerator.new.create_number_list(i)
      trial_list = TrialDivisionPrimeGenerator.new.create_number_list(i)
      assert_equal(eratos_list, trial_list)
      assert_equal(i, eratos_list.size)
      assert_equal(i, trial_list.size)
    end
  end
  
  def test_generators_bigger
    (321..721).step(50).each do |i|
      eratos_list = EratosthenesPrimeGenerator.new.create_number_list(i)
      trial_list = TrialDivisionPrimeGenerator.new.create_number_list(i)
      assert_equal(eratos_list, trial_list)
      assert_equal(i, eratos_list.size)
      assert_equal(i, trial_list.size)
    end
  end
  
  def test_generators_invalid
    eratos_list = EratosthenesPrimeGenerator.new.create_number_list('a')
    trial_list = TrialDivisionPrimeGenerator.new.create_number_list(-4)
    assert_equal(eratos_list, trial_list)
    assert_equal(0, eratos_list.size)
    assert_equal(0, trial_list.size)
  end
end

class TestPrimes < Minitest::Test
  def setup
    @prime_list = MultiplicationTablePrinter.new(TrialDivisionPrimeGenerator.new, 10)
  end
  
  def test_prime_list_is_populated
    assert @prime_list.get_list.size == 10
  end
  
  def test_multiplication_table_output
    table = "       2   3   5   7  11  13  17  19  23  29\n"\
            "   2   4   6  10  14  22  26  34  38  46  58\n"\
            "   3   6   9  15  21  33  39  51  57  69  87\n"\
            "   5  10  15  25  35  55  65  85  95 115 145\n"\
            "   7  14  21  35  49  77  91 119 133 161 203\n"\
            "  11  22  33  55  77 121 143 187 209 253 319\n"\
            "  13  26  39  65  91 143 169 221 247 299 377\n"\
            "  17  34  51  85 119 187 221 289 323 391 493\n"\
            "  19  38  57  95 133 209 247 323 361 437 551\n"\
            "  23  46  69 115 161 253 299 391 437 529 667\n"\
            "  29  58  87 145 203 319 377 493 551 667 841\n"
            
    assert_output(table){ @prime_list.print_table }
  end
  
  def test_empty_list
    empty_list = MultiplicationTablePrinter.new(TrialDivisionPrimeGenerator.new,0)
    
    assert empty_list.get_list.size == 0
    
    assert_output("empty list\n"){ empty_list.print_table }
  end
  
  def test_negative_list
    empty_list = MultiplicationTablePrinter.new(TrialDivisionPrimeGenerator.new,-1)
    
    assert empty_list.get_list.size == 0
    
    assert_output("empty list\n"){ empty_list.print_table }
  end
  
  def test_invalid_list_size
    empty_list = MultiplicationTablePrinter.new(TrialDivisionPrimeGenerator.new,"test")
    
    assert empty_list.get_list.size == 0
    
    assert_output("empty list\n"){ empty_list.print_table }
  end
end
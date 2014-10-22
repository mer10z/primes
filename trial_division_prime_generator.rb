#
# Generates primes by incrementally trying to divide each number N by 2..N-1
# This is O(n^2/2) but ok for small sizes
#
class TrialDivisionPrimeGenerator
  def create_number_list list_size 

    list = []
    
    if (!list_size.is_a?(Integer) || list_size < 0)
      puts "invalid list_size: #{list_size}"
    else
      current = 2

      until list.size == list_size
        is_prime = true
        for i in 2...current
          if current % i == 0
            is_prime = false
            break
          end
        end

        if is_prime
          list.push(current)
        end

        current += 1
      end
    end
    
    return list
  end
end
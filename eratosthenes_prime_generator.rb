#
# implementation of the Sieve of Eratosthenes
# see en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
class EratosthenesPrimeGenerator
  def create_number_list list_size 
    
    @list_size = list_size
    @primes = []
    
    if (!list_size.is_a?(Integer) || @list_size < 0)
      puts "invalid size: #{list_size}"
    else
    
      @sieve_size = get_sieve_size
    
      # using a pretend 1 indexed array so that we can use the
      # array index as the number instead of i - 1
      @sieve = Array.new(@sieve_size + 1, true)

      execute_sieve
      
      get_primes_from_sieve

    end
    
    return @primes
    
  end
  
  def get_sieve_size 
    # the pi equation below evalutes to -infinity if list_size is 1 or 0, and we don't want that 
    if @list_size == 0
      sieve_size = 0
    elsif @list_size < 6
      sieve_size = 11
    else
      # crazy equation (pi) for sieve size needed to find first N primes, only works when N > 6
      # more at http://primes.utm.edu/howmany.html#pi_def or
      # http://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number
      sieve_size = (@list_size * Math.log(@list_size)) + (@list_size * (Math.log(Math.log(@list_size))))
    end
  end
  
  def execute_sieve
    # start at 2 because it's the first prime
    2.upto(Math.sqrt(@sieve_size)) do |i|
      if @sieve[i] == true
        k = 0
        j = (i * i) + (k * i)
        while j <= @sieve_size do
          @sieve[j] = false
          k += 1
          j = (i * i) + (k * i)
        end
      end
    end
  end
  
  def get_primes_from_sieve
    for i in 2..@sieve_size
      if @sieve[i]
        @primes.push(i);
      end
      if @primes.size >= @list_size
        break
      end
    end
  end
  
end

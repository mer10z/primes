# Primes

This application generates a list of prime numbers and then uses them to print a multiplication table.

It includes the following files:

* prime\_app.rb - Application entry point that creates a MultiplicationTablePrinter class with a trial division prime generator and then prints a multiplication table
* multiplication\_table\_printer.rb - Class that uses a generator to make a number list and print a multiplication table
* trial\_division\_prime\_generator.rb - simple prime generator, good for small size lists
* eratosthenes\_prime\_generator.rb - implementation of Erotosthenes prime sieve, uses more memory but better for larger lists
* unit\_test.rb - Minitest unit test for the MultiplicationTablePrinter class and prime generator classes
* benchmark.rb - Minitest performance test for the two prime generators

How to run the app:

    ./prime_app.rb 

Run the unit tests:

    ruby -Ilib:test unit_test.rb

Run the performance test:

    ruby -Ilib:test benchmark.rb

##Implementation Notes

Since the requirement is to print a table with the first 10 prime numbers, I used a trial division generator for the main app because although it has a complexity of O(N^2/2) it is sufficiently fast for the requirement and less complicated, thus easier to maintain and less likely to introduce bugs. 

After performance testing the trial division generator with N = 10000 and experiencing the terrible performance, I decided to also implement a more efficient prime sieve. I decided on the Eratosthenes sieve because it is easy to understand and there are no requirements to make the fastest, most efficient prime generator. While this algorithm is faster, it requires more memory, so in cases where memory is limited, a different algorithm would be better.

At first I couldn’t think of a really effective way to unit test a prime generator, but then I thought that with two different implementations we can write tests that compare the two, which is cool.

I implemented the MultiplicationTablePrinter to use a generic generator class to create a list of numbers and then print the numbers. The two prime number generators can be used to create the number list, or any other class that provides a create_number_list method can also be used

I threw all of the unit tests in the same file just to make it easier to review. Each unit test should probably have it’s own file in the real world. I also put all the files in the same directory to make reviewing easier, no need to navigate into test directories or whatnot.

##Style Notes

I've been writing mostly Java and JavaScript at the moment so that syntax is most present in my brain at this moment. I've done my best to use the typical Ruby style here. With less Java and More Ruby I can improve this, and of course I would also learn and use whatever style guidelines you all have.

I try to code with descriptive method and variables names to reduce the amount of comments needed. My philosophy is that it’s better to write more understandable code than it is to write long comments that could get out of sync with the code. 
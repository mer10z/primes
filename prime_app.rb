#!/usr/bin/ruby
require_relative 'multiplication_table_printer'
require_relative 'trial_division_prime_generator'

# run the program!
table_printer = MultiplicationTablePrinter.new(TrialDivisionPrimeGenerator.new, 10)
table_printer.print_table

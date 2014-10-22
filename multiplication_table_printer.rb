#
# Uses a generator to create a list of numbers
# Can print a multiplication table from the list 
#
class MultiplicationTablePrinter
  
  # creates a list of numbers of the given size using the provided generator
  def initialize generator, size
    @list = []
    if (size.is_a?(Integer) && size >=0 && generator.respond_to?(:create_number_list))
      @list = generator.create_number_list(size)
    else
      puts "invalid initialization args: #{generator.class.name} #{size}" 
    end
  end
    
  def get_list
    @list
  end
  
  # print a square multiplication table of the list
  def print_table
    if @list.size == 0 
      puts "empty list"
    else
      calculate_format_string
      print_header
    
      @list.each do |column_num|
        print_row(column_num)
      end
    end
  end
  
  def calculate_format_string
    @format_string = "%".concat(get_spacing_width.to_s).concat("d")
  end
  
  def get_spacing_width
    if @list.length > 0 
      (@list[-1] * @list[-1]).to_s.length + 1
    else
      0
    end
  end
  
  def print_header
    get_spacing_width.times do
      print ' '
    end
    @list.each do |i|
      print @format_string % i
    end
    puts
  end
  
  def print_row column_num
    print @format_string % column_num
    @list.each do |row_num|
      print @format_string % (column_num * row_num)
    end
    puts
  end
  
  private :calculate_format_string, :print_header, :print_row, :get_spacing_width
end








  
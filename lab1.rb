class Calculator
    @@operation_counter = { total_additions: 0,
        total_multiplications: 0,
        total_bulk_additions: 0,
        total_bulk_multiplications: 0,
       }

    attr_accessor :real
    attr_accessor :imag
    

    def initialize(real=0, imag=0)
        @real = real
        @imag = imag
        
    end

   def add(complex_number)
    @@operation_counter[:total_additions] += 1
    result = Calculator.new(
        @real + complex_number.real,
        @imag + complex_number.imag

    ) 
    result
   end

   def multiply(complex_number)
    @@operation_counter[:total_multiplications] += 1
    result = Calculator.new(
        (@real * complex_number.real) - (@imag * complex_number.imag),
        (@real * complex_number.imag) + (@imag * complex_number.real)
    )
   end
    
   def self.bulk_add(complex_numbers)
    @@operation_counter[:total_bulk_additions] += 1
    sum_real = 0
    sum_imag = 0
    complex_numbers.each do |complex_number|
        sum_real += complex_number.real
        sum_imag += complex_number.imag
    end
    result = Calculator.new(sum_real, sum_imag)
    end

    def self.bulk_multiply(complex_numbers)
        @@operation_counter[:total_bulk_multiplications] += 1
        result = complex_numbers[0]
        for num in 1...complex_numbers.length
            @@operation_counter[:total_multiplications] -= 1
            result = result.multiply(complex_numbers[num])
        end
        result
    end

    def print 
        puts "#{@real} + #{@imag}i"
    end

    def self.get_status
        puts "Total number of additions: #{@@operation_counter [:total_additions]} "
        puts "Total number of multiplication: #{@@operation_counter [:total_multiplications]} " 
        puts "Total number of bulk additions: #{@@operation_counter [:total_bulk_additions]} " 
        puts "Total number of bulk multiplication:#{@@operation_counter [:total_bulk_multiplications]} " 
    end

        

end

c1 = Calculator.new(2, 1)
c2 = Calculator.new(3, 2)
c3 = Calculator.new(5, 7)
c4 = Calculator.new(20, 10)


result_add = c1.add(c2)
result_add.print

result_add2 = c3.add(c4)
result_add2.print


result_multiply = c1.multiply(c2)
result_multiply.print

result_bulk_add = Calculator.bulk_add([c1, c2, c3, c4])
result_bulk_add.print

result_bulk_multiplication = Calculator.bulk_multiply([c1, c2, c3, c4])
result_bulk_multiplication.print

Calculator.get_status


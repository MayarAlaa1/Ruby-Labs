class ComplexNumbers
    attr_accessor :real, :imaginary
    @@Stats ={
        "+(num)" => 0,
        "*(num)" => 0,
        "bulk_add" => 0,
        "bulk_multiply" =>0
    }

    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end
##########################################
    def +(num)
        @@Stats["+(num)"] +=1
        ComplexNumbers.new(@real + num.real, @imaginary+ num.imaginary)
    end
#########################################
    def *(num)
        @@Stats["*(num)"] +=1
        ComplexNumbers.new(@real * num.real - @imaginary * num.imaginary,@real*num.imaginary+ @imaginary * num.real)
    end

########################################
    def self.bulk_add(cns)
        @@Stats["bulk_add"] +=1
        add=ComplexNumbers.new(0,0)
        cns.each do |cn|
           add=add+cn
        end
        add
    end
##########################################
    def self.bulk_multiply(cns)
        @@Stats["bulk_multiply"] +=1
        mul=ComplexNumbers.new(1,0)
        cns.each do |cn|
            mul=mul*cn
        end
        mul
    end
#########################################
    def self.get_stats()
      
        puts @@Stats

    end 
##########################################
end    

comp1= ComplexNumbers.new(1,2)
comp2= ComplexNumbers.new(3,4)
comp3= ComplexNumbers.new(5,6)

sum = comp1 + comp2
multiplication = comp1 * comp2
bulk_sum= ComplexNumbers.bulk_add([comp1,comp2,comp3])
bulk_mul= ComplexNumbers.bulk_multiply([comp1,comp2,comp3])

########### print ########################
puts "sum= #{sum.real} + #{sum.imaginary} i" 
puts "Multiplication= #{multiplication.real} + #{multiplication.imaginary} i" 
puts "Bulk addition= #{bulk_sum.real} + #{bulk_sum.imaginary} i" 
puts "Bulk Multiplication = #{bulk_mul.real} + #{bulk_mul.imaginary} i" 
puts ComplexNumbers.get_stats



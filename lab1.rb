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
############### Plus ###################
    def +(num)
        @@Stats["+(num)"] +=1
        ComplexNumbers.new(@real + num.real, @imaginary+ num.imaginary)
    end
################ Mutiply ####################
    def *(num)
        @@Stats["*(num)"] +=1
        ComplexNumbers.new(@real * num.real - @imaginary * num.imaginary,@real*num.imaginary+ @imaginary * num.real)
    end

############  Bulk addition ###################
    def self.bulk_add(cns)
        @@Stats["bulk_add"] +=1
        add=ComplexNumbers.new(0,0)
        cns.each do |cn|
           add=add+cn
        end
        add
    end
############# Bulk multiplication ##############
    def self.bulk_multiply(cns)
        @@Stats["bulk_multiply"] +=1
        mul=ComplexNumbers.new(1,0)
        cns.each do |cn|
            mul=mul*cn
        end
        mul
    end
############ Stats ############################
    def self.get_stats()
      
        puts @@Stats

    end 
########## Formatting output ################

    def to_s
        "#{self.real}+#{self.imaginary} i"
    end
##########################################
end    

comp1= ComplexNumbers.new(1,2)
comp2= ComplexNumbers.new(3,4)
comp3= ComplexNumbers.new(5,6)

########### print ########################
puts "sum = #{ comp1 + comp2}"
puts"multiplication = #{comp1 * comp2}"
puts "bulk_sum = #{ComplexNumbers.bulk_add([comp1,comp2,comp3])}"
puts "bulk_mul = #{ComplexNumbers.bulk_multiply([comp1,comp2,comp3])}"
puts ComplexNumbers.get_stats



class Pizza
  def initialize(pizza_size)
    @baked = false
    @slices = 0
    @size = pizza_size
  end

  def bake
    @baked = true
  end

  def cut
    new_slices = 2
    if @baked && @slices < 20
      @slices += new_slices
    else
      puts "You have to bake it first!"
    end
  end

  def eat
    if @baked == true && @slices >= 1
      @slices -= 1
    end
  end
end

puts 'PIZZA'

puts '-- Pizza.new-'

pizza = Pizza.new('large')
puts pizza.inspect

puts '-- pizza.bake -'

pizza.bake
puts pizza.inspect

puts '-- pizza.eat -'

pizza.eat
puts pizza.inspect

puts '-- 3 times pizza.cut do-'

3.times do
  pizza.cut #cut adds 2 slices to @slices
end
puts pizza.inspect

puts '-- 5 times pizza.eat do-'

5.times do
  puts pizza.inspect
  pizza.eat
end


puts '-- Pizza2.new-'

pizza2 = Pizza.new('medium')

puts pizza2.inspect

puts 'bake Pizza2'

puts pizza2.bake

puts pizza2.inspect

puts 'cut Pizza2'

puts pizza2.cut

puts pizza2.inspect

puts 'eat Pizza2'

puts pizza2.eat

puts pizza2.inspect

puts 'eat Pizza2'

puts pizza2.eat

puts pizza2.inspect

puts 'eat Pizza2'

puts pizza2.eat

puts pizza2.inspect

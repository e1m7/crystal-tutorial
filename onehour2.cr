
# Хэши

sample = {
  "Moscow" => 8_000_000,
  "London" => 9_000_000,
  "Tokio" => 14_000_000
}
puts sample["London"]

sample.each do |key, value|
  puts("Ключ = #{key}, значение = #{value}")
end

puts sample.size
puts sample.empty?
puts sample.has_key?("Tokio")
puts sample.has_key?("Paris")
puts sample.has_value?(9_000_000)

sample.merge({
  "Paris" => 2_100_000,
  "Pekin" => 21_500_000
})
sample.each do |key, value|
  puts("Ключ = #{key}, значение = #{value}")
end

sample = sample.reject("Moscow")
sample.each do |key, value|
  puts("Ключ = #{key}, значение = #{value}")
end

sample1 = {
  "ananas" => 8_000,
  "abrikos" => 5_000,
  "kiwi" => 9_000,
  "fanta" => 13_000,
  "cola" => 14_000,
  "aqua" => 1_000
}

puts sample1.select { |k,v| v > 10_000 }

sample1.delete("kiwi")

sample1.each do |key, value|
  puts("Ключ = #{key}, значение = #{value}")
end

sample1.clear

# 1) size
# 2) empty?
# 3) has_key?
# 4) has_value?
# 5) merge
# 6) reject
# 7) select
# 8) delete
# 9) clear

# Кортежи (неизменяемые списки)

list1 = { "Napoleon", 1.60, 55, "imperator" }
puts list1[0]
puts list1[1]
puts list1[2]
puts list1[3]

list1 = { "Napoleon", 1.60, 55, "imperator" }
list1.each do |val|
  puts "Элемент #{val}"
end

puts list1.first?
puts list1.last?
puts list1.size

# Процедуры и функции

double = ->(x : Int32) { x * x }
puts double.call 12

cool = ->(x : Int32 | String) { puts "Cool write: " + x.to_s }
puts cool.call 12
puts cool.call "Hello World"

def addNumbers(n1, n2) 
  return n1 + n2
end
puts addNumbers(10, 12)

addNumbers = ->(n1 : Int32, n2 : Int32) { n1 + n2 }
puts addNumbers.call 10, 12

x = 1
def change(x)
  x = 100
end
puts x

# Передача параметров происходит по значению, а не по ссылке
# 1) х в основной программе имеет одну ссылку
# 2) х внутри функции имеет другую ссылку

def superAdd(*values)
  sum = 0
  values.each do |val|
    sum = sum + val
  end
  return sum
end
puts superAdd(1,2,3,4,5,6,7,8,9,10)

# Enum's (перечисления)

enum Color : UInt8
  Red    = 1
  Green  = 2
  Blue   = 3

  def green?
    self == Color::Green
  end

  def red?
    self == Color::Red
  end

  def blue?
    self == Color::Blue
  end
end

puts Color::Red.value
puts Color::Green.value
puts Color::Blue.value
puts Color::Green.green?
puts Color::Green.blue?
puts Color::Green.red?

# Symbols (символы)

a = :Ivan
b = :Marina
puts a
puts b

# Class (классы)

# Классы это чертежи объектов реального мира
# 1) свойства объектов называются поля fields
# 2) изменение свойств объектов называется методы methods
# 3) качества: 1) полиморфизм, 2) наследование, 3) инкапсуляция

class Animal
  def initialize(name : String)
    puts "Питомец создан"
    @name = name
  end

  def setName(name)
    @name = name
  end

  def getName
    @name
  end

  def name
    @name
  end

  def name=(name)
    if name.is_a?(Number)
      puts "Имя не может быть числом!"
    else
      @name = name
    end
  end
end

pet1 = Animal.new "Дружок"
puts pet1.name
puts pet1.getName
pet1.setName "Тотошка"
puts pet1.name
pet1.name = "Пантелеймошка"
puts pet1.name
pet1.name = 12
puts pet1.name

# Более простой способ созданяи классов

class Dog
  property name : String
  property height : Float32
  property weight : Float32

  def initialize()
    @name = "No name"
    @height = 0
    @weight = 0
  end

  def bark
    "гав-гав-гав!"
  end
end

pet2 = Dog.new
pet2.name = "Белка"
pet2.height = 0.56
pet2.weight = 3.45
puts pet2.name
puts pet2.height
puts pet2.weight

puts "Имя=#{pet2.name} высота=#{pet2.height} вес=#{pet2.weight}"
puts "Животное #{pet2.name} говорит #{pet2.bark}"




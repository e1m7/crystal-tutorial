
# Классы (наследование и прочее)

# 1) Инкапсуляция (изменение свойств только через методы класса)
# 2) Наследование (класс делается на основе супер-класса)
# 3) Полиморфизм (класс обрабатывает данные разных типов), утиная типизация

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

  def info
    puts "Имя #{@name} рост #{@height} вес #{@weight}"
  end
end

class GermanDog < Dog
  def bark
    "ГАВ-ГАВ-ГАВ!"
  end
end

d1 = Dog.new
d1.name = "Тотошка"
d1.height = 0.50
d1.weight = 1.50

d2 = GermanDog.new
d2.name = "Верный"
d2.height = 1.50
d2.weight = 100.50

d1.info
d2.info
puts d1.bark
puts d2.bark

# Модули

# 1) модуль похож на класс
# 2) нельзя создать объект модуля

module StandartCar
  def sound
    puts "Подмосковные вечера"
  end 
end

class Track
  include StandartCar
end

track1 = Track.new
track1.sound

# Утиная типизация

class Bird
  def tweet(bird_type)
    bird_type.tweet
  end
end

class Collibry < Bird
  def tweet()
    puts "Фить-фить"
  end
end

class Eagel < Bird
  def tweet()
    puts "Уух-уух"
  end
end

generic_bird = Bird.new
generic_bird.tweet(Collibry.new)
generic_bird.tweet(Eagel.new)

# Структуры

# Структура это класс со встроенными методами

struct Location
  property lat : Float32
  property long : Float32
  def initialize(@lat : Float32, @long : Float32)
  end 

  def position
    puts "Широта : #{lat}, долгота : #{long}"
  end
end

pos1 = Location.new(100.5, 16.3)
pos1.position

# Ислючения

a = [1,2,3]
begin
	puts a[3]
  exit
rescue
	puts "Индекс выходит за границы"
end

# Собственные исключения

age = -30
begin
  if (age < 0)
    raise "Введите положительный возраст"
  end
rescue message
  puts message
	exit
end
puts "Все хорошо, ваш возраст #{age}"

# Работа с файлами

write_handler = File.new("test.txt", "w")
write_handler.puts("Первая строка текста").to_s
write_handler.puts("Вторая строка текста").to_s
write_handler.puts("Третья строка текста").to_s
write_handler.close

read_handler = File.read("test.txt")
puts read_handler

# [5] ООП в языке Crystal, часть 2

# Методы позволяют указывать значения по-умолчанию для последних аргументов

class Person
  def initialize(@name : String)
    @age = 0
  end
  def name
    @name
  end
  def age
    @age
  end
  # методы
  def add_age(by = 1)
    @age += by
  end
end

p = Person.new "Владимир"
p.add_age 5
puts p.age
p.add_age by: 5
puts p.age

# Если параметров по-умолчанию много, то их порядок не важен
# Если параметров по-умолчанию много, то часть можно не указывать

# Можно передавать переменное количество аргументов через *
# Замечание: параметр * может появится в любом месте, но только 1 раз
# Переданные через * аргументы становятся кортежом

def summa(*elements)
  total = 0
  elements.each do |value|
    total = total + value
  end
  total
end

puts summa(1, 2, 3)
puts summa(10, 20, 30, 40, 50)

# Мы можем ограничивать типы, которые получают поля экземпляра класса

def add(x, y)
  x + y
end

puts add(1, 2)
puts add("Маша", "Вася")

# Ограничение включено

def add(x : Number, y : Number)
  x + y
end

puts add(1, 2)

# В качестве ограничителя можно использовать тип самого класса == self
# Это полезно когда мы делаем методы только для экземпляров класса

class Person
  def initialize(@name : String)
    @age = 0
  end
  def name
    @name
  end
  def age
    @age
  end

  def ==(other : self)
    other.name == name
  end

  def ==(other)
    false
  end

end

p1 = Person.new "Mario"
p2 = Person.new "Mario"
p3 = Person.new "Antonio"
p4 = 100

puts p1 == p2
puts p1 == p3
puts p1 == p4

# Если мы хотим, чтобы в качестве типа принимались только целые числа, то Int32
# Если мы хотим, чтобы в качестве типа принимались только строки, то String

def sample(x : Int32.class)
  puts("Все работает замечательно")
end

sample Int32
# sample String

# Можно определить множество аргументов (кортеж) определеного типа
# Например, кортеж 1,2,3 подходит
# Например, кортеж "a", "b", "c" подходит
# Например, кортеж 1,2,"r" не подходит

def sample(*args : Int32)
  puts("Все ок")
end

def sample(*args : String)
  puts("Все ок")
end

sample 1,2,3
sample "a","b","c"

# Замечание: пустой кортеж не будет поддерживаться
# Чтобы он "проходил" надо написать метод

def sample
  puts("Все ок")
end

# Замечание: буква Т в качестве имени типа == все типы (свободная переменная)

def sample(x : T)
  puts("Все нормально, так можно x = #{x} его тип = #{T}")
end
# не работает

# Можно указывать тип возвращаемого значения
# а) для котроля
# б) для документации

def test : String
  "Hello World"
end

puts test

# Операторы плюс и минус это обычные методы
# a + b === a.+(b)

class Vector
  getter x, y
  def initialize(@x : Int32, @y : Int32)
  end

  def +(other)
    Vector.new(x + other.x, y + other.y)
  end
end

v1 = Vector.new(1,2)
v2 = Vector.new(3,4)
v3 = v1 + v2
puts "Vector x=#{v2.x} y=#{v3.y}"

# Можно определить операторы

+   # сложение
-   # вычитание
*   # умножение
/   # деление
%   # модуль (остаток от деления)
&   # и
|   # или
^   # исключению или
**  # возведение в степень
<<  # сдвиг влево
>>  # сдвиг вправо
==  # равно
!=  # не равно
<   # меньше
<=  # меньше или равно
>   # больше
>=  # больше или равно
<=> # сравнение
=== # полное равенство

+   # плюс
-   # минус
!   # нет
~   # побитовое дополнение

[]  # индекс массива
[]? # индекс массива (может выйти за границы)
[]= # назначение индекса

# Методы могут быть
# а) protected (можно вызвать только как object.method)
# б) private (можно вызвать только как self.method)
# в) public (по-умолчанию)

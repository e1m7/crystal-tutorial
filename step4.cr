
# [4] ООП в языке Crystal

# В языке Crystal все является объектом
# У объекта есть два свойства
# а) он имеет некий тип
# б) он может вызывать некие методы
# У объекта есть внутренее состояние
# Узнать его можно только через вызов методов

def add(x,y)
  x + y
end

puts add(1,2)

# Сама программа представляет собой глобальный объект, в котором можно
# 1) определять типы
# 2) отределять методы
# 3) определять переменные


def even?(num)
 return true if num % 2 == 0
 return false
end

puts even?(10)

# Значения из методов можно возвращать явно через return
# Неявно будет возвращен результат последнего действия

def add(x, y)
  x + y
end

class SampleClass
  def first
    add(1,2)
    mul(1,2)
  end

  def mul(x, y)
    x * y
  end
end

a = SampleClass.new
puts a.first

# При вызове метода он будет искаться в основной программе
# 1) создали переменную a = экземпляру класса SampleClass
# 2) вызвали для экземпляра метод first
# 3) в классе есть метод first (внутри него еще два вызова)
#   а) add (метода нет внутри класса, но есть в основной программе)
#   б) mul (метод есть внутри класса), ответ 1*2=2

x = 10

def add(a,b)
  puts x
  a + b
end

add(1,2)

# Переменные из основной программы не видны внутри методов

# Классы это планы (шаблоны, заготовки) некоторых (сложных) типов переменных 
# Из классов создаются новые (сложные) переменные, тип которых = названию класса
# Замечание: все классы в Crystal называются в большой буквы

# Задача: создадим новый класс Person с полями имя человека и его возраст
# Эти поля будет находится внутри объекта под именами @name, @age
# По-умолчанию любая новая переменная типа Person будет с пустым именем и 0 возрастом

class Person
  def initialize(name : String)            # ограничение типа
    @name = name
    @age = 0
  end

  def name
    @name
  end

  def age
    @age
  end
end

marina = Person.new "Marina"
stepan = Person.new "Stepan"

puts marina.name
puts marina.age

# При создании нового экземпляра класса был вызван метод new
# Он был написан автоматически самим языком Crystal

class Person
  def self.new(name)
    instance = Person.allocate          # 1)
    instance.initialize(name)           # 2)
    instance                            # 3)
  end
 end

# Приставка self означает, что метод new принадлежит классу Person
# Теперь можно вызвать этот метод внутри основной программы
# allocate = выделение памяти под еще не инициализированный объект Person
# initialize = инициализируем новый объект (получаем на него ссылку)
# instance = возвращаем новый объект в основную программу

# Можно чуть-чуть упростить создание нового экземпляра

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
end

# Добавим возможность делать человека старше на 1 год
# Это реализуется с помощью метода класса become_older

class Person
  def initialize(@name : String)
    @age = 0
  end
  
  def become_older
    @age += 1
  end

  def name
    @name
  end

  def age
    @age
  end
end

marina = Person.new "Marina"
puts marina.age
marina.become_older
puts marina.age

# Можно было написать become_older внутри Person в отдельном блоке
# Все методы Person будут складываться (склеиваться) внутри одного класса
# Более нижний метод будет иметь приоритет

class Person
  def initialize(@name : String)
    @age = 0
  end
  
  def become_older
    @age += 1
  end

  def name
    @name
  end

  def age
    @age
  end
end

class Person
  def become_older
    @age += 10
  end
end

marina = Person.new "Marina"
puts marina.age
marina.become_older
puts marina.age

# Более ранний метод можно вызвать из более позднего
# Для вызова используется команда previous_def
# Она получает параметры, аналогичные крайнему вызову, хотя их можно переопределить

class Person
  def initialize(@name : String)
    @age = 0
  end
  
  def become_older
    @age += 1
  end

  def name
    @name
  end

  def age
    @age
  end
end

class Person
  def become_older
    previous_def
    @age += 10
  end
end

marina = Person.new "Marina"
puts marina.age
marina.become_older
puts marina.age

# Возможно написать внутри класса несколько методов
# Методы будут называться одинакого, но иметь разное количество аргументов
# Они будут считаться разными методами, это называется "перегрузка методов"
# Пример: метод become_older с параметром и без

class Person

  def initialize(@name : String)
    @age = 0
  end

  def become_older
    @age = @age + 1
  end

  def become_older(year)
    @age = @age + year
  end

  def name
    @name
  end

  def age
    @age
  end
  
end

m = Person.new "Mario"
puts "Person name = #{m.name} age = #{m.age}"
m.become_older
puts "Person name = #{m.name} age = #{m.age}"
m.become_older(15)
puts "Person name = #{m.name} age = #{m.age}"

# Перегрузка бывает трех вариантов
# 1) по количеству аргументов
# 2) по ограничению типа
# 3) по принятию блока

class Person

  def initialize(@name : String)
    @age = 0
  end

  def become_older
    @age = @age + 1
  end

  # перегрузка по количеству аргументов
  def become_older(year)
    @age = @age + year
  end

  # перегрузка по ограничению типа
  def become_older(year : String)
    @age = @age + year.to_i
  end

  # перегрузка по ограничению типа
  def become_older(year : Int32)
    @age = @age + year
  end

  # перегрузка по принятию блока
  def become_older
    @age = @age + yield @age
  end

  def name
    @name
  end

  def age
    @age
  end
  
end

a = Person.new "Antonio"
a.become_older
puts a.age

a.become_older "12"
puts a.age

a.become_older 13
puts a.age

a.become_older do |current|
  current < 20 ? 10 : 30
end
puts a.age


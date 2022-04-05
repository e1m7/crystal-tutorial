
# [6] ООП в языке Crystal, часть 3

class Person

  private def say(message)
    puts("I write #{message}")
  end

  def sample
    say("Amsterdam")
  end

end

a = Person.new
a.sample                 # ok
a.say                    # error

# Приватные методы доступны подклассам

class Person

  protected def say(message)
    puts("I write #{message}")
  end

  def sample
    say("Amsterdam")              # ok
    self.say("London")            # ok
    b = Person.new
    b.say("Paris")                # ok
  end

end

a = Person.new
a.sample                         # ok
a.say                            # error 

# Каждый класс (кроме Object) наследуется от другого класса
# Класс наследует все свойства и методы родителя, включая конструкторы

class Person
  def initialize(@name : String)
  end

  def greet
    puts("Hello, i'am #{@name}")
  end
end

class Worker < Person
end

w = Worker.new "Alan Silverstone"
w.greet

# Если класс описывает методы new || initialize, то конструктор у него свой

class Person
  def initialize(@name : String)
  end

  def greet
    puts("Hello, i'am #{@name}")
  end
end

class Worker < Person
  def initialize(@name : String, @company : String)
  end
    def greet
    puts("Hello, i'am #{@name} from #{@company}")
  end
end

w = Worker.new "Alan Silverstone", "Apple"
w.greet

# В подклассе можно вызывать методы супер-класса через super

class Person
  def initialize(@name : String)
  end

  def greet
    puts("Hello, i'am #{@name}")
  end
end

class Worker < Person
  def initialize(@name : String, @company : String)
  end
    def greet
    super
    puts("I love company #{@company}")
  end
end

w = Worker.new "Alan Silverstone", "Apple"
w.greet

# Замечание: без аргументов super получает теже параметры, что и подкласс
# Если надо изменить аргументы, то надо указать скобки и параметры

# Виртуальный тип == тип переменной, которая объдиняет разные типы в одной иерархии классов
# Работает со всеми классами кроме Reference

class Animal
end

class Dog < Animal
  def talk
    puts "Гав-гав"
  end
end

class Cat < Animal
  def talk
    puts "Мяу-мяу"
  end
end

class Person
  getter pet

  def initialize(@name : String, @pet : Dog)
  end
end

mario = Person.new "Mario", Dog.new
mario.pet.talk

# Тип поля pet == Animal+ (любой тип, который получен из Animal)

abstract class Animal
  abstract def talk
end

class Dog < Animal
  def talk
    puts "Гав-гав"
  end
end

class Cat < Animal
  def talk
    puts "Мяу-мяу"
  end
end

class Person
  getter pet

  def initialize(@name : String, @pet : Animal)
  end
end

mario = Person.new "Mario", Dog.new
mario.pet.talk


# Макросы (метапрограммирование)

# Макросы это методы, которые получают узлы AST и создают код

# 1) простой макрос

macro sample(name, content)
  def {{name}}
    {{content}}
  end
end

sample hello, 100
puts hello

# def hello                               => было сгенерировано на лету
#   100                                   => было сгенерировано на лету
# end                                     => было сгенерировано на лету
puts hello

# 2) макрос, который создает класс

macro sample2(m_name, m_class, method, content)
  module {{m_name}}
    class {{m_class}}
      def initialize(@name : String)
      end
      def {{method}}
        {{content}} + @name
      end
    end
  end
end

sample2 ModuleName, ModuleClass, say_hello, "Hello "
puts ModuleName::ModuleClass.new("Tommy").say_hello

# module ModuleName                       => было сгенерировано на лету
#   class ModuleClass                     => было сгенерировано на лету
#     def initialize(@name : String)      => было сгенерировано на лету
#     end                                 => было сгенерировано на лету
#     def say_hello                       => было сгенерировано на лету
#       "Hello " + @name                  => было сгенерировано на лету
#     end                                 => было сгенерировано на лету
#   end                                   => было сгенерировано на лету
# end                                     => было сгенерировано на лету

# 3) макрос, который использует if

macro sample3(name, content)
  def {{name}}
    {% if content == 1 %}
      "Сработала первая часть макроса"
    {% elsif content == 2 %}
      "Сработала вторая часть макроса"
    {% else %}
      "Сработала третья часть макроса"
    {% end %}
  end
end

sample3 f1, 1
sample3 f2, 2
sample3 f3, 3
puts f1
puts f2
puts f3

# 4) макрос, который использует for

macro sample4(count)
  {% for i in (1..count) %}
    VALUE_{{i.id}} = Math::PI * {{i}}
  {% end %}
end

sample4(5)
puts VALUE_1
puts VALUE_2
puts VALUE_3
puts VALUE_4
puts VALUE_5

# Cпециальные макросы

# 1) inherited      вызывается когда определяется подкласс (@type тип наследования)
# 2) included       вызывается при включении модуля (@type включающий тип)
# 3) extended       вызывается при расширении модуля (@type расширяющийся тип)
# 4) method_missing вызываеся когда метод не найден
# 5) method_added   вызывается когда в текущей области определяется новый метод
# 6) finished       вызывается после завершения синтаксического анализа

# inherited (определен подкласс)

class Parent
  macro inherited
    def myclass
      "{{@type.name.id}} < Parent"
    end
  end
end

class Child < Parent
end

a = Child.new
puts a.myclass

# method_missing (метод не найден)

macro method_missing(call)
  print "Method ", {{call.name.id.stringify}}, " with ", {{call.args.size}}, " args", '\n'
end

foo
foo 1, 2, 3

# method_added (метод добавлен)

macro method_added(method)
  {% puts "Method add: #{method.name.stringify}" %}
end

def add(a, b); a + b; end
def sub(a, b); a - b; end
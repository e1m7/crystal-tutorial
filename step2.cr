
# [2] Условия в языке Crystal

# Все, что можно привести к true => truthy-значения
# Все, что можно привести к false => falsey-значения

# nil, false и нулевые указатели => falsey (ложь)
# все остальное => truthy (истина)

a = 10
if a > 1
  puts "Вы победитель"
end

puts "Вы победитель" if a > 1
# сокращенная запись

sample = if 2 > 3 2 else 3 end
puts sample
# if возвращает последнее выражение, которые было вычислено

# Есть тернарный оператор

a = 10 > 5 ? 100 : 200
puts a

# Если переменная является условием if, то внутри ветки then она не nil

condition = 10 > 100
a = condition ? nil : 100
if a
	puts "Hello World"
end

# Если переменная является условием if, но это переменная класса, то не работает

if @a
	puts "Hello World"
end

# Выйти из ситуации когда @a может оказаться nil можно так:
# 1) назначить переменную а
# 2) использовать try

if a = @a
	puts "Hello World"
end

if @a.try do |a|
	puts "Hello World"
end

# Есть функция для проверки типа переменной
 
a = "Hello"
if a.is_a?(String)
	puts "Переменная а оказалась строка"
end

b = 10
if b.is_a?(Number)
	puts "Переменная b оказалась числом"
else
	puts "Переменная b не оказалась числом"
end

# Если проверять переменную класса, то не сработает
# Решение: сначала присвоить эту переменную локальной

if @a.is_a?(String)
	puts "Да, переменная @a строка"
	# нельзя так делать
end

a = @a
if a.is_a?(String)
	puts "Да, переменная a строка"
	# так можно
end

puts "Да, переменная a строка" if (a = @a).is_a?(String)
# так вообще красиво и стильно

# Есть функция для ограничения типами, за которые отвечает метод

a = 10
a = "Hello World"
if a.responds_to?(:size)
  puts "a = #{a}"
end

# Есть оператор unless = противоположность if

valid = false
a = 10 unless valid
puts a

# Есть оператор case это проверка на соответствие шаблону

expr = 4

case expr
when 1,2,3,4,5
  puts "Рабочий день"
when 6,7
  puts "Выходной день"
else
	puts "Неизвестный день"
end

expr = 10

case expr
when String
  puts "Строковая переменная"
when Int32
  puts "Числовая переменная"
else
	puts "Переменная неизвестного типа"
end

expr = 11

case expr
when .even?
  puts "Четное число"
when .odd?
  puts "Нечетное число"
else
	puts "Ошибка"
end
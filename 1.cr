class Isogram

	def self.isogram?(value)
    value = value.downcase.gsub("-","").gsub(" ","")
		answer = ""
    i = 0
    while i < value.size
			current = value[i]
			begin
				a = answer.index(current)
				return false
			rescue
				answer = answer + current
			end
			i = i + 1
		end
		true
	end

end

a = Isogram
puts a.isogram?("Subd-e-rm   atoglyphic")

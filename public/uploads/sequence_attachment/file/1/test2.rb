class add
	attr_accessor first
	attr_accessor second
	def addition
		p @first + @second
	end
end

add.new(1,2)
add.addition
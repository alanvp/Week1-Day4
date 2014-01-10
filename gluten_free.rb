#Title: Gluten Free

#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes

#Objectives:
#- Work with exceptions, classes, class variables, conditions

#"======================================================================"

# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class Person

	
	def initialize(name, allergies=[])
		@name = name
		@allergies = allergies
		@stomach=[]
	end

	def eat(food)
		food.each do |food_item|
			if @allergies.include?(food_item)
				@stomach = []
				puts "<VOMIT>"
				raise AllergyErr.new(@name, food_item)
			else 
				@stomach << food_item
				puts "#{@name} enjoyed the #{food_item}"
			end	
		end
	end
end

class AllergyErr <  RuntimeError
	attr_accessor :name, :food_item
	def initialize(name, food_item)
		@name = name
		@food_item = food_item
	end	
end


# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("chris",["gluten"])
beth = Person.new("beth",["scallops"])
begin
	chris.eat(pizza + pan_seared_scallops + water)
	beth.eat(pizza + pan_seared_scallops + water)
rescue AllergyErr => err
	puts("(#{err.name} is allergic to #{err.food_item})")
end

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError


# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception

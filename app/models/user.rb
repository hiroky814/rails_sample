class User < ApplicationRecord
	validates :name, presence: true
	#validates :age, presence: true
	#validates :age, numericality: true
	#validates :graduate, presence: true
	#validates :graduate, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 47 }

	def create(name, age, pref, hobby)
		user = User.new
		user.attributes = {name: name, age: age, graduate: pref, hobby: hobby}
		user.save
	end
end

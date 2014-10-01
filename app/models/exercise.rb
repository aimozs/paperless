class Exercise < ActiveRecord::Base

	has_many :specs
	has_many :programmes, through: :specs

  	accepts_nested_attributes_for :specs
end

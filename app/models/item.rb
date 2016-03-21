class Item < ActiveRecord::Base
	belongs_to :list
	has_many :categorizations
	has_many :categories, :through => :categorizations
end

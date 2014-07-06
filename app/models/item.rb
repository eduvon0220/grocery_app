class Item < ActiveRecord::Base
	belongs_to :list
	has_many :categories
end

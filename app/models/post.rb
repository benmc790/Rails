class Post < ActiveRecord::Base
	validates :title, :content, presence: true
	has_many :line_items, inverse_of: :order
end

class Comment < ApplicationRecord
	belongs_to :photography
	belongs_to :user
end

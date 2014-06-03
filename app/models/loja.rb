class Loja < ActiveRecord::Base
	has_many :offers
	belongs_to :user
end

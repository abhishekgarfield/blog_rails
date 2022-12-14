class Article < ApplicationRecord
    has_many :comments
    validates :title , presence: true , length: {minimum: 8 , message: "Length should be >= 8"}
    validates :body , presence:true
end

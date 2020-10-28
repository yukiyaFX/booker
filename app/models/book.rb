class Book < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :book_comments, dependent: :destroy
    validates :body, length: { maximum: 200 }, presence: true
    validates :title, presence: true, length: { maximum: 200 }
end

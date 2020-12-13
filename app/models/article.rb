class Article < ApplicationRecord
    has_many :comments
    has_many :likes, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    def number_of_dislikes
        self.likes.where(is_dislike:true).count
    end

    def number_of_likes
        self.likes.where(is_dislike:false).count
    end
end

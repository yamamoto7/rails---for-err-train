class PostImage < ApplicationRecord
    has_many :users
    attachment :image
    has_many :post_comments, dependent: :destroy    
    has_many :favorites, dependent: :destroy
    
    validates :shop_name, presence: true
    validates :image, presence: true
    
    def favorited_by?
        favorites.where(user_id: params).exists?
    end
end

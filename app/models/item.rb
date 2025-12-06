class Item < ApplicationRecord
    belongs_to :user   #追加
    has_one_attached :image #追記,imageではなくphotoを追加
end

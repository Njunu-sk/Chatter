class Song < ApplicationRecord
    has_one_attached :image
    has_one_attached :audio

    has_many :comments, dependent: :destroy
end

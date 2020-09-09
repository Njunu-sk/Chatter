class Comment < ApplicationRecord
    belongs_to :song
    belongs_to :user
    validates :body, length: {minimum: 1, maximum: 280}
end

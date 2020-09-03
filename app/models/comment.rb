class Comment < ApplicationRecord
    belongs_to :song
    validates :body, length: {minimum: 1, maximum: 280}
end

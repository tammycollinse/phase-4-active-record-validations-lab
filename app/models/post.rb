class Post < ApplicationRecord
    validates :title , presence: true
    validates :content , length: { minimum: 250 }
    validates :summary , length: { maximum: 250 }
    validates :category , inclusion: { in: %w(fiction non-fiction)}
    validate :clickbait_validation

    def clickbait_validation
        if title.downcase == "won't believe" || title.downcase == "secret" || title.downcase == "top " || title.downcase == "guess"
        errors.add(:title, "sorry, this title is not clickbaity")
        end
    end
end

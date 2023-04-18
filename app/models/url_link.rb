class UrlLink < ApplicationRecord
    validates :original_url, presence: true
    validates :shortened_url, presence: true, uniqueness: true
    validates :clicks, numericality: { greater_than_or_equal_to: 0 }
end
    
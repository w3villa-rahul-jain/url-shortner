class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    validates :shortened_code, presence: true, uniqueness: true
  
    before_validation :generate_shortened_code
  
    private
  
    def generate_shortened_code
      self.shortened_code ||= Shortener.generate(self.long_url)
    end
  end
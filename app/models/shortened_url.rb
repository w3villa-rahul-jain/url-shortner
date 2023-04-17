class ShortenedUrl < ApplicationRecord
    before_create :generate_short_url
    validates :original_url, presence: true, format: URI::regexp(%w[http https])

    validates :long_url, presence: true, length: { maximum: 255 }
    validates :short_url, presence: true, length: { maximum: 255 }, uniqueness: true

    private

    def generate_short_url
      self.short_url = SecureRandom.hex(3)
      generate_short_url if ShortenedUrl.exists?(short_url: self.short_url)
    end
  end

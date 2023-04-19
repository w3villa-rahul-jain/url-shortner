class Url < ApplicationRecord
    validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
    validates :short_url, presence: true, uniqueness: true
    # validates :clicks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    before_validation :generate_short_url, on: :create
    before_create :generate_short_url
  
    private
  
    def generate_short_url
      loop do
        self.short_url = SecureRandom.urlsafe_base64(6)
        break unless Url.exists?(short_url: short_url)
      end
    end

    def generate_short_url
        self.short_url = SecureRandom.uuid[0..6]
    end
    
  end
 
  
  
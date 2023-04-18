class UrlsController < ApplicationController
    def create
      url = Url.create(original_url: params[:original_url], short_url: generate_short_url)
      render json: { short_url: url.short_url }
    end
  
    def show
      url = Url.find_by(short_url: params[:id])
      render json: { clicks: url.clicks }
    end
  
    def redirect
      url = Url.find_by(short_url: params[:short_url])
      url.increment!(:clicks)
      redirect_to url.original_url
    end
  
    private
  
    def generate_short_url
      loop do
        short_url = SecureRandom.urlsafe_base64(6)
        return short_url unless Url.exists?(short_url: short_url)
      end
    end
end
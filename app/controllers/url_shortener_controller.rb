class UrlShortenerController < ApplicationController
    def shorten
      @shortened_url = ShortenedUrl.new(shortened_url_params)
      if @shortened_url.save
        render json: { short_url: request.base_url + '/' + @shortened_url.short_url }
      else
        render json: { errors: @shortened_url.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def redirect
      @shortened_url = ShortenedUrl.find_by(short_url: params[:short_url])
      if @shortened_url
        redirect_to @shortened_url.long_url
      else
        render plain: '404 Not Found', status: :not_found
      end
    end
    
    private
    
    def shortened_url_params
      params.require(:shortened_url).permit(:long_url, :short_url)
    end
  end
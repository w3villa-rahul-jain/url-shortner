class UrlLinksController < ApplicationController
    def create
      @short_url = UrlLink.new(short_url_params)
  
      if @short_url.save
        flash[:success] = "Short URL created successfully."
      else
        flash[:error] = "There was an error creating the short URL."
      end
  
      redirect_to new_url_link_path
    end
  
    def show
      @short_url = UrlLink.find_by_shortened_url(params[:id])
      @short_url.increment!(:clicks)
      redirect_to @short_url.original_url
    end
    
    private
  
    def short_url_params
      params.require(:url_link).permit(:original_url, :shortened_url, :clicks)
    end
  end
  
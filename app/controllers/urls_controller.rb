class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_show_path(short_url: @url.short_url)
    else
      render :new
    end
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])
    @myurl = @url.original_url
  
  end
  
  private
  
  def url_params
    params.require(:url).permit(:original_url)
  end
end

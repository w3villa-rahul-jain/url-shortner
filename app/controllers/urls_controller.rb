class UrlsController < ApplicationController
  before_action :authenticate_user!
  def index
    @urls = Url.all
  end
  
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
    @url = Url.find_by(params[:id])
    @myurl = @url.short_url
    @original = @url.original_url
  end

  def click_count
    @count = Url.find_by(short_url: params[:url])
    @url = @count.original_url
    @click = @count.click_count
    @count.update(click_count: @click.to_i+1)
    redirect_to @url
  end
  
  private
  
  def url_params
    params.require(:url).permit(:original_url)
  end
end

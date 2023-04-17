class ShortenedUrlsController < ApplicationController
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    if @shortened_url.save
      redirect_to shortened_url_path(@shortened_url.short_url)
    else
      render :new
    end
  end

  def new
 
  end

  def show
    @shortened_url = ShortenedUrl.find_by(short_url: params[:id])
    redirect_to @shortened_url.original_url
  end

  private

  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end
end

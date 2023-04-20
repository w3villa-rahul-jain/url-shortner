class ShortnersController < ApplicationController
  before_action :set_shortner, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /shortners or /shortners.json
  def index
    @shortners = Shortner.all
  end

  # GET /shortners/1 or /shortners/1.json
  def show
    @shortner = Shortner.find_by(params[:id])
    @short_url = @shortner.short_url 
    @original = @shortner.original_url
  end

  # GET /shortners/new
  def new
    @shortner = Shortner.new
  end

  # GET /shortners/1/edit
  def edit
  end

  # POST /shortners or /shortners.json
  def create
    @shortner = Shortner.new(shortner_params)

    respond_to do |format|
      if @shortner.save
        format.html { redirect_to shortner_url(@shortner), notice: "Shortner was successfully created." }
        format.json { render :show, status: :created, location: @shortner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shortner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shortners/1 or /shortners/1.json
  def update
    respond_to do |format|
      if @shortner.update(shortner_params)
        format.html { redirect_to shortner_url(@shortner), notice: "Shortner was successfully updated." }
        format.json { render :show, status: :ok, location: @shortner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shortner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortners/1 or /shortners/1.json
  def destroy
    @shortner.destroy

    respond_to do |format|
      format.html { redirect_to shortners_url, notice: "Shortner was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def click_count
    @count = Shortner.find_by(short_url: params[:url])
    @url = @count.original_url
    @click = @count.click_count
    @count.update(click_count: @click.to_i+1)
    redirect_to @url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortner
      @shortner = Shortner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shortner_params
      params.require(:shortner).permit(:original_url)
    end
end

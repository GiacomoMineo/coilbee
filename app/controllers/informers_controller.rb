class InformersController < ApplicationController
  before_action :set_informer, only: [:show, :edit, :update, :destroy]

  # GET /informers
  # GET /informers.json
  def index
    @informers = Informer.all
  end

  # GET /informers/1
  # GET /informers/1.json
  def show
  end

  # GET /informers/new
  def new
    @informer = Informer.new
    @landing = true
  end

  # GET /informers/1/edit
  def edit
  end

  # POST /informers
  # POST /informers.json
  def create
    @informer = Informer.new(informer_params)

    respond_to do |format|
      if @informer.save
        format.html { redirect_to @informer, notice: 'Informer was successfully created.' }
        format.json { render :show, status: :created, location: @informer }
      else
        format.html { render :new }
        format.json { render json: @informer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informers/1
  # PATCH/PUT /informers/1.json
  def update
    respond_to do |format|
      if @informer.update(informer_params)
        format.html { redirect_to @informer, notice: 'Informer was successfully updated.' }
        format.json { render :show, status: :ok, location: @informer }
      else
        format.html { render :edit }
        format.json { render json: @informer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informers/1
  # DELETE /informers/1.json
  def destroy
    @informer.destroy
    respond_to do |format|
      format.html { redirect_to informers_url, notice: 'Informer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informer
      @informer = Informer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def informer_params
      params.require(:informer).permit(:email)
    end
end

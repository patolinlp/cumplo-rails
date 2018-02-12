class TmcsController < ApplicationController
  before_action :set_tmc, only: [:show, :edit, :update, :destroy]

  # GET /tmcs
  # GET /tmcs.json
  def index
    @tmcs = Tmc.all
  end

  # GET /tmcs/1
  # GET /tmcs/1.json
  def show
  end

  # GET /tmcs/new
  def new
    @tmc = Tmc.new
  end

  # GET /tmcs/1/edit
  def edit
  end

  # POST /tmcs
  # POST /tmcs.json
  def create
    @tmc = Tmc.new(tmc_params)

    respond_to do |format|
      if @tmc.save
        format.html { redirect_to @tmc, notice: 'Tmc was successfully created.' }
        format.json { render :show, status: :created, location: @tmc }
      else
        format.html { render :new }
        format.json { render json: @tmc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tmcs/1
  # PATCH/PUT /tmcs/1.json
  def update
    respond_to do |format|
      if @tmc.update(tmc_params)
        format.html { redirect_to @tmc, notice: 'Tmc was successfully updated.' }
        format.json { render :show, status: :ok, location: @tmc }
      else
        format.html { render :edit }
        format.json { render json: @tmc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tmcs/1
  # DELETE /tmcs/1.json
  def destroy
    @tmc.destroy
    respond_to do |format|
      format.html { redirect_to tmcs_url, notice: 'Tmc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tmc
      @tmc = Tmc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tmc_params
      params.require(:tmc).permit(:valor, :fecha, :titulo, :subtitulo, :tipo)
    end
end

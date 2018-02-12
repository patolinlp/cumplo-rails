class DolarsController < ApplicationController
  before_action :set_dolar, only: [:show, :edit, :update, :destroy]

  # GET /dolars
  # GET /dolars.json
  def index
    @dolars = Dolar.all
  end

  # GET /dolars/1
  # GET /dolars/1.json
  def show
  end

  # GET /dolars/new
  def new
    @dolar = Dolar.new
  end

  # GET /dolars/1/edit
  def edit
  end

  # POST /dolars
  # POST /dolars.json
  def create
    @dolar = Dolar.new(dolar_params)

    respond_to do |format|
      if @dolar.save
        format.html { redirect_to @dolar, notice: 'Dolar was successfully created.' }
        format.json { render :show, status: :created, location: @dolar }
      else
        format.html { render :new }
        format.json { render json: @dolar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dolars/1
  # PATCH/PUT /dolars/1.json
  def update
    respond_to do |format|
      if @dolar.update(dolar_params)
        format.html { redirect_to @dolar, notice: 'Dolar was successfully updated.' }
        format.json { render :show, status: :ok, location: @dolar }
      else
        format.html { render :edit }
        format.json { render json: @dolar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dolars/1
  # DELETE /dolars/1.json
  def destroy
    @dolar.destroy
    respond_to do |format|
      format.html { redirect_to dolars_url, notice: 'Dolar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dolar
      @dolar = Dolar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dolar_params
      params.require(:dolar).permit(:valor, :fecha)
    end
end

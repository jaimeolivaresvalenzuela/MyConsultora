class ProyectoetapasController < ApplicationController
  before_action :set_proyectoetapa, only: [:show, :edit, :update, :destroy]

  # GET /proyectoetapas
  # GET /proyectoetapas.json
  def index
    @proyectoetapas = Proyectoetapa.all
  end

  # GET /proyectoetapas/1
  # GET /proyectoetapas/1.json
  def show
  end

  # GET /proyectoetapas/new
  def new
    @proyectoetapa = Proyectoetapa.new
  end

  # GET /proyectoetapas/1/edit
  def edit
  end

  # POST /proyectoetapas
  # POST /proyectoetapas.json
  def create
    @proyectoetapa = Proyectoetapa.new(proyectoetapa_params)

    respond_to do |format|
      if @proyectoetapa.save
        format.html { redirect_to @proyectoetapa, notice: 'Proyectoetapa was successfully created.' }
        format.json { render :show, status: :created, location: @proyectoetapa }
      else
        format.html { render :new }
        format.json { render json: @proyectoetapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectoetapas/1
  # PATCH/PUT /proyectoetapas/1.json
  def update
    respond_to do |format|
      if @proyectoetapa.update(proyectoetapa_params)
        format.html { redirect_to @proyectoetapa, notice: 'Proyectoetapa was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyectoetapa }
      else
        format.html { render :edit }
        format.json { render json: @proyectoetapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectoetapas/1
  # DELETE /proyectoetapas/1.json
  def destroy
    @proyectoetapa.destroy
    respond_to do |format|
      format.html { redirect_to proyectoetapas_url, notice: 'Proyectoetapa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyectoetapa
      @proyectoetapa = Proyectoetapa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyectoetapa_params
      params.require(:proyectoetapa).permit(:etaid, :ropeid, :proid, :pretestado, :pretfechacreacion, :pretdescripcion)
    end
end

class RolpersonasController < ApplicationController
  before_action :set_rolpersona, only: [:show, :edit, :update, :destroy]

  # GET /rolpersonas
  # GET /rolpersonas.json
  def index
    @rolpersonas = Rolpersona.all
  end

  # GET /rolpersonas/1
  # GET /rolpersonas/1.json
  def show
  end

  # GET /rolpersonas/new
  def new
    @rolpersona = Rolpersona.new
  end

  # GET /rolpersonas/1/edit
  def edit
  end

  # POST /rolpersonas
  # POST /rolpersonas.json
  def create
    @rolpersona = Rolpersona.new(rolpersona_params)

    respond_to do |format|
      if @rolpersona.save
        format.html { redirect_to @rolpersona, notice: 'Rolpersona was successfully created.' }
        format.json { render :show, status: :created, location: @rolpersona }
      else
        format.html { render :new }
        format.json { render json: @rolpersona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rolpersonas/1
  # PATCH/PUT /rolpersonas/1.json
  def update
    respond_to do |format|
      if @rolpersona.update(rolpersona_params)
        format.html { redirect_to @rolpersona, notice: 'Rolpersona was successfully updated.' }
        format.json { render :show, status: :ok, location: @rolpersona }
      else
        format.html { render :edit }
        format.json { render json: @rolpersona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rolpersonas/1
  # DELETE /rolpersonas/1.json
  def destroy
    @rolpersona.destroy
    respond_to do |format|
      format.html { redirect_to rolpersonas_url, notice: 'Rolpersona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rolpersona
      @rolpersona = Rolpersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rolpersona_params
      params.require(:rolpersona).permit(:perid, :rolid, :ropeestado, :ropefechacreacion, :ropedescripcion)
    end
end

class EtapatareasController < ApplicationController
  before_action :set_etapatarea, only: [:show, :edit, :update, :destroy]

  # GET /etapatareas
  # GET /etapatareas.json
  def index
    @etapatareas = Etapatarea.all
  end

  # GET /etapatareas/1
  # GET /etapatareas/1.json
  def show
  end

  # GET /etapatareas/new
  def new
    @etapatarea = Etapatarea.new
  end

  # GET /etapatareas/1/edit
  def edit
  end

  # POST /etapatareas
  # POST /etapatareas.json
  def create
    @etapatarea = Etapatarea.new(etapatarea_params)

    respond_to do |format|
      if @etapatarea.save
        format.html { redirect_to @etapatarea, notice: 'Etapatarea was successfully created.' }
        format.json { render :show, status: :created, location: @etapatarea }
      else
        format.html { render :new }
        format.json { render json: @etapatarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etapatareas/1
  # PATCH/PUT /etapatareas/1.json
  def update
    respond_to do |format|
      if @etapatarea.update(etapatarea_params)
        format.html { redirect_to @etapatarea, notice: 'Etapatarea was successfully updated.' }
        format.json { render :show, status: :ok, location: @etapatarea }
      else
        format.html { render :edit }
        format.json { render json: @etapatarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etapatareas/1
  # DELETE /etapatareas/1.json
  def destroy
    @etapatarea.destroy
    respond_to do |format|
      format.html { redirect_to etapatareas_url, notice: 'Etapatarea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapatarea
      @etapatarea = Etapatarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etapatarea_params
      params.require(:etapatarea).permit(:pretid, :tarid, :ropeid, :ettaestado, :ettafechacreacion, :ettadescripcion)
    end
end

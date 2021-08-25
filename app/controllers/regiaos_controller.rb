class RegiaosController < ApplicationController
  before_action :set_regiao, only: %i[ show edit update destroy ]

  # GET /regiaos or /regiaos.json
  def index
    @regiaos = Regiao.all
  end

  # GET /regiaos/1 or /regiaos/1.json
  def show
  end

  # GET /regiaos/new
  def new
    @regiao = Regiao.new
  end

  # GET /regiaos/1/edit
  def edit
  end

  # POST /regiaos or /regiaos.json
  def create
    @regiao = Regiao.new(regiao_params)

    respond_to do |format|
      if @regiao.save
        format.html { redirect_to @regiao, notice: "Regiao was successfully created." }
        format.json { render :show, status: :created, location: @regiao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @regiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regiaos/1 or /regiaos/1.json
  def update
    respond_to do |format|
      if @regiao.update(regiao_params)
        format.html { redirect_to @regiao, notice: "Regiao was successfully updated." }
        format.json { render :show, status: :ok, location: @regiao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @regiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regiaos/1 or /regiaos/1.json
  def destroy
    @regiao.destroy
    respond_to do |format|
      format.html { redirect_to regiaos_url, notice: "Regiao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regiao
      @regiao = Regiao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def regiao_params
      params.require(:regiao).permit(:inscricao_lideranca_id, :descricao, :ordem)
    end
end

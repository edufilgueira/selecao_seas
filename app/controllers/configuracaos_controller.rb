class ConfiguracaosController < ApplicationController
  before_action :set_configuracao, only: [:show, :edit, :update, :destroy]

  # GET /configuracaos
  # GET /configuracaos.json
  def index
    @configuracaos = Configuracao.all
  end

  # GET /configuracaos/1
  # GET /configuracaos/1.json
  def show
  end

  # GET /configuracaos/new
  def new
    @configuracao = Configuracao.new
  end

  # GET /configuracaos/1/edit
  def edit
  end

  # POST /configuracaos
  # POST /configuracaos.json
  def create
    @configuracao = Configuracao.new(configuracao_params)

    respond_to do |format|
      if @configuracao.save
        format.html { redirect_to @configuracao, notice: 'Configuracao was successfully created.' }
        format.json { render :show, status: :created, location: @configuracao }
      else
        format.html { render :new }
        format.json { render json: @configuracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuracaos/1
  # PATCH/PUT /configuracaos/1.json
  def update
    respond_to do |format|
      if @configuracao.update(configuracao_params)
        format.html { redirect_to @configuracao, notice: 'Configuracao was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuracao }
      else
        format.html { render :edit }
        format.json { render json: @configuracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuracaos/1
  # DELETE /configuracaos/1.json
  def destroy
    @configuracao.destroy
    respond_to do |format|
      format.html { redirect_to configuracaos_url, notice: 'Configuracao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuracao
      @configuracao = Configuracao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuracao_params
      params.require(:configuracao).permit(:data_inicio_selecao, :data_termino_selecao, :data_termino_recurso, :data_inicio_recurso, :data_inicio_recurso_pontuacao, :data_termino_recurso_pontuacao, :data_inicio_selecao_lideranca, :data_termino_selecao_lideranca, :data_inicio_recurso_lideranca, :data_termino_recurso_lideranca, :data_inicio_entrevista_lideranca, :data_termino_entrevista_lideranca, :data_apresetacao_dados_lideranca, :status)
    end
end

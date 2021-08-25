class LocalContratacaosController < ApplicationController
  before_action :set_local_contratacao, only: %i[ show edit update destroy ]

  # GET /local_contratacaos or /local_contratacaos.json
  def index
    @local_contratacaos = LocalContratacao.all
  end

  # GET /local_contratacaos/1 or /local_contratacaos/1.json
  def show
  end

  # GET /local_contratacaos/new
  def new
    @local_contratacao = LocalContratacao.new
  end

  # GET /local_contratacaos/1/edit
  def edit
  end

  # POST /local_contratacaos or /local_contratacaos.json
  def create
    @local_contratacao = LocalContratacao.new(local_contratacao_params)

    respond_to do |format|
      if @local_contratacao.save
        format.html { redirect_to @local_contratacao, notice: "Local contratacao was successfully created." }
        format.json { render :show, status: :created, location: @local_contratacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local_contratacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_contratacaos/1 or /local_contratacaos/1.json
  def update
    respond_to do |format|
      if @local_contratacao.update(local_contratacao_params)
        format.html { redirect_to @local_contratacao, notice: "Local contratacao was successfully updated." }
        format.json { render :show, status: :ok, location: @local_contratacao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local_contratacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_contratacaos/1 or /local_contratacaos/1.json
  def destroy
    @local_contratacao.destroy
    respond_to do |format|
      format.html { redirect_to local_contratacaos_url, notice: "Local contratacao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_contratacao
      @local_contratacao = LocalContratacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_contratacao_params
      params.require(:local_contratacao).permit(:descricao)
    end
end

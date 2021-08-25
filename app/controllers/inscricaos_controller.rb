class InscricaosController < ApplicationController
  before_action :set_inscricao, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_usuario!, only: [:new, :create, :download_pdf_inscricao, :inscricao_realizada, :solicitar_recurso, :salvar_solicitacao_recurso]

  include PdfInscricao

  # GET /inscricaos
  # GET /inscricaos.json
  def index
    @inscricaos = Inscricao.all.reverse_order
  end
  
  # GET /inscricaos/1
  # GET /inscricaos/1.json
  def show
  end
  
  # GET /inscricaos/new
  def new
    unless usuario_signed_in?
      # if ((Time.now - 3.hour).to_date >= '13/11/2018'.to_date)
      if Time.now.to_date >= '04/08/2020'.to_date
        render partial: 'encerramento'
      else
        @inscricao = Inscricao.new
      end
    end
  end

  # GET /inscricaos/1/edit
  def edit
  end

  # POST /inscricaos
  # POST /inscricaos.json
  def create
    @inscricao = Inscricao.new(inscricao_params)
    
    respond_to do |format|
      if @inscricao.save
        @arquivo = PdfInscricao.gerar_comprovante_inscricao(@inscricao)
        flash[:message] = "mensagem"
        flash[:notice] = "Inscrição nº: #{@inscricao.id} realizada com sucesso. #{view_context.link_to('Clique aqui', download_pdf_inscricao_inscricaos_path(arquivo: @arquivo), class: 'alert-link', target: '_blank')} para baixar o comprovante de inscrição."
        format.html { redirect_to inscricao_realizada_inscricaos_path }
        format.json { redirect_to inscricao_realizada_inscricaos_path, status: :created, location: @inscricao }
      else
        format.html { render :new }
        format.json { render json: @inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscricaos/1
  # PATCH/PUT /inscricaos/1.json
  def update
    respond_to do |format|
      if @inscricao.update(inscricao_params)
        format.html { redirect_to @inscricao, notice: 'Inscricao was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscricao }
      else
        format.html { render :edit }
        format.json { render json: @inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscricaos/1
  # DELETE /inscricaos/1.json
  def destroy
    @inscricao.destroy
    respond_to do |format|
      format.html { redirect_to inscricaos_url, notice: 'Inscricao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_pdf_inscricao
    send_file params[:arquivo]
  end

  def inscricao_realizada
    # este método renderiza uma partial
  end

  def solicitar_recurso
    if Time.now.to_date >= '16/08/2020'.to_date
    # if Time.now >= Time.parse('14/08/2020 10:55:00')
      render partial: 'encerramento'
    else
      if !params[:frm].blank?
        cpf = params[:frm][:cpf]
        @inscricao = Inscricao.find_by_cpf(cpf)
        if @inscricao.blank?
          @msg = "O CPF de nº #{cpf} não foi localizado. Verifique novamente."
        elsif @inscricao.recurso_solicitado?
          @msg = "Já foi realizado a solicitação para o CPF de nº #{cpf}"
        end
      end
    end
  end

  def salvar_solicitacao_recurso
    if !params[:salva].blank?
      @inscricao = Inscricao.find(params[:inscricao_id])
      if @inscricao.update_attributes(recurso_solicitado: true, recurso: params[:salva][:recurso])
        @msg = "Documentação enviada com sucesso."
      else
        @msg = "Ocorreu um erro ao enviar a documentação."
      end
    end
    redirect_to solicitar_recurso_inscricaos_path, notice: @msg
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscricao
      @inscricao = Inscricao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inscricao_params
      params.require(:inscricao).permit(:nome_completo, :naturalidade, :nacionalidade, :nome_mae, :sexo, :estado_civil, :data_nascimento, :cpf, :rg, :orgao_emissor, :endereco, :complemento, :bairro, :cidade, :uf, :cep, :telefone_fixo, :telefone_celular, :email, :formacao, :orgao_representacao_classe, :numero_registro, :termo_aceito, :curriculo, {documentacao: []}, :recurso_solicitado, :recurso)
    end
end

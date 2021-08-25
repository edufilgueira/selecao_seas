class RecursoServidorsController < ApplicationController
  before_action :set_recurso_servidor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_usuario!, only: [:new, :cpf, :buscar_por_cpf, :create, :show]

  # GET /recurso_servidors
  # GET /recurso_servidors.json
  def index
    @recurso_servidors = RecursoServidor.all

    respond_to do |format| 
      format.html
      format.pdf { 
      render pdf: "recursos",
      footer: { center: "[page] de [topage]" },
      encoding: 'utf8',
      orientation: 'Landscape',
      page_size: 'A4',
      default_header: false,
      grayscale: false,
      enable_plugins: true,
      keep_relative_links: true,
      dpi: '300',
      print_media_type: true,
      no_pdf_compression: true,
      image_quality: 10,
      font_size: '30'
    }
    end
  end

  # GET /recurso_servidors/1
  # GET /recurso_servidors/1.json
  def show
  end

  # GET /recurso_servidors/new
  def new
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if Time.now.to_date < configuracao.data_inicio_recurso.to_date or Time.now.to_date >= configuracao.data_termino_recurso.to_date
        render partial: 'encerramento_recurso'
      else
        @inscricao_servidor = InscricaoServidor.where(cpf: params[:cpf]).first
        @recurso_servidor = RecursoServidor.new
      end
    end
    
    @inscricao_servidor = InscricaoServidor.where(cpf: params[:cpf]).first
    if !@inscricao_servidor.nil?
      @cpf_preenchido = true
    else
      @cpf_preenchido = false
    end

    @recurso_servidor = RecursoServidor.new
  end

  # GET /recurso_servidors/1/edit
  def edit
  end

  def cpf
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if Time.now.to_date < configuracao.data_inicio_recurso.to_date or Time.now.to_date >= configuracao.data_termino_recurso.to_date
        render partial: 'encerramento_recurso.html'
      end
    end
  end

  def buscar_por_cpf
    inscricao_servidor = InscricaoServidor.where(cpf: params[:frm][:cpf], ativo: true).last
    if(!inscricao_servidor.nil?)
      redirect_to new_recurso_servidor_url(cpf: params[:frm][:cpf])
    else
      redirect_to new_recurso_servidor_url(cpf: params[:frm][:cpf])
    end
    
  end

  # POST /recurso_servidors
  # POST /recurso_servidors.json
  def create
    @recurso_servidor = RecursoServidor.new(recurso_servidor_params)

    respond_to do |format|
      if @recurso_servidor.save
        format.html { redirect_to @recurso_servidor, notice: 'Recurso solicitado com sucesso.' }
        format.json { render :show, status: :created, location: @recurso_servidor }
      else
        format.html { render :new }
        format.json { render json: @recurso_servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurso_servidors/1
  # PATCH/PUT /recurso_servidors/1.json
  def update
    respond_to do |format|
      if @recurso_servidor.update(recurso_servidor_params)
        format.html { redirect_to @recurso_servidor, notice: 'Recurso servidor was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurso_servidor }
      else
        format.html { render :edit }
        format.json { render json: @recurso_servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurso_servidors/1
  # DELETE /recurso_servidors/1.json
  def destroy
    @recurso_servidor.destroy
    respond_to do |format|
      format.html { redirect_to recurso_servidors_url, notice: 'Recurso servidor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def exportar_csv
    require 'csv' 
    folder = "#{Rails.root}/recurso_csv_export/"
    file = "recursos.csv"
    file_path = folder + file
    FileUtils.mkdir(folder) unless File.exists?(file_path)
    recursos = RecursoServidor.order(:inscricao_servidor_id)
    headers = ["Nº Inscrição", "Nome", "E-mail", "Texto"]
    CSV.open(file_path, 'w', write_headers: true, headers: headers) do |writer|
      recursos.each do |recurso| 
        writer << [recurso.inscricao_servidor.id, recurso.inscricao_servidor.nome_completo, recurso.inscricao_servidor.email, recurso.texto] 
      end
    end

    send_file file_path
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurso_servidor
      @recurso_servidor = RecursoServidor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recurso_servidor_params
      params.require(:recurso_servidor).permit(:inscricao_servidor_id, :texto)
    end
end

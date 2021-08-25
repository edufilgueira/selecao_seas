require "digest"

class InscricaoServidorsController < ApplicationController
  before_action :set_inscricao_servidor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_usuario!, only: [:new, :create, :edit, :update, :destroy, :cpf, :buscar_por_cpf, :selecionar_vagas, :salvar_selecionar_vagas, :update_selecionar_vagas, :edit_selecionar_vagas, :finalizar, :remover_file, :remover_selecionar_vaga ]

  # GET /inscricao_servidors
  # GET /inscricao_servidors.json
  def index
    @inscricao_servidors = InscricaoServidor.select("inscricao_servidors.id serv_id, inscricao_servidors.*, c.descricao nome_cargo").joins(
      "INNER JOIN cargos c ON c.id = inscricao_servidors.cargo_id")
      .where("finalizar = true")
      .order("total_geral_correcao desc, experiencia_profissional_01_correcao desc, experiencia_profissional_02_correcao desc, experiencia_profissional_03_correcao desc, experiencia_profissional_04_correcao desc, experiencia_profissional_05_correcao desc")
      
      respond_to do |format| 
        format.html
        format.pdf { 
        render pdf: "Relatorio_inscricao",
        footer: { center: "[page] de [topage]" },
        encoding: 'utf8',
        orientation: 'Landscape',# default , Landscape, Portrait
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

  def listar_index
    sql = ""
    if(!params[:frm].nil?)
      @cargo_id = params[:frm][:cargo_id]
      @sexo = params[:frm][:sexo]
      @deficiente = params[:frm][:deficiente]
      @status_acompanhamento = params[:frm][:status_acompanhamento]
      @cota_negro = params[:frm][:cota_negro]

      if(!@cargo_id.blank? and !@cargo_id.nil?)
        sql += " and cargo_id = " + @cargo_id
      end

      if(!@sexo.blank?)
        sql += " and inscricao_servidors.sexo ilike '#{@sexo}'" 
      end
      
      if(!@deficiente.blank?)
        if @deficiente == "Sim"
          sql += " and deficiente = true"
        else
          sql += " and deficiente = false"
        end
      end

      if(!@status_acompanhamento.blank?)
        if @status_acompanhamento == "Finalizado"
          sql += " and inscricao_servidors.status_acompanhamento = 'Finalizado'"
        elsif @status_acompanhamento == "inscrito_deferido"
          sql += " and inscricao_servidors.status_acompanhamento = 'Correção de dados'" 
        elsif @status_acompanhamento == "inscrito_indeferido"
          sql += " and inscricao_servidors.status_acompanhamento = 'Desclassificado'" 
        elsif @status_acompanhamento == "recurso_inscricao_apresentado"
          sql += " and recurso_candidato is not null and resposta_recurso_candidato is null"
        elsif @status_acompanhamento == "recurso_inscricao_deferido"
          sql += " and reclassificar_recurso_candidato = true"
        elsif @status_acompanhamento == "recurso_inscricao_indeferido"
          sql += " and reclassificar_recurso_candidato = false"
        elsif @status_acompanhamento == "analise_curriculo"
          sql += " and inscricao_servidors.status_acompanhamento = 'Correção de dados'" 
        elsif @status_acompanhamento == "curriculo_analisado"
          sql += " and inscricao_servidors.status_acompanhamento = 'Correção de pontuação'" 
        elsif @status_acompanhamento == "recurso_curriculo_apresentado"
          sql += " and recurso_pontuacao is not null and resposta_recurso_pontuacao is null"
        elsif @status_acompanhamento == "recurso_curriculo_deferido"
          sql += " and reclassificar_recurso_pontuacao = true"
        elsif @status_acompanhamento == "recurso_curriculo_indeferido"
          sql += " and reclassificar_recurso_pontuacao = false"
        elsif @status_acompanhamento == "resultado_final"
          sql += " and inscricao_servidors.status_acompanhamento = 'Correção de pontuação'" 
        else
          sql += " and inscricao_servidors.status_acompanhamento = '#{@status_acompanhamento}'" 
        end
      end

      if(@cota_negro == "1")
        sql += " and inscricao_servidors.cota_negro = true"
      end
      
    end
    
    @inscricao_servidors = InscricaoServidor.select("inscricao_servidors.id serv_id, inscricao_servidors.*, c.descricao nome_cargo").joins(
      "LEFT JOIN cargos c ON c.id = inscricao_servidors.cargo_id")
      .where("finalizar = true" + sql)
      .order("total_geral_correcao desc, experiencia_profissional_01_correcao desc, experiencia_profissional_02_correcao desc, experiencia_profissional_03_correcao desc, experiencia_profissional_04_correcao desc, experiencia_profissional_05_correcao desc")

    render "index"
  end

  def nao_finalizados
    @inscricao_servidors = InscricaoServidor.where("finalizar is not true").order("nome_completo")
  end

  # GET /inscricao_servidors/1
  # GET /inscricao_servidors/1.json
  def show
    @inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
  end

  # GET /inscricao_servidors/new
  def new
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if configuracao.nil?
        render partial: 'notificar_ausencia_data'
      else
        if Time.now.to_date >= configuracao.data_termino_selecao.to_date
          render partial: 'encerramento'
        else
          @inscricao_servidor = InscricaoServidor.new
        end
      end
    end
    @inscricao_servidor = InscricaoServidor.new
  end

  # GET /inscricao_servidors/1/edit
  def edit
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if configuracao.nil?
        render partial: 'notificar_ausencia_data'
      end
    end
    @inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
    @id = params[:id]
  end

  def edit_correcao
    @inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
    @id = params[:id]
  end

  def cpf
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if configuracao.nil?
        render partial: 'notificar_ausencia_data'
      end
    end
  end

  def finalizar
    inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
    inscricao_servidor.finalizar = true
    inscricao_servidor.status_acompanhamento = "Finalizado"
    inscricao_servidor.save
    redirect_to edit_inscricao_servidor_path(inscricao_servidor.slug)
  end

  def analisar_dados_obs
    inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
    if(!params[:observacao].nil?)
      inscricao_servidor.observacao = params[:observacao]
    end
    
    if !params[:resposta_recurso_candidato].blank?
      inscricao_servidor.resposta_recurso_candidato = params[:resposta_recurso_candidato]
    end

    if !params[:resposta_recurso_pontuacao].blank?
      inscricao_servidor.resposta_recurso_pontuacao = params[:resposta_recurso_pontuacao]
    end
    
    if params[:desclassificar] == "Indeferir"
      inscricao_servidor.status_acompanhamento = "Desclassificado"
    elsif params[:desclassificar] == "Deferir"
      inscricao_servidor.status_acompanhamento = "Correção de dados"
    end

    if params[:reclassificar_fase_1] == "Deferir"
      inscricao_servidor.reclassificar_recurso_candidato = true
      inscricao_servidor.status_acompanhamento = "Correção de dados"
    elsif params[:reclassificar_fase_1] == "Indeferir"
      inscricao_servidor.reclassificar_recurso_candidato = false
      inscricao_servidor.status_acompanhamento = "Desclassificado"
    end

    if params[:reclassificar_fase_2] == "Deferir"
      inscricao_servidor.reclassificar_recurso_pontuacao = true
    elsif params[:reclassificar_fase_2] == "Indeferir"
      inscricao_servidor.reclassificar_recurso_pontuacao = false
    end
    inscricao_servidor.usuario_corrigiu_dados = current_usuario[:id]
    inscricao_servidor.save
    redirect_to inscricao_servidors_path()
  end

  def correcao(slug)
    inscricao_servidor = InscricaoServidor.find_by(slug: slug)
    inscricao_servidor.status_acompanhamento = "Correção de pontuação"
    inscricao_servidor.usuario_corrigiu_pontuacao = current_usuario[:id]
    inscricao_servidor.save
    #redirect_to inscricao_servidors_path()
  end

  # POST /inscricao_servidors
  # POST /inscricao_servidors.json
  def create
    @inscricao_servidor = InscricaoServidor.new(inscricao_servidor_params)
    respond_to do |format|
      if @inscricao_servidor.save
        id_crypto = Digest::MD5.hexdigest(@inscricao_servidor.id.to_s)
        slug = "#{id_crypto}_" + remover_acentos(@inscricao_servidor.nome_completo)
        slug = slug.strip
        nome_completo = @inscricao_servidor.nome_completo.strip
        InscricaoServidor.find(@inscricao_servidor.id).update_attributes(nome_completo: nome_completo, slug: slug)
        #format.html { redirect_to selecionar_vagas_inscricao_servidors_path(inscricao_servidor_id: slug, notice: 'Cadastro realizado com sucesso. Agora você pode adicionar os cargos através do botão <b>Adicionar cargos</b> ou voltar para tela de cadastro através do botão <b>Voltar para alterar Inscrição</b>.') }
        format.html { redirect_to edit_inscricao_servidor_path(slug) }
        format.json { render :show, status: :created, location: @inscricao_servidor }
      else
        format.html { render :new }
        format.json { render json: @inscricao_servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscricao_servidors/1
  # PATCH/PUT /inscricao_servidors/1.json
  def update
    @inscricao_servidor = InscricaoServidor.where(slug: inscricao_servidor_params[:slug])[0]
    
    # DELETA O ARQUIVO AO MUDAR O CARGO PARA GARANTIR APENAS UM CERTIFICADO DE ENSINO
    if @inscricao_servidor.cargo_id == 4
      @inscricao_servidor.remove_certificado_ensino_superior!
    elsif
      @inscricao_servidor.remove_certificado_ensino_medio!
    end
    respond_to do |format|
      inscricao_servidor = inscricao_servidor_params
      id_crypto = Digest::MD5.hexdigest(@inscricao_servidor.id.to_s)
      slug = "#{id_crypto}_" + remover_acentos(@inscricao_servidor.nome_completo)
      slug = slug.strip
      inscricao_servidor[:slug] = slug
      inscricao_servidor[:nome_completo] = @inscricao_servidor.nome_completo.strip
      if inscricao_servidor_params[:recurso_candidato].blank?
        inscricao_servidor.delete("recurso_candidato")
      end
      if inscricao_servidor_params[:recurso_pontuacao].blank?
        inscricao_servidor.delete("recurso_pontuacao")
      end
      if inscricao_servidor_params[:deficiente] != "1"
        @inscricao_servidor.remove_deficiente_anexo!
      end 

      if @inscricao_servidor.update(inscricao_servidor)
        if params[:commit] == "Finalizar Correção"
          correcao(params[:id])
          #VERIFICA SE A PAGINA FOI CHAMADA PELA REVIÃO DA PONTUAÇÃO, PARA FECHAR A PAGINA INDEX COM window.close(); APÓS CARREGA-LA.
          if !params[:fase].nil? and params[:fase] == "revisao"
            format.html { redirect_to inscricao_servidors_path(fase:"revisao") }
          else
            format.html { redirect_to inscricao_servidors_path() }
          end
          format.json { render :edit, status: :ok, location: @inscricao_servidor }
        else
          format.html { redirect_to edit_inscricao_servidor_path(@inscricao_servidor.slug) }
          format.json { render :edit, status: :ok, location: @inscricao_servidor }
        end
      else
        format.html { redirect_to edit_inscricao_servidor_path(@inscricao_servidor.slug, mensagem_erro: @inscricao_servidor.errors.full_messages) }
      end
    end
  end
  
  # DELETE /inscricao_servidors/1
  # DELETE /inscricao_servidors/1.json
  def destroy
    @inscricao_servidor.destroy
    respond_to do |format|
      format.html { redirect_to inscricao_servidors_url, notice: 'Inscricao servidor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buscar_por_cpf
    cpf = params[:frm][:cpf].nil? ? "" : params[:frm][:cpf]
    inscricao = params[:frm][:inscricao].nil? ? "" : params[:frm][:inscricao]
    tipo = params[:tipo].nil? ? "" : params[:tipo]
    data_nascimento = params[:frm][:data_nascimento].nil? ? "" : params[:frm][:data_nascimento]
    if verify_rucaptcha?
      if params[:tipo] == "novo"
        inscricao_servidor = InscricaoServidor.where(cpf: cpf, ativo: true).last
        if(inscricao_servidor.nil?)
          redirect_to new_inscricao_servidor_url(cpf: cpf)
        elsif(!inscricao_servidor.finalizar)
          redirect_to edit_inscricao_servidor_url(inscricao_servidor.slug)
        elsif(inscricao_servidor.finalizar)
          redirect_to "/?alert=Já existe CPF com esta inscrição. Favor selecione a opção consultar."
        end
      else
        data_nascimento = "1111-11-11"
        if(!params[:frm][:data_nascimento].blank?)
          data_nascimento = DateTime.parse(params[:frm][:data_nascimento]).strftime('%Y-%m-%d')
        end
        inscricao = inscricao.blank? ? "0" : inscricao
        inscricao_servidor = InscricaoServidor.where("cpf = '"+cpf.to_s+"' and (id = "+inscricao+" or data_nascimento = '"+data_nascimento+"') and ativo = true").last
        if(inscricao_servidor.nil?)
          redirect_to "/?cpf="+cpf+"&inscricao="+inscricao+"&tipo="+tipo+"&data_nascimento="+data_nascimento+"&alert=CPF ou Nº de Inscrição estão incorretos."
        else
          redirect_to edit_inscricao_servidor_url(inscricao_servidor.slug)
        end
      end
    else
      
      redirect_to "/?cpf="+cpf+"&inscricao="+inscricao+"&tipo="+tipo+"&data_nascimento="+data_nascimento+"&alert=Código incorreto."
    end 
  end

  def selecionar_vagas
    if usuario_signed_in?
      if(!params[:novo].nil?)
        @novo = params[:novo]
        @selecionar_vaga = SelecionarVaga.new
      end
      @selecionar_vagas = SelecionarVaga.where(inscricao_servidor_id: params[:inscricao_servidor_id])
      @inscricao_servidor_id = params[:inscricao_servidor_id]
    else
      render partial: 'encerramento'
    end
  end

  def remover_file

    inscricao_servidor = InscricaoServidor.where(slug: params[:slug])[0]

    case params[:file]
    when "formacao_academica_01_file"
      inscricao_servidor.remove_formacao_academica_01_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_01_candidato.to_i
      inscricao_servidor.formacao_academica_01_candidato = 0.0
    when "formacao_academica_02_file"
      inscricao_servidor.remove_formacao_academica_02_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_02_candidato.to_i
      inscricao_servidor.formacao_academica_02_candidato = 0.0
    when "formacao_academica_03_file"
      inscricao_servidor.remove_formacao_academica_03_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_03_candidato.to_i
      inscricao_servidor.formacao_academica_03_candidato = 0.0
    when "formacao_academica_04_file"
      inscricao_servidor.remove_formacao_academica_04_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_04_candidato.to_i
      inscricao_servidor.formacao_academica_04_candidato = 0.0
    when "formacao_academica_05_file"
      inscricao_servidor.remove_formacao_academica_05_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_05_candidato.to_i
      inscricao_servidor.formacao_academica_05_candidato = 0.0
    when "formacao_academica_06_file"
      inscricao_servidor.remove_formacao_academica_06_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_06_candidato.to_i
      inscricao_servidor.formacao_academica_06_candidato = 0.0
    when "formacao_academica_07_file"
      inscricao_servidor.remove_formacao_academica_07_file!
      inscricao_servidor.formacao_academica_soma_candidato = inscricao_servidor.formacao_academica_soma_candidato.to_i - inscricao_servidor.formacao_academica_07_candidato.to_i
      inscricao_servidor.formacao_academica_07_candidato = 0.0

    when "qualificacao_profissional_01_file"
      inscricao_servidor.remove_qualificacao_profissional_01_file!
      inscricao_servidor.qualificacao_profissional_soma_candidato = inscricao_servidor.qualificacao_profissional_soma_candidato.to_i - inscricao_servidor.qualificacao_profissional_01_candidato.to_i
      inscricao_servidor.qualificacao_profissional_01_candidato = 0.0
    when "qualificacao_profissional_02_file"
      inscricao_servidor.remove_qualificacao_profissional_02_file!
      inscricao_servidor.qualificacao_profissional_soma_candidato = inscricao_servidor.qualificacao_profissional_soma_candidato.to_i - inscricao_servidor.qualificacao_profissional_02_candidato.to_i
      inscricao_servidor.qualificacao_profissional_02_candidato = 0.0
    when "qualificacao_profissional_03_file"
      inscricao_servidor.remove_qualificacao_profissional_03_file!
      inscricao_servidor.qualificacao_profissional_soma_candidato = inscricao_servidor.qualificacao_profissional_soma_candidato.to_i - inscricao_servidor.qualificacao_profissional_03_candidato.to_i
      inscricao_servidor.qualificacao_profissional_03_candidato = 0.0
    when "qualificacao_profissional_04_file"
      inscricao_servidor.remove_qualificacao_profissional_04_file!
      inscricao_servidor.qualificacao_profissional_soma_candidato = inscricao_servidor.qualificacao_profissional_soma_candidato.to_i - inscricao_servidor.qualificacao_profissional_04_candidato.to_i
      inscricao_servidor.qualificacao_profissional_04_candidato = 0.0
    
    when "experiencia_profissional_01_file"
      inscricao_servidor.remove_experiencia_profissional_01_file!
      inscricao_servidor.experiencia_profissional_soma_candidato = inscricao_servidor.experiencia_profissional_soma_candidato.to_i - inscricao_servidor.experiencia_profissional_01_candidato.to_i
      inscricao_servidor.experiencia_profissional_01_candidato = 0.0
    when "experiencia_profissional_02_file"
      inscricao_servidor.remove_experiencia_profissional_02_file!
      inscricao_servidor.experiencia_profissional_soma_candidato = inscricao_servidor.experiencia_profissional_soma_candidato.to_i - inscricao_servidor.experiencia_profissional_02_candidato.to_i
      inscricao_servidor.experiencia_profissional_02_candidato = 0.0
    when "experiencia_profissional_03_file"
      inscricao_servidor.remove_experiencia_profissional_03_file!
      inscricao_servidor.experiencia_profissional_soma_candidato = inscricao_servidor.experiencia_profissional_soma_candidato.to_i - inscricao_servidor.experiencia_profissional_03_candidato.to_i
      inscricao_servidor.experiencia_profissional_03_candidato = 0.0
    when "experiencia_profissional_04_file"
      inscricao_servidor.remove_experiencia_profissional_04_file!
      inscricao_servidor.experiencia_profissional_soma_candidato = inscricao_servidor.experiencia_profissional_soma_candidato.to_i - inscricao_servidor.experiencia_profissional_04_candidato.to_i
      inscricao_servidor.experiencia_profissional_04_candidato = 0.0
    when "experiencia_profissional_05_file"
      inscricao_servidor.remove_experiencia_profissional_05_file!
      inscricao_servidor.experiencia_profissional_soma_candidato = inscricao_servidor.experiencia_profissional_soma_candidato.to_i - inscricao_servidor.experiencia_profissional_05_candidato.to_i
      inscricao_servidor.experiencia_profissional_05_candidato = 0.0
    end
    
    if !params[:file].nil?
      inscricao_servidor.save
    end
    
    redirect_to edit_inscricao_servidor_url(inscricao_servidor.slug)
  end

  def edit_selecionar_vagas
    @selecionar_vaga = SelecionarVaga.find(params[:selecionar_vaga_id])
    @novo = params[:selecionar_vaga_id]
    @inscricao_servidor_id = params[:inscricao_servidor_id]
    @selecionar_vagas = SelecionarVaga.where(inscricao_servidor_id: params[:inscricao_servidor_id])
  end

  def edit_selecionar_vaga_correcao
    @selecionar_vaga = SelecionarVaga.find(params[:selecionar_vaga_id])
    @novo = params[:selecionar_vaga_id]
    @inscricao_servidor_id = params[:inscricao_servidor_id]
    @selecionar_vagas = SelecionarVaga.where(inscricao_servidor_id: params[:inscricao_servidor_id])
  end

  def selecionar_vaga_correcao
    if(!params[:novo].nil?)
      @novo = params[:novo]
      @selecionar_vaga = SelecionarVaga.new
    end
    @selecionar_vagas = SelecionarVaga.where(inscricao_servidor_id: params[:inscricao_servidor_id])
    @inscricao_servidor_id = params[:inscricao_servidor_id]
  end

  def resgate
    
    @correto = []
    @errado = []
    @correto_finalizado = []
    @errado_finalizado = []
    
    inscricoes = InscricaoServidor.all
    inscricoes.each do |inscricao|
      dir = "#{Rails.root}/public/uploads/inscricao_servidor/documentos/#{inscricao.id}"
      if Dir.exist?(dir)
        @correto.push(inscricao.id)
      else
        @errado.push(inscricao.id)
      end
    end

    inscricoes = InscricaoServidor.where(finalizar: true)
    inscricoes.each do |inscricao|
      dir = "#{Rails.root}/public/uploads/inscricao_servidor/documentos/#{inscricao.id}"
      if Dir.exist?(dir)
        @correto_finalizado.push(inscricao.id)
      else
        @errado_finalizado.push(inscricao.id)
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscricao_servidor
      if ((!params[:id].to_s == "update_selecionar_vagas") or (!params[:id].to_s == "update_selecionar_vaga_correcao"))
        #@inscricao_servidor = InscricaoServidor.find(params[:id])
        @inscricao_servidor = InscricaoServidor.find_by(slug: params[:id])
      # else
      #  @selecionar_vaga = SelecionarVaga.find(params[:selecionar_vaga][:id])
      end
    end
    
    # Only allow a list of trusted parameters through.
    def inscricao_servidor_params
      params.require(:inscricao_servidor).permit(:nome_completo, :naturalidade, :nacionalidade, :nome_mae, :sexo, :estado_civil, :data_nascimento, :cpf, :rg, :orgao_emissor, :endereco, :complemento, :bairro, :cidade, :uf, :cep, :telefone_fixo, :telefone_celular, :email, :orgao_representacao_classe, :numero_registro, :termo_aceito, :curriculo, :recurso_solicitado, :recurso, :documentos, :slug, :deficiente, :deficiente_anexo, :cargo_id, :formacao_academica_01_candidato, :formacao_academica_01_correcao, :represetacao_classe, :represetacao_classe_cache, :formacao_academica_02_candidato, :formacao_academica_02_correcao, :formacao_academica_03_candidato, :formacao_academica_03_correcao, :formacao_academica_04_candidato, :formacao_academica_04_correcao, :formacao_academica_05_candidato, :formacao_academica_05_correcao, :formacao_academica_06_candidato, :formacao_academica_06_correcao, :formacao_academica_07_candidato, :formacao_academica_07_correcao, :qualificacao_profissional_01_candidato, :qualificacao_profissional_01_correcao, :qualificacao_profissional_02_candidato, :qualificacao_profissional_02_correcao, :qualificacao_profissional_03_candidato, :qualificacao_profissional_03_correcao, :qualificacao_profissional_04_candidato, :qualificacao_profissional_04_correcao, :experiencia_profissional_01_candidato, :experiencia_profissional_02_candidato, :experiencia_profissional_03_candidato, :experiencia_profissional_04_candidato, :experiencia_profissional_05_candidato, :experiencia_profissional_01_correcao, :experiencia_profissional_02_correcao, :experiencia_profissional_03_correcao, :experiencia_profissional_04_correcao, :experiencia_profissional_05_correcao, {formacao_academica_01_file: []}, {formacao_academica_02_file: []}, {formacao_academica_03_file: []}, {formacao_academica_04_file: []},{formacao_academica_05_file: []}, {formacao_academica_06_file: []}, {formacao_academica_07_file: []}, {qualificacao_profissional_01_file: []}, {qualificacao_profissional_02_file: []}, {qualificacao_profissional_03_file: []}, {qualificacao_profissional_04_file: []}, {experiencia_profissional_01_file: []}, {experiencia_profissional_02_file: []}, {experiencia_profissional_03_file: []}, {experiencia_profissional_04_file: []}, {experiencia_profissional_05_file: []}, :formacao_academica_total, :qualificacao_profissional_total, :experiencia_profissional_total, :formacao_academica_soma_candidato, :qualificacao_profissional_soma_candidato, :experiencia_profissional_soma_candidato, :formacao_academica_soma_correcao, :qualificacao_profissional_soma_correcao, :experiencia_profissional_soma_correcao, :formacao_academica_01_verificar, :formacao_academica_02_verificar, :formacao_academica_03_verificar, :formacao_academica_04_verificar, :formacao_academica_05_verificar, :formacao_academica_06_verificar, :formacao_academica_07_verificar,:qualificacao_profissional_01_verificar, :qualificacao_profissional_02_verificar, :qualificacao_profissional_03_verificar, :qualificacao_profissional_04_verificar, :experiencia_profissional_01_verificar, :experiencia_profissional_02_verificar, :experiencia_profissional_03_verificar, :experiencia_profissional_04_verificar, :experiencia_profissional_05_verificar, :formacao_academica_01_obs, :formacao_academica_02_obs, :formacao_academica_03_obs, :formacao_academica_04_obs, :formacao_academica_05_obs,:formacao_academica_06_obs, :formacao_academica_07_obs, :qualificacao_profissional_01_obs, :qualificacao_profissional_02_obs, :qualificacao_profissional_03_obs, :qualificacao_profissional_04_obs, :experiencia_profissional_01_obs, :experiencia_profissional_02_obs, :experiencia_profissional_03_obs, :experiencia_profissional_04_obs, :experiencia_profissional_05_obs, :formacao_academica_01_resposta, :formacao_academica_02_resposta, :formacao_academica_03_resposta, :formacao_academica_04_resposta, :formacao_academica_05_resposta,:formacao_academica_06_resposta, :formacao_academica_07_resposta, :qualificacao_profissional_01_resposta, :qualificacao_profissional_02_resposta, :qualificacao_profissional_03_resposta, :qualificacao_profissional_04_resposta, :experiencia_profissional_01_resposta, :experiencia_profissional_02_resposta, :experiencia_profissional_03_resposta, :experiencia_profissional_04_resposta, :experiencia_profissional_05_resposta, :total_geral_candidato, :total_geral_correcao, :certificado_ensino_medio, :certificado_ensino_superior, :recurso_candidato, :resposta_recurso_candidato, :reclassificar_recurso_candidato, :recurso_pontuacao, :resposta_recurso_pontuacao, :reclassificar_recurso_pontuacao, :formacao_academica_01_file_cache, :formacao_academica_02_file_cache, :formacao_academica_03_file_cache, :formacao_academica_04_file_cache, :formacao_academica_05_file_cache, :formacao_academica_06_file_cache, :formacao_academica_07_file_cache, :qualificacao_profissional_01_file_cache, :qualificacao_profissional_02_file_cache, :qualificacao_profissional_03_file_cache, :qualificacao_profissional_04_file_cache, :experiencia_profissional_01_file_cache, :experiencia_profissional_02_file_cache, :experiencia_profissional_03_file_cache, :experiencia_profissional_04_file_cache, :experiencia_profissional_05_file_cache, :documentos_cache, :deficiente_anexo_cache, :certificado_ensino_superior_cache, :certificado_ensino_medio_cache, :cota_negro)
    end

end

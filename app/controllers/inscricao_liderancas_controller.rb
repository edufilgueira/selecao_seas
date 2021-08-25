require "digest"

class InscricaoLiderancasController < ApplicationController
  before_action :set_inscricao_lideranca, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_usuario!, only: [:new, :create, :edit, :update, :destroy, :cpf, :buscar_por_cpf, :selecionar_vagas, :salvar_selecionar_vagas, :update_selecionar_vagas, :edit_selecionar_vagas, :finalizar, :remover_file, :remover_selecionar_vaga ]

  # GET /inscricao_liderancas or /inscricao_liderancas.json
  def index 
    @inscricao_liderancas = InscricaoLideranca.select("inscricao_liderancas.id serv_id, inscricao_liderancas.*, c.descricao nome_cargo").joins(
      "INNER JOIN cargos c ON c.id = inscricao_liderancas.cargo_id")
      .where("finalizar = true")
      .order("total_geral_correcao desc, experiencia_profissional_01_correcao desc, experiencia_profissional_02_correcao desc, experiencia_profissional_03_correcao desc")
      
      respond_to do |format| 
        format.html
        format.pdf { 
        render pdf: "Relatorio_inscricao",
        footer: { center: "[page] de [topage]" },
        encoding: 'utf8',
        orientation: 'Portrait',# default , Landscape, Portrait
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
        sql += " and inscricao_liderancas.sexo ilike '#{@sexo}'" 
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
          sql += " and inscricao_liderancas.status_acompanhamento = 'Finalizado'"
        elsif @status_acompanhamento == "inscrito_deferido"
          sql += " and inscricao_liderancas.status_acompanhamento = 'Correção de dados'" 
        elsif @status_acompanhamento == "inscrito_indeferido"
          sql += " and inscricao_liderancas.status_acompanhamento = 'Desclassificado'" 
        elsif @status_acompanhamento == "recurso_inscricao_apresentado"
          sql += " and recurso_candidato_dados is not null and resposta_recurso_candidato_dados is null"
        elsif @status_acompanhamento == "recurso_inscricao_deferido"
          sql += " and reclassificar_recurso_candidato_dados = true"
        elsif @status_acompanhamento == "recurso_inscricao_indeferido"
          sql += " and reclassificar_recurso_candidato_dados = false"
        elsif @status_acompanhamento == "analise_curriculo"
          sql += " and inscricao_liderancas.status_acompanhamento = 'Correção de dados'" 
        elsif @status_acompanhamento == "curriculo_analisado"
          sql += " and inscricao_liderancas.status_acompanhamento = 'Correção de pontuação'" 
        elsif @status_acompanhamento == "recurso_curriculo_apresentado"
          sql += " and recurso_pontuacao is not null and resposta_recurso_entrevista is null"
        elsif @status_acompanhamento == "recurso_curriculo_deferido"
          sql += " and reclassificar_recurso_entrevista = true"
        elsif @status_acompanhamento == "recurso_curriculo_indeferido"
          sql += " and reclassificar_recurso_entrevista = false"
        elsif @status_acompanhamento == "resultado_final"
          sql += " and inscricao_liderancas.status_acompanhamento = 'Correção de pontuação'" 
        else
          sql += " and inscricao_liderancas.status_acompanhamento = '#{@status_acompanhamento}'" 
        end
      end

      if(@cota_negro == "1")
        sql += " and inscricao_liderancas.cota_negro = true"
      end
      
    end
    
    @inscricao_liderancas = InscricaoLideranca.select("inscricao_liderancas.id serv_id, inscricao_liderancas.*, c.descricao nome_cargo").joins(
      "LEFT JOIN cargos c ON c.id = inscricao_liderancas.cargo_id")
      .where("finalizar = true" + sql)
      .order("total_geral_correcao desc, experiencia_profissional_01_correcao desc, experiencia_profissional_02_correcao desc, experiencia_profissional_03_correcao desc")

    render "index"
  end

  def nao_finalizados
    @inscricao_liderancas = InscricaoLideranca.where("finalizar is not true").order("nome_completo")
  end

  # GET /inscricao_liderancas/1 or /inscricao_liderancas/1.json
  def show
    @inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    @id = params[:id]
  end

  def mostrar_lideranca
    @inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    @id = params[:id]
    render "show"
  end

  # GET /inscricao_liderancas/new
  def new
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if configuracao.nil?
        render partial: 'notificar_ausencia_data'
      else
        if Time.now.to_date >= configuracao.data_termino_selecao.to_date
          render partial: 'encerramento'
        else
          @inscricao_lideranca = InscricaoLideranca.new
          @inscricao_lideranca.regiaos.build
        end
      end
    end
    @inscricao_lideranca = InscricaoLideranca.new
    @inscricao_lideranca.regiaos.build
  end

  # GET /inscricao_liderancas/1/edit
  def edit
    unless usuario_signed_in?
      configuracao = Configuracao.where(status: true).last
      if configuracao.nil?
        render partial: 'notificar_ausencia_data'
      end
    end
    @inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    @id = params[:id]
  end

  def edit_correcao
    @inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
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
    inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    inscricao_lideranca.finalizar = true
    inscricao_lideranca.status_acompanhamento = "Finalizado"
    inscricao_lideranca.save
    redirect_to edit_inscricao_lideranca_path(inscricao_lideranca.slug)
  end

  def analisar_dados_obs
    inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    if(!params[:observacao].nil?)
      inscricao_lideranca.observacao = params[:observacao]
    end
    
    if !params[:resposta_recurso_candidato_dados].blank?
      inscricao_lideranca.resposta_recurso_candidato_dados = params[:resposta_recurso_candidato_dados]
    end

    if !params[:resposta_recurso_entrevista].blank?
      inscricao_lideranca.resposta_recurso_entrevista = params[:resposta_recurso_entrevista]
    end
    
    if params[:desclassificar] == "Indeferir"
      inscricao_lideranca.status_acompanhamento = "Desclassificado"
    elsif params[:desclassificar] == "Deferir"
      inscricao_lideranca.status_acompanhamento = "Correção de dados"
    end

    if params[:reclassificar_fase_1] == "Deferir"
      inscricao_lideranca.reclassificar_recurso_candidato_dados = true
      inscricao_lideranca.status_acompanhamento = "Correção de dados"
    elsif params[:reclassificar_fase_1] == "Indeferir"
      inscricao_lideranca.reclassificar_recurso_candidato_dados = false
      inscricao_lideranca.status_acompanhamento = "Desclassificado"
    end

    if params[:reclassificar_fase_2] == "Deferir"
      inscricao_lideranca.reclassificar_recurso_entrevista = true
    elsif params[:reclassificar_fase_2] == "Indeferir"
      inscricao_lideranca.reclassificar_recurso_entrevista = false
    end
    inscricao_lideranca.usuario_corrigiu_dados = current_usuario[:id]
    inscricao_lideranca.save
    redirect_to inscricao_liderancas_path()
  end

  def correcao(slug)
    inscricao_lideranca = InscricaoLideranca.find_by(slug: slug)
    inscricao_lideranca.status_acompanhamento = "Correção de pontuação"
    inscricao_lideranca.usuario_corrigiu_entrevista = current_usuario[:id]
    inscricao_lideranca.save
    #redirect_to inscricao_liderancas_path()
  end

  # POST /inscricao_liderancas or /inscricao_liderancas.json
  def create
    @inscricao_lideranca = InscricaoLideranca.new(inscricao_lideranca_params)
    respond_to do |format|
      if @inscricao_lideranca.save
        id_crypto = Digest::MD5.hexdigest(@inscricao_lideranca.id.to_s)
        slug = "#{id_crypto}_" + remover_acentos(@inscricao_lideranca.nome_completo)
        slug = slug.strip
        nome_completo = @inscricao_lideranca.nome_completo.strip
        InscricaoLideranca.find(@inscricao_lideranca.id).update_attributes(nome_completo: nome_completo, slug: slug)
        #format.html { redirect_to selecionar_vagas_inscricao_liderancas_path(inscricao_lideranca_id: slug, notice: 'Cadastro realizado com sucesso. Agora você pode adicionar os cargos através do botão <b>Adicionar cargos</b> ou voltar para tela de cadastro através do botão <b>Voltar para alterar Inscrição</b>.') }
        format.html { redirect_to edit_inscricao_lideranca_path(slug) }
        format.json { render :show, status: :created, location: @inscricao_lideranca }
      else
        format.html { render :new }
        format.json { render json: @inscricao_lideranca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscricao_liderancas/1 or /inscricao_liderancas/1.json
  def update
    @inscricao_lideranca = InscricaoLideranca.where(slug: inscricao_lideranca_params[:slug])[0]

    respond_to do |format|
      inscricao_lideranca = inscricao_lideranca_params
      id_crypto = Digest::MD5.hexdigest(@inscricao_lideranca.id.to_s)
      slug = "#{id_crypto}_" + remover_acentos(@inscricao_lideranca.nome_completo)
      slug = slug.strip
      inscricao_lideranca[:slug] = slug
      inscricao_lideranca[:nome_completo] = @inscricao_lideranca.nome_completo.strip
      
      # if inscricao_lideranca_params[:recurso_candidato].blank?
      #   inscricao_lideranca.delete("recurso_candidato")
      # end
      # if inscricao_lideranca_params[:recurso_pontuacao].blank?
      #   inscricao_lideranca.delete("recurso_pontuacao")
      # end
      # if inscricao_lideranca_params[:deficiente] != "1"
      #   @inscricao_lideranca.remove_deficiente_anexo!
      # end 

      if @inscricao_lideranca.update(inscricao_lideranca)
        if params[:commit] == "Finalizar Correção"
          correcao(@inscricao_lideranca.slug)
          #VERIFICA SE A PAGINA FOI CHAMADA PELA REVIÃO DA PONTUAÇÃO, PARA FECHAR A PAGINA INDEX COM window.close(); APÓS CARREGA-LA.
          if !params[:fase].nil? and params[:fase] == "revisao"
            format.html { redirect_to inscricao_liderancas_path(fase:"revisao") }
          else
            format.html { redirect_to inscricao_liderancas_path() }
          end
          format.json { render :edit, status: :ok, location: @inscricao_lideranca }
        else
          format.html { redirect_to edit_inscricao_lideranca_path(@inscricao_lideranca.slug) }
          format.json { render :edit, status: :ok, location: @inscricao_lideranca }
        end
      else
        format.html { redirect_to edit_inscricao_lideranca_path(@inscricao_lideranca.slug, mensagem_erro: @inscricao_lideranca.errors.full_messages) }
      end
    end
  end

  # DELETE /inscricao_liderancas/1 or /inscricao_liderancas/1.json
  def destroy
    @inscricao_lideranca.destroy
    respond_to do |format|
      format.html { redirect_to inscricao_liderancas_url, notice: "Inscricao lideranca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def deletar_regiao
    regiao = Regiao.find(params[:id])
    inscricao_lideranca = InscricaoLideranca.find(regiao.inscricao_lideranca_id)
    # raise inscricao_lideranca.slug.inspect
    if regiao.destroy
      redirect_to edit_inscricao_lideranca_path(inscricao_lideranca.slug), notice: I18n.t("messages.delecao_sucesso")
    end
  end

  def buscar_por_cpf
    cpf = params[:frm][:cpf].nil? ? "" : params[:frm][:cpf]
    inscricao = params[:frm][:inscricao].nil? ? "" : params[:frm][:inscricao]
    tipo = params[:tipo].nil? ? "" : params[:tipo]
    data_nascimento = params[:frm][:data_nascimento].nil? ? "" : params[:frm][:data_nascimento]
    if verify_rucaptcha?
      if params[:tipo] == "novo"
        inscricao_lideranca = InscricaoLideranca.where(cpf: cpf, ativo: true).last
        if(inscricao_lideranca.nil?)
          redirect_to new_inscricao_lideranca_url(cpf: cpf)
        elsif(!inscricao_lideranca.finalizar)
          redirect_to edit_inscricao_lideranca_url(inscricao_lideranca.slug)
        elsif(inscricao_lideranca.finalizar)
          redirect_to "/?alert=Já existe CPF com esta inscrição. Favor selecione a opção consultar."
        end
      else
        data_nascimento = "1111-11-11"
        if(!params[:frm][:data_nascimento].blank?)
          data_nascimento = DateTime.parse(params[:frm][:data_nascimento]).strftime('%Y-%m-%d')
        end
        inscricao = inscricao.blank? ? "0" : inscricao
        inscricao_lideranca = InscricaoLideranca.where("cpf = '"+cpf.to_s+"' and (id = "+inscricao+" or data_nascimento = '"+data_nascimento+"') and ativo = true").last
        if(inscricao_lideranca.nil?)
          redirect_to "/?cpf="+cpf+"&inscricao="+inscricao+"&tipo="+tipo+"&data_nascimento="+data_nascimento+"&alert=CPF ou Nº de Inscrição estão incorretos."
        else
          redirect_to edit_inscricao_lideranca_url(inscricao_lideranca.slug)
        end
      end
    else
      
      redirect_to "/?cpf="+cpf+"&inscricao="+inscricao+"&tipo="+tipo+"&data_nascimento="+data_nascimento+"&alert=Código incorreto."
    end 
  end

  def remover_file

    inscricao_lideranca = InscricaoLideranca.where(slug: params[:slug])[0]

    case params[:file]
    when "formacao_academica_01_file"
      inscricao_lideranca.remove_formacao_academica_01_file!
      inscricao_lideranca.formacao_academica_soma_candidato = inscricao_lideranca.formacao_academica_soma_candidato.to_i - inscricao_lideranca.formacao_academica_01_candidato.to_i
      inscricao_lideranca.formacao_academica_01_candidato = 0.0
    when "formacao_academica_02_file"
      inscricao_lideranca.remove_formacao_academica_02_file!
      inscricao_lideranca.formacao_academica_soma_candidato = inscricao_lideranca.formacao_academica_soma_candidato.to_i - inscricao_lideranca.formacao_academica_02_candidato.to_i
      inscricao_lideranca.formacao_academica_02_candidato = 0.0
    when "formacao_academica_03_file"
      inscricao_lideranca.remove_formacao_academica_03_file!
      inscricao_lideranca.formacao_academica_soma_candidato = inscricao_lideranca.formacao_academica_soma_candidato.to_i - inscricao_lideranca.formacao_academica_03_candidato.to_i
      inscricao_lideranca.formacao_academica_03_candidato = 0.0
    when "formacao_academica_04_file"
      inscricao_lideranca.remove_formacao_academica_04_file!
      inscricao_lideranca.formacao_academica_soma_candidato = inscricao_lideranca.formacao_academica_soma_candidato.to_i - inscricao_lideranca.formacao_academica_04_candidato.to_i
      inscricao_lideranca.formacao_academica_04_candidato = 0.0
    when "formacao_academica_05_file"
      inscricao_lideranca.remove_formacao_academica_05_file!
      inscricao_lideranca.formacao_academica_soma_candidato = inscricao_lideranca.formacao_academica_soma_candidato.to_i - inscricao_lideranca.formacao_academica_05_candidato.to_i
      inscricao_lideranca.formacao_academica_05_candidato = 0.0
    
    when "experiencia_profissional_01_file"
      inscricao_lideranca.remove_experiencia_profissional_01_file!
      inscricao_lideranca.experiencia_profissional_soma_candidato = inscricao_lideranca.experiencia_profissional_soma_candidato.to_i - inscricao_lideranca.experiencia_profissional_01_candidato.to_i
      inscricao_lideranca.experiencia_profissional_01_candidato = 0.0
    when "experiencia_profissional_02_file"
      inscricao_lideranca.remove_experiencia_profissional_02_file!
      inscricao_lideranca.experiencia_profissional_soma_candidato = inscricao_lideranca.experiencia_profissional_soma_candidato.to_i - inscricao_lideranca.experiencia_profissional_02_candidato.to_i
      inscricao_lideranca.experiencia_profissional_02_candidato = 0.0
    when "experiencia_profissional_03_file"
      inscricao_lideranca.remove_experiencia_profissional_03_file!
      inscricao_lideranca.experiencia_profissional_soma_candidato = inscricao_lideranca.experiencia_profissional_soma_candidato.to_i - inscricao_lideranca.experiencia_profissional_03_candidato.to_i
      inscricao_lideranca.experiencia_profissional_03_candidato = 0.0
    end
    
    if !params[:file].nil?
      inscricao_lideranca.save
    end
    
    redirect_to edit_inscricao_lideranca_url(inscricao_lideranca.slug)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscricao_lideranca
      @inscricao_lideranca = InscricaoLideranca.find_by(slug: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inscricao_lideranca_params
      params.require(:inscricao_lideranca).permit(:nome_completo, :naturalidade, :nacionalidade, :nome_mae, :sexo, :estado_civil, :data_nascimento, :cpf, :rg, :orgao_emissor, :endereco, :complemento, :bairro, :cidade, :uf, :cep, :telefone_fixo, :telefone_celular, :email, :orgao_representacao_classe, :numero_registro, :termo_aceito, :curriculo, :recurso_solicitado, :recurso, :documentos, :slug, :deficiente, :deficiente_anexo, :cargo_id, :formacao_academica_01_candidato, :formacao_academica_01_correcao, :represetacao_classe, :represetacao_classe_cache, :formacao_academica_02_candidato, :formacao_academica_02_correcao, :formacao_academica_03_candidato, :formacao_academica_03_correcao, :formacao_academica_04_candidato, :formacao_academica_04_correcao, :formacao_academica_05_candidato, :formacao_academica_05_correcao, :formacao_academica_06_candidato, :formacao_academica_06_correcao, :formacao_academica_07_candidato, :formacao_academica_07_correcao, :qualificacao_profissional_01_candidato, :qualificacao_profissional_01_correcao, :qualificacao_profissional_02_candidato, :qualificacao_profissional_02_correcao, :qualificacao_profissional_03_candidato, :qualificacao_profissional_03_correcao, :qualificacao_profissional_04_candidato, :qualificacao_profissional_04_correcao, :experiencia_profissional_01_candidato, :experiencia_profissional_02_candidato, :experiencia_profissional_03_candidato, :experiencia_profissional_04_candidato, :experiencia_profissional_05_candidato, :experiencia_profissional_01_correcao, :experiencia_profissional_02_correcao, :experiencia_profissional_03_correcao, :experiencia_profissional_04_correcao, :experiencia_profissional_05_correcao, {formacao_academica_01_file: []}, {formacao_academica_02_file: []}, {formacao_academica_03_file: []}, {formacao_academica_04_file: []},{formacao_academica_05_file: []}, {formacao_academica_06_file: []}, {formacao_academica_07_file: []}, {qualificacao_profissional_01_file: []}, {qualificacao_profissional_02_file: []}, {qualificacao_profissional_03_file: []}, {qualificacao_profissional_04_file: []}, {experiencia_profissional_01_file: []}, {experiencia_profissional_02_file: []}, {experiencia_profissional_03_file: []}, {experiencia_profissional_04_file: []}, {experiencia_profissional_05_file: []}, :formacao_academica_total, :qualificacao_profissional_total, :experiencia_profissional_total, :formacao_academica_soma_candidato, :qualificacao_profissional_soma_candidato, :experiencia_profissional_soma_candidato, :formacao_academica_soma_correcao, :qualificacao_profissional_soma_correcao, :experiencia_profissional_soma_correcao, :formacao_academica_01_verificar, :formacao_academica_02_verificar, :formacao_academica_03_verificar, :formacao_academica_04_verificar, :formacao_academica_05_verificar, :formacao_academica_06_verificar, :formacao_academica_07_verificar,:qualificacao_profissional_01_verificar, :qualificacao_profissional_02_verificar, :qualificacao_profissional_03_verificar, :qualificacao_profissional_04_verificar, :experiencia_profissional_01_verificar, :experiencia_profissional_02_verificar, :experiencia_profissional_03_verificar, :experiencia_profissional_04_verificar, :experiencia_profissional_05_verificar, :formacao_academica_01_obs, :formacao_academica_02_obs, :formacao_academica_03_obs, :formacao_academica_04_obs, :formacao_academica_05_obs,:formacao_academica_06_obs, :formacao_academica_07_obs, :qualificacao_profissional_01_obs, :qualificacao_profissional_02_obs, :qualificacao_profissional_03_obs, :qualificacao_profissional_04_obs, :experiencia_profissional_01_obs, :experiencia_profissional_02_obs, :experiencia_profissional_03_obs, :experiencia_profissional_04_obs, :experiencia_profissional_05_obs, :formacao_academica_01_resposta, :formacao_academica_02_resposta, :formacao_academica_03_resposta, :formacao_academica_04_resposta, :formacao_academica_05_resposta,:formacao_academica_06_resposta, :formacao_academica_07_resposta, :qualificacao_profissional_01_resposta, :qualificacao_profissional_02_resposta, :qualificacao_profissional_03_resposta, :qualificacao_profissional_04_resposta, :experiencia_profissional_01_resposta, :experiencia_profissional_02_resposta, :experiencia_profissional_03_resposta, :experiencia_profissional_04_resposta, :experiencia_profissional_05_resposta, :total_geral_candidato, :total_geral_correcao, :certificado_ensino_medio, :certificado_ensino_superior, :recurso_candidato_dados, :resposta_recurso_candidato_dados, :reclassificar_recurso_candidato, :recurso_entrevista, :resposta_recurso_entrevista, :reclassificar_recurso_entrevista, :formacao_academica_01_file_cache, :formacao_academica_02_file_cache, :formacao_academica_03_file_cache, :formacao_academica_04_file_cache, :formacao_academica_05_file_cache, :formacao_academica_06_file_cache, :formacao_academica_07_file_cache, :qualificacao_profissional_01_file_cache, :qualificacao_profissional_02_file_cache, :qualificacao_profissional_03_file_cache, :qualificacao_profissional_04_file_cache, :experiencia_profissional_01_file_cache, :experiencia_profissional_02_file_cache, :experiencia_profissional_03_file_cache, :experiencia_profissional_04_file_cache, :experiencia_profissional_05_file_cache, :documentos_cache, :deficiente_anexo_cache, :certificado_ensino_superior_cache, :certificado_ensino_medio_cache, :cota_negro, 
      regiaos_attributes: %i[inscricao_lideranca_id local_contratacao_id ordem id _destroy] )
    end
end

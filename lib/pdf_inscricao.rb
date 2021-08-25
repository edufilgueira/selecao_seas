module PdfInscricao
  def self.gerar_comprovante_inscricao(inscricao)
    diretorio = "#{Rails.root}/app/pdf_inscricoes"
    FileUtils.mkdir(diretorio) unless File.exists?(diretorio)
    arquivo = "#{diretorio}/inscricao_#{inscricao.id}.pdf"
    Prawn::Document.generate(arquivo) do
      image "#{Rails.root}/app/assets/images/logo.png", :width => 400, :position => :center
      text "Seleção Diretor 2020", :align => :center, :size => 20, :style => :bold
      move_down 10
      text "Dados Pessoais", :size => 15, :style => :bold
      stroke_horizontal_rule
      move_down 5
      text "Inscrição nº: #{inscricao.id}"
      move_down 3
      text "Nome completo: #{inscricao.nome_completo}"
      move_down 3
      text "Naturalidade: #{inscricao.naturalidade}"
      move_down 3
      text "Nacionalidade: #{inscricao.nacionalidade}"
      move_down 3
      text "Nome da mãe: #{inscricao.nome_mae}"
      move_down 3
      text "Sexo: #{inscricao.sexo}"
      move_down 3
      text "Estado civil: #{inscricao.estado_civil}"
      move_down 3
      text "Data de nascimento: #{inscricao.data_nascimento}"
      move_down 3
      text "CPF: #{inscricao.cpf}"
      move_down 3
      text "RG: #{inscricao.rg}"
      move_down 3
      text "Órgão emissor: #{inscricao.orgao_emissor}"
      move_down 3
      text "Endereço: #{inscricao.endereco}"
      move_down 3
      text "Complemento: #{inscricao.complemento}"
      move_down 3
      text "Bairro: #{inscricao.bairro}"
      move_down 3
      text "Cidade: #{inscricao.cidade}"
      move_down 3
      text "UF: #{inscricao.uf}"
      move_down 3
      text "CEP: #{inscricao.cep}"
      move_down 3
      text "Telefone fixo: #{inscricao.telefone_fixo}"
      move_down 3
      text "Telefone celular: #{inscricao.telefone_celular}"
      move_down 3
      text "E-mail: #{inscricao.email}"
      move_down 3
      text "Formação / Curso de Nível Superior: #{inscricao.formacao}"
      move_down 3
      text "Órgão representação classe: #{inscricao.orgao_representacao_classe}"
      move_down 3
      text "Nº registro: #{inscricao.numero_registro}"
      move_down 3
      text "Termos aceitos: #{inscricao.termo_aceito? ? "Sim" : "Não"}"
      # move_down 10
      # text "Documentação", :size => 15, :style => :bold
      # stroke_horizontal_rule
      # move_down 5
      # text "Currículo Padrão:"
      # move_down 3
      # text "Currículo", :indent_paragraphs => 20
      # move_down 3
      # text "Diploma e documentação comprobatória dos Títulos e Experiência Profissional a serem pontuados:"
      # inscricao.documentacao.each_with_index do |doc, index|
      #   text "Anexo #{index + 1}", :indent_paragraphs => 20
      #   move_down 3
      # end
    end
    return arquivo
  end
end
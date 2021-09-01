Rails.application.routes.draw do
  resources :local_contratacaos
  resources :regiaos
  resources :recurso_servidors do
    collection do
      get :cpf
      post :buscar_por_cpf
      get :exportar_csv
    end
  end
  resources :configuracaos
  resources :cargos
  # devise_for :usuarios, controllers: { sessions: "usuarios/sessions", registrations: "usuarios/registrations" }, path_names: { sign_in: "login", sign_out: "logout" }
  devise_for :usuarios do
    get '/usuarios/sign_out' => 'devise/sessions#destroy'
  end
  # devise_for :usuarios, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' }

  resources :inscricaos, path: 'inscricoes', only: [:index, :new, :create, :show] do
    collection do
      get :download_pdf_inscricao
      get :inscricao_realizada 
      match :solicitar_recurso, via: [:get, :post]
      post :salvar_solicitacao_recurso
    end
  end

  resources :inscricao_servidors do
    collection do
      match :edit_correcao, via: [:get, :post]
      get :selecionar_vagas
      get :cpf
      post :buscar_por_cpf
      get :selecionar_vaga_correcao
      get :edit_selecionar_vaga_correcao
      match :remover_file, via: [:get, :post]
      get :update_selecionar_vaga_correcao
      match :finalizar, via: [:get, :post]
      match :correcao, via: [:get, :post]
      match :analisar_dados_obs, via: [:get, :post]
      get :resgate
      match :listar_index, via: [:get, :post]
      get :nao_finalizados
    end
  end

  resources :inscricao_liderancas do
    collection do
      match :edit_correcao, via: [:get, :post]
      match :entrevista, via: [:get, :post]
      match :salvar_entrevista, via: [:get, :post]
      get :selecionar_vagas
      get :cpf
      post :buscar_por_cpf
      get :selecionar_vaga_correcao
      get :edit_selecionar_vaga_correcao
      match :remover_file, via: [:get, :post]
      get :update_selecionar_vaga_correcao
      match :finalizar, via: [:get, :post]
      match :correcao, via: [:get, :post]
      match :analisar_dados_obs, via: [:get, :post]
      match :listar_index, via: [:get, :post]
      get :nao_finalizados
      get :deletar_regiao
      get :mostrar_lideranca
      get :recurso
    end
  end
  
  resources :inscricao_servidors, param: :slug
  #root to: 'inscricao_servidors#cpf'
  root to: 'inscricao_liderancas#cpf'
end

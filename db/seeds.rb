# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.create(email: 'nutic@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'larisse.pedrosa@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'roberto.peixoto@seas.ce.gov.br', password: 'roberto@2431')
Usuario.create(email: 'alberto.holanda@seas.ce.gov.br', password: 'alberto@3214')
Usuario.create(email: 'ernande.oliveira@seas.ce.gov.br', password: 'ernande@2143')
Usuario.create(email: 'ednaldo.silva@seas.ce.gov.br', password: 'ednaldo@3142')
Usuario.create(email: 'ana.timbo@seas.ce.gov.br', password: 'timbo@1324')
Usuario.create(email: 'ramon.nascimento@seas.ce.gov.br', password: 'ramon@2134')
Usuario.create(email: 'carol.santos@seas.ce.gov.br', password: 'carol@2413')
Usuario.create(email: 'lara.cybelle@seas.ce.gov.br', password: 'lara@1243')
Usuario.create(email: 'vitoria.reboucas@seas.ce.gov.br', password: 'vitoria@1342')
Usuario.create(email: 'rosane.martins@seas.ce.gov.br', password: 'rosane@4231')
Usuario.create(email: 'larissa.neves@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'gloria.marques@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'paulo.santos@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'laura.tavares@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'denisangela.pinheiro@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'danilo.pereira@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'aparecidan.costa@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'frans.beno@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'beto.vieira@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'juliana.andrade@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'ednaldo.silva@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'joao.lavor@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'fran.silva@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'mayara.monteiro@seas.ce.gov.br', password: 'seas@1234')
Usuario.create(email: 'elson.silverio@seas.ce.gov.br', password: 'seas@1234')

Cargo.find_or_create_by(descricao: "Assistente Social").update(id:1, tipo_cargo: "Servidor")
Cargo.find_or_create_by(descricao: "Psicólogo").update(id:2, tipo_cargo: "Servidor")
Cargo.find_or_create_by(descricao: "Pedagogo").update(id:3, tipo_cargo: "Servidor")
Cargo.find_or_create_by(descricao: "Socioeducador").update(id:4, tipo_cargo: "Servidor")
Cargo.find_or_create_by(descricao: "Diretor").update(id:5, tipo_cargo: "Liderança")

Resposta.find_or_create_by(descricao: "Pontuação Zerada por não anexar documento comprobatório.")
Resposta.find_or_create_by(descricao: "Pontuação Zerada por documento anexo não comprovar item exigido em Edital.")
Resposta.find_or_create_by(descricao: "Pontuação Diminuída por não haver comprovação do tempo solicitado mínimo para pontuação.")
Resposta.find_or_create_by(descricao: "Pontuação incluída pois documentação anexa comprova item do Edital.")
Resposta.find_or_create_by(descricao: "Pontuação aumentada pois documentação comprova maior tempo referente ao item exigido em Edital.")
Resposta.find_or_create_by(descricao: "Pontuação Zerada por documento estar inelegível.")
Resposta.find_or_create_by(descricao: "Pontuação Zerada por documento repetir pontuação já acrescida em outro item do edital.")
Resposta.find_or_create_by(descricao: "Pontuação Diminuída por documento repetir pontuação já acrescida em outro item do edital.")
Resposta.find_or_create_by(descricao: "Outros")
namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_clients)
    puts %x(rake dev:generate_advertisings)

    puts "Setup completado com sucesso!"
  end

  #################################################################

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando ADMINISTRADORES..."

    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,1].sample
      )
    end

    puts "ADMINISTRADORES cadastrados com sucesso!"
  end

  #################################################################

  desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    10.times do
      Member.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end

    puts "MEMBROS cadastrados com sucesso!"
  end

  #############################
  desc "Cria Clientes Fake"
  task generate_clients: :environment do

    puts "Cadastrando CLIENTES"
    clients = ["Padaria",
               "Supermercado",
               "Famácia",
               "Sorveteria",
               "Cafeteria",
               "Academia",
               "Conveniência",
               "Açougue"]

    clients.each do |client|
      Client.find_or_create_by(
        name: client,
        millisec: 3
      )
    end
    puts "CLIENTES cadastrados com sucesso"

  end

  #############################

  desc "Cria Anuncios Fake"
  task generate_advertisings: :environment do

    puts "Cadastrando ANUNCIOS"
    100.times do
      Advertising.create!(
        client: Client.all.sample,
        start_date: "2022-01-01",
        end_date: "2022-12-31",
        category: Category.all.sample,
        weather: Weather.all.sample,
        picture: File.new(Rails.root.join('public', 'images', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
    end
    puts "ANUNCIOS cadastrados com sucesso"

  end

  #############################












end

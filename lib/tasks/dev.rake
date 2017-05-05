namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_weathers)

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

  desc "Cria clima"
  task generate_weathers: :environment do
    puts "Cadastrando CLIMAS..."

    climas = ["Ensolarado",
              "Nublado",
              "Chuvoso"]

    climas.each do |climas|
      Weather.find_or_create_by(description: climas,
                                minTemp: "#{Random.rand(15)}",
                                maxTemp: "#{Random.rand(15)}")
    end

    puts "CLIMAS cadastrados com sucesso!"
  end

end

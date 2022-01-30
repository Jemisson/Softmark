# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Cadastrando ADMINISTRADOR PADRÃO'
Admin.create!(name: 'Administrador Padrão',
              email: 'admin@admin.com',
              password: '123456',
              password_confirmation: '123456',
              role: 0)

puts 'ADMINISTRADOR PADRÃO cadastrado com sucesso'

#############################

puts 'Cadastrando MEMBRO PADRÃO'
Member.create!(name: 'Membro Padrão',
               email: 'user@user.com',
               password: '123456',
               password_confirmation: '123456')

puts 'ADMINISTRADOR MEMBRO cadastrado com sucesso'

#############################

puts 'Cadastrando as CATEGORIAS'
categories = %w[dia
  tarde
  noite]

categories.each do |category|
  Category.find_or_create_by(description: category)
end
puts 'CATEGORIAS cadastradas com sucesso'

#############################

puts 'Cadastrando CLIMAS...'

Weather.find_or_create_by(description: 'Ensolarado', min_temp: 28, max_temp: 60)
Weather.find_or_create_by(description: 'Nublado', min_temp: 19, max_temp: 27)
Weather.find_or_create_by(description: 'Frio', min_temp: 0, max_temp: 17)

puts 'CLIMAS cadastrados com sucesso!'

#############################

puts 'Cadastrando QRCODE VAZIO'
Qrcode.create!(client: 'Não Informado',
               validity: 0,
               value: 0,
               date_time: '0000-00-00T00:00:00-00:00',
               img_path: '/',
               token: 'vazio')

puts 'QRCODE VAZIO cadastrado com sucesso'

#############################

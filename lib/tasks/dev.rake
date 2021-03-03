namespace :dev do
  DEFAULT_PASSWORDS = "123456"
  desc "TODO"
  task setup: :environment do
    show_spinner("Apagando BD...") { %x(rails db:drop) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
    # show_spinner("Cadastrando outros administradores...") { %x(rails dev:add_others_adms) }
    show_spinner("Cadastrando os membros...") { %x(rails dev:add_members) }
    # show_spinner("Cadastrando assuntos padrões...") { %x(rails dev:add_subjects) }
    # show_spinner("Cadastrando questões padrões...") { %x(rails dev:add_answers_and_questions) }
  end

  desc "Adiciona ADM"
  task add_default_admin: :environment do
    Admin.create(
      email: "admin@admin.com",
      password: DEFAULT_PASSWORDS,
      password_confirmation: DEFAULT_PASSWORDS
    )
  end

  desc "Adiciona Membros"
  task add_members: :environment do
    10.times do |i|
      Churchmember.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        cellphone: Faker::Number.number(digits: 9),
        birthdate: Faker::Date.between(from: '2000-09-23', to: '2002-09-25'),
        membershipdate: Faker::Date.between(from: '2010-09-23', to: '2014-09-25'),
        street: Faker::Address.street_name,
        district: Faker::Address.community,
      )
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_users
  User.create!(username: "example", email: "example@example.com", password: "password",
               password_confirmation: "password")
end

def create_attractions
  Attraction.create!(user: User.first, name: "How I met your mother",
                     description: "A cômica busca de Ted Mosby por sua alma gêmera só para quando "\
                     "ele conta aos filhos como conheceu a mãe deles.",
                     media: 0,
                     date: "2015/12/12 12:00")

  Attraction.create!(user: User.first, name: "Friends",
                     description: "Esta série de enorme sucesso acompanha as aventuras de seis amigos "\
                     "que enfrentam as armadilhas da vida, do trabalho e do amor nos anos 1990.",
                     media: 2,
                     date: "2015/11/20 13:00")

  Attraction.create!(user: User.first, name: "Queen live at Wembley",
                     description: "Pela primeira vez, este espetacular concerto realizado em "\
                     "12 de julho de 1986, no estádio de Wembley, em Londres, Inglaterra, é"\
                     "apresentado na íntegra. O show faz parte da Magic Tour, última tour da"\
                     "banda Queen.",
                     media: 4,
                     date: "2015/12/13 10:00")
end

create_users
create_attractions
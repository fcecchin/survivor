# # rake db:seed
admin = User.create(email: 'fcecchin@gmail.com', password: 'senhasites', admin: true, name: 'Frantchesco C.')
b1 = User.create(email: 'boleiro1@gmail.com', password: 'boleiro1', admin: false, name: 'Boleiro 1')
b2 = User.create(email: 'boleiro2@gmail.com', password: 'boleiro2', admin: false, name: 'Boleiro 2')
b3 = User.create(email: 'boleiro3@gmail.com', password: 'boleiro3', admin: false, name: 'Boleiro 3')
b4 = User.create(email: 'boleiro4@gmail.com', password: 'boleiro4', admin: false, name: 'Boleiro 4')
b5 =User.create(email: 'boleiro5@gmail.com', password: 'boleiro5', admin: false, name: 'Boleiro 5')
c1 = User.create(email: 'cartola1@gmail.com', password: 'cartola1', admin: false, name: 'Cartola 1')
c2 = User.create(email: 'cartola2@gmail.com', password: 'cartola2', admin: false, name: 'Cartola 2')

# CRIAR TIMES
ame = Team.create(name: "América-MG")
cam = Team.create(name: "Atlético-MG")
cap = Team.create(name: "Atlético-PR")
bot = Team.create(name: "Botafogo")
cha = Team.create(name: "Chapecoense")
cor = Team.create(name: "Corinthians")
cfc = Team.create(name: "Coritiba")
cru = Team.create(name: "Cruzeiro")
fig = Team.create(name: "Figueirense")
fla = Team.create(name: "Flamengo")
flu = Team.create(name: "Fluminense")
gre = Team.create(name: "Grêmio")
int = Team.create(name: "Internacional")
pal = Team.create(name: "Palmeiras")
pon = Team.create(name: "Ponte Preta")
sta = Team.create(name: "Santa Cruz")
san = Team.create(name: "Santos")
sao = Team.create(name: "São Paulo")
spo = Team.create(name: "Sport")
vit = Team.create(name: "Vitória")

# CRIAR TORNEIOS
br16 = Tournament.create(name: "Campeonato Brasileiro", year: "2016")
cb16 = Tournament.create(name: "Copa do Brasil", year: "2016")
nfl = Tournament.create(name: "NFL", year: "2016")

# CRIAR JOGOS
Match.create(datetime: DateTime.today + 7, tournament: br16, team_a: int, team_b: ame, round: 7)
Match.create(datetime: DateTime.today + 7, tournament: br16, team_a: pon, team_b: cha, round: 7)
Match.create(datetime: DateTime.today + 7, tournament: br16, team_a: flu, team_b: gre, round: 7)

r1 = Contest.create(name: "Resta Um", owner: admin, tournament: br16, active: true)
r2 = Contest.create(name: "Resta Um - Copel", owner: c1, tournament: br16, active: true)
cb1 = Contest.create(name: "Bolao Copa do Brasil", owner: admin, tournament: cb16)
n1 = Contest.create(name: "Survivor NFL", owner: admin, tournament: nfl, active: true)

Participant.create(user: b1, contest: r1);
Participant.create(user: b2, contest: r1);
Participant.create(user: admin, contest: r1);
Participant.create(user: b1, contest: n1);
Participant.create(user: b2, contest: n1);
Participant.create(user: admin, contest: n1);
Participant.create(user: b1, contest: cb1);
Participant.create(user: b2, contest: cb1);
Participant.create(user: b3, contest: cb1);
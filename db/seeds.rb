# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

payment_method_pix = PaymentMethod.find_or_create_by!(name: "Pix", slug: "pix")
payment_method_dinheiro = PaymentMethod.find_or_create_by!(name: "Dinheiro", slug: "dinheiro")
payment_method_cartaoc = PaymentMethod.find_or_create_by!(name: "Cartão de crédito", slug: "cartao-de-credito")
payment_method_cartaod = PaymentMethod.find_or_create_by!(name: "Cartão de débito", slug: "cartao-de-debito")

gym_type_a = GymType.find_or_create_by!(name: "Musculação", slug: "bodybuilding")
gym_type_b = GymType.find_or_create_by!(name: "Natação", slug: "swimming")

gym_hfstudio = Gym.find_or_create_by!(name: "HFSTUDIO", email: "academia@hfstudio.com", cnpj: "72.178.624/0001-04", slug: "hfstudio", gym_type_id: gym_type_a.id)

user_adm = User.find_or_create_by!(name: "Hugo Freitas", email: "hugo@hfstudio.com", user_type: ADMIN, gym_id: gym_hfstudio.id)

state_rj = State.find_or_create_by!(name: "Rio de Janeiro", uf: "RJ")

city_campos = City.find_or_create_by!(name: "Campos dos Goytacazes", state_id: state_rj.id)

Telephone.find_or_create_by!(number: "(22)99999-9999", user_id: nil, gym_id: gym_hfstudio.id)

Location.find_or_create_by!(
	address: "Rua Teste", 
	number: "123",
	neighborhood: "bairro a",
	complement: "frente",
	gym_id: gym_hfstudio.id,
	city_id: city_campos.id,
	user_id: nil, 
)

plan_a = Plan.find_or_create_by!(name: "Plano A", price: 100.0)

client_rafael = Client.find_or_create_by!(name: "Rafael", email: "rafael@hfstudio.com", weight: 0.0, height: 0.0, plan_id: plan_a.id, gym_id: gym_hfstudio.id, user_type: CLIENT)

payment_2008 = Payment.find_or_create_by!(value: 80.0, amount_paid: 80.0, payment_date: Date.new(2023,8,20), due_date: Date.new(2023,8,25), payment_method_id: payment_method_pix.id, client_id: client_rafael.id)
payment_2009 = Payment.find_or_create_by!(value: 80.0, amount_paid: 80.0, payment_date: Date.new(2023,9,20), due_date: Date.new(2023,9,25), payment_method_id: payment_method_pix.id, client_id: client_rafael.id)
payment_2010 = Payment.find_or_create_by!(value: 80.0, amount_paid: 80.0, payment_date: Date.new(2023,10,20), due_date: Date.new(2023,10,25), payment_method_id: payment_method_pix.id, client_id: client_rafael.id)
payment_2011 = Payment.find_or_create_by!(value: 80.0, amount_paid: 80.0, payment_date: Date.new(2023,11,20), due_date: Date.new(2023,11,25), payment_method_id: payment_method_pix.id, client_id: client_rafael.id)
payment_2012 = Payment.find_or_create_by!(value: 80.0, amount_paid: 80.0, payment_date: Date.new(2023,12,20), due_date: Date.new(2023,12,25), payment_method_id: payment_method_pix.id, client_id: client_rafael.id)

employee_joao = Employee.find_or_create_by!(name: "João", email: "joao@hfstudio.com", weight: 0.0, height: 0.0, gym_id: gym_hfstudio.id, user_type: EMPLOYEE)

record_1 = Record.find_or_create_by!(
	begin_date: "data inicial", 
	end_date: "data final",
	client_id: client_rafael.id,
	goal: "objetivo",
	interval: "intervalo",
	employee_id: employee_joao.id,
)

training_1 = Training.find_or_create_by!(name: "Treino 1", record_id: record_1.id)
exercise_1 = Exercise.find_or_create_by!(name: "Exercicio 1", qnt_series: 10, qnt_repetitions: 5, gym_id: gym_hfstudio.id)

training_exercise_1 = TrainingExercise.find_or_create_by!(training_id: training_1.id, exercise_id: exercise_1.id)

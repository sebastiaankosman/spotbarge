# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ cargo_name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# require 'open-uri'
# require 'nokogiri'

# url = "https://www.elwis.de/DE/dynamisch/gewaesserkunde/wasserstaende/index.php?target=1&pegelId=1d26e504-7f9e-480a-b52c-5932be6549ab"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# sea_level = {}

# html_doc.search('tr td').each_with_index do |element, i|
#   if i > 41 && i < 68 && (i % 2 == 1)
#     # puts "#{i} - #{element.text.strip}"
#     sea_level["#{i}"] = element.text.strip
#   end
# end

# puts sea_level

# WaterLevel.new()
# w = WaterLevel.last
# w.height = {}

# height[:monday] = 12




Barge.destroy_all
Broker.destroy_all
Cargo.destroy_all
OilCompany.destroy_all
User.destroy_all

puts 'Creating barge...'

users_attributes = [
  {
    first_name: 'Sebastiaan',
    last_name: 'Kosman',
    password: '123456',
    email: 'sebastiaankosman@gmail.com',
    ice_chat: 'Sebastiaan_ICE',
    company_name: 'Shell',
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'no',
  },
  {
    first_name: 'Onne',
    last_name: 'Bakker',
    password: '123456',
    email: 'onnebakker@gmail.com',
    ice_chat: 'Onne_ICE',
    company_name: 'Vitol',
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'no'
  },
  {
    first_name: 'Djongjin',
    last_name: 'Lee',
    password: '123456',
    email: 'Djongjin@gmail.com',
    ice_chat: 'Djongjin_ICE',
    company_name: 'Glencore',
    type_of_company: 'Oilsupplier',
    city: 'London',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Ruud',
    last_name: 'Bussink',
    password: '123456',
    email: 'ruud@gmail.com',
    ice_chat: 'ruud_ICE',
    company_name: 'ExxonMobil',
    type_of_company: 'Oilsupplier',
    city: 'Antwerp',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Olivia',
    last_name: 'Lara',
    password: '123456',
    email: 'olivia@gmail.com',
    ice_chat: 'olivia_ICE',
    company_name: 'BP',
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Jos',
    last_name: 'Molernaar',
    password: '123456',
    email: 'josn@gmail.com',
    ice_chat: 'jos_ICE',
    company_name: 'Interstream',
    type_of_company: 'Broker',
    city: 'Rotterdam',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'no'
  },
  {
    first_name: 'Peter',
    last_name: 'Steutel',
    password: '123456',
    email: 'peter@gmail.com',
    ice_chat: 'peter_ICE',
    company_name: 'Victrol',
    type_of_company: 'Broker',
    city: 'Antwerp',
    location: 'Belgium',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'no',
  },
  {
    first_name: 'Yessi',
    last_name: 'van der Waal',
    password: '123456',
    email: 'Yessi@gmail.com',
    ice_chat: 'yessi_ICE',
    company_name: 'Unibarge',
    type_of_company: 'Broker',
    city: 'Rotterdam',
    location: 'The Netherlands',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Karin',
    last_name: 'Grotenhuis',
    password: '123456',
    email: 'karin@gmail.com',
    ice_chat: 'karin_ICE',
    company_name: 'Gefo',
    type_of_company: 'Broker',
    city: 'Hamburg',
    location: 'Germany',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Benna',
    last_name: 'Talahatu',
    password: '123456',
    email: 'benna@gmail.com',
    ice_chat: 'benna_ICE',
    company_name: 'Stetra',
    type_of_company: 'Broker',
    city: 'Ludwigshafen',
    location: 'Germany',
    phone_number: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  }
]

User.create!(users_attributes)
brokers = User.where('type_of_company = ?','Broker')
oil_users = User.where('type_of_company = ?', 'Oilsupplier')
companies = ['Shell', 'Petrobras', 'BP', 'Vitol', 'Glencore']

oil_users.each do |oil_user|
  OilCompany.create!(name: oil_user.company_name, user: oil_user)
  oil_user.oil_company = OilCompany.last
end

brokers.each do |broker|
  Broker.create!(name: broker.company_name, user: broker)
  broker.broker = Broker.last
end

barge_attributes = [
  {
    barge_name: 'Chamisa',
    capacity: 6500,
    pre_cargo: 'Diesel''Gasoline''Gasoline',
    barge_type: 'CPP',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,9),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Elisabethstad',
    capacity: 6500,
    pre_cargo: 'Diesel' 'Diesel' 'Diesel',
    barge_type: 'CPP',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,10),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Gilla',
    capacity: 3000,
    pre_cargo: 'Naptha' 'Alkylate' 'Gasoline',
    barge_type: 'CPP',
    gas_free: 'No',
    barge_area: 'Middle-Rhine',
    barge_load_window: Date.new(2019,9,11),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Emma',
    capacity: 3200,
    pre_cargo: 'Gasoil' 'Diesel' 'LCO',
    barge_type: 'CPP',
    gas_free: 'Yes',
    barge_area: 'Upper-Rhine',
    barge_load_window: Date.new(2019,9,12),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Piz Languard',
    capacity: 3200,
    pre_cargo: 'Des Hgo' 'Diesel' 'GTL',
    barge_type: 'CPP',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,13),
    broker: Broker.all.sample
  },
    {
    barge_name: 'Vorstenbosch',
    capacity: 10000,
    pre_cargo: 'VGO''VGO''VGO',
    barge_type: 'Fuel',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,9),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Atlantic Progress',
    capacity: 8000,
    pre_cargo: 'HSVGO' 'Slurry' 'Slurry',
    barge_type: 'Fuel',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,10),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Atlantic Pioneer',
    capacity: 7500,
    pre_cargo: 'LSVGO' 'LSVGO' 'LSVGO',
    barge_type: 'Fuel',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,11),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Promotion',
    capacity: 6500,
    pre_cargo: 'Heavy Fuel' 'LSVGO' 'Heavy Fuel',
    barge_type: 'Fuel',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,12),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Viraya',
    capacity: 6500,
    pre_cargo: 'VGO' 'VGO' 'VGO',
    barge_type: 'Fuel',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,13),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Quebec',
    capacity: 9000,
    pre_cargo: 'VGO''RMK''RMK',
    barge_type: 'Bunkers',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,9),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Valencia',
    capacity: 5000,
    pre_cargo: 'RMK' 'Slurry' 'Slurry',
    barge_type: 'Bunkers',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,10),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Jowi',
    capacity: 4000,
    pre_cargo: 'RMK' 'RMK' 'RMK',
    barge_type: 'Bunkers',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,11),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Amistade',
    capacity: 6500,
    pre_cargo: 'Heavy Fuel' 'RMK' 'Heavy Fuel',
    barge_type: 'Bunkers',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,12),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Volterra',
    capacity: 3500,
    pre_cargo: 'RMK' 'RMK' 'RMK',
    barge_type: 'Bunkers',
    gas_free: 'Yes',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,13),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Wilson',
    capacity: 2500,
    pre_cargo: 'Alkylate''Pygas''Pygas',
    barge_type: 'Chemicals',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,9),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Riva',
    capacity: 3100,
    pre_cargo: 'Reformate' 'Alkylate' 'Toluene',
    barge_type: 'Chemicals',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,10),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Manouk',
    capacity: 3500,
    pre_cargo: 'Ortho-Xylene' 'Toluene' 'Pygas',
    barge_type: 'Chemicals',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,11),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Oranje Nassau',
    capacity: 3300,
    pre_cargo: 'Toluene' 'Benzene' 'Benzene',
    barge_type: 'Chemicals',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,12),
    broker: Broker.all.sample
  },
  {
    barge_name: 'Macan',
    capacity: 3500,
    pre_cargo: 'Pygas' 'Reformate' 'Pygas',
    barge_type: 'Chemicals',
    gas_free: 'No',
    barge_area: 'ARA',
    barge_load_window: Date.new(2019,9,13),
    broker: Broker.all.sample
  },
]

Barge.create!(barge_attributes)

cargo_attributes = [
  {
    cargo_name: 'FCCG',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'CPP',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,9),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Diesel',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Strasbourg',
    cargo_type: 'CPP',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,10),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Gasoline',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Essen',
    cargo_type: 'CPP',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,11),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Naptha',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Amsterdam',
    cargo_type: 'CPP',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,12),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Alkylate',
    volume: 1800,
    load_location: 'Rotterdam',
    discharge_location: 'Koln',
    cargo_type: 'CPP',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,13),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Cutters',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'Fuel',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,9),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'LSVGO',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Karlsruhe',
    cargo_type: 'Fuel',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,10),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'HSVGO',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam',
    cargo_type: 'Fuel',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,11),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Slurry',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Amsterdam',
    cargo_type: 'Fuel',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,12),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'VGO',
    volume: 1800,
    load_location: 'Rotterdam',
    discharge_location: 'Koln',
    cargo_type: 'Fuel',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,13),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'RMK-380',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'Bunkers',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,9),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Fuel-700',
    volume: 2000,
    load_location: 'Rotterdam',
    discharge_location: 'Rotterdam',
    cargo_type: 'Bunkers',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,10),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'RMK-700',
    volume: 5000,
    load_location: 'Antwerp',
    discharge_location: 'Rotterdam',
    cargo_type: 'Bunkers',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,11),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'RMK-300',
    volume: 6000,
    load_location: 'Amsterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'Bunkers',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,12),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'RMK-700',
    volume: 7000,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'Bunkers',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,13),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Toluene',
    volume: 2500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp',
    cargo_type: 'Chemicals',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,9),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Ortho-Xylene',
    volume: 2000,
    load_location: 'Rotterdam',
    discharge_location: 'Koln',
    cargo_type: 'Chemicals',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,10),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Pygas',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Rotterdam',
    cargo_type: 'Chemicals',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,11),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Benzene',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam',
    cargo_type: 'Chemicals',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,12),
    oil_company: OilCompany.all.sample
  },
  {
    cargo_name: 'Mioxed-Xylene',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam',
    cargo_type: 'Chemicals',
    gas_free: 'No',
    cargo_load_window: Date.new(2019,9,13),
    oil_company: OilCompany.all.sample
  },
]

Cargo.create!(cargo_attributes)

puts 'Finished!'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
Barge.destroy_all
Cargo.destroy_all
User.destroy_all

puts 'Creating barge...'

users_attributes = [
  {
    first_name: 'Sebastiaan',
    last_name: 'Kosman',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'sebastiaankosman@gmail.com',
    ice_chat: 'Sebastiaan_ICE',
    company_name: 'Shell',
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'no'
  },
  {
    first_name: 'Onne',
    last_name: 'Bakker',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'onnebakker@gmail.com',
    ice_chat: 'Onne_ICE',
    company_name: 'Vitol'
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'no'
  },
  {
    first_name: 'Djongjin',
    last_name: 'Lee',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'Djongjin@gmail.com',
    ice_chat: 'Djongjin_ICE',
    company_name: 'Glencore',
    type_of_company: 'Oilsupplier',
    city: 'London',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Ruud',
    last_name: 'Bussink',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'ruud@gmail.com',
    ice_chat: 'ruud_ICE',
    company_name: 'ExxonMobil',
    type_of_company: 'Oilsupplier',
    city: 'Antwerp',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Olivia',
    last_name: 'Lara',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'olivia@gmail.com',
    ice_chat: 'olivia_ICE',
    company_name: 'BP',
    type_of_company: 'Oilsupplier',
    city: 'Rotterdam',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Jos',
    last_name: 'Molernaar',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'josn@gmail.com',
    ice_chat: 'jos_ICE',
    company_name: 'Interstream',
    type_of_company: 'Broker',
    city: 'Rotterdam',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'no'
  },
  {
    first_name: 'Peter',
    last_name: 'Steutel',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'peter@gmail.com',
    ice_chat: 'peter_ICE',
    company_name: 'Victrol',
    type_of_company: 'Broker',
    city: 'Antwerp',
    country: 'Belgium'
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'no',
  },
  {
    first_name: 'Yessi',
    last_name: 'van der Waal',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'Yessi@gmail.com',
    ice_chat: 'yessi_ICE',
    company_name: 'Unibarge',
    type_of_company: 'Broker',
    city: 'Rotterdam',
    country: 'The Netherlands',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Karin',
    last_name: 'Grotenhuis',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'karin@gmail.com',
    ice_chat: 'karin_ICE',
    company_name: 'Gefo',
    type_of_company: 'Broker',
    city: 'Hamburg',
    country: 'Germany',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  },
  {
    first_name: 'Benna',
    last_name: 'Talahatu',
    password: '123456',
    reset_password_token: '1ajfeijfqw',
    email: 'benna@gmail.com',
    ice_chat: 'benna_ICE',
    company_name: 'Stetra',
    type_of_company: 'Broker',
    city: 'Ludwigshafen',
    country: 'Germany',
    phonenumber: '123456789',
    notification_email: 'yes',
    notification_sms: 'Yes'
  }
]

User.create!(users_attributes)
brokers = User.where('type_of_company = ?','Broker')
oilsuppliers = User.where('type_of_company = ?', 'Oilsupplier')

barge_attributes = [
  {
    name: 'Chamisa',
    capacity: 6500,
    pre_cargo: 'Diesel''Gasoline''Gasoline',
    barge_type: 'CPP',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,9),
    broker_id: brokers.sample
  },
  {
    name: 'Elisabethstad',
    capacity: 6500,
    pre_cargo: 'Diesel' 'Diesel' 'Diesel',
    barge_type: 'CPP',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,10),
    broker_id: brokers.sample
  },
  {
    name: 'Gilla',
    capacity: 3000,
    pre_cargo: 'Naptha' 'Alkylate' 'Gasoline',
    barge_type: 'CPP',
    gasfree: 'No',
    barge_area: 'Middle-Rhine'
    barge_loadwindow: Date.new(2019,9,11),
    broker_id: brokers.sample
  },
  {
    name: 'Emma',
    capacity: 3200,
    pre_cargo: 'Gasoil' 'Diesel' 'LCO',
    barge_type: 'CPP',
    gasfree: 'Yes',
    barge_area: 'Upper-Rhine'
    barge_loadwindow: Date.new(2019,9,12),
    broker_id: brokers.sample
  },
  {
    name: 'Piz Languard',
    capacity: 3200,
    pre_cargo: 'Des Hgo' 'Diesel' 'GTL',
    barge_type: 'CPP',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,13),
    broker_id: brokers.sample
  },
    {
    name: 'Vorstenbosch',
    capacity: 10000,
    pre_cargo: 'VGO''VGO''VGO',
    barge_type: 'Fuel',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,9),
    broker_id: brokers.sample
  },
  {
    name: 'Atlantic Progress',
    capacity: 8000,
    pre_cargo: 'HSVGO' 'Slurry' 'Slurry',
    barge_type: 'Fuel',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,10),
    broker_id: brokers.sample
  },
  {
    name: 'Atlantic Pioneer',
    capacity: 7500,
    pre_cargo: 'LSVGO' 'LSVGO' 'LSVGO',
    barge_type: 'Fuel',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,11),
    broker_id: brokers.sample
  },
  {
    name: 'Promotion',
    capacity: 6500,
    pre_cargo: 'Heavy Fuel' 'LSVGO' 'Heavy Fuel',
    barge_type: 'Fuel',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,12),
    broker_id: brokers.sample
  },
  {
    name: 'Viraya',
    capacity: 6500,
    pre_cargo: 'VGO' 'VGO' 'VGO',
    barge_type: 'Fuel',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,13),
    broker_id: brokers.sample
  },
  {
    name: 'Quebec',
    capacity: 9000,
    pre_cargo: 'VGO''RMK''RMK',
    barge_type: 'Bunkers',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,9),
    broker_id: brokers.sample
  },
  {
    name: 'Valencia',
    capacity: 5000,
    pre_cargo: 'RMK' 'Slurry' 'Slurry',
    barge_type: 'Bunkers',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,10),
    broker_id: brokers.sample
  },
  {
    name: 'Jowi',
    capacity: 4000,
    pre_cargo: 'RMK' 'RMK' 'RMK',
    barge_type: 'Bunkers',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,11),
    broker_id: brokers.sample
  },
  {
    name: 'Amistade',
    capacity: 6500,
    pre_cargo: 'Heavy Fuel' 'RMK' 'Heavy Fuel',
    barge_type: 'Bunkers',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,12),
    broker_id: brokers.sample
  },
  {
    name: 'Volterra',
    capacity: 3500,
    pre_cargo: 'RMK' 'RMK' 'RMK',
    barge_type: 'Bunkers',
    gasfree: 'Yes',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,13),
    broker_id: brokers.sample
  },
  {
    name: 'Wilson',
    capacity: 2500,
    pre_cargo: 'Alkylate''Pygas''Pygas',
    barge_type: 'Chemicals',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,9),
    broker_id: brokers.sample
  },
  {
    name: 'Riva',
    capacity: 3100,
    pre_cargo: 'Reformate' 'Alkylate' 'Toluene',
    barge_type: 'Chemicals',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,10),
    broker_id: brokers.sample
  },
  {
    name: 'Manouk',
    capacity: 3500,
    pre_cargo: 'Ortho-Xylene' 'Toluene' 'Pygas',
    barge_type: 'Chemicals',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,11),
    broker_id: brokers.sample
  },
  {
    name: 'Oranje Nassau',
    capacity: 3300,
    pre_cargo: 'Toluene' 'Benzene' 'Benzene',
    barge_type: 'Chemicals',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,12),
    broker_id: brokers.sample
  },
  {
    name: 'Macan',
    capacity: 3500,
    pre_cargo: 'Pygas' 'Reformate' 'Pygas',
    barge_type: 'Chemicals',
    gasfree: 'No',
    barge_area: 'ARA'
    barge_loadwindow: Date.new(2019,9,13),
    broker_id: brokers.sample
  },
]

Barge.create!(barge_attributes)

cargo_attributes = [
  {
    name: 'FCCG',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'CPP',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,9),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Diesel',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Strasbourg'
    cargo_type: 'CPP',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,10),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Gasoline',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Essen'
    cargo_type: 'CPP',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,11),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Naptha',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Amsterdam'
    cargo_type: 'CPP',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,12),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Alkylate',
    volume: 1800,
    load_location: 'Rotterdam',
    discharge_location: 'Koln'
    cargo_type: 'CPP',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,13),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Cutters',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'Fuel',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,9),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'LSVGO',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Karlsruhe'
    cargo_type: 'Fuel',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,10),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'HSVGO',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam'
    cargo_type: 'Fuel',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,11),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Slurry',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Amsterdam'
    cargo_type: 'Fuel',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,12),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'VGO',
    volume: 1800,
    load_location: 'Rotterdam',
    discharge_location: 'Koln'
    cargo_type: 'Fuel',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,13),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'RMK-380',
    volume: 4500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'Bunkers',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,9),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Fuel-700',
    volume: 2000,
    load_location: 'Rotterdam',
    discharge_location: 'Rotterdam'
    cargo_type: 'Bunkers',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,10),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'RMK-700',
    volume: 5000,
    load_location: 'Antwerp',
    discharge_location: 'Rotterdam'
    cargo_type: 'Bunkers',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,11),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'RMK-300',
    volume: 6000,
    load_location: 'Amsterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'Bunkers',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,12),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'RMK-700',
    volume: 7000,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'Bunkers',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,13),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Toluene',
    volume: 2500,
    load_location: 'Rotterdam',
    discharge_location: 'Antwerp'
    cargo_type: 'Chemicals',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,9),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Ortho-Xylene',
    volume: 2000,
    load_location: 'Rotterdam',
    discharge_location: 'Koln'
    cargo_type: 'Chemicals',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,10),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Pygas',
    volume: 2000,
    load_location: 'Karlsruhe',
    discharge_location: 'Rotterdam'
    cargo_type: 'Chemicals',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,11),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Benzene',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam'
    cargo_type: 'Chemicals',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,12),
    oilcompany_id: oilsuppliers.sample
  },
  {
    name: 'Mioxed-Xylene',
    volume: 2000,
    load_location: 'Koln',
    discharge_location: 'Rotterdam'
    cargo_type: 'Chemicals',
    gasfree: 'No',
    cargo_loadwindow: Date.new(2019,9,13),
    oilcompany_id: oilsuppliers.sample
  },
]

Cargo.create!(cargo_attributes)

puts 'Finished!'

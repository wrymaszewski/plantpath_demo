# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
RegularChemical.destroy_all
Primer.destroy_all
Sequence.destroy_all
BacterialStock.destroy_all

users = User.create! [
  { username: "wrymaszewski", password: "123", first_name: "Wojciech", last_name: "Rymaszewski" },
  { username: "admin", password: "WIV7289" , first_name: "Admin", last_name: "Admin"}
]

require 'csv'
csv = File.read(Rails.root.join('lib', 'seeds', 'reg_chem.csv')).scrub
csvregchem = CSV.parse(csv, :headers => true)
csv= File.read(Rails.root.join('lib', 'seeds', 'sequences.csv')).scrub
csvseq = CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'primers1.csv')).scrub
csvprim = CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'bacteria2.csv')).scrub
csvbac= CSV.parse(csv, :headers => true)

csvregchem.each do |r|
	t = RegularChemical.new
	t.short_name = r["name"]
	t.full_name = r["fullname"]
	t.formula = r["formula"]
	t.producer = r["producer"]
	t.catalogue_number = r["catalogue"]
	t.place = r["place"]
	t.comments = r["comments"]
	t.save
	puts t.short_name
end
csvseq.each do |r|
	t = Sequence.new
	t.name = r["seq"]
	t.organism = r["organism"]
	puts t.name
	csvprim.each do |prow|
		if prow["seq"] == t.name
			p = t.primers.new
			p.name = prow["nazwa"]
			p.p_sequence = prow["sekwencja"]
			p.comments = prow["uwagi"]
			p.gene_sequence = prow["seq"]
			p.refine
			p.calculate_tm
			p.calculate_length
			puts p.p_sequence
		end
	end
	csvbac.each do |bac|
		if bac['sequence'] == t.name
			b = t.bacterial_stocks.new
			b.number = bac['number']
			b.insert = bac['insert']
			b.sequence_name = bac['sequence']
			b.plasmid = bac['plasmid']
			b.tag = bac['TAG']
			b.species = bac['species']
			b.antibiotic_resistance = bac['antibiotics resistance']
			b.methods_of_cloning = bac['methods of cloning']
			b.source = bac['source']
			b.comments = bac['comments']
			puts b.insert
		end
	end
	t.save
end

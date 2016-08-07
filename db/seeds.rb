User.destroy_all
RegularChemical.destroy_all
VectorAttachment.destroy_all
Vector.destroy_all
MolBiolChemical.destroy_all
Primer.destroy_all
SequenceAttachment.destroy_all
BacterialStock.destroy_all
CompetentCell.destroy_all
Sequence.destroy_all


users = User.create! [
  { username: "wrymaszewski", password: "123", first_name: "Wojciech", last_name: "Rymaszewski" },
  { username: "admin", password: "1234" , first_name: "Admin", last_name: "Admin"}
]

require 'csv'
csv = File.read(Rails.root.join('lib', 'seeds', 'reg_chem.csv')).scrub
csvregchem = CSV.parse(csv, :headers => true)
csv= File.read(Rails.root.join('lib', 'seeds', 'sequences.csv')).scrub
csvseq = CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'primers1.csv')).scrub
csvprim = CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'bacteria3.csv')).scrub
csvbac= CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'mol_biol.csv')).scrub
csvmolbiol= CSV.parse(csv, :headers => true)
csv = File.read(Rails.root.join('lib', 'seeds', 'competent.csv')).scrub
csvcompetent= CSV.parse(csv, :headers => true)

csvregchem.each do |r|
	t = RegularChemical.new
	t.short_name = r["name"]
	t.full_name = r["fullname"]
	t.formula = r["formula"]
	t.producer = r["producer"]
	t.catalogue_number = r["catalogue"]
	t.place = r["place"]
	t.comments = r["comments"]
	t.rodzaj = r["rodzaj"]
	t.state = "full"
	t.save
	puts "Regular chemicals #{t.short_name} added"
end

csvcompetent.each do |r|
	t = CompetentCell.new
	t.place = r["place"]
	t.species = r["species"]
	t.strain = r["strain"]
	t.antibiotic_resistance = r["resistance"]
	t.usage = r["zastosowanie"]
	t.comments = r["uwagi"]
	t.save
	puts "Competent cells stock #{t.strain} added"
end

csvmolbiol.each do |m|
	t = MolBiolChemical.new
	t.name = m["Fast Digest"]
	t.producer = m["Producer"]
	t.catalogue_number = m["Nr kat."]
	t.comments = m["Uwagi"]
	t.quantity = m["Zapas "]
	t.delivery_date = m["delivery"]
	t.rodzaj = m["type"]
	t.state = "full"
	t.save
	puts "Molecular biology chemical #{t.name} added"
end

csvseq.each do |r|
	t = Sequence.new
	t.name = r["seq"]
	t.organism = r["organism"]
	puts "##################### Sequence #{t.name} added ########################"
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
			puts "Primer #{p.name} added"
		end
	end
	csvbac.each do |bac|
		if bac['sequence'] == t.name
			b = t.bacterial_stocks.new
			b.number = bac['number']
			b.wstawka = bac['insert']
			b.sequence_name = bac['sequence']
			b.plasmid = bac['plasmid']
			b.tag = bac['tag']
			b.species = bac['species']
			b.strain = bac['strain']
			b.antibiotic_resistance = bac['antibiotics resistance']
			b.methods_of_cloning = bac['methods of cloning']
			b.source = bac['source']
			b.comments = bac['comments']
			b.place = bac['place']
			puts "Bacterial stock #{b.wstawka} added"
		end
	end
	t.save
end

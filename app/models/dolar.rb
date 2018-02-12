class Dolar < ApplicationRecord

	def self.search_or_create_dolars(date, dataDolar)	
		if dataDolar['Dolares'] != nil
			valor = dataDolar['Dolares'][0]['Valor']
			if valor['.'] != nil 
				valor['.'] = ''
			end
			if valor[','] != nil
				valor[','] = '.'
			end
			dolar = Dolar.create(:fecha => date, :valor => valor.to_f)
			dolar.save
		end
	end

	def self.valor_max(dolars)
		max = dolars.maximum(:valor)
	end

	def self.valor_min(dolars)
		min = dolars.minimum(:valor)
	end

	def self.valor_avr(dolars)
		avr = dolars.average(:valor)
	end

	def self.chart_data(dolars)
		data = dolars.map { |d| [d[:fecha], d[:valor]] }
	end
end

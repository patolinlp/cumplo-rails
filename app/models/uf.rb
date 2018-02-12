class Uf < ApplicationRecord

	def self.search_or_create_ufs(date, dataUf)	
		if dataUf['UFs'] != nil
			valor = dataUf['UFs'][0]['Valor']
			if valor['.'] != nil 
				valor['.'] = ''
			end
			if valor[','] != nil
				valor[','] = '.'
			end
			uf = Uf.create(:fecha => date, :valor => valor.to_f)
			uf.save
		end
	end

	def self.valor_max(ufs)
		max = ufs.maximum(:valor)
	end

	def self.valor_min(ufs)
		min = ufs.minimum(:valor)
	end

	def self.valor_avr(ufs)
		avr = ufs.average(:valor)
	end

	def self.chart_data(ufs)
		data = ufs.map { |f| [f[:fecha], f[:valor]] }
	end

end

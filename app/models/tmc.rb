class Tmc < ApplicationRecord
	def self.search_or_create_tmcs(dateInit, dateEnd, dataTMC)
		if dataTMC['TMCs'] != nil
			tmcs = dataTMC['TMCs']
			tmcs.each do |t|
				d = t['Fecha'].to_date
				tipo = t['Tipo'].to_i
				tmc_exist = Tmc.where(fecha: d, tipo: tipo)
				if tmc_exist.empty? && d >= dateInit && d <= dateEnd
					tmc = Tmc.create(:fecha => d, :valor => t['Valor'].to_f, :titulo => t['Titulo'], :subtitulo => t['SubTitulo'], :tipo => t['Tipo'].to_i)
					tmc.save
				end
			end
		end
	end

	def self.chart_data(tmcs)
		#data = tmcs.group_by{|h| h[:fecha]}.each{|_, v| v.map!{|h| [h[:valor]]}}
		data = tmcs
		
		#data = tmcs.group_by{|h| h[:tipo]}.each{|_, v| v.map!{|h| [h[:fecha], h[:valor]]}}
	end
end

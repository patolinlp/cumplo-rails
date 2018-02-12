class WelcomeController < ApplicationController
  def index
  	
  end

  def search
  	require 'net/http'
  	require 'json'

  	date_init = set_params[:dateInit].to_date
    date_end  = set_params[:dateEnd].to_date

	date_range = (date_init..date_end).to_a

	date_range.each do |d|	
		dolar = Dolar.where(fecha: d)
		if dolar.empty?
			uriDolar = 'http://api.sbif.cl/api-sbifv3/recursos_api/dolar/'+d.year.to_s+'/'+d.month.to_s+'/dias/'+d.day.to_s+'?apikey=b8124793da9ca97350a3be40583dd49e1c07e51c&formato=json'
			dataDolar = Net::HTTP.get(URI.parse(uriDolar))
			dataDolar = JSON.parse dataDolar
			Dolar.search_or_create_dolars(d, dataDolar)
			
		end
	
		uf = Uf.where(fecha: d)
		if uf.empty?
			uriUf = 'http://api.sbif.cl/api-sbifv3/recursos_api/uf/'+d.year.to_s+'/'+d.month.to_s+'/dias/'+d.day.to_s+'?apikey=b8124793da9ca97350a3be40583dd49e1c07e51c&formato=json'	
			dataUf = Net::HTTP.get(URI.parse(uriUf))
			dataUf = JSON.parse dataUf
			Uf.search_or_create_ufs(d, dataUf)
		end
	end

	uriTMC = 'http://api.sbif.cl/api-sbifv3/recursos_api/tmc/periodo/'+date_init.year.to_s+'/'+date_init.month.to_s+'/'+date_end.year.to_s+'/'+date_end.month.to_s+'?apikey=b8124793da9ca97350a3be40583dd49e1c07e51c&formato=json'
	dataTMC = Net::HTTP.get(URI.parse(uriTMC))
	dataTMC = JSON.parse dataTMC
	Tmc.search_or_create_tmcs(date_init, date_end, dataTMC)

	@dolars = Dolar.where('fecha between ? and ?', date_init, date_end)
	@ufs = Uf.where('fecha between ? and ?', date_init, date_end)
	@tmcs = Tmc.where('fecha between ? and ?', date_init, date_end)

	@data_dolars = Dolar.chart_data(@dolars)
	@data_ufs = Uf.chart_data(@ufs)
	@data_tmcs = Tmc.chart_data(@tmcs)
  end

  def set_params
    params.require(:date_range).permit(:dateInit, :dateEnd)
  end

end

require 'mechanize'

module Colectivero
	class Arrival
		def self.query(bus, bus_stop_code)
			agent = Mechanize.new
	    agent.post("http://www.etr.gov.ar/getSmsResponse.php", {"parada" => "#{bus_stop_code}", "linea"=>"#{bus[:value]}"})
	    agent.page.content
	  end
	end
end
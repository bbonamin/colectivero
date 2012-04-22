# -*- encoding: utf-8 -*-
require 'mechanize'

module Colectivero
	class Arrival
		attr_reader :query_date_time, :message
		def initialize(bus, bus_stop)
			agent = Mechanize.new
	    agent.post("http://www.etr.gov.ar/getSmsResponse.php", {"parada" => "#{bus_stop.number}", "linea"=>"#{bus.value}"})
	    @message = agent.page.content
	    @query_date_time = Time.now
	  end
	end
end
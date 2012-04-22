# -*- encoding: utf-8 -*-
require 'mechanize'
require 'json'

module Colectivero
	class BusStop

		attr_reader :number
		def initialize(bus,street,intersection)
			agent = Mechanize.new
			agent.get("http://www.etr.gov.ar/getData.php?accion=getInfoParadas&idLinea=#{bus.line_id}&idCalle=#{street['id']}&idInt=#{intersection['id']}")
			@number = agent.page.links.first.text
		end
	end
end
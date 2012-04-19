require 'mechanize'
require 'json'

module Colectivero
	class Route
		def self.streets(bus)
			agent = Mechanize.new
			agent.get("http://www.etr.gov.ar/getData.php?accion=getCalle&idLinea=#{bus.line_id}")
			JSON(agent.page.content)
		end

		def self.intersections(bus,street)
			agent = Mechanize.new
    	agent.get("http://www.etr.gov.ar/getData.php?accion=getInterseccion&idLinea=#{bus.line_id}&idCalle=#{street['id']}")
    	JSON(agent.page.content)
		end

		def bus_stop_code(bus,street,intersection)
			agent.get("http://www.etr.gov.ar/getData.php?accion=getInfoParadas&idLinea=#{bus.line_id}&idCalle=#{street['id']}&idInt=#{intersection['id']}")
			agent.page.links.first.text
		end
	end
end
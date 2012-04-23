# -*- encoding: utf-8 -*-
module Colectivero
	class Bus
		BUS_LINES = [	{:name => '101', :line_id => '1,2', :value => '101'},
									{:name => '102', :line_id => '3,4', :value => '102'},
									{:name => '103', :line_id => '5,6', :value => '103'},
									{:name => '110', :line_id =>  '11', :value => '110'},
									{:name => '112', :line_id=>'12,13', :value => '112'},
									{:name => '113', :line_id =>  '14', :value => '113'},
									{:name => '115', :line_id =>  '15', :value => '115'},
									{:name => '116', :line_id =>  '16', :value => '116'},
									{:name => '120', :line_id =>  '17', :value => '120'},
									{:name => '121', :line_id =>  '18', :value => '121'},
									{:name => '122', :line_id=>'19,20', :value => '122'},
									{:name => '123', :line_id =>  '21', :value => '123'},
									{:name => '125', :line_id =>  '22', :value => '125'},
									{:name => '126', :line_id=>'23,24', :value => '126'},
									{:name => '127', :line_id =>  '25', :value => '127'},
									{:name => '128', :line_id=>'26,27', :value => '128'},
									{:name => '129', :line_id =>  '28', :value => '129'},
									{:name => '130', :line_id =>  '29', :value => '130'},
									{:name => '131', :line_id =>  '30', :value => '131'},
									{:name => '132', :line_id =>  '31', :value => '132'},
									{:name => '133', :line_id=>'32,33', :value => '133'},
									{:name => '134', :line_id =>  '34', :value => '134'},
									{:name => '135', :line_id =>  '35', :value => '135'},
									{:name => '136', :line_id =>  '36', :value => '136'},
									{:name => '137', :line_id =>  '37', :value => '137'},
									{:name => '138', :line_id=>'38,39', :value => '138'},
									{:name => '139', :line_id=>'40,41', :value => '139'},
									{:name => '140', :line_id =>  '43', :value => '140'},
									{:name => '141', :line_id =>  '44', :value => '141'},
									{:name => '142', :line_id => '45,46,47', :value => '142'},
									{:name => '143', :line_id => '48,49', :value => '143'},
									{:name => '144', :line_id => '50,51', :value => '144'},
									{:name => '145', :line_id => '52,53', :value => '145'},
									{:name => '146', :line_id => '54,55', :value => '146'},
									{:name => '153', :line_id => '56,57,58', :value => '153'},
									{:name => 'K', :line_id => '64', :value => 'K'},
									{:name => 'Linea de la Costa', :line_id => '65', :value => 'LC'},
									{:name => 'Ronda del Centro', :line_id => '66', :value => 'RC'}	]

		attr_reader :name, :line_id, :value
		def initialize bus_name
			bus = BUS_LINES.select { |bus| bus[:name] == bus_name.to_s }.first
			if bus.nil?
				raise 'Nombre de colectivo no válido'
			else
				@name 		= bus[:name]
				@line_id 	= bus[:line_id]
				@value 		= bus[:value]
			end
		end

		def self.list_all
			buses = []
			BUS_LINES.each do |bus|
				buses << bus[:name]
			end
			buses
		end

		def streets
			agent = Mechanize.new
			agent.get("http://www.etr.gov.ar/getData.php?accion=getCalle&idLinea=#{line_id}")
			JSON(agent.page.content)
		end

		def intersections(street)
			agent = Mechanize.new
    	agent.get("http://www.etr.gov.ar/getData.php?accion=getInterseccion&idLinea=#{line_id}&idCalle=#{street['id']}")
    	JSON(agent.page.content)
		end
	end
end
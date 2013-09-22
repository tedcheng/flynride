module RidersHelper

	def generateMapUrl(rankResults) 
		@colors = ["black","blue","red","green"]
		@base_map_url = "http://maps.googleapis.com/maps/api/staticmap?sensor=false&size=900x300&maptype=roadmap&"

		@base_map_url += "markers=color:#{@colors[0]}|label:You|#{current_rider.final_dest}&"


		rankResults.each_with_index  do |result, idx|

			@base_map_url += "markers=color:#{@colors[idx+1]}|label:#{(idx + 97).chr.capitalize}|#{result[:final_dest]}&"
			
			break if idx == 2 

		end

		@base_map_url
	end

end

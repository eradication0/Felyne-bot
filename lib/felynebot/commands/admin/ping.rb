module FelyneBot
	module Commands
		module Ping
			extend Discordrb::Commands::CommandContainer
			command(
					:ping,
					bucket: :delay10,
					description: "Responds with response time",
					useage: "ping"
			) do |event|
				x = ["a","e","i","o","u"]
				y = ["B","C","D","F","G","H","J","K","L","M","N","P","R","S","T","V","W","X","Z"]
				event.respond  ":ping_pong:#{y[rand(0..y.length-1)]}#{x[rand(0..x.length-1)]}ng! : #{((Time.now - event.timestamp) * 1000).to_i}ms.:ping_pong:"
				puts "#{event.timestamp}: #{event.user.name}: CMD: ping"
				nil
			end
		end
	end
end

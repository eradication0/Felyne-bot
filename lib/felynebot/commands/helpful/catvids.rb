module FelyneBot
	module Commands
		module CatVids
			extend Discordrb::Commands::CommandContainer
			command(
					:catvids,
					description: "Cat quest videos. (Chinese)",
					useage: "catvids"
			) do |event|
				event << "<http://mho.tgbus.com/zt/mmywl/>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: catquest"
				nil
			end
		end
	end
end
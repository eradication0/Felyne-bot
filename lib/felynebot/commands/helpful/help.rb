module FelyneBot
	module Commands
		module Help
			extend Discordrb::Commands::CommandContainer
			command(
					:fullhelp,
					description: "Shows all commands. If command is added will show the description",
					useage: "help <command>"
			) do |event, more|
				admin = []
				database = []
				helpful = []
				mods = []
				raids = []
				roles = []
				Dir["lib/felynebot/commands/admin/*.rb"].each {|file| admin.push(File.basename(file, ".rb")) }
				Dir["lib/felynebot/commands/database/*.rb"].each {|file| database.push(File.basename(file, ".rb")) }
				Dir["lib/felynebot/commands/helpful/*.rb"].each {|file| helpful.push(File.basename(file, ".rb")) }
				Dir["lib/felynebot/commands/mods/*.rb"].each {|file| mods.push(File.basename(file, ".rb")) }
				Dir["lib/felynebot/commands/raids/*.rb"].each {|file| raids.push(File.basename(file, ".rb")) }
				Dir["lib/felynebot/commands/roles/*.rb"].each {|file| roles.push(File.basename(file, ".rb")) }
				if more == nil
					more = "none"
					out = "```ruby\n#IGN/Guild/Timezone Database\n"
					database.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Helpful Commands\n"
					helpful.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Role Commands\n"
					roles.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Raids\n"
					raids.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Mod only\n"
					mods.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Admin/Troubleshooting\n"
					admin.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\nTo get more info about a specific command type: #{$prefix}help <command>```"
				else
					search = more.to_sym
					if $bot.commands[search] != nil
						desc = $bot.commands[search].attributes[:description]
						useage = $bot.commands[search].attributes[:usage]
						out = "#{$prefix}#{more}: ``#{desc}``"
						if useage != nil
							out << "\nUseage: ``#{$prefix}#{useage}``"
						end
					else
						out = "No such command exists."
					end
				end
				event.respond out
				puts "#{event.timestamp}: #{event.user.name}: CMD: help"
				nil
			end
		end
	end
end
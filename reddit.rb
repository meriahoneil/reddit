require 'rest-client'
require 'json'

#greet the user
puts "Hello! Welcome to Reddit!"

puts "What kind of subreddit would you like to see?"

input = gets.strip
subreddit = "/r/#{input}"

if !subreddit.empty?
	subreddit = "/r/#{input}"
end
offset = 0


puts "What stories would you like to see? ('top', 'hot')"

feed = gets.strip

#while true
#get the petitions
#petitions = ["Gun Control", "Cannabis", "Immigration"]
	url = "reddit.com#{subreddit}/#{feed}.json?limit=10"
	response = RestClient.get url #huge string

	parsed_response = JSON.parse(response) #huge hash

	stories = parsed_response["data"]["children"]

	stories.each_with_index do |story,index|
		puts "#{index+1}. #{story["data"]["title"]}"
	end

#end 

# 	petitions = parsed_response["results"] #huge array with hashes inside

# 	if petitions.empty?
# 		puts "No more petitions to show"
# 		break
# 	end

# 	#print each petition
# 	petitions.each_with_index do |petition, index|
# 		puts "#{offset+index+1}. [#{petition["status"].upcase}] #{petition["title"]}"
# 	end

# 	offset += 10

# 	puts "Would you like to see more? (y/n)"

# 	break if gets.strip == "n"
# end

puts

#goodbye
puts "Thanks, bye!"
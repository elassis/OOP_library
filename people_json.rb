require "json"
class PeopleJson
  def show_json
    if File.exists?("people.json") == false
      File.new("people.json")
      puts ""
    end
  end
  
end
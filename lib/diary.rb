require 'pg'
require_relative 'entry'
class Diary 
  
  def self.set_environment
  
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary')
    else
      connection = PG.connect(dbname: 'diary')
    end
  end

  def self.all
    connection = PG.connect(dbname: 'diary')
   entries = connection.exec('SELECT * FROM diary_entries;')
   entries.map do |entry|
     Entry.new(entry['title'], entry['entry'], entry['date'])
   end
  end

  def self.add_entry(title, entry, date = Time.now.strftime('%B-%d-%Y'))
    set_environment.exec("INSERT INTO diary (title, entry, date) VALUES('') ")
  end  

  def self.retrieve_entry(title)
    result = set_environment.exec("SELECT title, entry, date FROM diary_entries WHERE title = '#{title}' ")
    Entry.new(result[0]['title'], result[0]["entry"], result[0]['date'])
  end
end
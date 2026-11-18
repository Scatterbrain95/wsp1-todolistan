require 'debug'
require "awesome_print"

class App < Sinatra::Base
    register Sinatra::Reloader

    def db
      return @db if @db

      @db = SQLite3::Database.new(DB_PATH)
      @db.results_as_hash = true

      return @db
    end

    get '/' do        
        @todos = db.execute('SELECT todos.*, categories.name AS category_name FROM todos INNER JOIN category_id = categories.id')
        ap @todos
        erb(:'todos/index')
    end

end

require 'pg'

class DatabaseConnection

  def self.current_connection
    @connection
  end

  def self.query(sql)
    setup unless @connection
    @connection.exec(sql)
  end

  private
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
      # ALTER SEQUENCE bookmarks RESTART
    end
  end
end
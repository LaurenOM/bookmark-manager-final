require 'database_connection'

describe DatabaseConnection do
  before(:each) { truncates }
  before(:each) { add_bookmarks }

  it 'returns a pg instance' do
    expect(DatabaseConnection.setup).to be_a(PG::Connection)
  end
end
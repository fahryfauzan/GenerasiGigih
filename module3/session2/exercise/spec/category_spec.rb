require_relative '../db/mysql_connector'
require_relative '../models/category'


describe Category do
    describe '#Insert Success' do
        context 'when insert data is valid' do

            it 'Should be insert data is Success With name = Savory' do
                client = create_db_client
                savory = Category.new(40,"Savory")
                client.query("insert into categories(id, name) values('#{savory.id}','#{savory.name}')")
                savory.save
                expect(savory.name).to eq("Savory")
            end

            it 'Should be insert data to database' do
                category = Category.new("","category")
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("insert into categories(name) values('#{category.name}')")
                #expect(category.id).to eq(40)
                expect(category.save).to eq("")
            end

        end
    end
end
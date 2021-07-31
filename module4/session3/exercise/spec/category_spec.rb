require_relative '../db/mysql_connector'
require_relative '../models/category'


describe Category do
    describe '#Insert Success' do
        context 'when insert data is valid' do
            it 'Should be insert data is Success With name = Savory' do
                client = create_db_client
                savory = Category.new(nil,"Savory")
                client.query("insert into categories(id, name) values('#{savory.id}','#{savory.name}')")
                savory.save
                expect(savory.name).to eq("Savory")
            end

            it 'Should be insert data to database' do
                category = Category.new(nil,"Category")
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO categories(name) VALUES('#{category.name}')")
                expect(category.save).to eq(true)
            end
        end

        context 'when insert data is not valid' do
            it 'Should be not insert data to database because categories.name is null' do
                category = Category.new(nil,nil)
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO categories(name) VALUES('#{category.name}')")
                expect(category.save).to eq(false)
            end
        end
    end

    describe "#View Success" do
        context "When view data is valid" do
            it 'Should be Dislay all categories' do
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from categories")
                expect(category.all).to eq(true)
            end
        end

        context "When view data is not valid" do
            
        end
    end

    describe "#Update Success" do
        context "When view data is valid" do
            
        end

        context "When view data is not valid" do
            
        end
    end

    describe "#Delete Success" do
        context "When view data is valid" do
            
        end

        context "When view data is not valid" do
            
        end
    end
end
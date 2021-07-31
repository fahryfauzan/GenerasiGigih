require_relative '../db/mysql_connector'
require_relative '../models/item'


describe Item do
    describe '#Insert Success' do
        context 'when insert data is valid' do
            it 'Should be insert data is Success With name = Rawon' do
                client = create_db_client
                rawon = Item.new(nil,"Rawon",30000)
                client.query("insert into items(id, name, price) values('#{rawon.id}','#{rawon.name}','#{rawon.price}')")
                rawon.save
                expect(rawon.name).to eq("Rawon")
                expect(rawon.price).to eq(30000)
            end

            it 'Should be insert data to database' do
                item = Item.new(nil,"Makanan",20000)
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO items(name,price) VALUES('#{item.name}','#{item.price}')")
                expect(item.save).to eq(true)
            end
        end

        context 'when insert data is not valid' do
        
        end
    end

    describe "#View Success" do
        context "When view data is valid" do
        
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
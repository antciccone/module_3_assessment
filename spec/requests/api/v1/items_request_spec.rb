require 'rails_helper'


describe 'all items endpoint' do
  context 'api/vi/items' do
    it 'returns all itens' do
      Item.create(name: 'Anthony', description: "turing student", image_url: "google.com/images" )
      Item.create(name: 'john', description: "bu student", image_url: "google.com/images" )

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(items.count).to eq(2)
      expect(items.first["name"]).to eq('Anthony')
      expect(items.first["description"]).to eq("turing student")
      expect(items.first["image_url"]).to eq("google.com/images")
      expect(items.first["created_at"]).to eq(nil)
      expect(items.first["updated_at"]).to eq(nil)
    end
  end

  context 'api/vi/items/1' do
    it 'returns specified item' do
      item = Item.create(name: 'Anthony', description: "turing student", image_url: "google.com/images" )
      Item.create(name: 'john', description: "bu student", image_url: "google.com/images" )

      get '/api/v1/items/#{item}'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)
  
    end
  end
end

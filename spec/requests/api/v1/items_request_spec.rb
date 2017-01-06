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
      item1 = Item.create(name: 'Anthony', description: "turing student", image_url: "google.com/images" )
      item2 = Item.create(name: 'john', description: "bu student", image_url: "google.com/images" )

      get "/api/v1/items/#{item1.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(item["name"]).to eq('Anthony')
      expect(item["description"]).to eq("turing student")
      expect(item["image_url"]).to eq("google.com/images")
      expect(item["created_at"]).to eq(nil)
      expect(item["updated_at"]).to eq(nil)
    end
  end

  context 'api/vi/items' do
    it 'creates an item' do
      item = Item.create(name: 'Anthony', description: "turing student", image_url: "google.com/images" )
      item_params = { name: 'john', description: 'test', image_url: 'google.com/images' }

      post "/api/v1/items", item: item_params

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(201)

      expect(items.count).to eq(2)
      expect(items.second["name"]).to eq('john')
      expect(items.second["description"]).to eq("test")
      expect(items.second["image_url"]).to eq("google.com/images")
      expect(items.second["created_at"]).to eq(nil)
      expect(items.second["updated_at"]).to eq(nil)
    end
  end

  context 'api/vi/items' do
    it 'deletes an item' do
      item1 = Item.create(name: 'Anthony', description: "turing student", image_url: "google.com/images" )
      item2 = Item.create(name: 'john', description: "turing student", image_url: "google.com/images" )

      delete "/api/v1/items/#{item1.id}"

      expect(response).to be_success
      expect(response.status).to eq(201)
    end
  end
end

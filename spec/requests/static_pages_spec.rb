require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe "'/api/v1/'にGETメソッドでリクエストを送信" do
    it 'ステータスコード200(ok)が返されること' do
      get '/api/v1/'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(1)
      expect(JSON.parse(response.body)['message']).to eq('Hello World')
    end
  end

  describe "'/api/v1/home'にGETメソッドでリクエストを送信" do
    it 'ステータスコード200(ok)が返されること' do
      get '/api/v1/home'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(1)
      expect(JSON.parse(response.body)['message']).to eq('Hello World')
    end
  end
end

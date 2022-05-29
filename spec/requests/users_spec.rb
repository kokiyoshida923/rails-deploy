require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe "'/api/v1/users/:id'にGETメソッドでリクエストを送信" do
    let!(:user) { create(:user) }

    it 'ステータスコード200 (ok) が返されること' do
      get "/api/v1/users/#{user.id}"
      expect(response.status).to eq 200
    end

    it 'ルーティングのパラメータに対応するユーザーがJSON形式で返されること' do
      get "/api/v1/users/#{user.id}"
      json = JSON.parse(response.body)
      expect(json['user']['id']).to eq(user.id)
    end
  end
end

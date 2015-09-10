require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe 'GET index' do
    let!(:products) { create_list(:product, 10) }
    let(:index_request) { get :index }
    let(:index_response) { JSON.parse response.body }

    context 'response' do
      before { index_request }

      it 'should have status 200' do
        expect(response).to have_http_status(200)
      end

      it 'should have products' do
        expect(index_response.count).to eq 10
        index_response.each do |product|
          expect(product['name']).to be_present
          expect(product['sku']).to be_present
          expect(product['category']).to be_present
        end
      end
    end
  end

  describe 'PUT update' do
    let(:product_attr) { attributes_for(:product) }
    let!(:product) { create(:product) }

    let!(:update_request) { put :update, id: product.id,
                                product: { name: product_attr[:name], sku: product_attr[:sku], category: product_attr[:category] } }

    let(:update_response) { JSON.parse response.body }

    before { update_request }

    context 'response' do
      it 'should have status 200' do
        expect(response.status).to eq(200)
      end
    end

    context 'shoud have a product' do
      it 'should have product' do
        expect(update_response['name']).to eq product_attr[:name]
        expect(update_response['sku'].to_i).to eq product_attr[:sku]
        expect(update_response['category']).to eq product_attr[:category]
      end
    end
  end
end
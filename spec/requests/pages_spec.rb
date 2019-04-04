require 'rails_helper'

RSpec.describe 'Page API', type: :request do
  let!(:page) { create(:page) }

  describe 'GET /pages' do
    before do
      Page.new(url: 'https://youtube.com').save!

      get '/pages', {
        params: {
          include: 'tags'
        }
      }
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all parsed URLs' do
      expect(json["data"].size).to eq(2)
    end

    it 'returns the included tags alongs with page' do
      expect(json.keys).to include('included')
    end
  end

  describe 'GET /pages with filter url' do
    before do
      get '/pages', {
        params: {
          include: 'tags',
          'filter[url]': 'https://wikipedia.org'
        }
      }
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns data and included keys' do
      expect(json.keys).to eq(%w(data included))
    end

    it 'returns a page' do
      expect(json["data"].size).to eq(1)
    end

    it 'return tags along with page' do
      expect(json["included"].size).to eq(3)
    end

    it 'return correct number of h1 tags' do
      expect(count_of_tags('h1')).to eq(1)
    end

    it 'return correct number of h2 tags' do
      expect(count_of_tags('h2')).to eq(5)
    end

    it 'return correct number of h3 tags' do
      expect(count_of_tags('h3')).to eq(0)
    end

    it 'return correct number of a tags' do
      expect(count_of_tags('a')).to eq(320)
    end
  end


  describe 'POST /pages' do
    context 'when correct url is passed' do
      before do
        post "/pages", {
          params: {
            data: {
              type: 'pages',
              attributes: {
                url: 'https://google.com'
              }
            }
          }.to_json,
          headers: {
            'Content-Type': 'application/vnd.api+json'
          }
        }
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return the json api resource object' do
        expect(response.body).to be_jsonapi_response_for('pages')
      end
    end

    context "when incorrect url is passed" do
      before do
        post "/pages", {
          params: {
            data: {
              type: 'pages',
              attributes: {
                url: 'google'
              }
            }
          }.to_json,
          headers: {
            'Content-Type': 'application/vnd.api+json'
          }
        }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns invalid http url message' do
        expect(json["errors"][0]["title"]).to eq('is not a valid HTTP URL')
      end
    end
  end
end

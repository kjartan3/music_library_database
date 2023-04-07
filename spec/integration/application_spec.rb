require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context 'GET /' do
  #   it 'returns an hello page if the password is correct' do
  #     response = get('/', password: 'abcd')

  #     expect(response.body).to include('Hello!')
  #   end
  # end
  
  # context 'GET /' do
  #   it 'returns an hello page if the password is incorrect' do
  #     response = get('/', password: 'sdflksdjkflsalpdow')

  #     expect(response.body).to include('Access forbidden')
  #   end
  # end

  # context "GET /albums" do
  #   it "returns a list of album titles" do
  #     response = get("/albums")
  #     expect(response.status).to eq 200
  #     expect(response.body).to include('Title: Surfer Rosa')
  #     expect(response.body).to include('Title: Waterloo')
  #   end
  # end

  context 'GET /albums/:id' do
    it 'should return a specific album' do
      response = get('/albums/2')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Surfer Rosa</h1>")
      expect(response.body).to include("Release year: 1988")
      expect(response.body).to include("Artist: Pixies")
    end
  end

  context 'GET /albums' do
    it 'should return the list of albums' do
      response = get('/albums')

      # <br />

      # <a href="albums/2">Surfer Rosa</a>
      # <a href="albums/3">Waterloo</a>
      # <a href="albums/4">Super Trouper</a>

      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/albums/2">Surfer Rosa</a><br />')
      expect(response.body).to include('<a href="/albums/3">Waterloo</a><br />')
      expect(response.body).to include('<a href="/albums/4">Super Trouper</a><br />')
      expect(response.body).to include('<a href="/albums/5">Bossanova</a><br />')
    end
  end

  context 'GET /artists/:id' do
    it 'should return a specific artist' do
      response = get('/artists/2')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>ABBA</h1>")
      expect(response.body).to include("ID: 2")
      expect(response.body).to include("Genre: Pop")
    end
  end

  context 'GET /artists' do
    it 'should return a list of all artists' do
      response = get('/artists')

      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/artists/1">Pixies</a><br />')
      expect(response.body).to include('<a href="/artists/2">ABBA</a><br />')
      expect(response.body).to include('<a href="/artists/3">Taylor Swift</a><br />')
      expect(response.body).to include('<a href="/artists/4">Nina Simone</a><br />')
      expect(response.body).to include('<a href="/artists/5">Kiasmos</a><br />')
    end
  end

  # context 'POST /albums' do
  #   it 'should return a new album' do
  #     response = post('/albums', title: 'OK Computer', release_year: '1997',  artist_id: '1')

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq('')

  #     response = get('/albums')

  #     expect(response.body).to include('OK Computer')
  #   end
  # end

  # context 'GET /artists' do
  #   it 'should return the list of artists' do
  #     response = get('/artists')

  #     expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos'

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq(expected_response)
  #   end
  # end

  # context 'POST /artists' do
  #   it 'should return a new artist' do
  #     response = post('/artists', name: 'Wild nothing', genre: 'Indie')

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq('')

  #     response = get('/artists')
  #   end
  # end

end

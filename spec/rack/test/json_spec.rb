
require 'rack/test/json'

require 'json'

describe Rack::Test::JSON do
	subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/json'}, JSON.dump(foo: 'bar'))}
	
	it 'should be valid json' do
		expect(subject).to be_json
		expect(subject.as_json['foo']).to be == 'bar'
	end
end

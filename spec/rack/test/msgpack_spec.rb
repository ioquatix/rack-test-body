
require 'rack/test/body/msgpack'

describe Rack::Test::Body::MessagePack do
	subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/msgpack'}, MessagePack.dump(foo: 'bar'))}
	
	it 'should be valid msgpack' do
		expect(subject).to be_msgpack
		
		expect(subject.parsed_body['foo']).to be == 'bar'
		
		expect(subject.as_hash[:foo]).to be == 'bar'
	end
end

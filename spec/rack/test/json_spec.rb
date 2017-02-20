
require 'rack/test/body/json'

describe Rack::Test::Body::JSON do
  subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/json'}, JSON.dump(foo: 'bar'))}

  it 'should be valid json' do
    expect(subject).to be_json

    expect(subject.parsed_body['foo']).to be == 'bar'

    expect(subject.as_hash[:foo]).to be == 'bar'
  end
end


require 'rack/test/body/yaml'

describe Rack::Test::Body::YAML do
  subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/yaml'}, YAML.dump(foo: 'bar'))}

  it 'should be valid yaml' do
    expect(subject).to be_yaml

    expect(subject.parsed_body[:foo]).to be == 'bar'

    expect(subject.as_hash[:foo]).to be == 'bar'
  end
end

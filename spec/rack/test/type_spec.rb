
require 'rack/test/body/json'

describe Array do
  subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/json'}, JSON.dump([1, 2, 3, 4]))}

  it 'should be an array' do
    expect(subject.as_array.first).to be == 1
  end

  it 'should not be a hash' do
    expect{subject.as_hash}.to raise_error(TypeError)
  end
end

describe Hash do
  subject {Rack::MockResponse.new(200, {'Content-Type' => 'application/json'}, JSON.dump({"apples" => "good"}))}

  it 'should be a hash' do
    expect(subject.as_hash.first).to be == [:apples, "good"]
  end

  it 'should not be an array' do
    expect{subject.as_array}.to raise_error(TypeError)
  end
end

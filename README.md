# Rack::Test::Body

Provides extensions to `Rack::MockResponse` for dealing with structured data, including support for JSON, YAML, and MessagePack.

## Usage

Add the following to your `spec_helper.rb` or to the top of your spec:

	# Any combination is fine, but only the ones you load will be supported:
	require 'rack/test/body/json'
	require 'rack/test/body/yaml'
	require 'rack/test/body/msgpack'

In your spec, use `last_response.parsed_body`, `last_response.as_hash` or `last_response.as_array` to interpret the response.

	# ... in spec:
	expect(last_response).to be_json
	expect(last_response.parsed_body['foo']).to be == 'bar'
	expect(last_response.as_hash[:foo]).to be == 'bar'

The `as_hash` and `as_array` attempt to symbolize the keys of the response body, so that you don't need to worry if the underlying format prefers symbols or strings for keys.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ioquatix/rack-test-json.

## License

Released under the MIT license.

Copyright, 2017, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

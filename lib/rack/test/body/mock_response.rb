# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'rack/mock'
require 'rack/test'

class Rack::MockResponse
  def parse_text(content_type, content, **options)
    raise ArgumentError.new("Unsupported content type: #{self.content_type}")
  end

  def parsed_body
    @parsed_body ||= parse_text(self.content_type, self.body)
  end

  def as_hash
    @as_hash ||= as_class(Hash)
  end

  def as_array
    @as_array ||= as_class(Array)
  end

  private

  def parsed_symbolic_body
    @parsed_symbolic_body ||= parse_text(self.content_type, self.body, symbolize_keys: true)
  end

  def as_class(klass)
    result = parsed_symbolic_body

    if result.is_a? klass
      return result
    else
      raise TypeError.new("Expected parsed body to be a #{klass}, got #{result.class} instead!")
    end
  end
end

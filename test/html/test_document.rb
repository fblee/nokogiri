require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module HTML
    class TestDocument < Nokogiri::TestCase
      def setup
        @html = Nokogiri::HTML.parse(File.read(HTML_FILE))
      end

      def test_HTML_function
        html = Nokogiri::HTML(File.read(HTML_FILE))
        assert html.html?
      end

      def test_relative_css
        html = Nokogiri::HTML(<<-eohtml)
        <html>
          <body>
            <div>
              <p>inside div tag</p>
            </div>
            <p>outside div tag</p>
          </body>
        </html>
        eohtml
        set = html.search('div').search('p')
        assert_equal(1, set.length)
        assert_equal('inside div tag', set.first.inner_text)
      end

      def test_multi_css
        html = Nokogiri::HTML(<<-eohtml)
        <html>
          <body>
            <div>
              <p>p tag</p>
              <a>a tag</a>
            </div>
          </body>
        </html>
        eohtml
        set = html.css('p, a')
        assert_equal(2, set.length)
        assert_equal ['a tag', 'p tag'].sort, set.map { |x| x.content }.sort
      end

      def test_inner_text
        html = Nokogiri::HTML(<<-eohtml)
        <html>
          <body>
            <div>
              <p>
                Hello world!
              </p>
            </div>
          </body>
        </html>
        eohtml
        node = html.xpath('//div').first
        assert_equal('Hello world!', node.inner_text.strip)
      end

      def test_find_by_xpath
        found = @html.xpath('//div/a')
        assert_equal 3, found.length
      end

      def test_find_by_css
        found = @html.css('div > a')
        assert_equal 3, found.length
      end

      def test_dup_shallow
        found = @html.search('//div/a').first
        dup = found.dup(0)
        assert dup
        assert_equal '', dup.content
      end

      def test_search_can_handle_xpath_and_css
        found = @html.search('//div/a', 'div > p')
        length = @html.xpath('//div/a').length +
          @html.css('div > p').length
        assert_equal length, found.length
      end

      def test_dup_document
        assert dup = @html.dup
        assert_not_equal dup, @html
      end

      def test_dup_document_shallow
        assert dup = @html.dup(0)
        assert_not_equal dup, @html
      end

      def test_dup
        found = @html.search('//div/a').first
        dup = found.dup
        assert dup
        assert_equal found.content, dup.content
        assert_equal found.document, dup.document
      end

      def test_inner_html
        html = Nokogiri::HTML(<<-eohtml)
        <html>
          <body>
            <div>
              <p>
                Hello world!
              </p>
            </div>
          </body>
        </html>
        eohtml
        node = html.xpath('//div').first
        assert_equal('<p>Helloworld!</p>', node.inner_html.gsub(/\s/, ''))
      end

      def test_fragment
        node_set = Nokogiri::HTML.fragment(<<-eohtml)
          <div>
            <b>Hello World</b>
          </div>
        eohtml
        assert node_set
        assert_equal 1, node_set.length
        assert_equal 'div', node_set.first.name
        assert_match(/Hello World/, node_set.to_html)
      end

      def test_relative_css_finder
        doc = Nokogiri::HTML(<<-eohtml)
          <html>
            <body>
              <div class="red">
                <p>
                  inside red
                </p>
              </div>
              <div class="green">
                <p>
                  inside green
                </p>
              </div>
            </body>
          </html>
        eohtml
        red_divs = doc.css('div.red')
        assert_equal 1, red_divs.length
        p_tags = red_divs.first.css('p')
        assert_equal 1, p_tags.length
        assert_equal 'inside red', p_tags.first.text.strip
      end

      def test_find_classes
        doc = Nokogiri::HTML(<<-eohtml)
          <html>
            <body>
              <p class="red">RED</p>
              <p class="awesome red">RED</p>
              <p class="notred">GREEN</p>
              <p class="green notred">GREEN</p>
            </body>
          </html>
        eohtml
        list = doc.css('.red')
        assert_equal 2, list.length
        assert_equal %w{ RED RED }, list.map { |x| x.text }
      end

      def test_parse_can_take_io
        html = nil
        File.open(HTML_FILE, 'rb') { |f|
          html = Nokogiri::HTML(f)
        }
        assert html.html?
      end

      def test_html?
        assert !@html.xml?
        assert @html.html?
      end

      def test_serialize
        assert @html.serialize
        assert @html.to_html
      end
    end
  end
end


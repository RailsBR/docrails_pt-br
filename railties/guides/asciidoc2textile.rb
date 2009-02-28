class ASCIIDoc2Textile

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    text = self.text.dup
    headers(text)
    links(text)
    inline_code(text)
    block_code(text)
    pre_blocks(text)
    tables(text)
    footnotes(text)
    text
  end

  def self.convert(text)
    new(text).convert
  end

private

  def inline_code(text)
    text.gsub!(/(`)(.+?)\1/, '+\\2+')
  end

  def block_code(text)
    text.gsub! /(\[source, *(\w+)\]\n)?-+\n(.*?)\n-+/m do
      type = $1 ? $2 : 'pre'
      "<#{type}>\n#{$3}\n</#{type}>"
    end
  end

  def pre_blocks(text)
    text.gsub! /^\.{5,}(.*?)\.{5,}/m do
      "<pre>#{$1}</pre>"
    end
  end

  def headers(text)
    text.gsub! /^(=+) (.*?)(?: =+)?$/ do
      "h#{$1.size+1}. #{$2}"
    end
  end

  def links(text)
    text.gsub! /(link:|http:)(.*?)\[(.*?)\]/ do
      "\"#{$3}\":#{$1 == 'http:' ? $1 : ''}#{$2}"
    end
  end

  def footnotes(text)
    text.gsub!(/<<(\d+)>>/, '[\\1]')
    text.gsub!(/\[\[\[(\d+)\]\]\]/, 'fn\\1.')
  end

  def tables(text)
    text.gsub! /^\|=+\n(\|.+\n)+\|=+/m do
      $1
    end
  end

end


if __FILE__ == $0
  puts ASCIIDoc2Textile.convert(ARGV[0] ? File.read(ARGV[0]) : STDIN.read)
end

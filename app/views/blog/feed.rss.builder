# app/views/posts/index.rss.builder
xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title "Kevin McPhillips"
    xml.description "Rails Developer"
    xml.link "http://kevinmcphillips.ca"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description nl2br(post.body)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post.full_path
      end
    end
  end
end

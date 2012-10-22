require 'test/unit'
require 'open-uri'

require_relative '../lib/halidator'

class HalidatorTest < Test::Unit::TestCase
  def test_haltalk_users
#    url = "http://haltalk.herokuapp.com/users.json"
    json_string = <<-json
{"_links":{"curie":{"name":"ht","href":"http://haltalk.herokuapp.com/rels/{rel}","templated":true},"ht:user":[{"href":"/users/mike","title":"Mike Kelly"},{"href":"/users/graste","title":"gra ste"},{"href":"/users/mamund","title":"Mike Amundsen"},{"href":"/users/amir","title":"Amir Mohtasebi"},{"href":"/users/david","title":"david h"},{"href":"/users/lanzoma","title":"Andres Freyria"},{"href":"/users/solojavier","title":"Javier Cervantes"},{"href":"/users/jaime","title":"Jaime Ryan"},{"href":"/users/fred","title":"Fred Wilson"},{"href":"/users/joel","title":"Joel Turnbull"},{"href":"/users/ryan","title":"Fred Wilson"},{"href":"/users/mikehadlow","title":"Mike Hadlow"},{"href":"/users/locks","title":"Ricardo Mendes"},{"href":"/users/downchuck","title":"Charles Pritchard."},{"href":"/users/dgray","title":"Derek Gray"},{"href":"/users/toto","title":null},{"href":"/users/qwer","title":"Garrido Gadorna"},{"href":"/users/redmatt","title":null},{"href":"/users/qfwfq","title":null},{"href":"/users/yamsahol","title":null},{"href":"/users/grosbobo","title":"Le Gros Bobo"},{"href":"/users/jblow","title":"Joe Blow"},{"href":"/users/hbredel","title":"Henning Bredel"},{"href":"/users/leusername","title":"Le Username"},{"href":"/users/ahoi","title":"Ahoi Mateh"},{"href":"/users/stewart","title":"Stewart Armbrecht"},{"href":"/users/derp","title":null},{"href":"/users/Shaun%20Marko","title":null},{"href":"/users/Mitchy","title":"Mitchy Mitch"},{"href":"/users/eric","title":"Eric"},{"href":"/users/luke","title":"Luke Stokes"},{"href":"/users/samsm","title":"Sam Schenkman-Moore"},{"href":"/users/statonjr","title":"Larry Staton Jr."},{"href":"/users/joe","title":"Fred Wilson"},{"href":"/users/chrism","title":"Chris Murphy"},{"href":"/users/test","title":"blah"},{"href":"/users/febeling","title":"Florian Ebeling"},{"href":"/users/A_Edison","title":"Albert Edison"},{"href":"/users/jason","title":"Jason Erickson"},{"href":"/users/stade","title":"Marcus Stade"},{"href":"/users/foobar","title":null},{"href":"/users/tony","title":"Tony Leigh"},{"href":"/users/coyote","title":null}]}}
json
    hal = Halidator.new(json_string)
    assert false == hal.valid?
  end

  def test_haltalk_users_posts
#    url = "http://haltalk.herokuapp.com/users/mike/posts.json"
    json_string = <<-json
{"_links":{"self":{"href":"/users/mike/posts"},"curie":{"name":"ht","href":"http://haltalk.herokuapp.com/rels/{rel}","templated":true},"ht:author":{"href":"/users/mike"}},"_embedded":{"ht:post":[{"_links":{"self":{"href":"/posts/4ff9331ee85ace0002000001"},"ht:author":{"href":"/users/mike","title":"Mike Kelly"},"ht:in-reply-to":{"href":"/posts/4ff8b9b52e95950002000004"}},"content":"Awesome! Good too see someone figured out how to post something!! ;)","created_at":"2012-07-08T07:13:34+00:00"}]}}
json
    hal = Halidator.new(json_string)
    assert true == hal.valid?
  end

  def test_haltalk_posts_latest
#    url = 'http://haltalk.herokuapp.com/posts/latest.json'
    json_string = <<-json
{"_links":{"self":{"href":"/posts/latest"}},"_embedded":{"ht:post":[{"_links":{"self":{"href":"/posts/4ff8b9b52e95950002000004"},"ht:author":{"href":"/users/mamund","title":"Mike Amundsen"}},"content":"having fun w/ the HAL Talk explorer","created_at":"2012-07-07T22:35:33+00:00"},{"_links":{"self":{"href":"/posts/4ff9331ee85ace0002000001"},"ht:author":{"href":"/users/mike","title":"Mike Kelly"},"ht:in-reply-to":{"href":"/posts/4ff8b9b52e95950002000004"}},"content":"Awesome! Good too see someone figured out how to post something!! ;)","created_at":"2012-07-08T07:13:34+00:00"},{"_links":{"self":{"href":"/posts/4fff350318fbbc0002000002"},"ht:author":{"href":"/users/david","title":"david h"}},"content":"test","created_at":"2012-07-12T20:35:15+00:00"},{"_links":{"self":{"href":"/posts/500d888403270e0002000003"},"ht:author":{"href":"/users/solojavier","title":"Javier Cervantes"}},"content":"This is a new post","created_at":"2012-07-23T17:23:16+00:00"},{"_links":{"self":{"href":"/posts/50339fcb9726840002000002"},"ht:author":{"href":"/users/mikehadlow","title":"Mike Hadlow"}},"content":"HAL Browser rocks! I think I'm finally having the hypermedia enlightenment","created_at":"2012-08-21T14:48:43+00:00"},{"_links":{"self":{"href":"/posts/5037ff3f6af5800002000003"},"ht:author":{"href":"/users/locks","title":"Ricardo Mendes"}},"content":"Hello World","created_at":"2012-08-24T22:25:03+00:00"},{"_links":{"self":{"href":"/posts/5037ff5e6af5800002000004"},"ht:author":{"href":"/users/locks","title":"Ricardo Mendes"}},"content":"ha!, this stuff wwoorrkkeeddd","created_at":"2012-08-24T22:25:34+00:00"},{"_links":{"self":{"href":"/posts/503a70787124180002000002"},"ht:author":{"href":"/users/downchuck","title":"Charles Pritchard."}},"content":"Hello everyone!","created_at":"2012-08-26T18:52:40+00:00"},{"_links":{"self":{"href":"/posts/503de98a0ee39b0002000005"},"ht:author":{"href":"/users/qfwfq","title":null}},"content":"esto est\u00e1 interesante","created_at":"2012-08-29T10:06:02+00:00"},{"_links":{"self":{"href":"/posts/5040713a5b65f30002000008"},"ht:author":{"href":"/users/grosbobo","title":"Le Gros Bobo"}},"content":"Hello from Gros bobo","created_at":"2012-08-31T08:09:30+00:00"},{"_links":{"self":{"href":"/posts/5040a65dd33e370002000002"},"ht:author":{"href":"/users/hbredel","title":"Henning Bredel"}},"content":"First try to POST s/th","created_at":"2012-08-31T11:56:13+00:00"},{"_links":{"self":{"href":"/posts/5040a741d33e370002000003"},"ht:author":{"href":"/users/hbredel","title":"Henning Bredel"},"ht:in-reply-to":{"href":"/posts/4ff8b9b52e95950002000004"}},"content":"just try to reply to a post ...","created_at":"2012-08-31T12:00:01+00:00"},{"_links":{"self":{"href":"/posts/50473b59f51e290002000004"},"ht:author":{"href":"/users/ahoi","title":"Ahoi Mateh"}},"content":"Oi oi?","created_at":"2012-09-05T11:45:29+00:00"},{"_links":{"self":{"href":"/posts/506332f4d61be70002000001"},"ht:author":{"href":"/users/Shaun%20Marko","title":null}},"content":"This is a test","created_at":"2012-09-26T16:53:08+00:00"},{"_links":{"self":{"href":"/posts/506351d970e5b20002000002"},"ht:author":{"href":"/users/Mitchy","title":"Mitchy Mitch"}},"content":"I posted it!","created_at":"2012-09-26T19:04:57+00:00"},{"_links":{"self":{"href":"/posts/5075f7b959ff250002000002"},"ht:author":{"href":"/users/chrism","title":"Chris Murphy"}},"content":"What's this then","created_at":"2012-10-10T22:33:29+00:00"},{"_links":{"self":{"href":"/posts/507edd36ed08770002000002"},"ht:author":{"href":"/users/jason","title":"Jason Erickson"}},"content":"My first post!","created_at":"2012-10-17T16:30:46+00:00"}]}}
json
    hal = Halidator.new(json_string)
    assert true == hal.valid?
  end

  def test_dtime_root
    #curl  -H "Accept: application/json"  https://api.dtime.com
    json_string = <<-json
{"_links":{"self":{"href":"https://api.dtime.com/","rel":"self"},"dtime:developers:documentation":{"href":"https://api.dtime.com/docs","rel":"dtime:developers:documentation"},"dtime:sitemap":{"href":"https://api.dtime.com/sitemap","rel":"dtime:sitemap"},"dtime:dashboard":{"href":"https://api.dtime.com/dashboard","rel":"dtime:dashboard"},"dtime:dashboard:developers":{"href":"https://api.dtime.com/developer_dashboard","rel":"dtime:dashboard:developers"},"dtime:dashboard:admin":{"href":"https://api.dtime.com/admin_dashboard","rel":"dtime:dashboard:admin"},"dtime:website":{"href":"https://www.dtime.com/{+url}","templated":true,"href-vars":{"url":"string"},"rel":"dtime:website"},"curie":{"name":"dtime","href":"https://api.dtime.com/docs/rels/{+relation}","rel":"curie","templated":true},"dtime:root":{"href":"https://api.dtime.com/","rel":"dtime:root"}}}
json
    hal = Halidator.new(json_string)
    assert true == hal.valid?
  end
end

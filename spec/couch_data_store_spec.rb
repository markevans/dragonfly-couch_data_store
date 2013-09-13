# encoding: utf-8
require 'spec_helper'
require 'net/http'
require 'uri'
require 'dragonfly/couch_data_store'
require 'dragonfly/spec/data_store_examples'

describe Dragonfly::CouchDataStore do

  before(:each) do
    @data_store = Dragonfly::CouchDataStore.new(:database => "dragonfly_test")
  end

  it_should_behave_like 'data_store'

  let (:app) { Dragonfly.app }
  let (:content) { Dragonfly::Content.new(app, "gollum") }
  let (:new_content) { Dragonfly::Content.new(app) }

  describe "url_for" do
    it "should give the correct url" do
      @data_store.url_for('asd7fas9df/thing.txt').should == 'http://localhost:5984/dragonfly_test/asd7fas9df/thing.txt'
    end

    it "should assume the attachment is called 'file' if not given" do
      @data_store.url_for('asd7fas9df').should == 'http://localhost:5984/dragonfly_test/asd7fas9df/file'
    end
  end

  describe "serving from couchdb" do

    def get_content(url)
      uri = URI.parse(url)
      Net::HTTP.start(uri.host, uri.port) {|http|
        http.get(uri.path)
      }
    end

    it "serves with the correct data type (taken from ext)" do
      content.name = 'doogie.png'
      uid = @data_store.write(content)
      response = get_content(@data_store.url_for(uid))
      response.body.should == 'gollum'
      response['Content-Type'].should == 'image/png'
    end

 end

  describe "already stored stuff" do
    def store_pdf(meta)
      doc = CouchRest::Document.new(:meta => meta)
      doc_id = @data_store.db.save_doc(doc)['id']
      doc.put_attachment("pdf", "PDF data here")
      doc_id
    end

    it "still works" do
      doc_id = store_pdf('some' => 'cool things')
      @data_store.read(new_content, "#{doc_id}/pdf")
      new_content.data.should == "PDF data here"
      new_content.meta['some'].should == 'cool things'
    end

    it "still works when meta was stored as a marshal dumped hash (but stringifies its keys)" do
      doc_id = store_pdf(Dragonfly::Serializer.marshal_b64_encode(:some => 'shizzle'))
      @data_store.read(new_content, "#{doc_id}/pdf")
      new_content.meta['some'].should == 'shizzle'
    end
  end

end


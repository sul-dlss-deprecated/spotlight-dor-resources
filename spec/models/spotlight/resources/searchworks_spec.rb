require 'spec_helper'

describe Spotlight::Resources::Searchworks do

  let :exhibit do
    double(solr_data: { }, blacklight_config: Blacklight::Configuration.new)
  end

  subject { Spotlight::Resources::Searchworks.new url: "http://searchworks.stanford.edu/view/xf680rd3068" }

  before do
    allow(subject).to receive(:exhibit).and_return(exhibit)
    allow(subject).to receive(:to_global_id).and_return('x')
  end

  describe ".can_provide?" do
    subject { Spotlight::Resources::Searchworks }
    it "should be able to provide any searchworks URL" do
      expect(subject.can_provide?(double(url: "https://searchworks.stanford.edu/xyz"))).to eq true
      expect(subject.can_provide?(double(url: "http://searchworks.stanford.edu/xyz"))).to eq true
    end
    it "should also work with searchworks-test URLs" do
      expect(subject.can_provide?(double(url: "https://searchworks-test.stanford.edu/xyz"))).to eq true
      expect(subject.can_provide?(double(url: "http://searchworks-test.stanford.edu/xyz"))).to eq true
    end
  end

  describe "#doc_id" do
    it "should be able to extract DRUIDs from a searchworks url" do
      subject.url = "http://searchworks.stanford.edu/view/xyz"
      expect(subject.doc_id).to eq "xyz"
    end

    it "should be able to extract DRUIDs from a searchworks format url" do
      subject.url = "http://searchworks.stanford.edu/view/xf680rd3068.xml"
      expect(subject.doc_id).to eq "xf680rd3068"
    end
  end

  describe "#resource" do
    it "should be a Harvestdor::Indexer resource" do
      expect(subject.resource).to be_a_kind_of Harvestdor::Indexer::Resource
    end

    it "should have the correct druid" do
      expect(subject.resource.druid).to eq "xf680rd3068"
    end

    it "should have the correct indexer" do
      expect(subject.resource.indexer).to eq Spotlight::Dor::Resources.indexer.harvestdor
    end
  end

  describe "#to_solr" do
    before do
      allow(Spotlight::Dor::Resources.indexer).to receive(:solr_document)
      allow_any_instance_of(SolrDocument).to receive(:to_solr).and_return({})
    end
    context "with a collection" do
      before do
        allow(subject.resource).to receive(:collection?).and_return(true)
      end

      it "should provide a solr document for the collection" do
        allow(subject.resource).to receive(:items).and_return([])
        expect(Spotlight::Dor::Resources.indexer).to receive(:solr_document).with(subject.resource).and_return({upstream: true})
        expect(subject.to_solr.first).to include :upstream, :spotlight_resource_id_ssim, :spotlight_resource_type_ssim
      end

      it "should provide a solr document for the items too" do
        item = double
        allow(subject.resource).to receive(:items).and_return([item])
        expect(Spotlight::Dor::Resources.indexer).to receive(:solr_document).with(subject.resource).and_return({collection: true})
        expect(Spotlight::Dor::Resources.indexer).to receive(:solr_document).with(item).and_return({item: true})
        solr_doc = subject.to_solr.to_a
        expect(solr_doc.first).to include :collection
        expect(solr_doc.last).to include :item
      end
    end

    context "with a single item" do
      before do
        allow(subject.resource).to receive(:collection?).and_return(false)
      end

      it "should provide a solr document for the resource" do
        expect(Spotlight::Dor::Resources.indexer).to receive(:solr_document).with(subject.resource).and_return({upstream: true})
        expect(subject.to_solr.first).to include :upstream, :spotlight_resource_id_ssim, :spotlight_resource_type_ssim
      end
    end
  end
end
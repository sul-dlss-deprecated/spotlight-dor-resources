describe 'gdor indexing integration test', :vcr do
  let(:exhibit) { FactoryGirl.create(:exhibit) }

  subject do
    r = Spotlight::Resources::DorHarvester.new(druid_list: 'xf680rd3068', exhibit: exhibit)
    allow(r).to receive(:to_global_id).and_return('x')
    r.document_builder.to_solr.first
  end

  it 'has a doc id' do
    expect(subject[:id]).to eq 'xf680rd3068'
  end

  it 'has the gdor data' do
    expect(subject).to include :collection, :modsxml, :url_fulltext
  end

  it 'has spotlight data' do
    expect(subject).to include :spotlight_resource_id_ssim
  end

  it 'has exhibit-specific indexing' do
    expect(subject).to include 'full_image_url_ssm'
  end

  it 'can write doc to solr with latest exhibits_solr_conf', vcr: false do
    # hd778hw9236 has B.C. date -- good for checking Solr field types
    r = Spotlight::Resources::DorHarvester.new(druid_list: 'hd778hw9236')
    allow(r).to receive(:to_global_id).and_return('x')
    allow(r).to receive(:exhibit).and_return(exhibit)
    r.reindex
  end
end

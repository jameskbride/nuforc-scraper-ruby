describe IndexReportsSince do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxpost.html'


  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'reports_since.html')
    @index_reports_html = File::open(path)
  end

  after(:each) do
    @index_reports_html.close
  end

  describe 'given a matching date' do
    it 'returns a list of reports since that date' do
      exact_date = '07/07/2017'
      index_reports = IndexReportsSince.new(ARBITRARY_URL, exact_date)
      expect(index_reports).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)
      @monthly_reports = index_reports.parse

      expect(@monthly_reports.length).to eq(1)
      expect(@monthly_reports[0].url).to eq('http://nuforc.org/webreports/ndxp170707.html')
    end
  end

  describe 'given a non-matching date' do
    it 'returns a list of reports since that date' do
      non_matching_date = '06/21/2017'
      index_reports = IndexReportsSince.new(ARBITRARY_URL, non_matching_date)
      expect(index_reports).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)
      @monthly_reports = index_reports.parse

      expect(@monthly_reports.length).to eq(2)
      expect(@monthly_reports[0].url).to eq('http://nuforc.org/webreports/ndxp170707.html')
      expect(@monthly_reports[1].url).to eq('http://nuforc.org/webreports/ndxp170622.html')
    end
  end
end
describe Incident do

  ARBITRARY_INCIDENT_URL = 'http://nuforc.org/webreports/130/S130329.html'

  it 'should have a url' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30')

    expect(incident.url).to eq(ARBITRARY_INCIDENT_URL)
  end

  it 'should have a date/time' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30')

    expect(incident.date_time).to eq('9/29/16 23:30')
  end
end
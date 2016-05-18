require './app/models/space'

describe AvailablePeriod do
  let(:start_date) { Date.new(2016,05,18) }
  let(:end_date) { Date.new(2016,05,20) }

  before(:each) do
    user = User.create(firstname: 'Jack', lastname: 'Hardy', email: 'jackhardy1@gmail.com', password: 'jack')
    space = Space.create(name: 'makers', description: 'makers is good', price: 10, user_id: user.id)
    space.available_periods << AvailablePeriod.create(start_date: '2016-05-18', end_date: '2016-05-20', space_id: space.id)
  end

  describe 'Creates available dates' do
    it 'Creates a date' do
      period = AvailablePeriod.first
      expect(period.start_date).to eq start_date
      expect(period.end_date).to eq end_date
    end
  end

end

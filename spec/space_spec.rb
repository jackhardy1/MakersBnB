require './app/models/space'

describe Space do

  let(:user){ User.create(firstname: 'matt', lastname: 'ward', email: 'matt@matt.com', password: '123') }

  it 'stores a name' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50, user_id: user.id)
    expect(Space.first.name).to eq 'Makers Academy'
  end

  it 'stores a description' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50, user_id: user.id)
    expect(Space.first.description).to eq 'a very nice place to study at'
  end

  it 'stores a price per night' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50, user_id: user.id)
    expect(Space.first.price).to eq(50)
  end
end

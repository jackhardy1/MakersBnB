require './app/models/space'

describe Space do
  let!(:space) do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50)
  end
  it 'stores a name' do
    expect(space.name).to eq 'Makers Academy'
  end
  it 'stores a description' do
    expect(space.description).to eq 'a very nice place to study at'
  end
  it 'stores a price per night' do
    expect(space.price).to eq(50)
  end
end

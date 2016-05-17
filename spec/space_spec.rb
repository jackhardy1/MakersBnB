require './app/models/space'

describe Space do

  it 'stores a name' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50)
    expect(Space.first.name).to eq 'Makers Academy'
  end

  it 'stores a description' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50)
    expect(Space.first.description).to eq 'a very nice place to study at'
  end

  it 'stores a price per night' do
    Space.create(name: 'Makers Academy', description: 'a very nice place to study at', price: 50)
    expect(Space.first.price).to eq(50)
  end
end

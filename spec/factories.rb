FactoryGirl.define do
  factory(:message) do
    from '5032134556'
    to '5037841300'
    body 'Hey baby!'
  end

  factory(:contact) do
    name 'Daddy Jones'
    phone '5037841300'
  end
end

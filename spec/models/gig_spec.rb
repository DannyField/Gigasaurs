require 'rails_helper'

RSpec.describe Gig, type: :model do
    subject { Gig.new(
        title: 'Test Band',
        venue: 'The Prince Of Wales',
        location: '29 Fitzroy Street, St Kilda, VIC 3182',
        gig_details: 'We rock the stage at 8:30pm',
        support: 'Some Band',
        tickets_available: 100,
        cost: 4000
    )}

context 'validations' do
    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    if 'it not valid without a title' do
        subject.title = nil
        expect(subject).to_not be_valid
    end
end
end

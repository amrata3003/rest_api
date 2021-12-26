require 'rails_helper'

describe Course, type: :model do
  it { is_expected.to have_many :tutors }

  subject {
    FactoryBot.create(:course)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end

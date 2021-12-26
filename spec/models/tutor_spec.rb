require 'rails_helper'

describe Tutor, type: :model do
  it { is_expected.to belong_to(:course).optional }

  subject {
    FactoryBot.create(:tutor)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
end

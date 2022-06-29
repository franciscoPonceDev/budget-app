require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :all do
    @user = User.first
    @category = Category.first
  end

  it 'Create a valid transaction' do
    transaction = Entity.new(user: @user, category: @category, name: 'Disney+', amount: 10)
    expect(transaction).to be_valid
  end

  it 'Create an invalid transaction due to wrong name' do
    transaction = Entity.new(user: @user, category: @category, name: '', amount: 10)
    expect(transaction).to be_invalid
    expect(transaction.errors[:name][0]).to be == "Name can't be blank"
  end

  it 'Create an invalid transaction due to wrong amount' do
    transaction = Entity.new(user: @user, category: @category, name: 'Fruits', amount: 0)
    expect(transaction).to be_invalid
    expect(transaction.errors[:amount][0]).to be == 'Amount must be greater than 0'
  end
end

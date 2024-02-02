# frozen_string_literal: true
module AccountPresenter 
  extend ActiveSupport::Concern 

  included do
    acts_as_api
    api_accessible :base do |t|
      t.add :id
      t.add :account_number
      t.add :balance
    end

    api_accessible :index, extend: :base do |t|
    end

    api_accessible :show, extend: :base do |t|
    end
  end
end

require 'rails_helper'

RSpec.describe FightersController, type: :controller do

  user = FactoryBot.create(:user)
  login_as(user)

  describe 'Routing' do
    it { should route(:get, '/fighters').to(action: :index) }
    it { should route(:get, '/fighters/new').to(action: :new) }
    it { should route(:get, '/fighters/1').to(action: :show, id: 1) }
    it { should route(:get, '/fighters/1/edit').to(action: :edit, id: 1) }
  end
end

require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  it "renders the welcome page" do
    get :index
    expect(response).to render_template("index")
  end
end

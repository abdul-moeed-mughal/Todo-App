require 'rails_helper'

RSpec.describe TasksController, :type => :controller do

  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end

require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do

  before(:each) do
    @event = FactoryBot.build(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  it "show valid content" do
    id = @event.id
    render "events/id", :id => id

    rendered.should contain("Title")
  end

  # it "displays the correct page for a event" do
  #   controller.extra_params = { :id => @event.id }
  #   expect(controller.request.fullpath).to eq event_path(controller.extra_params)
  # end
end

# TO-DO LIST
# Un test pour montrer que cette vue affiche bien les éléments de l'événement en question (teste que le title de l'événement s'affiche bien, par exemple)
# Des tests pour vérifier que le bouton pour rejoindre un événement ne s'affiche pas si le visiteur :
#     n'est pas connecté
#     est le créateur de l'événement
#     est déjà participant à l'événement
# Un test pour vérifier que le bouton pour rejoindre l'événement s'affiche bien si nous avons un utilisateur connecté lambda du site
# Un test pour vérifier que le bouton pour modifier l'événement ne s'affiche pas à moins que le visiteur soit le créateur de l'événement

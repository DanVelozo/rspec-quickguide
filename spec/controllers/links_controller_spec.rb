require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:link) { mock_model(Link).as_null_object }

  describe "POST 'create'" do
    before do
      Link.stub(:new).and_return(link)
    end
    it 'creates link' do
      Link.should_receive(:new).with("url" => "http://exemplo.com").and_return(link)
      post :create, link: { url: 'http://exemplo.com' }
    end

    it 'saves link' do
      link.should_receive(:save)
      post :create
    end

    context 'when link is saved' do
      before do
        link.stub(save: true)
      end

      it 'redirects to link overview' do
        post :create
        expect(response).to redirect_to(action: 'show', id: link.id)
      end

      it 'display message' do
        post :create
        expect(flash[:notice]).to eql('Your link has been shortened!')
      end
    end

    context 'when link is not saved' do
      before do
        link.stub(save: false)
      end

      it 'assigns @link' do
        post :create
        expect(assigns[:link]).to eql(link)
      end

      it 'renders the new template' do
        post :create
        expect(response).to render_template('new')
      end

      it 'does not display message' do
        post :create
        expect(flash[:notice]).to be_nil
      end
    end
  end
end

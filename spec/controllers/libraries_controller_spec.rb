require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
	
	context "logged in as user" do
		login_user

		describe "GET index" do
	    it "populates several arrays of libraries" do
	    	libraries_own = []
	    	libraries_followed = []

	    	(1..4).each do
	    		libraries_own.push(FactoryGirl.create(:library))
	    	end
	    	subject.current_user.libraries_created = libraries_own
	    	 
	    	(1..4).each do
	    		libraries_followed.push(FactoryGirl.create(:library))
	    	end
	    	subject.current_user.libraries = libraries_followed


	    	#current_user follows his own library
	    	libraries_followed.first.creator = subject.current_user

	    	libraries = []
	    	



	    	get :index
	    	#expect(assigns(:libraries)).to eq(libraries_own.push(*libraries_followed))
	    	expect(assigns(:libraries_own)).to eq(libraries_own)
	    	expect(assigns(:libraries_followed)).to eq(libraries_followed.select { |lib| lib.creator != subject.current_user})
	    	expect(assigns(:libraries_followed)).not_to eq(libraries_followed)
	    end
	    it "renders the :index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
	  end

	  describe "GET show" do
	  	context "on private library" do
	  		context "where user is creator" do
	  		
	  			it "assigns the requested library to @library" do
  					library = FactoryGirl.create(:private_library)
  					subject.current_user.libraries_created.push(library)
	  				get :show, id: library
	  				expect(assigns(:library)).to eq(library)
	  			end
	  			it "renders the :show template" do
  					library = FactoryGirl.create(:private_library)
  					subject.current_user.libraries_created.push(library)
	  				get :show, id: library
			    	expect(response).to render_template(:show)
	  			end
	  		
	  		end
	  		context "where user is not creator" do

	  			it "returns 302 because of redirect caused by insufficient permissions" do
	  				library = FactoryGirl.create(:private_library)
	  				get :show, id: library
	    			expect(response.status).to eq(302)
	  			end

	  		end

	  	end
	  	context "on public library" do
	  		it "assigns the requested library to @library"
	    	it "renders the :show template" do
	    		#get :show, id: FactoryGirl.create
		    end
	  	end
	    
	  end

	  describe "GET new" do
	    it "assigns a new Library to @library" do
	    end
	    it "renders the :new template"
	  end

	  describe "POST create" do
	  	context "with valid attributes" do
	      it "saves the new library in the database"
	      it "redirects to the home page" do
	  			post :create, library: FactoryGirl.attributes_for(:library)
		  		expect(response).to redirect_to(root_url)
		  	end
	    end

	    context "with invalid attributes" do
	      it "does not save the new library in the database"
	      it "re-renders the :new template"
	    end
	  end

	end

	context "not logged in" do

		describe "GET index" do
	    it "returns 302 because of redirect caused by insufficient permissions" do
	    	get :index
	    	expect(response.status).to eq(302)
	    end
	  end

	  describe "GET show" do	  	
	  	context "on private library" do
	  		library = FactoryGirl.create(:private_library)

	  		it "returns 302 because of redirect caused by insufficient permissions" do
	  			get :show, id: library
	  			expect(response.status).to eq(302)
	  		end
	  	end
	  	
	  	context "on public library" do 
	  		library = FactoryGirl.create(:library)
	  		it "assigns the requested library to @library" do
	  			get :show, id: library
	  			expect(assigns(:library)).to eq(library)
	  		end
	  		it "renders the :show template" do
	  			get :show, id: library
	  			expect(response).to render_template(:show)
	  		end
	  	end
	  end

	  describe "GET new" do
	    it "returns 302 because of redirect caused by insufficient permissions" do
	    	get :new
	    	expect(response.status).to eq(302)
	    end
	  end
	
	end
	
end

class GossipsController < ApplicationController
 
    def index
      @array = Gossip.reorder('Created_at DESC').showall
    end
    #.reorder('Created_at DESC')
    def show
      puts @detail = Gossip.find(params['id'])
    end 

    def new
      puts @post = User.find(rand(1..20))
    end

    def create
      user = User.find(rand(1..20))
      @post = Gossip.new(user_id: user.id,
                          'title' => params[:title],
                          'content' => params[:content])
      if @post.save
        @array = Gossip.showall
        render "index.html.erb"
      else
        render new_gossip_path
      end
  end
  #reorder('Created_at DESC').
  
    def edit
      @detail = Gossip.reorder('Created_at DESC').find(params['id']) 
      # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
  
    def update
      @detail = Gossip.find(params['id'])
    gossip_params=params.require(:gossip).permit(:title, :date,:content)
    if @detail.update(gossip_params)
    redirect_to @detail
#      @detail = Gossip.find(params[:id])
 #   if @detail.update(params[:content])
 #     redirect_to @detail@detail
    else
      render :edit
    end


      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    end
  
    def destroy
      @detail = Gossip.find(params['id'])
      @detail.destroy
      redirect_to gossips_path
      #render "index.html.erb"
      # Méthode qui récupère le potin concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end
end
  


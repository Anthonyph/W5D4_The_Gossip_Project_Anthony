class User < ApplicationRecord
  has_many :gossips
	belongs_to :city
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	
  def self.showall
		user_array = User.all					
		return user_array    		
	end


	#Permet d'afficher tout les users sous forme d'array

	#def self.find(id)
		
   # user_array = self.showall
   # index=id.to_i - 1 
   # user_id = user_array[index]
    
	#	return user_id 
	#end
	#Permet de trouver un user dans l'array en utilisant son id.

end

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String
  has_many :businesscards

  has_secure_password

  validates_uniqueness_of :email

 # def businesscards
 #      Businesscard.find businesscard_ids
 # end
 #    #accepts_nested_attributes_for :pastries

 #    def businesscard_ids
 #      businesscard_ids_array = []
 #      self.user_businesscards.each do |one_user_card|
 #        if one_user_card.pastry_id
 #          businesscard_ids_array.push one_user_card.pastry_id
 #        end 
 #      end
 #      businesscard_ids_array 
 #    end

 #    def businesscard_ids=(list)
 #      self.user_businesscards.destroy
 #      list.each do |businesscard_id|
 #        self.user_businesscards.create(businesscard_id: businesscard_id)
 #      end
 #    end

 #    # some way of showing a list
 #    def businesscard_list
 #      businesscards_string = ""
 #      businesscards.each do |one_businesscard|
 #      businesscards_string += ", " + one_businesscard.name
 #    end
 #      businesscards_string.slice!(2,businesscard_string.length - 1)
 #      if businesscards_string.length = 0
 #          businesscards_string = "no cards"
 #      end
 #      businesscard_string
 #    end
end

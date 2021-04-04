class User < ApplicationRecord
    has_many :pieces
    has_many :museums

    has_secure_password

    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email

    def museums_attributes=(museums_attributes)
        museums_attributes.values.each do |museum_attribute|
            museum = Museum.find_or_create_by(museum_attribute)
            self.museums << museum
        end
    end
end
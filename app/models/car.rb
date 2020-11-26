class Car < ApplicationRecord
    validates :year, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :engine, presence: true
    validates :drivetrain, presence: true
    validates :suspension_and_brakes, presence: true
    validates :wheels_and_tires, presence: true
    validates :images, presence: true

    has_many :pins
    has_many :boards, through: :pins
    has_many :users, through: :boards 
    belongs_to :owner, class_name: "User"
    has_many_attached :images

 
    def self.search_all_fields(text)
        query = self.clean_query
        return Car.where( query, "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%", "%#{text}%")
    end

    def self.clean_query 
        query = column_names.map do |e, i| 
            if e == 'id' || e == 'year' || e == 'owner_id' 
                "cast(#{e} as text) LIKE ? OR"
            else 
                "#{e} LIKE ? OR"
            end
        end
        query.push(query.pop().gsub(" OR", "")).join(" ")
    end 

    def year_make_model
        "#{self.year} #{self.make} #{self.model}"
    end 


end 
class Car < ApplicationRecord
    validates :year, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :engine, presence: true
    validates :drivetrain, presence: true
    validates :suspension, presence: true
    validates :wheels_and_tires, presence: true

    has_many :pins
    has_many :boards, through: :pins
    has_many :users, through: :boards 
    belongs_to :owner, class_name: "User"
    has_many_attached :images

    # scope :desc_year, ->
    scope :search_all_fields, ->(text){
        where("#{column_names.join(' || ')} like ?", "%#{text}%")
      }

    def year_make_model
        "#{self.year} #{self.make} #{self.model}"
    end 


end 
class User < ActiveRecord::Base
  belongs_to :grade
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  after_save :add_role_if_empty
    
  
  def full_name
  	[last_name, first_name].join(' ')
  end

  protected

  def add_role_if_empty
    unless self.has_any_role?
      self.add_role :observer      
    end
  end 

end

class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :teams

  enum role: [:player, :captain, :admin]
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :player
  end
end

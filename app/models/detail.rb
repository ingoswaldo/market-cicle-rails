class Detail < ApplicationRecord
  belongs_to :person

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, numericality: { only_integer: true }, allow_nil: true
  validates :phone, format: { with: /\A^(?=(?:.*?\d){10}$)[0-9(). \/x\/+-]+\z/ }, allow_nil: true
end

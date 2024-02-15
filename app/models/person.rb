# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :details, dependent: :destroy

  accepts_nested_attributes_for :details

  validates :name, presence: true

  private

  def reject_details(attributes) = attributes['email'].blank?
end

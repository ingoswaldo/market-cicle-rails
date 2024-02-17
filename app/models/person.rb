# frozen_string_literal: true

class Person < ApplicationRecord
  has_one :detail, dependent: :destroy

  accepts_nested_attributes_for :detail

  validates :name, presence: true

  private

  def reject_details(attributes) = attributes['email'].blank?
end

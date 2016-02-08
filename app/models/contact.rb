class Contact < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :communications, dependent: :destroy
  accepts_nested_attributes_for :addresses, :communications, reject_if: :all_blank

  def self.address_build
    contact = self.new
    contact.addresses.build
    contact
  end

  def self.communication_build
    contact = self.new
    contact.communications.build
    contact
  end

  def full_name
    check_full_name = self.first_name.capitalize + ' ' + self.last_name.capitalize
    check_full_name.present? ? check_full_name : '-'
  end

  def primary_address
    first_address = self.addresses.first.try(:address)
    first_country = self.addresses.first.try(:country).try(:capitalize)
    check_primary_address = [first_address, first_country].compact.reject { |i| i.size.zero? }.join(' - ')
    check_primary_address.present? ? check_primary_address : '-'
  end

  def primary_phone
    check_primary_phone = self.communications.first.try(:phone)
    check_primary_phone.present? ? check_primary_phone : '-'
  end
end

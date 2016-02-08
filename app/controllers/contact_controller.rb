class ContactController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    @contact.addresses.build
    @contact.communications.build
    @address_count = 1
    @communication_count = 1
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:info] = 'Contact was successfully created.'
      redirect_to root_path
    else
      render :new
    end
  end

  def add_address
    @contact = Contact.address_build
    @address_count = params[:address_count]
    render :add_address, layout: false
  end

  def add_communication
    @contact = Contact.communication_build
    @communication_count = params[:communication_count]
    render :add_communication, layout: false
  end

  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, addresses_attributes: [ :id, :address, :country ], communications_attributes: [ :id, :phone ])
    end
end

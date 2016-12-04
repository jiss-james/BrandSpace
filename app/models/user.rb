# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, :last_name, presence: true

  enum gender: [ :male, :female ]

  has_many :identities
  has_many :companies, dependent: :destroy


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  # Omniauth - social connect
  def self.from_omniauth(auth)
    return false unless auth.info.email.present?

    @identity = Identity.find_by(provider: auth.provider, uid: auth.uid)
    return @identity.user if @identity

    user = find_by(email: auth.info.email)

    if user.present?
      user.create_identity(auth)
    else
      user = new do |new_user|
        new_user.email = auth.info.email
        new_user.password = Devise.friendly_token[0, 20]
        new_user.first_name = auth.info.first_name || auth.info.name.split.first
        new_user.last_name = auth.info.last_name || auth.info.name.split.last

        # should trigger a welcome email without confrimation link somewhere if creating... (maybe in user model as after create callback?)
        new_user.confirmed_at = Time.now

        new_user.avatar = auth.info.image # assuming the user model has an image
      end

      if user.save
        user.create_identity(auth)
      else
        return false
      end
    end

    user
  end

  def create_identity(auth)
    identities.create_with_omniauth(auth)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.first_name = data["name"].split.first if user.first_name.blank?
        user.last_name = data["name"].split.last if user.last_name.blank?
      end
    end
  end

end

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    redirect_to root_path, alert: 'ゲストユーザーは削除できません。' if resource.email == 'guest@example.com'
  end

  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end
end

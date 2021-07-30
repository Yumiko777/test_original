class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    redirect_to root_path, alert: 'ゲストユーザーは削除できません。' if resource.email == 'guest@example.com'
  end

  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end

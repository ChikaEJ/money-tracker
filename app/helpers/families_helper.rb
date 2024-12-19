module FamiliesHelper
  def current_user_family(user)
    Family.where(id: user.family_id).first
  end
end

module FamiliesHelper
  def has_family?(user)
    user_res = User.where.not(family_id: nil).where(id: user.id)
    user_res.empty? ? false : true
  end
  def current_user_family(user)
    Family.where(id: user.family_id).first
  end
end

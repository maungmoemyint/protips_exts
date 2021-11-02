module RolesHelper
  def can_edit?(tip)
    case(current_user.role)
    when 'admin' then true
    when 'registered' then current_user == tip.user
    else false
    end
  end
end

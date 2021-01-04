module AdminHelper

  def getUserRole
    user_roles_id = current_user.user_roles_id
    getRole = UserRole.where(id: user_roles_id).first()
    if(getRole !=nil && getRole.permission !=nil)
      return getRole.permission;
    else
      return false;
    end
  end

  def getMenusAll()
    usermenus = UserMenu.getMenus.where(parentMenu: '').order(orderBy: :asc)
    return usermenus
  end

  def getSubMenusAll(id)
    usersubmenus = UserMenu.getMenus.where(parentMenu: id.to_s).order(orderBy: :asc)
    return usersubmenus
  end

  def rolesDynamicChecked(array_val,menu_id)
    if(array_val !=nil)
      a = array_val.split(',')
      return (a.include?(menu_id.to_s)) ? true : false
    else
      errors.add(:base, "You don't have permission this")
      throw(:abort)
    end 
  end

end

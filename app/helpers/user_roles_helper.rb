module UserRolesHelper
  def getUserAction(id)
    useraction = UserMenuAction.where(user_menu_id: id)
    return useraction
  end

  def rolesMenusChecked(array_val,menu_id)
    if(array_val !=nil)
      a = array_val.split(',')
      return checked = (a.include?(menu_id.to_s)) ? 'checked' : ''
    else
      return checked = '';
    end 
  end 
end

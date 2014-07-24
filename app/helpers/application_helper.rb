module ApplicationHelper
  def link_to_remove_category_fields(category, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_category_fields(category, f, association)
  end
end

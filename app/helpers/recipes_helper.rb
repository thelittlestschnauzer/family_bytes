module RecipesHelper
  
  def chapter_id_field(recipe)
    if recipe.chapter.nil?
      select_tag "recipe[chapter_id]", options_from_collection_for_select(Chapter.all, :id, :title)
    else
      hidden_field_tag "recipe[chapter_id]", recipe.chapter_id 
    end 
  end 

end

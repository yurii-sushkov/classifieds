module SubcategoriesHelper
  def subcategories_collection
    Category.all.collect { |category| [category.title, category.subcategories.collect { |v| [v.title, v.id] } ] }
  end
end

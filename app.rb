require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ("/") do
  erb(:index)
end

post ("/") do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

post("/recipes") do
  name = params.fetch("recipe_name")
  Recipe.create({:name => name})
  redirect("/recipes")
end

get ('/recipes/delete') do
  recipe_id = params.fetch("recipe_delete")
  recipe=Recipe.find(recipe_id)
  recipe.delete
  @recipes = Recipe.all
  erb(:recipes)
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  if @employee.project_id
    @project = Project.find(@employee.project_id)
  else
    @project = nil
  end
  @projects = Project.all
  erb(:recipes)
end

get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/ingredients") do
  name = params.fetch("ingredients")
  Ingredients.create({:name => name})
  redirect("/ingredients")
end

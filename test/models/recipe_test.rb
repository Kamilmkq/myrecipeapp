 require 'test_helper'

class RecipeTest < ActiveSupport::TestCase



def setup
@chef = Chef.create(chefname: "Bob", email: "bob@example.com")	

@recipe = @chef.recipes.build(:name => "Chicken Tikka",:summary => "BBQ Dish",:description => 
	           			"Cook The dish on grill for 15 mins after marination")
end


test "recipe should be valid" do 
 assert_not @recipe.valid?
end

 

test "chef_id should be present" do 
	@recipe.chef_id = nil
	assert_not @recipe.valid?
end	


test "name should be present" do 
	@recipe.name = ""
	assert_not  @recipe.valid?
end	

test "name length should not be too long" do 
   @recipe.name = 'a' * 101
   assert_not @recipe.valid?

end	
 
test "name length should not be too short" do 
	@recipe.name = 'aaaa'
	assert_not @recipe.valid?

end	


test "summary should be present" do
   @recipe.summary = " "
   assert_not @recipe.valid?
end	

test "summary should not be too long" do 
     @recipe.summary = 'a' * 151
     assert_not @recipe.valid?
end	

test "summary should not be too short" do
	@recipe.summary = 'a' * 9
	assert_not @recipe.valid?
end	

test "description must be present" do
   @recipe.description = ''
   assert_not @recipe.valid?
end


test "description must not be too long" do 
	@recipe.description = 'a' * 501
	assert_not @recipe.valid? 

end

test "description must not be too short" do 
	@recipe.description = 'a' * 10
	assert_not @recipe.valid?

end





end

















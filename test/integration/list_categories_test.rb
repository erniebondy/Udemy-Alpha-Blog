require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "test")  
    @category2 = Category.create(name: "test2")  
  end

  test "should show categories listing" do
    get "/categories"

    ## Looks for a link
    ## We want the name to be the link to the category
    assert_select "a[href?]", category_path(@category), text: @category.name
    assert_select "a[href?]", category_path(@category2), text: @category2.name

  end

end

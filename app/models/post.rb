class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :users, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attributes.present? 
        category = Category.find_or_create_by(category_attribute)
        if !self.categories.include?(category)
          self.categories << category
        end 
      end 
    end 
  end 

  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_by(category_attribute)
  #       if !self.categories.contain?(category) && !category.empty?
  #         self.categories << category
  #       else
  #         category = Category.create_by(category_attribute)
  #       end 
  #   end 
  # end

end
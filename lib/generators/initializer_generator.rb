class InitializerGenerator < Rails::Generators::Base
  desc "创建基于vue的CRUD相关文件"

  def create_initializer_file
    create_file "config/initializers/initializer.rb", "# Add initialization content here"
  end
end
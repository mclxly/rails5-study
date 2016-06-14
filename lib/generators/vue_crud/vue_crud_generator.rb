class VueCrudGenerator < Rails::Generators::NamedBase
  desc "创建基于vue的CRUD相关文件"

  source_root File.expand_path('../templates', __FILE__)

  def copy_js_file
    copy_file "js.coffee", "app/assets/javascripts/#{file_name}.rb"
  end
end

module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path.split('/')[1] == test_path.split('/')[1]
  end
end

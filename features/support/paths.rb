def path_to(page_name)
  case page_name

  when /^the dashboard page$/
    dashboard_index_path
    
  when /^the home page$/
    root_path

  end
end
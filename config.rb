projects = @app.data.projects
projects.each_with_index do |project, index|
  proxy "/projects/#{project.slug}/index.html", 'projects/project.html', locals: {
    project: project,
    index: index,
    prev_project: index == 0 ? nil : projects[index - 1],
    next_project: (index + 1) == projects.length ? nil : projects[index + 1]
  }, ignore: true
end

configure :development do
  activate :livereload
end

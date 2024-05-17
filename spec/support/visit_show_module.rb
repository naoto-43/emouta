module VisitShowModule
  def visit_show()
    login(user)
    create_post
    save_and_open_page
    find('.card-side').click
  end
end

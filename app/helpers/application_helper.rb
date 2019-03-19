module ApplicationHelper
  def current_year
    Date.current.year
  end

  def flash_message()
    flash.map do |key, msg|
      (content_tag :div, msg, id: key, class: "alert alert-#{key}", role: "alert")
    end.join.html_safe
  end

  def github_url(author, repo = '')
    text = repo == "" ? author : repo
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end

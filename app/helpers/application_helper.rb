module ApplicationHelper
  def current_year
    Date.current.year
  end

  def flash_message(tag_type, classes)
    flash.map do |key, msg|
      content_tag tag_type, msg, id: key, class: classes
    end.join
  end

  def github_url(author, repo = '')
    text = repo == "" ? author : repo
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end

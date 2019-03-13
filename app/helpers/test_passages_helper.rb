module TestPassagesHelper
  def result_test_title(result, title)
    result ? "Congratulations! You are passed test #{title}" :
             "Sorry! You are not passed test #{title}"
  end
end

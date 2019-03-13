module TestPassagesHelper
  def result_test_title(percentage, title)
    if test_win?(percentage)
      "Congratulations! You are passed test #{title}"
    else
      "Sorry! You are not passed test #{title}"
    end
  end

  def test_win?(percentage)
    percentage >= 85
  end
end

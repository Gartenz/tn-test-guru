module TestPassagesHelper
  def result_test_title(test_passage)
    title = test_passage.test.title
    test_passage.succes? ? "Congratulations! You are passed test #{title}" :
                           "Sorry! You are not passed test #{title}"
  end
end

module TestPassagesHelper
  def result_test_title(test_passage)
    title = test_passage.test.title
    test_passage.success? ? t(:message_success, title: title) :
                            t(:message_failure, title: title)
  end
end

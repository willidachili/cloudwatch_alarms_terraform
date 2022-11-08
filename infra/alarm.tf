
resource "aws_cloudwatch_metric_alarm" "zerosum" {
  alarm_name                = "bank-sum-must-be-0_wine001"
  namespace                 = "wine001"
  metric_name               = "bank_sum.value"

  comparison_operator       = "GreaterThanThreshold"
  threshold                 = "0"
  evaluation_periods        = "2"
  period                    = "60"

  statistic                 = "Maximum"

  alarm_description         = "This alarm goes off as soon as the total amount of money in the bank exceeds 0 "
  insufficient_data_actions = []
  alarm_actions       = [aws_sns_topic.user_updates.arn]
}

resource "aws_sns_topic" "user_updates" {
  name = var.student_name
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "wnevjen@gmail.com"
}

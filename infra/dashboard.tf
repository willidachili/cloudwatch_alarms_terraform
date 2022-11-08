resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.student_name
  dashboard_body = <<DASHBOARD
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.student_name}",
            "account_count.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of accounts"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 7,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.student_name}",
            "bank_sum.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Sum of bank accounts"
      }
    }
  ]
}
DASHBOARD
}
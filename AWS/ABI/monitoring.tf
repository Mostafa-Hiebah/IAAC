# SNS topic to send emails with the Alerts
resource "aws_sns_topic" "alarm" {
  name              = "my-alarm-topic"
  kms_master_key_id = aws_kms_key.sns_encryption_key.id
  delivery_policy   = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
  ## This local exec, suscribes your email to the topic 
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint devmustafamohammed@gmail.com --region us-east-1"
  }
}


## KMS Key to encrypt the SNS topic (security best practises)
resource "aws_kms_key" "sns_encryption_key" {
  description             = "alarms sns topic encryption key"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}






resource "aws_cloudwatch_metric_alarm" "nlb_healthyhosts" {
  alarm_name          = "alarmname"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "0.01"
  alarm_description   = "cpu usage"
  actions_enabled     = "true"
  alarm_actions       = [aws_sns_topic.alarm.arn]

}
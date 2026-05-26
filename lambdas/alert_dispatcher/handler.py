import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info("Alert dispatcher received event")
    logger.info(json.dumps(event))

    # TODO: publish alerts to SNS or other notification channels
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Alert dispatched"})
    }

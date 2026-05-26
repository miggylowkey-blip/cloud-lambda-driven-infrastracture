import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info("Cost processor received event")
    logger.info(json.dumps(event))

    # TODO: implement cost event processing and aggregation
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Cost event processed"})
    }

import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info("Security processor received event")
    logger.info(json.dumps(event))

    # TODO: implement security event parsing, enrichment, and persistence
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Security event processed"})
    }

import logging

from flask import Flask, jsonify, request


logging.basicConfig(level=logging.INFO)
app = Flask(__name__)


@app.post("/action/tts")
def tts():
    payload = request.get_json(silent=True)
    text = payload.get("rawtext", {}).get("text") if isinstance(payload, dict) else None

    if not isinstance(text, str):
        return jsonify(error="Missing or invalid rawtext.text field"), 400

    app.logger.info("TTS text: %s", text)
    return jsonify(status="ok"), 200


@app.post("/action/pal_play_presentation_from_name")
def play_presentation():
    payload = request.get_json(silent=True)
    presentation_name = payload.get("presentation_name") if isinstance(payload, dict) else None

    if not isinstance(presentation_name, str):
        return jsonify(error="Missing or invalid presentation_name field"), 400

    app.logger.info("Presentation name: %s", presentation_name)
    return jsonify(status="ok"), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5050)

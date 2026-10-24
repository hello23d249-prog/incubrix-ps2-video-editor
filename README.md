# IncuBrix PS2 — Prompt-Based Video Editing Engine

## Run it on Windows (one action)
1. Extract this folder.
2. Double-click **`run_windows.bat`**.
3. When it starts, open **http://127.0.0.1:8000/docs**.

The script creates a virtual environment, installs dependencies, runs tests, then starts the API. Python 3.11+ is recommended. If the `py` command is unavailable, install Python from https://www.python.org/downloads/windows/ and select “Add Python to PATH”.

To stop the server, focus the command window and press `Ctrl+C`.

## What is implemented
- Deterministic transcript word IDs and source hash.
- Exact, unique phrase cut and mute operations.
- Captions anchored to source word IDs.
- Phrase reorder-to-end.
- Applied / Needs clarification / Rejected response states.
- Undo/redo snapshots; a new edit clears redo; operation IDs remain unique.
- FastAPI session endpoints, `/health`, `/ready`, OpenAPI docs, correlation IDs, JSON error envelope, and idempotency-key support for session creation.
- Unit tests and a local batch scenario runner.

## Important limits — read before submitting
This is a **working prototype, not a verified complete video editor**. The current session creation route accepts transcript text and estimates word timings from words-per-minute. It does **not yet** perform automatic speech recognition on uploaded media, render an edited video/audio file, prove frame-level A/V sync, implement all background-job semantics, S3/MinIO storage, or deploy a public demo. Do not claim those features pass until you implement and test them. The assessment says must-haves are pass/fail, so these gaps matter.

## Run tests
Double-click `run_tests.bat` after the first setup, or run:
`python -m pytest -q`

## Batch scenarios
After setup, run:
` .venv\Scripts\python.exe scripts\batch_runner.py sample_scenarios.json --out outputs\batch`

## API routes
- `GET /health`
- `GET /ready`
- `POST /api/v1/sessions`
- `GET /api/v1/sessions/{session_id}`
- `POST /api/v1/sessions/{session_id}/instructions`
- `POST /api/v1/sessions/{session_id}/undo`
- `POST /api/v1/sessions/{session_id}/redo`

## Docker (optional)
Copy `.env.example` to `.env`, then run `docker compose up --build`. Docker is optional for local testing.

## Error codes
`SESSION_NOT_FOUND`, `INTERNAL_ERROR`, `HTTP_ERROR`, `VALIDATION_ERROR`.

## Time policy
The current prototype operates on source-word IDs, not user-entered clock times. It does not yet implement a complete original-vs-current-timeline time parser. Never describe time-range editing as supported.

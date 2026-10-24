# Assessment Report — IncuBrix PS2

## Summary
This repository contains a deterministic transcript editing prototype. It is not yet a full video-rendering product. The brief requires all must-haves to pass; do not mark the submission complete until the gaps below have evidence.

## Implemented and locally testable
- Stable source-word identifiers and source hash.
- Exact phrase cut/mute and word-anchored captions.
- Deterministic timeline state and timeline hash.
- Applied / Needs clarification / Rejected statuses.
- Undo/redo; one snapshot per supported instruction; new edits clear redo.
- Session API, health/readiness routes, Swagger docs, batch runner, unit tests.
- Idempotency key on session creation and correlation ID response/logging.

## Not yet implemented / not verified
- Uploading real video and obtaining accurate word-level timestamps from ASR.
- Rendering the edited output video and validating audio/video sync to within one frame.
- Caption rendering in final media.
- Full speed changes and robust restore of a specific historical operation.
- Background job API with 202/job status/progress.
- Idempotency across every POST endpoint.
- MinIO/S3-compatible input/output storage and download links.
- Full OpenAPI 3.1 parity with every route and schema.
- Public live demo deployment.
- All 40 scripted scenarios, hidden-test-style cases, measured latency, cost/minute, repeatability and OpenTimelineIO export.

## Evidence
Run `run_windows.bat`; preserve the terminal output showing pytest results. Use `/docs` for API demonstration. Add actual screen recordings, rendered media, manifests and completed workbook entries only after running the corresponding tests.

## Metrics
No performance or cost figures are claimed. Measure them on the actual environment before submission.

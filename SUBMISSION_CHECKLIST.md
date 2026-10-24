# Final Submission Checklist

Before sending the assessment, verify each item and add a real evidence link in the supplied workbook.

## Must-haves
- [ ] Original media is never modified; original hash and edit history are preserved.
- [ ] Word-anchored edits remain attached to the same words after cuts/reorders/speed changes.
- [ ] Every instruction returns Applied, Needs clarification, or Rejected.
- [ ] Timeline operations are deterministic code; AI only parses instructions into operations.
- [ ] Actual render matches timeline; A/V sync and output duration are within one frame.
- [ ] Undo/redo semantics are correct, including new-edit redo invalidation and restoring a specific earlier edit.
- [ ] Original-time vs current-timeline policy is explicit and reported to the user.
- [ ] Container integration, runner, and live demo work.

## Integration Standard
- [ ] One-command Docker start and one-command tests without API keys.
- [ ] OpenAPI 3.1 matches running API; all routes under `/api/v1/`.
- [ ] >2s tasks are jobs returning 202 and job IDs; job status/progress endpoint.
- [ ] Idempotency keys on every POST.
- [ ] JSON error envelope with stable UPPER_SNAKE_CASE codes.
- [ ] Settings and paths configured through environment.
- [ ] Upload/URL inputs and S3-compatible outputs.
- [ ] Structured logs with correlation IDs; health and ready endpoints.
- [ ] Output manifest with provider/version/settings/seed/timings/cost/warnings/licensing.
- [ ] Batch runner writes outputs for every scenario.

## Evidence
Do not tick a box because code appears to exist. Run the behavior and save logs, test output, API response, rendered output or video proof.

# OFFICIAL CODEX CLOUD TASK — G0.0 FOUNDATION

## Required input
- Read `AGENTS.md`, `README.md`, `docs/G0_0_ACCEPTANCE.md`, and the original G0 design ZIP under `docs/reference` (READ ONLY).
- Confirm repository privacy and do not import production data or real v2 runtime.

## Deliverables
1. Validate the module skeleton; keep one HTML per business page and shared CSS/JS in core; placeholder pages must be visually accessible on desktop/mobile.
2. Set up GitHub Actions `windows-2025` PowerShell 7 checks and artifact packaging. Prove a real Windows CI run, or mark NOT RUN and explain why.
3. Keep file ownership, contract-first module manifest, API routing reserved but no server or storage runtime.
4. Add/update deterministic, testable release generation manifest+SHA256+archive verification (no Production data).
5. Produce PR against `main`, list exact paths changed, test cases/results, caveats/risks, commit hash and release checksum.
6. Stop, request owner review, do NOT move to G1.

## Non-goals
No WO CRUD, no warehouse stock, no login implementation, no service execution on Windows LAN, no Microsoft 365, no offline mobile, no public endpoint.

## Reporting
For each check give PASS / FAIL / NOT RUN, OS, PowerShell version, timestamp, command, CI run link and evidence. If network/credentials prevent completing work, report blocker rather than inventing result.

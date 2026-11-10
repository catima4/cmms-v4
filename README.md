# CMMS V4 — G0.0 Cloud Foundation handoff v0.1.0

STATUS: PREPARED LOCALLY / NOT DEPLOYED / NOT RUN ON GITHUB.

Purpose: give Codex Cloud a ready, safe starter scaffold for a **private** monorepo. No Production code, live data, or server is included. Preserve `/docs/reference/` as read-only G0 design evidence.

## Cloud start
1. Create an empty **private** repository `cmms-v4` on GitHub, after confirming company permission to store source externally.
2. Connect Codex Cloud to this repository. Import this folder as repository root. Do not import any live v2 runtime data or secrets.
3. Ask Codex to read `AGENTS.md`, `docs/CODEX_G0_0_PROMPT.md` and `docs/G0_0_ACCEPTANCE.md` and work ONLY on G0.0.
4. Commit to `feature/g0-0-foundation`, open a PR, review Windows Actions logs and upload artifacts.
5. Stop after reporting PASS/FAIL/NOT RUN; do not merge or implement G1 without approval.

## Local scaffold checks
- `pwsh -NoProfile -File tests/Run-FoundationTests.ps1`
- `pwsh -NoProfile -File scripts/Build-DesignRelease.ps1 -Version 0.1.0`

Local shell/PowerShell tests have NOT been executed in this preparation. Windows Actions remains NOT RUN until a real run URL is provided.

HTTP LAN, online-only mobile, Android/iOS, module-level RBAC 0–3 admin UI and JSONL storage are **future architectural requirements**, not implemented here.

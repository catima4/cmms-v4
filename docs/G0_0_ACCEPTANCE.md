# G0.0 Acceptance and status register

**Prepared package is a handoff, not accepted G0.0.** Status for cloud actions: NOT RUN.

| ID | Acceptance check | Current | Required evidence |
|---|---|---|---|
| A01 | Private repository exists and correct access reviewed | NOT RUN | repository link/settings |
| A02 | Codex Cloud environment linked | NOT RUN | environment and task reference |
| A03 | AGENTS.md and G0 reference checked read-only | PREPARED | PR diff |
| A04 | Independent HTML home/assets/inventory shell and shared core | PREPARED | file inspection + browser check |
| A05 | Windows Actions test run | NOT RUN | run URL, logs, exit code |
| A06 | Static test suite PASS on Windows | NOT RUN | CI test output |
| A07 | Reproducible ZIP with manifest + SHA256 | NOT RUN | script execution, hash, archive validation |
| A08 | PR review and owner permission to merge | NOT RUN | approved PR |
| A09 | No secrets/Production content published | NOT RUN | scan/review evidence |
| A10 | LAN runtime or mobile physical-device test | NOT RUN (out of gate) | future G8 pilot |

Blockers for Production: HTTP credentials/session unencrypted pending IT risk acceptance; JSONL durability/recovery pending G1; v2 P0 parity pending later gates; real restore test absent.

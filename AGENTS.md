# CMMS V4 Codex rules

- Owner-selected architecture: PowerShell + JSON/JSONL; one LAN HTTP server; independent HTML page per business module; common versioned REST API; mobile web online-only; Vietnamese/English; Admin-managed module RBAC (0 deny, 1 read, 2 operate, 3 manage) with sensitive-action exceptions.
- This gate is G0.0 CLOUD FOUNDATION ONLY: no business logic, real auth, storage engine, WO, inventory transactions, cloud Production or LAN deployment.
- Work in one private monorepo and one feature branch/PR; do not change baseline G0 reference materials or v2 artifacts.
- No secrets, employee information, real asset records, production JSONL, internal hostnames/IPs, confidential plant diagrams, or live backups. Never copy v2 baseline to public repository.
- No build-time CDN, external fonts or third-party resources required by deployed application; LAN must operate without Internet.
- Keep modules in `modules/<id>` with `web/`, `server/`, `schemas/`, `tests/`, `module.json`. Shared code stays in `core/`, never duplicated.
- Never assert tests PASS unless run with evidence. Distinguish NOT RUN from FAIL. Test results must record environment and run URL where applicable.
- Any change to G0 decisions requires written change request, not silent implementation. Do not switch HTTP to HTTPS; record the HTTP credential/session risk as a blocker pending IT decision.
- All new modules are deny-by-default; UI hiding must never be presented as server-side RBAC.
- Never claim native PWA installation/service worker/camera streaming works over LAN HTTP origins.
- Do not automatically proceed to G1 or merge to main without project-owner approval.

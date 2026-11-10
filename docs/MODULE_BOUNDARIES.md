# Module boundaries and planned routing

- `/` → `core/web/home.html` (portal placeholder only)
- `/assets/assets.html` → `modules/assets/web/assets.html`
- `/inventory/inventory.html` → `modules/inventory/web/inventory.html`
- Future API: `/api/v1/assets/...`, `/api/v1/inventory/...`; NONE implemented in G0.0.
- `module.json` only defines registration metadata; it is not a source of authorization. Server must enforce RBAC when implemented at G2.
- Keep business services separate from UI and persistence. Shared UI, language files, client fetch helpers and error contracts belong to Core.
- Browser does not access JSONL. Cross-module write goes through owning service.
- Portal should list only modules authorized after login G2; G0.0 placeholders are NOT access-controlled and must not be deployed as Production.

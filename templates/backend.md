
### 🛡️ AURA SECURITY: BACKEND - Checklist

- [ ] **Data Validation & Sanitization**: All inbound API inputs are strictly validated (e.g., via Zod or Serde) before processing.
- [ ] **Database Queries**: No raw SQL concatenation exists. ORM features or prepared statements are explicitly used to prevent SQLi.
- [ ] **Authorization**: Ensure all new endpoints or mutations check explicit user roles/permissions before executing any state-changing logic.
- [ ] **Business Logic Integrity**: Core functions have tests attached (if modifying payment, access, or core ledger rules).
- [ ] **Logging Hygiene**: Verified no PII (emails, names, passwords) or auth tokens are accidentally output to server logs.

# TZPID Phase 3 Release Skeleton

Creator: Daniel Alexander Trawin  
ORCID: https://orcid.org/0009-0001-4630-3715  
Generated UTC: 2026-06-09T07:03:29+00:00  
Commit: `f447222b103e223297de17a836e744fb03adece7`  
Branch: `master`

## Purpose

This folder begins Phase 3: converting the verified Phase 2 proof/certificate substrate into a publication-ready and reproducible release package.

Phase 2 currently has:

- `29` completion-matrix rows.
- `29` certificate JSON files.
- Isabelle/HOL theories wired through `isabelle_tzpid/ROOT`.
- Python certificate lanes for every matrix row not marked as direct `yes`.
- No matrix rows marked `started_not_complete` at generation time.

## Repository Binding

This local repository currently has **no configured git remote**. It is not yet attached to one of your hosted accounts from this checkout.

Local git identity:

- Name: `Daniel Alexander Trawin`
- Email: `daniel@tzpid.local`

Before publishing Phase 3, choose the intended GitHub/GitLab/remote account and add a remote explicitly.

## Phase 3 Package Targets

1. Freeze the verified snapshot.
2. Keep `README.md`, `VERIFY.md`, and `MANIFEST.json` as the release entrypoint.
3. Build one paper-facing spine summary per mature spine.
4. Package Isabelle theories, certificate JSON/CSV/MD artifacts, and source matrices.
5. Add a clear “How to Verify” command set.
6. Prepare a clean archive for Zenodo/DOI upload.

## Core Verification Evidence

- Matrix: `../TZPID_PHASE2_COMPLETION_MATRIX.csv`
- Manifest: `MANIFEST.json`
- Verification instructions: `VERIFY.md`
- Certificates: `../phase2_checks/`
- Isabelle session: `../isabelle_tzpid/ROOT`

## Current Spine/Batch Coverage

The manifest contains the full row-level matrix under `matrix_rows`. Use that as the source of truth for release packaging.

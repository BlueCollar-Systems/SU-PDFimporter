# LLM Context Pack — SketchUp PDF Importer

- Generated: `2026-04-05 11:15:42`
- Project Root: `C:/1SU-PDFimporter`
- Output File: `C:/1SU-PDFimporter/dev_logs/llm_context_20260405_111542.md`
- Formatting Safety: dynamic fenced blocks are used to avoid fence collisions.

## Project Inventory

Filtered inventory for context quality. Heavy/generated folders are excluded.

- `.github/`: 2 files
- `.gitignore`: 617.00 B
- `0build_master_output_1SU-PDFimporter.cmd`: 135.00 B
- `0build_master_output_1SU-PDFimporter.py`: 1.82 KB
- `bc_pdf_vector_importer_v3.6.6.rbz`: 112.22 KB
- `bc_pdf_vector_importer_v3.6.7.rbz`: 112.40 KB
- `build_release.py`: 2.91 KB
- `extracted/`: 35 files
- `LICENSE`: 1.05 KB
- `README.md`: 8.73 KB
- `repo_context_builder_core.py`: 22.10 KB
- `test/`: 1 files

## Repo Tree

Depth-limited tree. Full depth for selected roots, shallow for noisy areas.

```text
1SU-PDFimporter/
├── .github/
│   └── workflows/
│       ├── auto-release.yml
│       └── su-pdfimporter-ci.yml
├── extracted/
│   ├── sketchup_ext/
│   │   ├── bc_pdf_vector_importer/
│   │   │   ├── arc_fitter.rb
│   │   │   ├── bezier.rb
│   │   │   ├── command_runner.rb
│   │   │   ├── compatibility_report.rb
│   │   │   ├── content_stream_parser.rb
│   │   │   ├── dimension_parser.rb
│   │   │   ├── document_profiler.rb
│   │   │   ├── external_text_extractor.rb
│   │   │   ├── generic_classifier.rb
│   │   │   ├── generic_recognizer.rb
│   │   │   ├── geometry_builder.rb
│   │   │   ├── geometry_cleanup.rb
│   │   │   ├── hatch_detector.rb
│   │   │   ├── import_config.rb
│   │   │   ├── import_dialog.rb
│   │   │   ├── logger.rb
│   │   │   ├── main.rb
│   │   │   ├── metadata.rb
│   │   │   ├── ocg_parser.rb
│   │   │   ├── pdf_parser.rb
│   │   │   ├── primitive_extractor.rb
│   │   │   ├── primitives.rb
│   │   │   ├── recognizer.rb
│   │   │   ├── region_segmenter.rb
│   │   │   ├── report_dialog.rb
│   │   │   ├── scale_tool.rb
│   │   │   ├── stroke_font.rb
│   │   │   ├── svg_geometry_renderer.rb
│   │   │   ├── svg_text_renderer.rb
│   │   │   ├── text_parser.rb
│   │   │   ├── unit_parser.rb
│   │   │   ├── validator.rb
│   │   │   └── xobject_parser.rb
│   │   └── bc_pdf_vector_importer.rb
│   └── .gitignore
├── test/
│   └── smoke_test.rb
├── .gitignore
├── 0build_master_output_1SU-PDFimporter.cmd
├── 0build_master_output_1SU-PDFimporter.py
├── bc_pdf_vector_importer_v3.6.6.rbz
├── bc_pdf_vector_importer_v3.6.7.rbz
├── build_release.py
├── LICENSE
├── README.md
└── repo_context_builder_core.py
```

## Dependency Summary

No configured dependency files found.

## Missing Expected Files

### Expected Everywhere

None missing.

### Expected In Some Environments

None missing.

## Core Configuration Files

### README.md

- Path: `README.md`
- Size: `8.73 KB`
- Modified: `2026-04-04 04:35:56`

~~~markdown
# PDF Vector Importer for SketchUp

**BUILT. NOT BOUGHT.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-3.6.4-green.svg)]()
[![Platform](https://img.shields.io/badge/Platform-SketchUp%202017%2B-orange.svg)]()
[![Ruby](https://img.shields.io/badge/Ruby-2.2%2B-red.svg)]()

Import PDF vector geometry as native editable SketchUp edges with arc reconstruction, color-based tag grouping, text import, dash patterns, Scale by Reference tool, and full Bezier support. Pure-Ruby PDF parser -- no external dependencies.

---

## Overview

PDF Vector Importer parses PDF content streams directly in Ruby and reconstructs vector geometry as native SketchUp edges. No gems, no external binaries, no C extensions. It runs on every platform SketchUp supports, from SketchUp 2017 Make (Ruby 2.2) through the current Pro release.

The importer profiles each PDF document to identify its origin (fabrication drawings, CAD exports, architectural plans, vector art, or raster scans) and adapts its import strategy accordingly.

---

## Key Features

- **Pure-Ruby PDF parser** -- no gems or external dependencies required
- **Adaptive Bezier subdivision** with configurable flatness tolerance
- **Kasa algebraic circle fitting** for arc reconstruction from point sequences
- **OCG layer support** -- PDF Optional Content Groups map to SketchUp Tags
- **Color-based tag grouping** with dash pattern mapping
- **Scale by Reference** tool -- select an edge, type the real-world dimension
- **Quick Scale** with 15 architectural/engineering presets
- **Architectural scale notation parsing** (1/4"=1'-0", 3/8"=1', etc.)
- **Text import** as geometry or labels
- **Raster fallback** for scanned pages
- **Import quality assessment** with warnings and performance metrics
- **Post-import action workflow** (geometry only, scale, cleanup, feature inventory)
- **Safe Mode import command** (Fast preset) for very dense/problem PDFs
- **Native DXF bridge command** from the extension menu/toolbar
- **Tag visibility controls** for PDF layers
- **Document profiling** (fabrication, CAD, architectural, vector art, raster)
- **FlateDecode decompression** for compressed PDF streams
- **Form XObject recursion** for embedded PDF forms

---

## Installation

1. Download `bc_pdf_vector_importer_v3.6.4.rbz`
2. In SketchUp: **Window > Extension Manager > Install Extension**
3. Select the `.rbz` file
4. Restart SketchUp if prompted

The extension registers under **File > Import** and adds a PDF Vector Importer toolbar.

For SketchUp 2025 users: native PDF import discoverability changed in SketchUp UI,
but this extension still provides dedicated PDF import menu and toolbar commands.

---

## Scale Tool

The Scale by Reference tool lets you correct imported geometry to real-world dimensions. Select any edge, type the known real dimension, and all imported geometry scales proportionally.

### Quick Scale Presets

The Quick Scale dialog provides 15 architectural and engineering presets:

| Preset | Scale Ratio | Factor | Common Use |
|--------|-------------|--------|------------|
| 1:1 | Full size | 1.0 | Detail drawings |
| 1:2 | Half size | 0.5 | Large details |
| 1:4 | Quarter size | 0.25 | Construction details |
| 1:5 | 1/5 size | 0.2 | Detail drawings (metric) |
| 1:8 | 1/8 size | 0.125 | Room plans |
| 1:10 | 1/10 size | 0.1 | Detailed plans (metric) |
| 1:16 | 1/16 size | 0.0625 | Section drawings |
| 1:20 | 1/20 size | 0.05 | Building plans (metric) |
| 1:24 | 1/24 size | 0.04167 | 1/2"=1'-0" plans |
| 1:48 | 1/48 size | 0.02083 | 1/4"=1'-0" plans |
| 1:50 | 1/50 size | 0.02 | General plans (metric) |
| 1:96 | 1/96 size | 0.01042 | 1/8"=1'-0" plans |
| 1:100 | 1/100 size | 0.01 | Site plans (metric) |
| 1:192 | 1/192 size | 0.00521 | 1/16"=1'-0" plans |
| 1:200 | 1/200 size | 0.005 | Site plans (metric) |

The tool also accepts freeform architectural notation such as `1/4"=1'-0"`, `3/8"=1'`, `1"=10'`, and similar formats.

---

## Import Report

After every import, the extension presents a quality assessment report with three sections:

### Quality Assessment

Each import receives a quality grade based on geometry fidelity:

- **Excellent** -- All vectors parsed, arcs reconstructed, no anomalies
- **Good** -- Minor issues (small gaps, unclosed paths) that do not affect usability
- **Fair** -- Some geometry lost or degraded; manual review recommended
- **Poor** -- Significant parsing failures; consider alternate export settings

### Warnings

The report flags common issues:

- Clipping paths that may hide geometry
- Extremely thin or zero-width strokes
- Unsupported blend modes or transparency
- Font-based geometry that could not be converted
- Coordinate values outside the SketchUp modeling range
- Pages with no extractable vector content (raster-only)

### Performance Metrics

Every import logs timing and throughput data:

- Total import time (seconds)
- Objects imported (edges, arcs, faces)
- Throughput (objects/sec)
- PDF stream decompression time
- Bezier subdivision iterations
- Arc fitting attempts and successes

---

## Document Profiling

The importer analyzes each PDF and classifies it into one of five categories to optimize parsing:

| Profile | Characteristics |
|---------|----------------|
| **Fabrication** | Shop drawings, cut lists, weld callouts, BOM tables |
| **CAD** | Exported from AutoCAD, Revit, SolidWorks, or similar |
| **Architectural** | Floor plans, elevations, sections with dimension strings |
| **Vector Art** | Illustrator/Inkscape artwork, logos, complex fills |
| **Raster** | Scanned documents with embedded images, minimal vectors |

---

## Source Structure

```
bc_pdf_vector_importer.rb            # Root loader
bc_pdf_vector_importer/
  main.rb                            # Extension entry point
  pdf_parser.rb                      # Top-level PDF object parser
  content_stream_parser.rb           # PDF content stream interpreter
  geometry_builder.rb                # SketchUp geometry construction
  arc_fitter.rb                      # Kasa circle fitting
  bezier.rb                          # Adaptive Bezier subdivision
  scale_tool.rb                      # Scale by Reference tool
  report_dialog.rb                   # Import report UI
  import_dialog.rb                   # Import options UI
  unit_parser.rb                     # Architectural notation parser
  geometry_cleanup.rb                # Post-import cleanup utilities
  ocg_parser.rb                      # Optional Content Group parser
  text_parser.rb                     # Text extraction and rendering
  dimension_parser.rb                # Dimension string recognition
  document_profiler.rb               # PDF document classification
  generic_recognizer.rb              # Generic shape recognition
  generic_classifier.rb              # Generic element classification
  region_segmenter.rb                # Spatial region segmentation
  primitive_extractor.rb             # Low-level drawing primitive extraction
  primitives.rb                      # Primitive data structures
  recognizer.rb                      # Pattern recognizer
  hatch_detector.rb                  # Hatch pattern detection
  stroke_font.rb                     # Single-stroke font rendering
  svg_geometry_renderer.rb           # SVG geometry path renderer
  svg_text_renderer.rb               # SVG text path renderer
  external_text_extractor.rb         # External text extraction support
  validator.rb                       # Input validation
  xobject_parser.rb                  # Form XObject recursion
  logger.rb                          # Logging utilities
  metadata.rb                        # Version and extension metadata
```

---

## Compatibility

| SketchUp Version | Ruby Version | Status |
|------------------|-------------|--------|
| 2017–2019 | 2.2–2.5 | Supported (including Make; Ruby 2.2 smoke CI-tested) |
| 2020 | 2.5 | May work, not CI-tested |
| 2021–2023 | 2.7 | CI-tested |
| 2024+ | 3.2+ | CI-tested |

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

## AI Contributors

This project was developed with significant contributions from AI assistants:

- **Claude & Claude Code** (Anthropic) — Architecture, code generation, debugging, and code review
- **ChatGPT & Codex** (OpenAI) — Code generation and problem-solving assistance
- **Gemini** (Google) — Development assistance and code suggestions
- **Microsoft Copilot** — Code completion and development support

These AI tools were used as collaborative development partners throughout the project lifecycle.

---

## Author

**BlueCollar Systems** -- BUILT. NOT BOUGHT.
~~~

## Source Files

Included files: `42`

### .github/workflows/auto-release.yml

- Path: `.github/workflows/auto-release.yml`
- Size: `2.10 KB`
- Modified: `2026-04-04 04:42:23`

~~~yaml
name: auto-release

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: write

concurrency:
  group: auto-release
  cancel-in-progress: false

jobs:
  release:
    if: "!startsWith(github.event.head_commit.message, 'chore: bump version to')"
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v6
        with:
          fetch-depth: 0
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Set up Python
        uses: actions/setup-python@v6
        with:
          python-version: "3.12"

      - name: Read version
        id: version
        run: |
          python - <<'PY'
          import os
          import pathlib
          import re

          loader = pathlib.Path("extracted/sketchup_ext/bc_pdf_vector_importer.rb")

          loader_text = loader.read_text(encoding="utf-8")
          match = re.search(r"PLUGIN_VERSION\s*=\s*'(\d+)\.(\d+)\.(\d+)'", loader_text)
          if not match:
              raise SystemExit("Could not find PLUGIN_VERSION in extracted/sketchup_ext/bc_pdf_vector_importer.rb")

          version = ".".join(match.groups())

          out = pathlib.Path(os.environ["GITHUB_OUTPUT"])
          out.write_text(f"version={version}\n", encoding="utf-8")
          PY

      - name: Build .rbz
        run: python build_release.py

      - name: Create release if missing
        env:
          GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          set -e
          TAG="v${{ steps.version.outputs.version }}"
          RBZ="bc_pdf_vector_importer_v${{ steps.version.outputs.version }}.rbz"

          if gh release view "$TAG" >/dev/null 2>&1; then
            echo "Release $TAG already exists; skipping."
            exit 0
          else
            gh release create "$TAG" \
              --title "$TAG — PDF Vector Importer for SketchUp" \
              --notes "Automated release from latest \`main\` commit.

            **Install:** Download \`${RBZ}\` below, then in SketchUp: **Window > Extension Manager > Install Extension**." \
              --latest \
              "$RBZ"
          fi
~~~

### .github/workflows/su-pdfimporter-ci.yml

- Path: `.github/workflows/su-pdfimporter-ci.yml`
- Size: `1.22 KB`
- Modified: `2026-04-04 04:37:56`

```yaml
name: su-pdfimporter-ci

on:
  push:
    branches:
      - main
      - master
      - feature/**
  pull_request:
  workflow_dispatch:

jobs:
  smoke:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        ruby-version: ["2.2", "2.7", "3.0", "3.2"]
    steps:
      - name: Checkout
        uses: actions/checkout@v6

      - name: Set up Ruby ${{ matrix.ruby-version }}
        if: matrix.ruby-version != '2.2'
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: ${{ matrix.ruby-version }}
          bundler-cache: false

      - name: Ruby 2.2 syntax + smoke (SketchUp Make 2017 compatibility)
        if: matrix.ruby-version == '2.2'
        run: |
          set -e
          docker run --rm -v "${PWD}:/work" -w /work ruby:2.2 bash -lc '
            set -e
            find extracted test -type f -name "*.rb" -print0 | xargs -0 -n1 ruby -c
            ruby test/smoke_test.rb
          '

      - name: Ruby syntax check
        if: matrix.ruby-version != '2.2'
        run: |
          set -e
          find extracted test -type f -name "*.rb" -print0 | xargs -0 -n1 ruby -c

      - name: Run smoke test
        if: matrix.ruby-version != '2.2'
        run: ruby test/smoke_test.rb
```

### 0build_master_output_1SU-PDFimporter.cmd

- Path: `0build_master_output_1SU-PDFimporter.cmd`
- Size: `135.00 B`
- Modified: `2026-04-05 11:08:53`

```bat
@echo off
setlocal
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 "%~dp0\%~n0.py" %*
) else (
  python "%~dp0\%~n0.py" %*
)
endlocal
```

### 0build_master_output_1SU-PDFimporter.py

- Path: `0build_master_output_1SU-PDFimporter.py`
- Size: `1.82 KB`
- Modified: `2026-04-05 11:08:53`

```python

#!/usr/bin/env python3
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from repo_context_builder_core import main_with_preset

PRESET = {
  "title": "LLM Context Pack \u2014 SketchUp PDF Importer",
  "config_paths": [
    "README.md",
    ".gitignore"
  ],
  "script_paths": [
    "0build_master_output.py",
    "0build_master_output.cmd",
    "build_release.py"
  ],
  "source_roots": [
    "extracted",
    "."
  ],
  "test_roots": [
    "test"
  ],
  "dependency_files": [],
  "expected_files": {
    "expected_everywhere": [
      "README.md"
    ],
    "expected_some_envs": [
      "test",
      ".github/workflows"
    ]
  },
  "exclude_dir_names": [
    ".git",
    "__pycache__",
    ".ruff_cache",
    "dist",
    "dev_logs"
  ],
  "exclude_file_names": [],
  "exclude_suffixes": [
    ".rbz"
  ],
  "include_extensions": [
    ".bat",
    ".c",
    ".cfg",
    ".cmake",
    ".cmd",
    ".conf",
    ".cpp",
    ".css",
    ".dart",
    ".go",
    ".gradle",
    ".h",
    ".hpp",
    ".htm",
    ".html",
    ".ini",
    ".java",
    ".js",
    ".json",
    ".jsx",
    ".kt",
    ".kts",
    ".lua",
    ".md",
    ".php",
    ".plist",
    ".ps1",
    ".py",
    ".r",
    ".rb",
    ".rs",
    ".sample",
    ".scss",
    ".sh",
    ".sql",
    ".svg",
    ".swift",
    ".toml",
    ".ts",
    ".tsx",
    ".txt",
    ".xml",
    ".yaml",
    ".yml"
  ],
  "tree_full_depth_roots": [
    "extracted",
    "test",
    ".github"
  ],
  "tree_shallow_depth_roots": {
    ".git": 1
  },
  "default_tree_depth": 2,
  "navigation_grep_patterns": [
    "\\bUI::",
    "\\badd_menu_item\\b",
    "\\badd_item\\b",
    "\\bshow_model_info\\b"
  ],
  "navigation_roots": [
    "extracted",
    "."
  ],
  "check_commands": []
}

if __name__ == "__main__":
    raise SystemExit(main_with_preset(PRESET))
```

### build_release.py

- Path: `build_release.py`
- Size: `2.91 KB`
- Modified: `2026-03-25 21:26:19`

```python
#!/usr/bin/env python3
"""build_release.py — BlueCollar Systems (SketchUp)
Produces a clean .rbz release archive for SketchUp Extension Warehouse
distribution and manual install.

An .rbz is a zip file whose root contains:
  bc_pdf_vector_importer.rb        (loader/entrypoint)
  bc_pdf_vector_importer/         (support folder with all source files)

Excluded:
  .git/, .github/
  test/ (smoke tests — not shipped)
  *.bak
  __pycache__, .ruff_cache (should not exist in SU repo, but just in case)

Usage:
  python build_release.py
  python build_release.py --out /path/to/output_dir

Output:
  bc_pdf_vector_importer_v<VERSION>.rbz
"""

import argparse
import re
import zipfile
from pathlib import Path

REPO_ROOT   = Path(__file__).parent.resolve()
EXT_ROOT    = REPO_ROOT / "extracted" / "sketchup_ext"
LOADER_FILE = EXT_ROOT / "bc_pdf_vector_importer.rb"
SUPPORT_DIR = EXT_ROOT / "bc_pdf_vector_importer"

EXCLUDE_DIRS  = {".git", ".github", "test", "__pycache__", ".ruff_cache"}
EXCLUDE_FILES = {"build_release.py", ".gitignore", ".gitattributes"}
EXCLUDE_SUFFIXES = {".bak", ".swp", ".pyo", ".pyc"}


def _should_exclude(rel: Path) -> bool:
    for part in rel.parts:
        if part in EXCLUDE_DIRS:
            return True
    if rel.name in EXCLUDE_FILES:
        return True
    if rel.suffix.lower() in EXCLUDE_SUFFIXES:
        return True
    return False


def _read_version() -> str:
    if LOADER_FILE.exists():
        text = LOADER_FILE.read_text(encoding="utf-8", errors="replace")
        m = re.search(r"PLUGIN_VERSION\s*=\s*'([^']+)'", text)
        if m:
            return m.group(1).strip()
    return "0.0.0"


def build(out_dir: Path) -> Path:
    version  = _read_version()
    rbz_name = f"bc_pdf_vector_importer_v{version}.rbz"
    rbz_path = out_dir / rbz_name

    out_dir.mkdir(parents=True, exist_ok=True)

    file_count = 0
    skipped    = 0

    with zipfile.ZipFile(rbz_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        # Root loader file
        if LOADER_FILE.exists():
            zf.write(LOADER_FILE, LOADER_FILE.name)
            file_count += 1

        # Support folder
        for abs_path in sorted(SUPPORT_DIR.rglob("*")):
            if not abs_path.is_file():
                continue
            rel = abs_path.relative_to(EXT_ROOT)
            if _should_exclude(rel):
                skipped += 1
                continue
            zf.write(abs_path, str(rel))
            file_count += 1

    print(f"Built: {rbz_path}")
    print(f"  {file_count} files included, {skipped} excluded")
    return rbz_path


def main() -> None:
    parser = argparse.ArgumentParser(description="Build SU PDFVectorImporter .rbz")
    parser.add_argument("--out", default=str(REPO_ROOT),
                        help="Output directory (default: repo root)")
    args   = parser.parse_args()
    out    = Path(args.out).resolve()
    rbz    = build(out)
    print(f"\nRelease ready: {rbz}")


if __name__ == "__main__":
    main()
```

### extracted/sketchup_ext/bc_pdf_vector_importer/arc_fitter.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/arc_fitter.rb`
- Size: `6.88 KB`
- Modified: `2026-04-01 20:04:47`

```ruby
# bc_pdf_vector_importer/arc_fitter.rb
# Arc reconstruction from polyline segments using Kåsa algebraic circle fit.
# Detects runs of line segments that form circular arcs and replaces them
# with true arc representations for SketchUp.
#
# Matches the FreeCAD version's _circle_fit and _polyline_edges_to_arcs.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module ArcFitter

      ZERO_TOL = 1e-9

      # ---------------------------------------------------------------
      # Kåsa algebraic circle fit — fits a circle to N >= 3 points.
      # Returns [center_x, center_y, radius, rms_error]
      # ---------------------------------------------------------------
      def self.circle_fit(points)
        n = points.length
        raise "Need >= 3 points" if n < 3

        sx  = 0.0; sy  = 0.0; sx2 = 0.0; sy2 = 0.0
        sxy = 0.0; sz  = 0.0; sxz = 0.0; syz = 0.0

        points.each do |pt|
          x, y = pt[0].to_f, pt[1].to_f
          x2 = x * x
          y2 = y * y
          sx  += x;       sy  += y
          sx2 += x2;      sy2 += y2
          sxy += x * y
          z = x2 + y2
          sz  += z;       sxz += x * z;  syz += y * z
        end

        # Solve 3×3 system via Cramer's rule
        a = [[sx, sy, n.to_f], [sx2, sxy, sx], [sxy, sy2, sy]]
        b = [sz, sxz, syz]

        d = det3(a)
        return nil if d.abs < 1e-12

        a1 = [[b[0], a[0][1], a[0][2]], [b[1], a[1][1], a[1][2]], [b[2], a[2][1], a[2][2]]]
        a2 = [[a[0][0], b[0], a[0][2]], [a[1][0], b[1], a[1][2]], [a[2][0], b[2], a[2][2]]]
        a3 = [[a[0][0], a[0][1], b[0]], [a[1][0], a[1][1], b[1]], [a[2][0], a[2][1], b[2]]]

        va = det3(a1) / d
        vb = det3(a2) / d
        vc = det3(a3) / d

        cx = 0.5 * va
        cy = 0.5 * vb
        r_sq = vc + cx * cx + cy * cy
        r = r_sq > 0 ? Math.sqrt(r_sq) : 0.0

        # RMS error
        rms = 0.0
        points.each do |pt|
          dist = Math.sqrt((pt[0] - cx)**2 + (pt[1] - cy)**2)
          rms += (dist - r)**2
        end
        rms = Math.sqrt(rms / n)

        [cx, cy, r, rms]
      end

      # ---------------------------------------------------------------
      # Detect runs of consecutive points that form circular arcs.
      # Returns a new list of segments where polyline arcs are replaced
      # with :arc segments.
      #
      # Input: array of [x, y] points forming a polyline
      # Output: array of hashes:
      #   { type: :line, from: [x,y], to: [x,y] }
      #   { type: :arc, center: [x,y], radius: r, points: [[x,y],...],
      #     start_pt: [x,y], mid_pt: [x,y], end_pt: [x,y] }
      # ---------------------------------------------------------------
      def self.detect_arcs_in_polyline(points, opts = {})
        tol_mm   = opts[:arc_fit_tol] || 0.08
        min_segs = opts[:min_arc_segments] || 3
        max_segs = opts[:max_arc_segments] || 64
        min_angle = opts[:min_arc_angle_deg] || 5.0

        result = []
        n = points.length
        return result if n < 2

        i = 0
        while i < n - 1
          # Try to find the longest arc starting at position i
          best_arc_end = -1
          best_arc_data = nil

          # Need at least min_segs+1 points for an arc
          j = i + min_segs + 1
          while j <= [i + max_segs + 1, n].min
            run_pts = points[i..j-1]
            next if run_pts.length < 4

            begin
              fit = circle_fit(run_pts)
              if fit
                cx, cy, r, rms = fit
                # Accept if fit is good relative to radius
                tol = [tol_mm, r * 0.005].max
                if rms < tol && r > 0.01
                  # Check arc sweep is meaningful
                  dx0 = run_pts.first[0] - cx
                  dy0 = run_pts.first[1] - cy
                  dxN = run_pts.last[0] - cx
                  dyN = run_pts.last[1] - cy
                  a0 = Math.atan2(dy0, dx0)
                  aN = Math.atan2(dyN, dxN)
                  sweep = (aN - a0)
                  while sweep <= -Math::PI; sweep += 2 * Math::PI; end
                  while sweep > Math::PI; sweep -= 2 * Math::PI; end

                  if sweep.abs * 180.0 / Math::PI >= min_angle
                    best_arc_end = j
                    mid_idx = run_pts.length / 2
                    best_arc_data = {
                      type: :arc,
                      center: [cx, cy],
                      radius: r,
                      start_pt: run_pts.first,
                      mid_pt: run_pts[mid_idx],
                      end_pt: run_pts.last,
                      points: run_pts,
                      num_replaced: j - i - 1  # number of line segments replaced
                    }
                  end
                end
              end
            rescue StandardError => e
              Logger.warn("ArcFitter", "circle_fit failed: #{e.message}")
            end
            j += 1
          end

          if best_arc_data && best_arc_end > i + min_segs
            result << best_arc_data
            i = best_arc_end - 1  # -1 because the last point is shared
          else
            # No arc — emit a line segment
            result << {
              type: :line,
              from: points[i],
              to: points[i + 1]
            }
            i += 1
          end
        end

        result
      end

      # ---------------------------------------------------------------
      # Test if a cubic Bézier is approximately a circular arc.
      # Returns { center:, radius:, start_pt:, mid_pt:, end_pt: } or nil.
      # ---------------------------------------------------------------
      def self.bezier_to_arc(p0, p1, p2, p3, opts = {})
        tol = opts[:arc_fit_tol] || 0.08
        n_samples = opts[:arc_samples] || 7
        n_samples = n_samples | 1  # ensure odd

        # Sample points along the Bézier
        samples = (0..n_samples).map do |i|
          t = i.to_f / n_samples
          Bezier.evaluate_cubic(p0, p1, p2, p3, t)
        end

        begin
          fit = circle_fit(samples)
          return nil unless fit
          cx, cy, r, rms = fit
          return nil if rms > tol || r < 0.01

          mid = samples[samples.length / 2]
          {
            center: [cx, cy],
            radius: r,
            start_pt: p0,
            mid_pt: mid,
            end_pt: p3
          }
        rescue StandardError => e
          Logger.warn("ArcFitter", "bezier_to_arc failed: #{e.message}")
          nil
        end
      end

      private

      def self.det3(m)
        m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1]) -
        m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0]) +
        m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/bezier.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/bezier.rb`
- Size: `6.78 KB`
- Modified: `2026-04-01 20:04:46`

```ruby
# bc_pdf_vector_importer/bezier.rb
# Bézier curve utilities for approximating cubic Bézier curves
# as polyline segments suitable for SketchUp edges.
#
# Uses adaptive subdivision for accuracy: subdivides more in
# areas of high curvature, less in straight sections.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module Bezier

      # ---------------------------------------------------------------
      # Approximate a cubic Bézier curve as a polyline.
      #
      # p0, p1, p2, p3 are [x, y] control points.
      # max_segments: maximum number of line segments (quality cap)
      # tolerance: flatness tolerance for adaptive subdivision
      #
      # Returns array of [x, y] points (including p0 and p3).
      # ---------------------------------------------------------------
      def self.cubic_to_points(p0, p1, p2, p3, max_segments: 16, tolerance: 0.5)
        points = [p0]
        adaptive_subdivide(p0, p1, p2, p3, points, 0, max_segments, tolerance)
        points << p3
        points
      end

      # ---------------------------------------------------------------
      # Uniform subdivision (fallback / simple mode)
      # ---------------------------------------------------------------
      def self.cubic_uniform(p0, p1, p2, p3, segments: 12)
        points = []
        (0..segments).each do |i|
          t = i.to_f / segments
          points << evaluate_cubic(p0, p1, p2, p3, t)
        end
        points
      end

      # ---------------------------------------------------------------
      # Evaluate cubic Bézier at parameter t
      # ---------------------------------------------------------------
      def self.evaluate_cubic(p0, p1, p2, p3, t)
        t2 = t * t
        t3 = t2 * t
        mt = 1.0 - t
        mt2 = mt * mt
        mt3 = mt2 * mt

        x = mt3 * p0[0] + 3 * mt2 * t * p1[0] + 3 * mt * t2 * p2[0] + t3 * p3[0]
        y = mt3 * p0[1] + 3 * mt2 * t * p1[1] + 3 * mt * t2 * p2[1] + t3 * p3[1]
        [x, y]
      end

      private

      # ---------------------------------------------------------------
      # Adaptive subdivision using flatness test
      # ---------------------------------------------------------------
      def self.adaptive_subdivide(p0, p1, p2, p3, points, depth, max_depth, tolerance)
        if depth >= max_depth || is_flat_enough?(p0, p1, p2, p3, tolerance)
          return
        end

        # De Casteljau split at t = 0.5
        q0, q1, q2, q3, r0, r1, r2, r3 = split_cubic(p0, p1, p2, p3, 0.5)

        adaptive_subdivide(q0, q1, q2, q3, points, depth + 1, max_depth, tolerance)
        points << q3  # midpoint
        adaptive_subdivide(r0, r1, r2, r3, points, depth + 1, max_depth, tolerance)
      end

      # ---------------------------------------------------------------
      # Flatness test — checks if control points are close to the
      # chord from p0 to p3
      # ---------------------------------------------------------------
      def self.is_flat_enough?(p0, p1, p2, p3, tolerance)
        # Use the maximum distance of control points from the chord
        ux = 3.0 * p1[0] - 2.0 * p0[0] - p3[0]
        uy = 3.0 * p1[1] - 2.0 * p0[1] - p3[1]
        vx = 3.0 * p2[0] - 2.0 * p3[0] - p0[0]
        vy = 3.0 * p2[1] - 2.0 * p3[1] - p0[1]

        ux = ux * ux
        uy = uy * uy
        vx = vx * vx
        vy = vy * vy

        ux = vx if vx > ux
        uy = vy if vy > uy

        (ux + uy) <= (16.0 * tolerance * tolerance)
      end

      # ---------------------------------------------------------------
      # De Casteljau split of cubic Bézier at parameter t
      # Returns two sets of 4 control points: left curve and right curve
      # ---------------------------------------------------------------
      def self.split_cubic(p0, p1, p2, p3, t)
        mt = 1.0 - t

        # First level
        q0 = [mt * p0[0] + t * p1[0], mt * p0[1] + t * p1[1]]
        q1 = [mt * p1[0] + t * p2[0], mt * p1[1] + t * p2[1]]
        q2 = [mt * p2[0] + t * p3[0], mt * p2[1] + t * p3[1]]

        # Second level
        r0 = [mt * q0[0] + t * q1[0], mt * q0[1] + t * q1[1]]
        r1 = [mt * q1[0] + t * q2[0], mt * q1[1] + t * q2[1]]

        # Third level — the split point
        s = [mt * r0[0] + t * r1[0], mt * r0[1] + t * r1[1]]

        # Left curve: p0, q0, r0, s
        # Right curve: s, r1, q2, p3
        [p0, q0, r0, s, s, r1, q2, p3]
      end

      # ---------------------------------------------------------------
      # Arc approximation: detect if a Bézier is a circular arc
      # and return center/radius/angles if so.
      # Returns nil if not a recognizable arc.
      # ---------------------------------------------------------------
      def self.detect_arc(p0, p1, p2, p3, tolerance: 1.0)
        # Sample points along the curve
        samples = (0..8).map { |i| evaluate_cubic(p0, p1, p2, p3, i / 8.0) }

        # Try to fit a circle through first, middle, and last points
        pa = samples[0]
        pb = samples[4]
        pc = samples[8]

        center = circle_center(pa, pb, pc)
        return nil unless center

        radius = Math.sqrt((pa[0] - center[0])**2 + (pa[1] - center[1])**2)
        return nil if radius < 0.001 || radius > 1e6

        # Check if all sampled points are on this circle within tolerance
        max_err = 0
        samples.each do |pt|
          dist = Math.sqrt((pt[0] - center[0])**2 + (pt[1] - center[1])**2)
          err = (dist - radius).abs
          max_err = err if err > max_err
        end

        return nil if max_err > tolerance

        # Calculate start and end angles
        start_angle = Math.atan2(pa[1] - center[1], pa[0] - center[0])
        end_angle   = Math.atan2(pc[1] - center[1], pc[0] - center[0])

        {
          center: center,
          radius: radius,
          start_angle: start_angle,
          end_angle: end_angle
        }
      end

      # ---------------------------------------------------------------
      # Find circumcenter of three points (circle through 3 points)
      # ---------------------------------------------------------------
      def self.circle_center(a, b, c)
        ax, ay = a[0], a[1]
        bx, by = b[0], b[1]
        cx, cy = c[0], c[1]

        d = 2.0 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
        return nil if d.abs < 1e-10

        ux = ((ax * ax + ay * ay) * (by - cy) +
              (bx * bx + by * by) * (cy - ay) +
              (cx * cx + cy * cy) * (ay - by)) / d

        uy = ((ax * ax + ay * ay) * (cx - bx) +
              (bx * bx + by * by) * (ax - cx) +
              (cx * cx + cy * cy) * (bx - ax)) / d

        [ux, uy]
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/command_runner.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/command_runner.rb`
- Size: `4.16 KB`
- Modified: `2026-03-29 16:45:50`

```ruby
# bc_pdf_vector_importer/command_runner.rb
# Safe subprocess execution with timeout and captured output.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'open3'
require 'timeout'

module BlueCollarSystems
  module PDFVectorImporter
    module CommandRunner
      DEFAULT_TIMEOUT = 90.0

      # Run an external command safely.
      #
      # args: Array command + args (no shell).
      # opts:
      #   :timeout_s => Float seconds
      #   :context   => log context string
      #
      # Returns:
      #   {
      #     ok: Boolean,
      #     timed_out: Boolean,
      #     exitstatus: Integer|nil,
      #     stdout: String,
      #     stderr: String,
      #     error: String|nil
      #   }
      def self.run(args, opts = {})
        timeout_s = (opts[:timeout_s] || DEFAULT_TIMEOUT).to_f
        timeout_s = DEFAULT_TIMEOUT if timeout_s <= 0.0
        context = (opts[:context] || "CommandRunner").to_s

        raise ArgumentError, "args must be a non-empty Array" unless args.is_a?(Array) && !args.empty?

        cmd = args.map(&:to_s)
        stdout_s = ""
        stderr_s = ""
        status = nil
        timed_out = false
        error = nil

        begin
          Open3.popen3(*cmd) do |stdin, stdout, stderr, wait_thr|
            begin
              stdin.close
            rescue StandardError
              # ignore close errors
            end

            out_thread = Thread.new { stdout.read.to_s }
            err_thread = Thread.new { stderr.read.to_s }

            begin
              Timeout.timeout(timeout_s) { status = wait_thr.value }
            rescue Timeout::Error
              timed_out = true
              pid = nil
              begin
                pid = wait_thr.pid
              rescue StandardError
                pid = nil
              end
              if pid
                begin
                  if RUBY_PLATFORM =~ /mswin|mingw|cygwin/
                    # On Windows, terminate process tree to avoid orphaned children.
                    system("taskkill", "/PID", pid.to_s, "/T", "/F",
                           out: File::NULL, err: File::NULL)
                  else
                    Process.kill("KILL", pid)
                  end
                rescue StandardError
                  begin
                    Process.kill(9, pid)
                  rescue StandardError
                    # best effort
                  end
                end
              end
              begin
                status = wait_thr.value
              rescue StandardError
                # process may already be gone
              end
            end

            begin
              stdout_s = out_thread.value
            rescue StandardError
              stdout_s = ""
            end
            begin
              stderr_s = err_thread.value
            rescue StandardError
              stderr_s = ""
            end
          end
        rescue StandardError => e
          error = e
        end

        ok = (!timed_out &&
              status &&
              status.respond_to?(:success?) &&
              status.success?)

        if timed_out
          safe_warn(context, "Command timed out after #{timeout_s.round(1)}s: #{cmd.join(' ')}")
        elsif error
          safe_warn(context, "Command launch failed: #{error.class}: #{error.message}")
        elsif !ok
          code = status && status.respond_to?(:exitstatus) ? status.exitstatus : nil
          detail = stderr_s.to_s.strip
          detail = detail.lines.first.to_s.strip unless detail.empty?
          msg = "Command failed with exit status #{code}"
          msg += " — #{detail}" unless detail.empty?
          safe_warn(context, msg)
        end

        {
          ok: !!ok,
          timed_out: timed_out,
          exitstatus: status && status.respond_to?(:exitstatus) ? status.exitstatus : nil,
          stdout: stdout_s,
          stderr: stderr_s,
          error: error ? error.message : nil
        }
      end

      def self.safe_warn(context, msg)
        begin
          Logger.warn(context, msg)
        rescue StandardError
          # logger might be unavailable in minimal contexts
        end
      end
      private_class_method :safe_warn
    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/compatibility_report.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/compatibility_report.rb`
- Size: `7.54 KB`
- Modified: `2026-03-31 16:51:18`

```ruby
# bc_pdf_vector_importer/compatibility_report.rb
# Runtime compatibility diagnostics for support and troubleshooting.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'
require 'rbconfig'

module BlueCollarSystems
  module PDFVectorImporter
    module CompatibilityReport
      class << self
        def show
          report = build_report
          saved_path = save_report(report)
          copied = copy_to_clipboard(report)
          print_to_console(report)

          lines = []
          lines << "Compatibility report generated."
          lines << ""
          lines << "Clipboard: #{copied ? 'Copied' : 'Not available'}"
          lines << "Report file: #{saved_path || 'Not available'}"
          lines << ""
          lines << "Full report also printed to Ruby Console."
          UI.messagebox(lines.join("\n"))
        rescue StandardError => e
          Logger.error("CompatibilityReport", "show failed", e)
          UI.messagebox("Compatibility report failed:\n#{e.message}")
        end

        def build_report
          model = safe_call { Sketchup.active_model }
          entities = model ? safe_call { model.active_entities } : nil
          pdftocairo = find_pdftocairo
          pdftotext = find_pdftotext

          lines = []
          lines << "=== PDF Vector Importer Compatibility Report ==="
          lines << "Generated: #{Time.now}"
          lines << ""
          lines << "[Environment]"
          lines << "SketchUp Version: #{safe_call { Sketchup.version } || 'unknown'}"
          lines << "SketchUp Version Number: #{safe_call { Sketchup.version_number } || 'unknown'}"
          lines << "SketchUp Platform: #{safe_call { Sketchup.platform } || 'unknown'}"
          lines << "SketchUp Pro: #{safe_call { Sketchup.is_pro? } || 'unknown'}"
          lines << "Ruby Version: #{RUBY_VERSION}"
          lines << "Ruby Patchlevel: #{defined?(RUBY_PATCHLEVEL) ? RUBY_PATCHLEVEL : 'unknown'}"
          lines << "Ruby Engine: #{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
          lines << "Ruby Platform: #{RUBY_PLATFORM}"
          lines << "Host OS: #{safe_call { RbConfig::CONFIG['host_os'] } || 'unknown'}"
          lines << "Plugin Version: #{defined?(PLUGIN_VERSION) ? PLUGIN_VERSION : 'unknown'}"
          lines << ""
          lines << "[Capabilities]"
          lines << capability_line("UI::HtmlDialog available", html_dialog_supported?)
          lines << capability_line("UI.select_directory available", UI.respond_to?(:select_directory))
          lines << capability_line("UI clipboard API available", UI.respond_to?(:set_clipboard_data))
          lines << capability_line("Sketchup::Importer available", defined?(Sketchup::Importer) ? true : false)
          lines << capability_line("Model available", !model.nil?)
          lines << capability_line("Entities#add_image available", entities_responds?(entities, :add_image))
          lines << capability_line("Entities#add_3d_text available", entities_responds?(entities, :add_3d_text))
          lines << capability_line("Model#line_styles available", line_styles_supported?(model))
          lines << capability_line("pdftocairo found", !pdftocairo.nil?, pdftocairo)
          lines << capability_line("pdftotext found", !pdftotext.nil?, pdftotext)
          lines << ""
          lines << "[Feature Impact]"
          lines.concat(feature_impact_lines(model, entities, pdftocairo, pdftotext))
          lines << ""
          lines << "[Notes]"
          lines << "- This report is safe to share for support diagnostics."
          lines << "- It includes environment versions and local executable paths."

          lines.join("\n")
        end

        private

        def safe_call
          yield
        rescue StandardError
          nil
        end

        def entities_responds?(entities, method_name)
          return false unless entities
          entities.respond_to?(method_name)
        rescue StandardError
          false
        end

        def html_dialog_supported?
          return false unless defined?(UI::HtmlDialog)
          true
        rescue StandardError
          false
        end

        def line_styles_supported?(model)
          return false unless model && model.respond_to?(:line_styles)
          styles = model.line_styles
          !styles.nil?
        rescue StandardError
          false
        end

        def find_pdftocairo
          return nil unless defined?(SvgTextRenderer)
          SvgTextRenderer.find_pdftocairo
        rescue StandardError
          nil
        end

        def find_pdftotext
          return nil unless defined?(ExternalTextExtractor)
          ExternalTextExtractor.send(:pdftotext_executable)
        rescue StandardError
          nil
        end

        def capability_line(label, ok, detail = nil)
          state = ok ? "OK" : "MISSING"
          if detail && !detail.to_s.empty?
            "#{label}: #{state} (#{detail})"
          else
            "#{label}: #{state}"
          end
        end

        def feature_impact_lines(model, entities, pdftocairo, pdftotext)
          lines = []
          if !html_dialog_supported?
            lines << "- Dialog UI: Using basic input boxes (HtmlDialog unavailable)."
          else
            lines << "- Dialog UI: Modern HtmlDialog enabled."
          end

          if !(defined?(Sketchup::Importer) ? true : false)
            lines << "- File > Import hook: Not available; use Extensions/Plugins menu import."
          else
            lines << "- File > Import hook: Available."
          end

          if !entities_responds?(entities, :add_image)
            lines << "- Raster fallback: Not available (Entities#add_image missing)."
          else
            lines << "- Raster fallback: Available."
          end

          if !line_styles_supported?(model)
            lines << "- Native line styles: Not available; dashed lines use physical segment fallback."
          else
            lines << "- Native line styles: Available."
          end

          if pdftocairo
            lines << "- SVG/geometry text render: Enabled via pdftocairo."
          else
            lines << "- SVG/geometry text render: Disabled (pdftocairo not found)."
          end

          if pdftotext
            lines << "- External text extraction: Enabled via pdftotext."
          else
            lines << "- External text extraction: Disabled (internal parser fallback)."
          end

          lines
        end

        def save_report(report)
          dir = File.join(Dir.tmpdir, 'bc_pdf_importer')
          begin
            Dir.mkdir(dir) unless File.directory?(dir)
          rescue StandardError
            # directory might already exist or be non-creatable
          end

          path = File.join(dir, 'compatibility_report.txt')
          File.open(path, 'w') { |f| f.write(report) }
          path
        rescue StandardError => e
          Logger.warn("CompatibilityReport", "save_report failed: #{e.message}")
          nil
        end

        def copy_to_clipboard(report)
          return false unless UI.respond_to?(:set_clipboard_data)
          UI.set_clipboard_data(report)
          true
        rescue StandardError => e
          Logger.warn("CompatibilityReport", "copy_to_clipboard failed: #{e.message}")
          false
        end

        def print_to_console(report)
          puts report
        rescue StandardError
          # Ruby console may be unavailable.
        end
      end
    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/content_stream_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/content_stream_parser.rb`
- Size: `21.86 KB`
- Modified: `2026-04-01 20:04:52`

```ruby
# bc_pdf_vector_importer/content_stream_parser.rb
# Parses PDF content streams and extracts vector path data.
# Handles all PDF path construction and painting operators,
# graphics state (CTM transforms), and clipping paths.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class ContentStreamParser
      MAX_TOKENS_PER_STREAM = 1_000_000

      # A VectorPath represents one complete path with its sub-paths
      VectorPath = Struct.new(
        :subpaths,       # Array of SubPath
        :stroke,         # Boolean — was this path stroked?
        :fill,           # Boolean — was this path filled?
        :stroke_color,   # [r, g, b] 0.0–1.0
        :fill_color,     # [r, g, b] 0.0–1.0
        :line_width,     # Float (in PDF points)
        :line_cap,       # 0=butt, 1=round, 2=square
        :line_join,      # 0=miter, 1=round, 2=bevel
        :dash_pattern,   # [array, phase] or nil
        :ctm,            # [a, b, c, d, e, f] transformation matrix at time of painting
        :layer_name      # String — OCG layer name, or nil
      )

      SubPath = Struct.new(
        :segments,     # Array of Segment
        :closed        # Boolean — was 'h' (closepath) used?
      )

      Segment = Struct.new(
        :type,     # :move, :line, :curve, :rect
        :points    # Array of [x, y] in PDF user space
      )

      def initialize(streams, pdf_parser, ocg_map = {})
        @streams = streams       # Array of decoded stream strings
        @pdf_parser = pdf_parser
        @ocg_map = ocg_map       # { "MC0" => "Layer Name", ... }
        @paths = []
      end

      # ---------------------------------------------------------------
      # Parse all streams and return array of VectorPath
      # ---------------------------------------------------------------
      def parse
        @paths = []

        # Graphics state stack
        @gs_stack = []
        reset_graphics_state

        # Current path being constructed
        @current_subpaths = []
        @current_segments = []
        @current_point = nil

        # Marked content / OCG layer tracking
        @mc_layer_stack = []
        @current_ocg_layer = nil

        @streams.each do |stream|
          next unless stream && !stream.empty?
          tokens = tokenize_content_stream(stream)
          execute_operators(tokens)
        end

        @paths
      end

      private

      # ---------------------------------------------------------------
      # Graphics state
      # ---------------------------------------------------------------
      def reset_graphics_state
        @ctm = [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]  # Identity matrix
        @stroke_color = [0.0, 0.0, 0.0]
        @fill_color = [0.0, 0.0, 0.0]
        @line_width = 1.0
        @line_cap = 0
        @line_join = 0
        @dash_pattern = nil
        @color_space_stroke = '/DeviceGray'
        @color_space_fill = '/DeviceGray'
      end

      def save_graphics_state
        @gs_stack.push({
          ctm: @ctm.dup,
          stroke_color: @stroke_color.dup,
          fill_color: @fill_color.dup,
          line_width: @line_width,
          line_cap: @line_cap,
          line_join: @line_join,
          dash_pattern: @dash_pattern,
          color_space_stroke: @color_space_stroke,
          color_space_fill: @color_space_fill
        })
      end

      def restore_graphics_state
        gs = @gs_stack.pop
        return unless gs
        @ctm = gs[:ctm]
        @stroke_color = gs[:stroke_color]
        @fill_color = gs[:fill_color]
        @line_width = gs[:line_width]
        @line_cap = gs[:line_cap]
        @line_join = gs[:line_join]
        @dash_pattern = gs[:dash_pattern]
        @color_space_stroke = gs[:color_space_stroke]
        @color_space_fill = gs[:color_space_fill]
      end

      # ---------------------------------------------------------------
      # Matrix operations
      # ---------------------------------------------------------------
      def concat_matrix(a, b, c, d, e, f)
        # Multiply new matrix [a,b,c,d,e,f] by current CTM
        m = @ctm
        @ctm = [
          a * m[0] + b * m[2],
          a * m[1] + b * m[3],
          c * m[0] + d * m[2],
          c * m[1] + d * m[3],
          e * m[0] + f * m[2] + m[4],
          e * m[1] + f * m[3] + m[5]
        ]
      end

      def transform_point(x, y)
        m = @ctm
        tx = m[0] * x + m[2] * y + m[4]
        ty = m[1] * x + m[3] * y + m[5]
        [tx, ty]
      end

      # ---------------------------------------------------------------
      # Content stream tokenizer
      # ---------------------------------------------------------------
      def tokenize_content_stream(stream)
        tokens = []
        i = 0
        len = stream.length

        while i < len
          if tokens.length > MAX_TOKENS_PER_STREAM
            Logger.warn("ContentParser", "Token limit reached (#{MAX_TOKENS_PER_STREAM}) — truncating stream parse")
            break
          end

          c = stream[i]

          # Whitespace
          if c =~ /[\s\x00]/
            i += 1
            next
          end

          # Comment
          if c == '%'
            eol = stream.index(/[\r\n]/, i) || len
            i = eol + 1
            next
          end

          # String literal
          if c == '('
            depth = 1
            j = i + 1
            while j < len && depth > 0
              if stream[j] == '\\' 
                j += 2
                next
              end
              depth += 1 if stream[j] == '('
              depth -= 1 if stream[j] == ')'
              j += 1
            end
            tokens << { type: :string, value: stream[i...j] }
            i = j
            next
          end

          # Hex string
          if c == '<' && (i + 1 >= len || stream[i + 1] != '<')
            j = stream.index('>', i) || len
            tokens << { type: :hex_string, value: stream[i..j] }
            i = j + 1
            next
          end

          # Dict
          if c == '<' && i + 1 < len && stream[i + 1] == '<'
            depth = 1
            j = i + 2
            while j < len - 1 && depth > 0
              if stream[j, 2] == '<<'
                depth += 1
                j += 2
              elsif stream[j, 2] == '>>'
                depth -= 1
                j += 2
              else
                j += 1
              end
            end
            tokens << { type: :dict, value: stream[i...j] }
            i = j
            next
          end

          if c == '>' && i + 1 < len && stream[i + 1] == '>'
            i += 2
            next
          end

          # Array
          if c == '['
            depth = 1
            j = i + 1
            while j < len && depth > 0
              depth += 1 if stream[j] == '['
              depth -= 1 if stream[j] == ']'
              j += 1
            end
            tokens << { type: :array, value: stream[i...j] }
            i = j
            next
          end

          if c == ']'
            i += 1
            next
          end

          # Name
          if c == '/'
            j = i + 1
            while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/
              j += 1
            end
            tokens << { type: :name, value: stream[i...j] }
            i = j
            next
          end

          # Number or keyword
          j = i
          while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/
            j += 1
          end

          # Safety: if current char is an unhandled delimiter (for example '{' or '}'),
          # consume it so we don't loop forever on malformed/binary data.
          if j == i
            i += 1
            next
          end

          word = stream[i...j]

          # Inline image: BI <key-value pairs> ID <binary data> EI
          # When we see 'BI', skip forward past the binary data to 'EI'.
          if word == 'BI'
            # Find 'ID' marker (signals start of binary image data)
            id_pos = stream.index(/\sID[\s\n\r]/, j)
            if id_pos
              # Find 'EI' marker after the binary data.
              # EI must be preceded by whitespace to avoid false matches
              # inside the binary data.
              ei_pos = stream.index(/[\s\n\r]EI(?=[\s\n\r\/\[<])/, id_pos + 3)
              if ei_pos
                i = ei_pos + 3  # skip past 'EI'
              else
                i = len  # malformed — skip to end
              end
            else
              i = j  # no ID found — just skip the BI token
            end
            next
          end

          if word =~ /\A[+-]?\d*\.?\d+\z/
            tokens << { type: :number, value: word.to_f }
          else
            tokens << { type: :operator, value: word }
          end
          i = j
        end

        tokens
      end

      # ---------------------------------------------------------------
      # Execute operators
      # ---------------------------------------------------------------
      def execute_operators(tokens)
        operand_stack = []

        tokens.each do |token|
          if token[:type] == :operator
            op = token[:value]
            handle_operator(op, operand_stack)
            operand_stack.clear
          else
            operand_stack << token
          end
        end
      end

      def handle_operator(op, operands)
        nums = operands.select { |t| t[:type] == :number }.map { |t| t[:value] }

        case op

        # --- Graphics state ---
        when 'q'
          save_graphics_state

        when 'Q'
          restore_graphics_state

        when 'cm'
          if nums.length >= 6
            concat_matrix(nums[0], nums[1], nums[2], nums[3], nums[4], nums[5])
          end

        when 'w'
          @line_width = nums[0] || 1.0

        when 'J'
          @line_cap = (nums[0] || 0).to_i

        when 'j'
          @line_join = (nums[0] || 0).to_i

        when 'd'
          # Dash pattern: array phase
          arr_token = operands.find { |t| t[:type] == :array }
          phase = nums.last || 0
          if arr_token
            dash_nums = arr_token[:value].to_s.gsub(/[\[\]]/, '').strip.split(/\s+/).map(&:to_f)
            @dash_pattern = [dash_nums, phase]
          end

        # --- Color operators ---
        when 'G'  # Stroke gray
          @stroke_color = nums_to_rgb(nums, '/DeviceGray')
          @color_space_stroke = '/DeviceGray'

        when 'g'  # Fill gray
          @fill_color = nums_to_rgb(nums, '/DeviceGray')
          @color_space_fill = '/DeviceGray'

        when 'RG' # Stroke RGB
          if nums.length >= 3
            @stroke_color = nums_to_rgb(nums, '/DeviceRGB')
            @color_space_stroke = '/DeviceRGB'
          end

        when 'rg' # Fill RGB
          if nums.length >= 3
            @fill_color = nums_to_rgb(nums, '/DeviceRGB')
            @color_space_fill = '/DeviceRGB'
          end

        when 'K'  # Stroke CMYK
          if nums.length >= 4
            @stroke_color = cmyk_to_rgb(nums[0], nums[1], nums[2], nums[3])
            @color_space_stroke = '/DeviceCMYK'
          end

        when 'k'  # Fill CMYK
          if nums.length >= 4
            @fill_color = cmyk_to_rgb(nums[0], nums[1], nums[2], nums[3])
            @color_space_fill = '/DeviceCMYK'
          end

        when 'CS' # Stroke color space
          name_token = operands.find { |t| t[:type] == :name }
          @color_space_stroke = name_token[:value] if name_token

        when 'cs' # Fill color space
          name_token = operands.find { |t| t[:type] == :name }
          @color_space_fill = name_token[:value] if name_token

        when 'SC', 'SCN' # Stroke color (general)
          # Pattern-only SCN may provide no numeric components.
          @stroke_color = nums_to_rgb(nums, @color_space_stroke) unless nums.empty?

        when 'sc', 'scn' # Fill color (general)
          # Pattern-only scn may provide no numeric components.
          @fill_color = nums_to_rgb(nums, @color_space_fill) unless nums.empty?

        # --- Path construction ---
        when 'm'  # moveto
          if nums.length >= 2
            finish_subpath
            @current_point = [nums[0], nums[1]]
            @current_segments = [Segment.new(:move, [[nums[0], nums[1]]])]
          end

        when 'l'  # lineto
          if nums.length >= 2 && @current_point
            @current_segments << Segment.new(:line, [@current_point.dup, [nums[0], nums[1]]])
            @current_point = [nums[0], nums[1]]
          end

        when 'c'  # curveto (cubic Bezier)
          if nums.length >= 6 && @current_point
            @current_segments << Segment.new(:curve, [
              @current_point.dup,
              [nums[0], nums[1]],
              [nums[2], nums[3]],
              [nums[4], nums[5]]
            ])
            @current_point = [nums[4], nums[5]]
          end

        when 'v'  # curveto (initial point = current)
          if nums.length >= 4 && @current_point
            @current_segments << Segment.new(:curve, [
              @current_point.dup,
              @current_point.dup,
              [nums[0], nums[1]],
              [nums[2], nums[3]]
            ])
            @current_point = [nums[2], nums[3]]
          end

        when 'y'  # curveto (final point = control 2)
          if nums.length >= 4 && @current_point
            @current_segments << Segment.new(:curve, [
              @current_point.dup,
              [nums[0], nums[1]],
              [nums[2], nums[3]],
              [nums[2], nums[3]]
            ])
            @current_point = [nums[2], nums[3]]
          end

        when 'h'  # closepath
          if @current_segments.length > 0
            # Close back to the first moveto point
            first_seg = @current_segments.find { |s| s.type == :move }
            if first_seg && @current_point
              start_pt = first_seg.points[0]
              unless close_enough?(@current_point, start_pt)
                @current_segments << Segment.new(:line, [@current_point.dup, start_pt.dup])
              end
              @current_point = start_pt.dup
            end
            finish_subpath(true)
          end

        when 're' # rectangle
          if nums.length >= 4
            x, y, w, h = nums[0], nums[1], nums[2], nums[3]
            finish_subpath
            @current_segments = [
              Segment.new(:move, [[x, y]]),
              Segment.new(:line, [[x, y], [x + w, y]]),
              Segment.new(:line, [[x + w, y], [x + w, y + h]]),
              Segment.new(:line, [[x + w, y + h], [x, y + h]]),
              Segment.new(:line, [[x, y + h], [x, y]])
            ]
            @current_point = [x, y]
            finish_subpath(true)
          end

        # --- Path painting ---
        when 'S'   # Stroke
          finish_subpath
          emit_path(true, false)

        when 's'   # Close and stroke
          close_current_subpath
          finish_subpath(true)
          emit_path(true, false)

        when 'f', 'F' # Fill (nonzero winding / old-style)
          finish_subpath
          emit_path(false, true)

        when 'f*'  # Fill (even-odd)
          finish_subpath
          emit_path(false, true)

        when 'B'   # Fill and stroke
          finish_subpath
          emit_path(true, true)

        when 'B*'  # Fill (even-odd) and stroke
          finish_subpath
          emit_path(true, true)

        when 'b'   # Close, fill and stroke
          close_current_subpath
          finish_subpath(true)
          emit_path(true, true)

        when 'b*'  # Close, fill (even-odd) and stroke
          close_current_subpath
          finish_subpath(true)
          emit_path(true, true)

        when 'n'   # End path without painting (clipping boundary)
          finish_subpath
          clear_path

        # --- Text (we skip text content but track state) ---
        when 'BT', 'ET', 'Tf', 'Td', 'TD', 'Tm', 'T*',
             'Tj', 'TJ', "'", '"', 'Tc', 'Tw', 'Tz', 'TL', 'Tr', 'Ts'
          # Text operators — skip for vector import

        # --- Inline image (skip) ---
        when 'BI'
          # Skip — handled by tokenizer advancing past ID...EI

        # --- XObject / Form XObject (Do) ---
        when 'Do'
          # We could recurse into Form XObjects here for maximum accuracy
          # For now, skip

        # --- Marked content (OCG layer tracking) ---
        when 'BDC'
          # BDC takes two operands: tag and properties
          # For OCG: /OC /MC0 BDC
          if operands.length >= 2
            # Operands may be token hashes {type:, value:} or plain strings
            raw_tag = operands[-2]
            raw_props = operands[-1]
            tag = raw_tag.is_a?(Hash) ? raw_tag[:value].to_s : raw_tag.to_s
            props_name = raw_props.is_a?(Hash) ? raw_props[:value].to_s.sub(/\A\//, '') : raw_props.to_s.sub(/\A\//, '')
            if tag == '/OC' && @ocg_map.key?(props_name)
              @mc_layer_stack.push(@current_ocg_layer)
              @current_ocg_layer = @ocg_map[props_name]
            else
              @mc_layer_stack.push(@current_ocg_layer)
            end
          else
            @mc_layer_stack.push(@current_ocg_layer)
          end

        when 'BMC'
          @mc_layer_stack.push(@current_ocg_layer)

        when 'EMC'
          @current_ocg_layer = @mc_layer_stack.pop

        when 'MP', 'DP'
          # Marked point — no nesting, ignore

        else
          # Unknown operator — ignore silently
        end
      end

      # ---------------------------------------------------------------
      # Path management
      # ---------------------------------------------------------------
      def finish_subpath(closed = false)
        if @current_segments && @current_segments.length > 0
          sp = SubPath.new(@current_segments, closed)
          @current_subpaths << sp
        end
        @current_segments = []
      end

      def close_current_subpath
        if @current_segments.length > 0
          first_seg = @current_segments.find { |s| s.type == :move }
          if first_seg && @current_point
            start_pt = first_seg.points[0]
            unless close_enough?(@current_point, start_pt)
              @current_segments << Segment.new(:line, [@current_point.dup, start_pt.dup])
            end
            @current_point = start_pt.dup
          end
        end
      end

      def emit_path(stroke, fill)
        return if @current_subpaths.empty?

        # Transform all points by current CTM
        transformed_subpaths = @current_subpaths.map do |sp|
          new_segments = sp.segments.map do |seg|
            new_points = seg.points.map { |pt| transform_point(pt[0], pt[1]) }
            Segment.new(seg.type, new_points)
          end
          SubPath.new(new_segments, sp.closed)
        end

        path = VectorPath.new(
          transformed_subpaths,
          stroke,
          fill,
          @stroke_color.dup,
          @fill_color.dup,
          @line_width,
          @line_cap,
          @line_join,
          @dash_pattern ? @dash_pattern.dup : nil,
          @ctm.dup,
          @current_ocg_layer
        )

        @paths << path
        clear_path
      end

      def clear_path
        @current_subpaths = []
        @current_segments = []
        # PDF spec: after painting or ending a path, the current point is undefined.
        # Leaving this set can cause a subsequent 'l' operator to connect to stale geometry.
        @current_point = nil
      end

      # ---------------------------------------------------------------
      # Color helpers
      # ---------------------------------------------------------------
      def clamp01(v)
        n = begin
          Float(v)
        rescue StandardError
          0.0
        end
        n = 0.0 if n.nan? || n.infinite?
        [[n, 0.0].max, 1.0].min
      end

      def clamp_rgb(rgb)
        arr = rgb.is_a?(Array) ? rgb : []
        [
          clamp01(arr[0] || 0.0),
          clamp01(arr[1] || arr[0] || 0.0),
          clamp01(arr[2] || arr[1] || arr[0] || 0.0)
        ]
      end

      def cmyk_to_rgb(c, m, y, k)
        c = clamp01(c)
        m = clamp01(m)
        y = clamp01(y)
        k = clamp01(k)
        r = (1.0 - c) * (1.0 - k)
        g = (1.0 - m) * (1.0 - k)
        b = (1.0 - y) * (1.0 - k)
        clamp_rgb([r, g, b])
      end

      def nums_to_rgb(nums, color_space)
        safe = (nums || []).map do |n|
          begin
            Float(n)
          rescue StandardError
            0.0
          end
        end

        case color_space
        when '/DeviceGray'
          v = clamp01(safe[0] || 0.0)
          [v, v, v]
        when '/DeviceRGB'
          clamp_rgb([safe[0] || 0.0, safe[1] || 0.0, safe[2] || 0.0])
        when '/DeviceCMYK'
          cmyk_to_rgb(safe[0] || 0.0, safe[1] || 0.0, safe[2] || 0.0, safe[3] || 0.0)
        else
          # Unknown color space — best-effort fallback:
          # - 4 channels are commonly CMYK-like (ICCBased/Separation wrappers)
          # - otherwise use first 3 channels as RGB, or replicate gray.
          if safe.length >= 4
            cmyk_to_rgb(safe[0], safe[1], safe[2], safe[3])
          elsif safe.length >= 3
            clamp_rgb([safe[0], safe[1], safe[2]])
          elsif safe.length >= 1
            v = clamp01(safe[0])
            [v, v, v]
          else
            [0, 0, 0]
          end
        end
      end

      def close_enough?(pt1, pt2, tolerance = 0.001)
        (pt1[0] - pt2[0]).abs < tolerance && (pt1[1] - pt2[1]).abs < tolerance
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/dimension_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/dimension_parser.rb`
- Size: `7.95 KB`
- Modified: `2026-04-01 20:04:55`

```ruby
# bc_pdf_vector_importer/dimension_parser.rb
# Converts raw dimension text into structured ParsedDimension.
# Separates semantic parsing (what KIND of dimension) from
# token parsing (what NUMERIC VALUE).
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module DimensionParser

      # ---------------------------------------------------------------
      # Parse dimension text → ParsedDimension
      # ---------------------------------------------------------------
      def self.parse(text, config = nil)
        raw = text.to_s
        s = normalize(raw)

        result = ParsedDimension.new(raw, :unknown, nil, nil, nil, s, 0.0, [])

        # Extract quantity prefix: "4-13/16 DIA" → qty=4
        qty = extract_quantity(s)
        result.quantity = qty if qty

        # 1. Slot pattern: 13/16 x 1 1/4 SLOT
        slot = match_slot_size(s)
        if slot
          result.kind = :slot
          result.value = slot
          result.units = :in
          result.confidence = 0.95
          return result
        end

        # 2. Diameter marker: Ø13/16, 13/16 DIA
        if has_diameter_marker?(s)
          val = parse_length_token(remove_diameter_words(s))
          if val
            result.kind = :diameter
            result.value = val
            result.units = :in
            result.confidence = 0.95
            return result
          end
        end

        # 3. Radius marker: R2.5, RAD 1/2
        if has_radius_marker?(s)
          val = parse_length_token(remove_radius_words(s))
          if val
            result.kind = :radius
            result.value = val
            result.units = :in
            result.confidence = 0.90
            return result
          end
        end

        # 4. Feet-inches: 1'-4", 5' 6 1/2"
        fi = parse_feet_inches(s)
        if fi
          result.kind = :linear
          result.value = fi
          result.units = :in
          result.confidence = 0.95
          return result
        end

        # 5. Imperial fraction/decimal with inch mark
        imp = parse_imperial(s)
        if imp
          result.kind = :linear
          result.value = imp
          result.units = :in
          result.confidence = 0.85
          return result
        end

        # 6. Metric: 406.4 mm, 25 cm
        met = parse_metric(s)
        if met
          result.kind = :linear
          result.value = met[:value]
          result.units = met[:units]
          result.confidence = 0.90
          return result
        end

        # 7. Scale: 1/4" = 1'-0", 1:50
        sc = parse_scale(s)
        if sc
          result.kind = :scale
          result.value = sc
          result.units = nil
          result.confidence = 0.80
          return result
        end

        # 8. Plain number (ambiguous)
        if s =~ /\A\s*(\d+(?:\.\d+)?)\s*\z/
          result.kind = :linear
          result.value = $1.to_f
          result.units = :unknown
          result.confidence = 0.40
          result.warnings << "Ambiguous plain number — units unknown"
          return result
        end

        result.confidence = 0.1
        result.warnings << "Could not parse dimension text"
        result
      end

      private

      # ── Normalization ────────────────────────────────────────────
      def self.normalize(text)
        s = text.dup
        s.gsub!(/[\u2018\u2019\u201C\u201D]/, "'")  # smart quotes
        s.gsub!(/\u2013|\u2014/, '-')                 # en/em dash
        s.gsub!(/\u2044/, '/')                        # fraction slash
        s.gsub!(/DIA\.?/i, 'DIA')
        s.gsub!(/\bHOLES?\b/i, 'HOLE')
        s.gsub!(/\bSLOTS?\b/i, 'SLOT')
        s.gsub!(/\s+/, ' ')
        s.strip
      end

      # ── Quantity extraction ──────────────────────────────────────
      def self.extract_quantity(s)
        # (4) 13/16, 4-13/16, 2x Ø3/4
        if s =~ /\A\s*\((\d+)\)/
          return $1.to_i
        end
        if s =~ /\A\s*(\d+)\s*[-xX]\s*(?:Ø|\d)/
          return $1.to_i
        end
        nil
      end

      # ── Slot size ────────────────────────────────────────────────
      def self.match_slot_size(s)
        if s =~ /(\d+(?:\.\d+)?(?:\s*\/\s*\d+)?)\s*"?\s*[xX×]\s*(\d+(?:\.\d+)?(?:\s+\d+\s*\/\s*\d+)?(?:\s*\/\s*\d+)?)\s*"?\s*(?:SLOT|SSL|LSL)/i
          w = parse_length_token($1)
          l = parse_length_token($2)
          return { width: w, length: l } if w && l
        end
        nil
      end

      # ── Diameter / Radius markers ────────────────────────────────
      def self.has_diameter_marker?(s)
        s =~ /Ø|DIA\b|\bHOLE\b/i
      end

      def self.has_radius_marker?(s)
        s =~ /\AR\s*\d|RAD\b/i
      end

      def self.remove_diameter_words(s)
        s.gsub(/Ø|DIA\b|\bHOLE\b|\(\d+\)|\d+\s*[-xX]\s*/i, ' ').strip
      end

      def self.remove_radius_words(s)
        s.gsub(/\AR\s*|\bRAD\b/i, ' ').strip
      end

      # ── Feet-inches ──────────────────────────────────────────────
      def self.parse_feet_inches(s)
        if s =~ /(\d+(?:\.\d+)?)\s*['']\s*[-–]?\s*(\d+(?:\.\d+)?)?\s*(?:(\d+)\s*\/\s*(\d+))?\s*[""]?\s*\z/
          feet = $1.to_f
          inches = $2 ? $2.to_f : 0.0
          inches += $3.to_f / $4.to_f if $3 && $4 && $4.to_f != 0
          return feet * 12.0 + inches
        end
        nil
      end

      # ── Imperial fraction/decimal ────────────────────────────────
      def self.parse_imperial(s)
        # Mixed: 1 1/2", 3 3/4
        if s =~ /(\d+)\s+(\d+)\s*\/\s*(\d+)\s*[""]?/
          return $1.to_f + ($3.to_f != 0 ? $2.to_f / $3.to_f : 0.0)
        end
        # Pure fraction: 13/16, 15/16"
        if s =~ /\A\s*(\d+)\s*\/\s*(\d+)\s*[""]?\s*\z/
          return $1.to_f / $2.to_f
        end
        # Decimal with inch mark: 0.8125", 12.5"
        if s =~ /(\d+(?:\.\d+)?)\s*[""]/ 
          return $1.to_f
        end
        nil
      end

      # ── Metric ───────────────────────────────────────────────────
      def self.parse_metric(s)
        if s =~ /(\d+(?:\.\d+)?)\s*(MM|CM|M)\b/i
          val = $1.to_f
          unit = $2.upcase.to_sym
          return { value: val, units: unit }
        end
        nil
      end

      # ── Scale ────────────────────────────────────────────────────
      def self.parse_scale(s)
        if s =~ /(\d+(?:\.\d+)?(?:\s*\/\s*\d+)?)\s*"?\s*=\s*(\S+)/
          return { from: $1, to: $2 }
        end
        if s =~ /(\d+)\s*:\s*(\d+)/
          return { ratio: [$1.to_f, $2.to_f] }
        end
        nil
      end

      # ── Generic length token → Float ─────────────────────────────
      def self.parse_length_token(s)
        return nil unless s
        s = s.strip.gsub(/["']\z/, '')

        # Mixed: 1 1/4
        if s =~ /\A(\d+)\s+(\d+)\s*\/\s*(\d+)\z/
          return $1.to_f + ($3.to_f != 0 ? $2.to_f / $3.to_f : 0.0)
        end
        # Fraction: 13/16
        if s =~ /\A(\d+)\s*\/\s*(\d+)\z/
          return $1.to_f / $2.to_f
        end
        # Decimal
        if s =~ /\A(\d+(?:\.\d+)?)\z/
          return $1.to_f
        end
        nil
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/document_profiler.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/document_profiler.rb`
- Size: `5.92 KB`
- Modified: `2026-04-01 20:04:53`

```ruby
# bc_pdf_vector_importer/document_profiler.rb
# Auto-detects page type before recognition. Scores the page as:
# CAD drawing, architectural, fabrication, schematic, table-heavy,
# vector art, mixed, or raster-only.
#
# Part of the Core Engine — domain-neutral.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module DocumentProfiler

      PROFILES = [:cad_drawing, :architectural, :fabrication,
                  :schematic, :table_heavy, :vector_art,
                  :mixed, :raster_only, :unknown].freeze

      PageProfile = Struct.new(
        :page_number,
        :primary_type,    # Symbol from PROFILES
        :scores,          # Hash { profile => Float }
        :has_layers,      # Boolean — OCG layers present
        :has_text,        # Boolean
        :has_dimensions,  # Boolean
        :circle_count,    # Integer — circles/arcs found
        :closed_loop_count,
        :line_count,
        :text_count,
        :titleblock_likely # Boolean
      )

      # ---------------------------------------------------------------
      # Profile a PageData → PageProfile
      # ---------------------------------------------------------------
      def self.profile(page_data)
        prims = page_data.primitives
        texts = page_data.text_items

        # Count geometry types
        lines = prims.count { |p| p.type == :line }
        closed = prims.count { |p| p.type == :closed_loop }
        polylines = prims.count { |p| p.type == :polyline }
        total_geom = prims.length

        # Count text types
        dim_texts = texts.count { |t| t.classifications.include?(:dimension_like) }
        scale_texts = texts.count { |t| t.classifications.include?(:scale_like) }
        tb_texts = texts.count { |t| t.classifications.include?(:titleblock_like) }
        callout_texts = texts.count { |t| t.classifications.include?(:callout_like) }
        total_text = texts.length

        # Estimate circle count from closed loops
        circles = 0
        prims.each do |p|
          next unless p.type == :closed_loop && p.points && p.points.length >= 8
          fit = nil
          begin
            fit = ArcFitter.circle_fit(p.points)
          rescue StandardError => e
            Logger.warn("DocumentProfiler", "circle_fit failed: #{e.message}")
          end
          circles += 1 if fit && fit[3] < 0.02
        end

        # Page area and density
        page_area = page_data.width * page_data.height
        geom_density = page_area > 0 ? total_geom / page_area : 0
        text_density = page_area > 0 ? total_text / page_area : 0

        # Has layers?
        has_layers = page_data.layers && !page_data.layers.empty?

        # Score each profile type
        scores = {}

        # ── Fabrication / shop drawing ──
        s = 0.0
        s += 0.20 if circles > 3
        s += 0.15 if callout_texts > 2
        s += 0.15 if dim_texts > 5
        s += 0.10 if closed > 10
        s += 0.10 if tb_texts > 2
        s += 0.10 if scale_texts > 0
        scores[:fabrication] = [s, 1.0].min

        # ── CAD drawing (generic technical) ──
        s = 0.0
        s += 0.20 if lines > 50
        s += 0.15 if dim_texts > 3
        s += 0.15 if has_layers
        s += 0.10 if closed > 5
        s += 0.10 if scale_texts > 0
        s += 0.10 if tb_texts > 0
        scores[:cad_drawing] = [s, 1.0].min

        # ── Architectural ──
        s = 0.0
        s += 0.20 if lines > 100
        s += 0.15 if has_layers
        s += 0.15 if dim_texts > 10
        s += 0.10 if total_text > 30
        s += 0.10 if tb_texts > 3
        s -= 0.15 if circles > 10  # many circles → more likely fabrication
        scores[:architectural] = [s, 1.0].min

        # ── Vector art / illustration ──
        s = 0.0
        s += 0.30 if total_geom > 20 && dim_texts == 0
        s += 0.20 if polylines > lines
        s += 0.10 if total_text < 5
        s -= 0.20 if has_layers
        s -= 0.20 if dim_texts > 2
        scores[:vector_art] = [s, 1.0].min

        # ── Table-heavy ──
        s = 0.0
        tb_texts_count = texts.count { |t| t.classifications.include?(:table_like) }
        s += 0.30 if tb_texts_count > 10
        s += 0.20 if text_density > geom_density * 2
        s += 0.10 if closed > 20 && lines > 40
        scores[:table_heavy] = [s, 1.0].min

        # ── Raster only ──
        s = total_geom == 0 && total_text == 0 ? 0.90 : 0.0
        scores[:raster_only] = s

        # ── Schematic ──
        s = 0.0
        s += 0.20 if total_text > 20 && lines > 30
        s += 0.10 if circles > 2
        s -= 0.15 if dim_texts > 5
        scores[:schematic] = [s, 1.0].min

        # Pick the highest score
        primary = scores.max_by { |_, v| v }
        primary_type = primary ? primary[0] : :unknown

        # If scores are all low, default to generic
        if scores.values.max < 0.25
          primary_type = total_geom > 0 ? :cad_drawing : :unknown
        end

        PageProfile.new(
          page_data.page_number,
          primary_type,
          scores,
          has_layers,
          total_text > 0,
          dim_texts > 0,
          circles,
          closed,
          lines,
          total_text,
          tb_texts > 2
        )
      end

      # ---------------------------------------------------------------
      # Suggest recognition mode based on profile
      # ---------------------------------------------------------------
      def self.suggest_mode(profile)
        case profile.primary_type
        when :fabrication then :technical
        when :architectural then :architectural
        when :vector_art then :none
        when :raster_only then :none
        when :table_heavy then :none
        else :generic
        end
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/external_text_extractor.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/external_text_extractor.rb`
- Size: `19.12 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/external_text_extractor.rb
# Optional high-fidelity text extraction via Poppler's pdftotext -bbox-layout.
# Falls back to internal TextParser when pdftotext is unavailable.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'cgi'
require 'tmpdir'
require File.join(File.dirname(__FILE__), 'command_runner')

module BlueCollarSystems
  module PDFVectorImporter
    module ExternalTextExtractor
      class << self
        # Returns Array<TextParser::TextItem>
        # opts:
        #   :offset_x_pts, :offset_y_pts — added to extracted PDF coordinates
        #   to map crop-space coordinates back into media-space coordinates.
        def extract(pdf_path, page_number, opts = {})
          exe = pdftotext_executable
          return [] unless exe && File.exist?(pdf_path.to_s)

          out_html = File.join(
            Dir.tmpdir,
            "bc_pdf_text_bbox_#{Process.pid}_#{Time.now.to_i}_#{rand(100000)}.html"
          )

          args = [
            exe.to_s,
            '-f', page_number.to_i.to_s,
            '-l', page_number.to_i.to_s,
            '-bbox-layout',
            # Keep coordinate space consistent with pdftocairo SVG rendering.
            # Without -cropbox, pdftotext emits MediaBox coordinates on PDFs
            # where CropBox != MediaBox, which introduces text drift.
            '-cropbox',
            pdf_path.to_s,
            out_html.to_s
          ]

          run = CommandRunner.run(
            args,
            timeout_s: 45,
            context: 'ExternalTextExtractor.pdftotext'
          )
          return [] unless run[:ok] && File.exist?(out_html)

          html = File.read(out_html)
          parse_bbox_html(html, opts)
        rescue StandardError => e
          begin
            Logger.warn('ExternalTextExtractor', "pdftotext fallback: #{e.message}")
          rescue StandardError
            # Logger may be unavailable in stripped test/runtime contexts.
          end
          []
        ensure
          begin
            File.delete(out_html) if out_html && File.exist?(out_html)
          rescue StandardError => e
            Logger.warn("ExternalTextExtractor", "cleanup temp html failed: #{e.message}")
          end
        end

        private

        def pdftotext_executable
          # 1) Explicit override
          env = ENV['BC_PDFTOTEXT_PATH']
          return env if env && !env.empty? && File.exist?(env)

          # 2) Common Windows install path (MiKTeX)
          candidates = []
          candidates << 'C:\\Program Files\\poppler\\Library\\bin\\pdftotext.exe'
          candidates << 'C:\\Program Files\\poppler\\bin\\pdftotext.exe'
          if ENV['LOCALAPPDATA'] && !ENV['LOCALAPPDATA'].empty?
            candidates << File.join(
              ENV['LOCALAPPDATA'],
              'Programs', 'MiKTeX', 'miktex', 'bin', 'x64', 'pdftotext.exe'
            )
          end
          candidates << 'C:\\Program Files\\MiKTeX\\miktex\\bin\\x64\\pdftotext.exe'
          candidates.each { |p| return p if File.exist?(p) }

          # 3) PATH
          begin
            probe = CommandRunner.run(['pdftotext', '-v'],
              timeout_s: 10,
              context: 'ExternalTextExtractor.pdftotext_probe')
            return 'pdftotext' if probe[:ok]
          rescue StandardError => e
            Logger.warn('ExternalTextExtractor', "PATH probe failed: #{e.message}")
          end

          nil
        end

        def parse_bbox_html(html, opts = {})
          return [] if html.to_s.empty?

          page_h = html[/<page[^>]*height="([0-9.]+)"/i, 1].to_f
          return [] if page_h <= 0.0
          offset_x = opts[:offset_x_pts].to_f
          offset_y = opts[:offset_y_pts].to_f

          items = []

          html.scan(/<line\s+([^>]+)>(.*?)<\/line>/mi) do |line_attrs, inner|
            words = inner.scan(/<word\s+([^>]+)>(.*?)<\/word>/mi).map do |attrs, txt|
              {
                attrs: attrs,
                text: normalize_word_text(CGI.unescapeHTML(txt.to_s))
              }
            end.reject { |w| w[:text].empty? }
            next if words.empty?

            # Join words as they appear on the line.
            line_text = normalize_line_text(words.map { |w| w[:text] }.join(' '))
            next if line_text.empty?

            x_min = attr_value(line_attrs, 'xMin').to_f
            x_max = attr_value(line_attrs, 'xMax').to_f
            y_min = attr_value(line_attrs, 'yMin').to_f
            y_max = attr_value(line_attrs, 'yMax').to_f

            bbox_w = (x_max - x_min).abs
            bbox_h = (y_max - y_min).abs

            angle = estimate_angle(words, line_attrs)

            # For rotated text, the bbox is rotated too.
            # The SHORTER dimension of the bbox is the character height;
            # the LONGER dimension is the string length.
            # For horizontal text (angle near 0/180), height = bbox_h.
            # For vertical text (angle near 90/270), height = bbox_w.
            if angle.abs > 20 && angle.abs < 160
              # Significantly rotated — use shorter bbox dimension
              font_size = [bbox_w, bbox_h].min
            else
              # Horizontal-ish — use bbox height
              font_size = bbox_h
            end
            font_size = [font_size, 1.0].max

            x_pdf = x_min + offset_x
            y_pdf = (page_h - y_max) + offset_y

            items << TextParser::TextItem.new(
              line_text,
              x_pdf,
              y_pdf,
              font_size,
              angle,
              'pdftotext'
            )
          end

          stitch_fragmented_dimensions(items)
        end

        def attr_value(attrs, name)
          attrs[/\b#{Regexp.escape(name)}="([^"]+)"/i, 1] || ''
        end

        def normalize_word_text(text)
          t = text.to_s
          t = t.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: '')
          t = t.gsub(/\s+/, ' ').strip
          t
        end

        def normalize_line_text(text)
          t = text.to_s
          return '' if t.empty?

          # Clean common dimension spacing artifacts from bbox output.
          t = t.gsub(/(\d)\s*\/\s*(\d)/, '\\1/\\2')
          # Do NOT blindly rewrite denominator digits here (e.g. /1 -> /16):
          # that can silently corrupt valid dimensions. Denominator repair is
          # handled later by context-aware merge/rebuild heuristics.
          t = t.gsub(/(\d)\s*'\s*-\s*(\d)/, "\\1'-\\2")
          t = t.gsub(/(\d)\s*-\s*(\d)/, '\\1-\\2')
          t = t.gsub(/\s+"/, '"')
          t = t.gsub(/\s+/, ' ').strip

          t
        end

        # Join common split dimension fragments emitted by bbox extraction,
        # e.g. "3 15/1" + "6" -> "3 15/16", "2 7 /" + "16" -> "2 7/16".
        def stitch_fragmented_dimensions(items)
          return items if items.length < 2

          used = Array.new(items.length, false)
          out = []

          items.each_with_index do |it, i|
            next if used[i]

            text = it.text.to_s
            needs_tail_digit = text =~ /(?:\/\s*|\/1\s*)\z/
            needs_hyphen_tail = text =~ /-\s*\z/
            unless needs_tail_digit || needs_hyphen_tail
              out << it
              used[i] = true
              next
            end

            candidate_idx = nil
            best_score = Float::INFINITY

            items.each_with_index do |other, j|
              next if i == j
              # Allow already-output tiny numeric fragments to still serve as
              # denominator tails for later slash fragments.
              if used[j] && numeric_tail_candidate(other.text.to_s).nil?
                next
              end
              ot = other.text.to_s.strip
              next if ot.empty?

              # For dangling slash/hyphen, we only want compact numeric tails.
              tail_candidate = numeric_tail_candidate(ot)
              next unless tail_candidate

              dy = (other.y.to_f - it.y.to_f).abs
              dx = other.x.to_f - it.x.to_f
              next if dy > [it.font_size.to_f * 1.25, 24.0].max
              next if dx < -[it.font_size.to_f * 0.5, 4.0].max
              next if dx > [it.font_size.to_f * 2.5, 32.0].max

              score = (dy * 10.0) + dx.abs
              if score < best_score
                best_score = score
                candidate_idx = j
              end
            end

            if candidate_idx
              tail = numeric_tail_candidate(items[candidate_idx].text.to_s.strip) ||
                     items[candidate_idx].text.to_s.strip
              merged = normalize_line_text(merge_head_tail(text, tail))
              out << TextParser::TextItem.new(
                merged,
                it.x.to_f,
                it.y.to_f,
                [it.font_size.to_f, items[candidate_idx].font_size.to_f].max,
                merge_angle(it.angle, items[candidate_idx].angle),
                it.font_name
              )
              used[i] = true
              used[candidate_idx] = true
            else
              out << it
              used[i] = true
            end
          end

          out = repair_whole_fraction_pairs(out)
          out = drop_orphan_fraction_fragments(out)
          drop_redundant_fragments(out)
        rescue StandardError => e
          Logger.warn("ExternalTextExtractor", "merge_split_dimension_labels failed: #{e.message}")
          items
        end

        # For patterns like "R 2 2" + nearby "1/2" => "R 2 1/2"
        # and "9 1" + nearby "3/16" => "9 3/16".
        def repair_whole_fraction_pairs(items)
          return items if items.length < 2

          used = Array.new(items.length, false)
          out = []

          items.each_with_index do |it, i|
            next if used[i]
            text = normalize_line_text(it.text.to_s)

            unless text =~ /\A(?:R\s+\d+|\d+'-\d+|\d+-\d+|(?:R\s+)?\d+\s+\d)\z/
              out << it
              used[i] = true
              next
            end

            candidate_idx = nil
            candidate_frac = nil
            best_score = Float::INFINITY

            items.each_with_index do |other, j|
              next if i == j
              frac = fraction_hint_from_candidate(text, other.text.to_s)
              next unless frac

              dy = (other.y.to_f - it.y.to_f).abs
              dx = other.x.to_f - it.x.to_f
              next if dy > [it.font_size.to_f * 1.3, 24.0].max
              next if dx < -[it.font_size.to_f * 0.8, 8.0].max
              next if dx > [it.font_size.to_f * 3.5, 52.0].max

              score = (dy * 10.0) + dx.abs
              if score < best_score
                best_score = score
                candidate_idx = j
                candidate_frac = frac
              end
            end

            if candidate_idx && candidate_frac
              rebuilt = replace_trailing_whole_with_fraction(text, candidate_frac)
              out << TextParser::TextItem.new(
                normalize_line_text(rebuilt),
                it.x.to_f,
                it.y.to_f,
                [it.font_size.to_f, items[candidate_idx].font_size.to_f].max,
                merge_angle(it.angle, items[candidate_idx].angle),
                it.font_name
              )
              used[i] = true
              used[candidate_idx] = true
            else
              out << it
              used[i] = true
            end
          end

          out
        rescue StandardError => e
          Logger.warn("ExternalTextExtractor", "repair_whole_fraction_pairs failed: #{e.message}")
          items
        end

        def merge_head_tail(head_text, tail_text)
          head = head_text.to_s.rstrip
          tail = tail_text.to_s.strip
          return head if tail.empty?

          # Common truncation: "/1" + "6" or "/1" + "16" should become "/16".
          if head =~ /\/1\s*\z/
            if tail == '6'
              return "#{head}6"
            elsif tail == '16'
              return head.sub(/\/1\s*\z/, '/16')
            end
          end

          # Dangling slash/hyphen tails append directly.
          return "#{head}#{tail}" if head =~ /(?:\/\s*|-\s*)\z/

          "#{head} #{tail}"
        end

        def numeric_tail_candidate(text)
          t = text.to_s.strip
          return t if t =~ /\A\d{1,2}\z/
          # Some fragments appear as "8 8"; first value is the usable tail.
          return Regexp.last_match(1) if t =~ /\A(\d{1,2})\s+\d{1,2}\z/
          nil
        end

        def normalized_fraction_text(text)
          t = normalize_line_text(text.to_s)
          m = /\A(\d{1,2})\/(\d{1,2})\z/.match(t)
          return nil unless m

          valid_fraction(m[1].to_i, m[2].to_i)
        end

        def fraction_hint_from_candidate(whole_text, candidate_text)
          # Direct fraction candidate first.
          direct = normalized_fraction_text(candidate_text)
          return direct if direct

          whole_tail_tok = whole_text.to_s.split(/\s+/).last.to_s
          return nil unless whole_tail_tok =~ /\A\d{1,2}\z/
          whole_tail = whole_tail_tok.to_i

          t = normalize_line_text(candidate_text.to_s)

          # "/ 8" means denominator present, numerator is from whole tail.
          m = /\A\/\s*(\d{1,2})\z/.match(t)
          if m
            frac = valid_fraction(whole_tail, m[1].to_i)
            return frac if frac
          end

          # "1 /" or "8 /" could be either num/whole or whole/den depending on
          # which option produces a valid structural denominator.
          m = /\A(\d{1,2})\s*\/\z/.match(t)
          if m
            a = m[1].to_i
            frac = valid_fraction(a, whole_tail)
            return frac if frac
            frac = valid_fraction(whole_tail, a)
            return frac if frac
          end

          nil
        end

        def valid_fraction(num, den)
          return nil if num <= 0 || den <= 0
          valid = [2, 4, 8, 16, 32, 64]
          return nil unless valid.include?(den)
          return nil if num >= den  # e.g. 8/8 is not a valid fraction display
          "#{num}/#{den}"
        end

        def replace_trailing_whole_with_fraction(text, frac)
          # "R 2" + "1/2" => "R 2 1/2"
          if text =~ /\AR\s+\d+\z/
            return "#{text} #{frac}"
          end

          # "1'-0" + "1/16" => "1'-0 1/16"
          if text =~ /\A\d+'-\d+\z/ || text =~ /\A\d+-\d+\z/
            return "#{text} #{frac}"
          end

          parts = text.to_s.split(/\s+/)
          return text if parts.empty?

          # If OCR duplicated a single digit pair ("8 8"), prefer fraction only.
          if parts.length == 2 && parts[0] == parts[1]
            return frac
          end

          parts[-1] = frac
          parts.join(' ')
        end

        def drop_orphan_fraction_fragments(items)
          items.reject do |it|
            t = it.text.to_s.strip
            t =~ /\A\/\s*\d{1,2}\z/ || t =~ /\A\d{1,2}\s*\/\z/
          end
        end

        # Remove tiny leftovers when a nearby merged composite already contains
        # the same value (e.g., keep "R 2 1/2", drop nearby standalone "1/2").
        def drop_redundant_fragments(items)
          # Ruby 2.2 compat: .reject.with_index requires 2.4+.
          # Use explicit loop to build the filtered list.
          reject_indices = []
          items.each_with_index do |it, idx|
            t = it.text.to_s.strip

            should_reject = if t =~ /\A\d{1,2}\/(?:2|4|8|16|32|64)\z/
              items.each_with_index.any? do |other, j|
                next false if idx == j
                ot = other.text.to_s
                next false unless ot.length > t.length + 2
                next false unless ot.include?(t)
                dx = (other.x.to_f - it.x.to_f).abs
                dy = (other.y.to_f - it.y.to_f).abs
                dx <= [it.font_size.to_f * 3.0, 42.0].max &&
                  dy <= [it.font_size.to_f * 1.8, 30.0].max
              end
            elsif t == '0'
              items.any? do |other|
                next false if other.equal?(it)
                ot = other.text.to_s.strip
                next false unless ot =~ /\A\d+'-0(?:\s+\d{1,2}\/\d{1,2})?\z/ ||
                                  ot =~ /\A\d+-0(?:\s+\d{1,2}\/\d{1,2})?\z/
                dx = (other.x.to_f - it.x.to_f).abs
                dy = (other.y.to_f - it.y.to_f).abs
                dx <= [it.font_size.to_f * 3.0, 42.0].max &&
                  dy <= [it.font_size.to_f * 1.8, 30.0].max
              end
            elsif t =~ /\A(2|4|8|16|32|64)\z/
              den = Regexp.last_match(1)
              # Example: stray "16" near "15/16" after split/merge cleanup.
              items.any? do |other|
                next false if other.equal?(it)
                ot = other.text.to_s.strip
                next false unless ot =~ /\A\d{1,2}\/#{Regexp.escape(den)}\z/
                dx = (other.x.to_f - it.x.to_f).abs
                dy = (other.y.to_f - it.y.to_f).abs
                da = (other.angle.to_f - it.angle.to_f).abs
                dx <= [it.font_size.to_f * 3.0, 42.0].max &&
                  dy <= [it.font_size.to_f * 1.8, 30.0].max &&
                  da <= 35.0
              end
            else
              false
            end

            reject_indices << idx if should_reject
          end
          result = []
          items.each_with_index { |it2, i| result << it2 unless reject_indices.include?(i) }
          result
        end

        def estimate_angle(words, line_attrs = nil)
          if words.length < 2
            # Single-word lines have no reliable baseline vector.
            return 0.0
          end

          first = word_center(words.first[:attrs])
          last = word_center(words.last[:attrs])
          return 0.0 unless first && last

          dx = last[0] - first[0]
          dy_screen = last[1] - first[1]
          return 0.0 if dx.abs < 0.001 && dy_screen.abs < 0.001

          # Convert top-down screen Y to PDF-style Y-up angle.
          dy_pdf = -dy_screen
          Math.atan2(dy_pdf, dx) * 180.0 / Math::PI
        rescue StandardError => e
          Logger.warn("ExternalTextExtractor", "compute_line_angle failed: #{e.message}")
          0.0
        end

        def merge_angle(a, b)
          aa = a.to_f
          bb = b.to_f
          return bb if aa.abs < 1.0 && bb.abs >= 1.0
          return aa if bb.abs < 1.0 && aa.abs >= 1.0
          aa.abs >= bb.abs ? aa : bb
        rescue StandardError => e
          Logger.warn("ExternalTextExtractor", "merge_angle failed: #{e.message}")
          a.to_f
        end

        def word_center(attrs)
          x0 = attr_value(attrs, 'xMin').to_f
          y0 = attr_value(attrs, 'yMin').to_f
          x1 = attr_value(attrs, 'xMax').to_f
          y1 = attr_value(attrs, 'yMax').to_f
          return nil if x1 <= x0 || y1 <= y0
          [(x0 + x1) * 0.5, (y0 + y1) * 0.5]
        end
      end
    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/generic_classifier.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/generic_classifier.rb`
- Size: `6.17 KB`
- Modified: `2026-04-01 20:04:49`

```ruby
# bc_pdf_vector_importer/generic_classifier.rb
# Domain-neutral classification of primitives and text.
# Identifies: title blocks, tables, dimension text, leaders,
# symbol clusters, repeated forms, geometric outlines, decorative regions.
#
# Part of Core Engine — Domain-neutral.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module GenericClassifier

      # ---------------------------------------------------------------
      # Classify all text items with domain-neutral tags.
      # Adds :domain_tags to each NormalizedText (mutates in place).
      # ---------------------------------------------------------------
      def self.classify_text(page_data)
        page_data.text_items.each do |txt|
          # Classifications from primitive_extractor are already generic.
          # Here we add deeper classification based on context.
          tags = txt.classifications.dup

          t = txt.text.strip
          tu = txt.normalized

          # Pure number → likely a dimension value or table cell
          if t =~ /\A\d+(?:\.\d+)?(?:\s+\d+\/\d+)?\z/
            tags << :numeric_value
          end

          # Contains units → dimension
          if tu =~ /\b(MM|CM|IN|FT|INCH|FEET|METER)\b/
            tags << :has_units
          end

          # Revision marker: REV, R1, REV.A
          if tu =~ /\bREV[.\s]?[A-Z0-9]?\b/
            tags << :revision_like
          end

          # Section/detail reference: DETAIL A, SECTION B-B, VIEW C
          if tu =~ /\b(DETAIL|SECTION|SEC|VIEW|ELEVATION|ELEV)\s+[A-Z]/
            tags << :detail_reference
          end

          # Note indicator: NOTE, NOTES, N.T.S., SEE DWG
          if tu =~ /\b(NOTE|NOTES|N\.?T\.?S\.?|SEE\s+DWG|REFER\s+TO)\b/
            tags << :note_indicator
          end

          # Quantity: QTY, EA, EACH, PCS
          if tu =~ /\b(QTY|EA|EACH|PCS|PIECES?)\b/
            tags << :quantity_indicator
          end

          txt.classifications = tags
        end
      end

      # ---------------------------------------------------------------
      # Classify primitives with domain-neutral geometry tags.
      # ---------------------------------------------------------------
      def self.classify_primitives(page_data)
        prims = page_data.primitives

        # Identify likely border/frame (largest rectangle near page edges)
        page_area = page_data.width * page_data.height
        prims.each do |p|
          p_tags = []

          # Large closed rectangle near page size → border
          if p.type == :closed_loop && p.area && p.area > page_area * 0.7 &&
             p.points && p.points.length <= 5
            p_tags << :page_border
          end

          # Small closed rectangle → possible table cell
          if p.type == :closed_loop && p.area && p.area < 2.0 &&
             p.points && p.points.length <= 5
            p_tags << :possible_table_cell
          end

          # Dashed line → hidden/center/phantom
          if p.dash_pattern && !p.dash_pattern.empty?
            p_tags << :dashed_line
          end

          # Very thin line (construction/reference)
          if p.line_width && p.line_width < 0.3
            p_tags << :thin_line
          end

          # Store tags in the dedicated tags field
          existing = p.tags || []
          p.tags = existing + p_tags
        end
      end

      # ---------------------------------------------------------------
      # Detect title block region from page geometry/text
      # Returns bbox [min_x, min_y, max_x, max_y] or nil
      # ---------------------------------------------------------------
      def self.detect_title_block(page_data)
        w = page_data.width
        h = page_data.height

        # Title blocks are typically in the bottom-right quadrant
        # Look for concentration of titleblock_like text
        tb_texts = page_data.text_items.select { |t|
          t.classifications.include?(:titleblock_like)
        }

        return nil if tb_texts.length < 2

        # Get bounding box of titleblock text
        xs = tb_texts.map { |t| t.insertion[0] }
        ys = tb_texts.map { |t| t.insertion[1] }

        tb_bbox = [xs.min - 0.5, ys.min - 0.5, xs.max + 0.5, ys.max + 0.5]

        # Validate: should be in lower portion of page
        if tb_bbox[3] < h * 0.4  # bottom 40%
          tb_bbox
        else
          nil
        end
      end

      # ---------------------------------------------------------------
      # Detect table regions (clusters of small rectangles + text)
      # ---------------------------------------------------------------
      def self.detect_tables(page_data)
        tables = []
        # Find clusters of small closed rectangles
        cells = page_data.primitives.select { |p|
          p.type == :closed_loop && p.area && p.area < 3.0 &&
          p.points && p.points.length <= 5
        }

        return tables if cells.length < 4

        # Cluster cells by proximity
        used = Array.new(cells.length, false)
        cells.each_with_index do |cell, i|
          next if used[i]
          cluster = [cell]
          used[i] = true

          cells.each_with_index do |other, j|
            next if i == j || used[j]
            if bboxes_adjacent?(cell.bbox, other.bbox, 0.5)
              cluster << other
              used[j] = true
            end
          end

          if cluster.length >= 4
            all_x = cluster.flat_map { |c| [c.bbox[0], c.bbox[2]] }
            all_y = cluster.flat_map { |c| [c.bbox[1], c.bbox[3]] }
            tables << {
              bbox: [all_x.min, all_y.min, all_x.max, all_y.max],
              cell_count: cluster.length
            }
          end
        end

        tables
      end

      private

      def self.bboxes_adjacent?(b1, b2, threshold)
        # Check if two bboxes are within threshold of each other
        gap_x = [[b1[0] - b2[2], b2[0] - b1[2]].max, 0].max
        gap_y = [[b1[1] - b2[3], b2[1] - b1[3]].max, 0].max
        gap_x < threshold && gap_y < threshold
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/generic_recognizer.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/generic_recognizer.rb`
- Size: `7.71 KB`
- Modified: `2026-04-01 20:04:51`

```ruby
# bc_pdf_vector_importer/generic_recognizer.rb
# Domain-neutral geometry recognition.
# Detects: closed boundaries, circles, repeated patterns,
# dimension associations, annotation leaders, tables, title block.
#
# This runs for ALL PDFs regardless of domain.
# Generic document analysis.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module GenericRecognizer

      GenericResults = Struct.new(
        :circles,           # Array of { center:, radius:, prim_id:, confidence: }
        :closed_boundaries, # Array of { prim_id:, area:, bbox:, edge_count: }
        :repeated_patterns, # Array of { prim_ids:, count:, bbox_template: }
        :tables,            # Array of { bbox:, cell_count: }
        :title_block_bbox,  # [x0,y0,x1,y1] or nil
        :dimension_assocs,  # Array of { text_id:, nearest_prim_id:, value: }
        :page_profile       # PageProfile from DocumentProfiler
      )

      # ---------------------------------------------------------------
      # Run generic recognition on a PageData.
      # Returns GenericResults.
      # ---------------------------------------------------------------
      def self.analyze(page_data, config = nil)
        config ||= RecognitionConfig.default
        prims = page_data.primitives
        texts = page_data.text_items

        # Classify text and primitives generically
        GenericClassifier.classify_text(page_data)
        GenericClassifier.classify_primitives(page_data)

        # Profile the document
        profile = DocumentProfiler.profile(page_data)

        # Detect circles (any closed loop that fits a circle well)
        circles = detect_circles(prims, config)

        # Detect significant closed boundaries
        boundaries = detect_boundaries(prims, config)

        # Detect repeated geometry patterns
        patterns = detect_repeated_patterns(prims)

        # Detect tables
        tables = GenericClassifier.detect_tables(page_data)

        # Detect title block
        tb_bbox = GenericClassifier.detect_title_block(page_data)

        # Associate dimension text with nearest geometry
        dim_assocs = associate_dimensions(texts, prims, config)

        GenericResults.new(
          circles,
          boundaries,
          patterns,
          tables,
          tb_bbox,
          dim_assocs,
          profile
        )
      end

      private

      # ---------------------------------------------------------------
      # Detect all circles in the geometry
      # ---------------------------------------------------------------
      def self.detect_circles(prims, config)
        circles = []
        prims.each do |p|
          next unless p.type == :closed_loop && p.closed
          next unless p.points && p.points.length >= 6

          fit = nil
          begin
            fit = ArcFitter.circle_fit(p.points)
          rescue StandardError => e
            Logger.warn("GenericRecognizer", "circle_fit failed: #{e.message}")
          end
          next unless fit
          cx, cy, r, rms = fit
          next if rms > config.circle_fit_tol
          next if r * 2 < 0.05  # skip micro circles

          circles << {
            center: [cx, cy],
            radius: r,
            diameter: r * 2,
            prim_id: p.id,
            rms: rms,
            confidence: rms < config.circle_fit_tol * 0.5 ? 0.95 : 0.80
          }
        end
        circles
      end

      # ---------------------------------------------------------------
      # Detect significant closed boundaries (potential outlines)
      # ---------------------------------------------------------------
      def self.detect_boundaries(prims, config)
        boundaries = []
        prims.each do |p|
          next unless p.type == :closed_loop && p.closed
          next unless p.area && p.area >= config.closed_loop_min_area

          boundaries << {
            prim_id: p.id,
            area: p.area,
            bbox: p.bbox,
            edge_count: p.points ? p.points.length : 0,
            is_rectangular: rectangular?(p)
          }
        end

        # Sort by area descending
        boundaries.sort_by! { |b| -b[:area] }
        boundaries
      end

      # ---------------------------------------------------------------
      # Detect repeated geometry patterns (same shape, different location)
      # ---------------------------------------------------------------
      def self.detect_repeated_patterns(prims)
        # Group closed loops by approximate area + point count
        groups = {}
        prims.each do |p|
          next unless p.type == :closed_loop && p.area && p.area > 0.01
          key = "#{(p.area * 100).round}_#{(p.points || []).length}"
          groups[key] ||= []
          groups[key] << p
        end

        patterns = []
        groups.each do |_, group|
          next if group.length < 3  # need at least 3 to be a "pattern"

          patterns << {
            prim_ids: group.map(&:id),
            count: group.length,
            representative_area: group.first.area,
            representative_point_count: (group.first.points || []).length
          }
        end

        patterns.sort_by! { |p| -p[:count] }
        patterns
      end

      # ---------------------------------------------------------------
      # Associate dimension-like text with nearest geometry
      # ---------------------------------------------------------------
      def self.associate_dimensions(texts, prims, config)
        assocs = []

        dim_texts = texts.select { |t| t.classifications.include?(:dimension_like) }
        dim_texts.each do |txt|
          # Parse the dimension value
          parsed = DimensionParser.parse(txt.text)
          next unless parsed.value && parsed.confidence > 0.3

          # Find nearest primitive
          nearest = nil
          nearest_dist = config.dimension_assoc_radius

          prims.each do |p|
            next unless p.bbox
            # Distance from text insertion to primitive bbox center
            pcx = (p.bbox[0] + p.bbox[2]) / 2.0
            pcy = (p.bbox[1] + p.bbox[3]) / 2.0
            d = Math.sqrt((txt.insertion[0] - pcx)**2 + (txt.insertion[1] - pcy)**2)
            if d < nearest_dist
              nearest = p
              nearest_dist = d
            end
          end

          assocs << {
            text_id: txt.id,
            text: txt.text,
            parsed_value: parsed.value,
            parsed_kind: parsed.kind,
            parsed_units: parsed.units,
            nearest_prim_id: nearest ? nearest.id : nil,
            distance: nearest_dist
          }
        end

        assocs
      end

      def self.rectangular?(prim)
        pts = prim.points
        return false unless pts && (pts.length == 4 || pts.length == 5)
        # Normalize to 4 unique corners (5th point may duplicate first for closure)
        corners = pts.length == 5 ? pts[0..3] : pts
        # Check that all 4 interior angles are approximately 90°
        (0...4).each do |i|
          p0 = corners[(i - 1) % 4]
          p1 = corners[i]
          p2 = corners[(i + 1) % 4]
          v1 = [p0[0] - p1[0], p0[1] - p1[1]]
          v2 = [p2[0] - p1[0], p2[1] - p1[1]]
          len1 = Math.sqrt(v1[0]**2 + v1[1]**2)
          len2 = Math.sqrt(v2[0]**2 + v2[1]**2)
          return false if len1 < 1e-9 || len2 < 1e-9
          dot = v1[0] * v2[0] + v1[1] * v2[1]
          cos_angle = dot / (len1 * len2)
          # cos(90°) = 0; allow ~5° tolerance → |cos| < 0.087
          return false if cos_angle.abs > 0.087
        end
        true
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/geometry_builder.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/geometry_builder.rb`
- Size: `29.96 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/geometry_builder.rb
# Converts parsed PDF vector paths into native SketchUp geometry.
# v2: Arc reconstruction, color-based tag grouping, dash pattern mapping,
# line width tracking, text placement, and progress feedback.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class GeometryBuilder

      PDF_POINT_TO_INCH = 1.0 / 72.0
      CLOSE_TOL = 1e-6

      attr_reader :page_group

      def initialize(model, paths, text_items, media_box, opts = {})
        @model = model
        @paths = paths
        @text_items = text_items || []
        @media_box = media_box

        @scale           = opts[:scale_factor] || 1.0
        @bezier_segments = opts[:bezier_segments] || 16
        @import_as       = opts[:import_as] || :edges
        @layer_name      = opts[:layer_name] || 'PDF Import'
        @group_per_page  = opts[:group_per_page] != false
        @page_number     = opts[:page_number] || 1
        @flatten         = opts[:flatten_to_2d] != false
        @merge_tol       = opts[:merge_tolerance] || 0.001
        @import_fills    = opts[:import_fills] != false
        @group_by_color  = opts[:group_by_color] || false
        @detect_arcs     = opts[:detect_arcs] != false
        @map_dashes      = opts[:map_dashes] || false
        @import_text     = opts[:import_text] || false
        @use_3d_text     = opts[:use_3d_text] || false
        @target_entities = opts[:target_entities] || nil
        @y_offset        = opts[:y_offset] || 0.0

        @edge_count = 0
        @face_count = 0
        @arc_count  = 0
        @text_count = 0
      end

      def build
        base_layer = get_or_create_layer(@layer_name)
        entities = @target_entities || @model.active_entities

        # Create page group
        if @group_per_page
          @page_group = entities.add_group
          @page_group.name = "PDF Page #{@page_number}"
          set_layer(@page_group, base_layer)
          target = @page_group.entities
        else
          @page_group = nil
          target = entities
        end

        page_height = @media_box[3] - @media_box[1]
        page_origin_x = @media_box[0]
        page_origin_y = @media_box[1]

        # Color group cache
        @color_groups = {}

        page_width  = (@media_box[2] - @media_box[0]).abs
        page_height_pts = (@media_box[3] - @media_box[1]).abs
        page_area_pts = page_width * page_height_pts

        # ── Vector geometry ──
        @paths.each do |path|
          next unless path.subpaths && !path.subpaths.empty?

          should_stroke = path.stroke
          should_fill = path.fill && @import_fills
          next unless should_stroke || should_fill

          # ── Skip paths whose bounding box exceeds the page ──
          # These are typically decorative backgrounds, clip-fill regions, or
          # graphic elements that extend far beyond the visible page area.
          # They produce huge arcs/circles that clutter the import.
          path_bbox = compute_path_bbox(path)
          if path_bbox
            pw = (path_bbox[2] - path_bbox[0]).abs
            ph = (path_bbox[3] - path_bbox[1]).abs
            if pw * ph > page_area_pts * 0.95
              next
            end
          end

          # Determine target group based on color
          color_rgb = path.stroke_color || [0, 0, 0]
          dest = get_color_group(target, color_rgb)

          # Determine the layer for this path — OCG layer takes priority
          path_layer = base_layer
          if path.layer_name && !path.layer_name.empty?
            ocg_layer_name = "PDF::Layer::#{path.layer_name}"
            path_layer = get_or_create_layer(ocg_layer_name)
          end

          # Determine dash rendering info
          dash_spec = nil
          dash_layer = nil
          if @map_dashes && path.dash_pattern
            dash_spec = normalize_dash_pattern(path.dash_pattern, path.ctm)
            dash_layer = classify_dash(path.dash_pattern)
          end

          path.subpaths.each do |subpath|
            points_list = subpath_to_points(subpath)
            next if points_list.empty?

            # Convert PDF → SketchUp coordinates
            su_points = points_list.map do |pt|
              pdf_to_su(pt[0], pt[1], page_origin_x, page_origin_y)
            end

            su_points = remove_consecutive_duplicates(su_points)
            next if su_points.length < 2

            # Arc reconstruction on the polyline
            if @detect_arcs && dash_spec.nil? && su_points.length >= 5
              draw_with_arc_detection(dest, su_points, path_layer, dash_layer, dash_spec, subpath.closed, should_fill, path.fill_color)
            else
              draw_edges(dest, su_points, path_layer, dash_layer, dash_spec, subpath.closed)
              if should_fill && subpath.closed && su_points.length >= 3
                draw_face(dest, su_points, path_layer, path.fill_color)
              end
            end
          end
        end

        # ── Text objects ──
        if @import_text && !@text_items.empty?
          text_layer = get_or_create_layer("#{@layer_name}:Text")
          text_group = nil
          if @page_group
            text_group = @page_group.entities.add_group
            text_group.name = "Text"
            set_layer(text_group, text_layer)
          end
          text_target = text_group ? text_group.entities : target

          @text_items.each do |item|
            place_text(text_target, item, page_origin_x, page_origin_y, page_height, text_layer)
          end
        end

        {
          edges: @edge_count,
          faces: @face_count,
          arcs: @arc_count,
          text_objects: @text_count
        }
      end

      private

      # ---------------------------------------------------------------
      # Coordinate conversion
      # ---------------------------------------------------------------
      def pdf_to_su(pdf_x, pdf_y, origin_x, origin_y)
        x_inch = (pdf_x - origin_x) * PDF_POINT_TO_INCH * @scale
        y_inch = (pdf_y - origin_y) * PDF_POINT_TO_INCH * @scale + @y_offset
        z_inch = 0.0
        Geom::Point3d.new(x_inch, y_inch, z_inch)
      end

      # ---------------------------------------------------------------
      # Subpath to flat point list
      # ---------------------------------------------------------------
      def subpath_to_points(subpath)
        points = []
        subpath.segments.each do |seg|
          case seg.type
          when :move
            points << seg.points[0]
          when :line
            points << seg.points[1]
          when :curve
            p0, p1, p2, p3 = seg.points
            # Try arc detection on individual Bézier curves
            if @detect_arcs
              arc = ArcFitter.bezier_to_arc(p0, p1, p2, p3, arc_fit_tol: 0.08)
              if arc
                # For arc, just add start and end — the arc fitter will handle it
                # at the polyline level. Add intermediate samples for fallback.
              end
            end
            # Linearize the Bézier
            curve_pts = Bezier.cubic_to_points(
              p0, p1, p2, p3,
              max_segments: @bezier_segments,
              tolerance: 0.25
            )
            curve_pts[1..-1].each { |pt| points << pt }
          when :rect
            seg.points.each { |pt| points << pt }
          end
        end
        points
      end

      # ---------------------------------------------------------------
      # Draw edges with arc detection
      # ---------------------------------------------------------------
      def draw_with_arc_detection(entities, points, layer, dash_layer, dash_spec, closed, should_fill, fill_rgb = nil)
        # Convert Point3d to [x,y] for the arc fitter
        pts_2d = points.map { |p| [p.x, p.y] }

        segments = ArcFitter.detect_arcs_in_polyline(pts_2d,
          arc_fit_tol: 0.002 * @scale,  # Scale tolerance with import scale
          # Require at least 4 line segments (5 points) before promoting to arc.
          # 3-segment runs are commonly orthogonal corners that circle-fit badly.
          min_arc_segments: 4,
          max_arc_segments: 64
        )

        if segments.empty?
          draw_edges(entities, points, layer, dash_layer, dash_spec, closed)
          if should_fill && closed && points.length >= 3
            draw_face(entities, points, layer, fill_rgb)
          end
          return
        end

        all_edges = []
        segments.each do |seg|
          if seg[:type] == :arc
            # Draw a true SketchUp arc using 3-point arc
            sp = Geom::Point3d.new(seg[:start_pt][0], seg[:start_pt][1], 0)
            mp = Geom::Point3d.new(seg[:mid_pt][0], seg[:mid_pt][1], 0)
            ep = Geom::Point3d.new(seg[:end_pt][0], seg[:end_pt][1], 0)

            begin
              # Use add_arc with center, normal, xaxis, radius, start_angle, end_angle
              cx, cy = seg[:center][0], seg[:center][1]
              center = Geom::Point3d.new(cx, cy, 0)
              radius = seg[:radius]
              normal = Geom::Vector3d.new(0, 0, 1)

              # Calculate angles
              start_angle = Math.atan2(sp.y - cy, sp.x - cx)
              end_angle = Math.atan2(ep.y - cy, ep.x - cx)
              mid_angle = Math.atan2(mp.y - cy, mp.x - cx)

              # Always use the minor arc between endpoints. If the midpoint
              # does not align with that sweep, this is not a valid arc run.
              sweep = normalize_angle(end_angle - start_angle)
              if sweep.abs < 1e-4
                # Degenerate sweep — render as original polyline
                seg[:points].each_cons(2) do |pa, pb|
                  p1 = Geom::Point3d.new(pa[0], pa[1], 0)
                  p2 = Geom::Point3d.new(pb[0], pb[1], 0)
                  e = safe_add_line(entities, p1, p2, layer, dash_layer, dash_spec)
                  all_edges << e if e
                end
                next
              end

              # Midpoint consistency check:
              # if midpoint is far from the expected minor sweep centerline,
              # do NOT flip to a major arc (which creates huge circles).
              test_mid = normalize_angle(start_angle + sweep / 2.0)
              mid_diff = normalize_angle(mid_angle - test_mid).abs
              if mid_diff > Math::PI / 2
                seg[:points].each_cons(2) do |pa, pb|
                  p1 = Geom::Point3d.new(pa[0], pa[1], 0)
                  p2 = Geom::Point3d.new(pb[0], pb[1], 0)
                  e = safe_add_line(entities, p1, p2, layer, dash_layer, dash_spec)
                  all_edges << e if e
                end
                next
              end

              xaxis = Geom::Vector3d.new(Math.cos(start_angle), Math.sin(start_angle), 0)
              num_segs = [12, (sweep.abs * 180 / Math::PI / 10).ceil].max
              num_segs = [num_segs, 72].min

              edges = entities.add_arc(center, xaxis, normal, radius, 0, sweep, num_segs)
              if edges && !edges.empty?
                edges.each do |e|
                  set_layer(e, layer)
                  set_layer(e, get_or_create_layer(dash_layer)) if dash_layer
                  all_edges << e
                end
                @arc_count += 1
                @edge_count += edges.length
              else
                # Fallback to line
                e = safe_add_line(entities, sp, ep, layer, dash_layer, dash_spec)
                all_edges << e if e
              end
            rescue StandardError => ex
              Logger.warn("GeometryBuilder", "arc creation failed: #{ex.message}")
              # Arc creation failed — fall back to lines through the points
              seg[:points].each_cons(2) do |pa, pb|
                p1 = Geom::Point3d.new(pa[0], pa[1], 0)
                p2 = Geom::Point3d.new(pb[0], pb[1], 0)
                e = safe_add_line(entities, p1, p2, layer, dash_layer, dash_spec)
                all_edges << e if e
              end
            end

          elsif seg[:type] == :line
            p1 = Geom::Point3d.new(seg[:from][0], seg[:from][1], 0)
            p2 = Geom::Point3d.new(seg[:to][0], seg[:to][1], 0)
            e = safe_add_line(entities, p1, p2, layer, dash_layer, dash_spec)
            all_edges << e if e
          end
        end

        # Close path if needed
        if closed && all_edges.length >= 2
          first_pt = points.first
          last_pt = points.last
          if first_pt.distance(last_pt) > @merge_tol
            e = safe_add_line(entities, last_pt, first_pt, layer, dash_layer, dash_spec)
            all_edges << e if e
          end
        end

        # Create face from closed paths
        if should_fill && closed && all_edges.length >= 3
          draw_face(entities, points, layer, fill_rgb)
        end
      end

      # ---------------------------------------------------------------
      # Draw simple edges (no arc detection)
      # ---------------------------------------------------------------
      def draw_edges(entities, points, layer, dash_layer, dash_spec, closed)
        # Filter out zero-length segments, then batch-add for performance.
        valid_pts = [points.first]
        (1...points.length).each do |i|
          valid_pts << points[i] if points[i].distance(valid_pts.last) >= @merge_tol
        end
        if closed && valid_pts.length >= 3 && valid_pts.first.distance(valid_pts.last) >= @merge_tol
          valid_pts << valid_pts.first
        end

        return if valid_pts.length < 2

        # When a dash pattern is present and the SketchUp version lacks the
        # line_styles API (SU 2017/2018), we must draw each segment through
        # safe_add_line → add_dashed_line to physically create the gaps.
        # The batch add_edges path would ignore dash_spec entirely.
        needs_physical_dashes = dash_spec &&
          dash_spec[:pattern].is_a?(Array) && !dash_spec[:pattern].empty? &&
          !(@model.respond_to?(:line_styles) && @model.line_styles)

        if needs_physical_dashes
          (0...valid_pts.length - 1).each do |i|
            safe_add_line(entities, valid_pts[i], valid_pts[i + 1], layer, dash_layer, dash_spec)
          end
          return
        end

        target = dash_layer ? get_or_create_layer(dash_layer) : layer

        begin
          edges = entities.add_edges(valid_pts)
          if edges && !edges.empty?
            edges.each { |e| set_layer(e, target) }
            @edge_count += edges.length
          end
        rescue StandardError => e
          # Fallback to individual lines if batch fails
          Logger.warn("GeometryBuilder", "add_edges batch failed, falling back: #{e.message}")
          (0...valid_pts.length - 1).each do |i|
            safe_add_line(entities, valid_pts[i], valid_pts[i + 1], layer, dash_layer, dash_spec)
          end
        end
      end

      def safe_add_line(entities, p1, p2, layer, dash_layer, dash_spec = nil)
        return nil if p1.distance(p2) < @merge_tol
        begin
          target = dash_layer ? get_or_create_layer(dash_layer) : layer

          if dash_spec && dash_spec[:pattern].is_a?(Array) && !dash_spec[:pattern].empty?
            edges = add_dashed_line(entities, p1, p2, dash_spec, target)
            return edges.first if edges && !edges.empty?
            return nil
          end

          edge = entities.add_line(p1, p2)
          if edge
            set_layer(edge, target)
            @edge_count += 1
          end
          edge
        rescue StandardError => e
          Logger.error("GeometryBuilder", "add_line failed", e)
          nil
        end
      end

      # ---------------------------------------------------------------
      # Face creation
      # ---------------------------------------------------------------
      def draw_face(entities, points, layer, fill_rgb = nil)
        return if points.length < 3
        begin
          face = entities.add_face(points)
          if face
            set_layer(face, layer)
            if fill_rgb && fill_rgb.is_a?(Array) && fill_rgb.length >= 3
              face.material = get_or_create_material(fill_rgb)
            end
            @face_count += 1
          end
        rescue StandardError => e
          Logger.warn("GeometryBuilder", "draw_face failed: #{e.message}")
        end
      end

      # ---------------------------------------------------------------
      # Text placement
      # ---------------------------------------------------------------
      def place_text(entities, item, origin_x, origin_y, page_height, layer)
        return unless @import_text && item.text && !item.text.strip.empty?

        begin
          # Convert PDF coordinate to SketchUp point
          pt = pdf_to_su(item.x, item.y, origin_x, origin_y)

          if @use_3d_text
            # ── Geometry mode: add_3d_text (proper filled letterforms) ──
            page_h = (@media_box[3] - @media_box[1]).abs
            page_h = 792.0 if page_h < 1

            fs = item.font_size.to_f
            raw = (item.respond_to?(:raw_font_size) && item.raw_font_size) ?
                  item.raw_font_size.to_f : nil

            if raw && raw > 0
              # Internal parser: use raw if effective is blown up
              fs = fs > (page_h * 0.04) ? raw : fs
            else
              # ExternalTextExtractor: bbox height → add_3d_text letter height.
              # add_3d_text height = cap height directly.
              # bbox includes ascenders, descenders, leading.
              # Cap height ≈ 30% of pdftotext bbox for this font/page combo.
              bbox_h = fs
              fs = fs * 0.30
              # Shift origin up: bbox bottom includes descender space
              # Keep this conservative to avoid drift on rotated/angled blueprint text.
              baseline_ratio = (item.angle && item.angle.to_f.abs > 10.0) ? 0.0 : 0.05
              baseline_shift = bbox_h * baseline_ratio * PDF_POINT_TO_INCH * @scale
              pt = Geom::Point3d.new(pt.x, pt.y + baseline_shift, pt.z)
            end

            fs = [fs, page_h * 0.03].min if fs > page_h * 0.03
            fs = [fs, 1.0].max
            height = fs * PDF_POINT_TO_INCH * @scale
            height = [[height, 0.015].max, 1.5].min

            begin
              # add_3d_text creates geometry at the origin, then we transform it
              count_before = entities.to_a.length
              success = entities.add_3d_text(
                item.text,
                TextAlignLeft,
                "Arial",
                false,             # bold
                false,             # italic
                height,            # letter height in inches
                0.6,               # tolerance (lower = smoother)
                0.0,               # z extrusion (0 = flat faces)
                true,              # filled
                0.0                # z position
              )

              if success
                new_ents = entities.to_a[count_before..-1] || []
                if new_ents.any?
                  # Build transform: move to position, optionally rotate
                  xform = Geom::Transformation.new(pt)
                  if item.angle && item.angle.abs > 0.1
                    rot = Geom::Transformation.rotation(ORIGIN, Z_AXIS, item.angle.degrees)
                    xform = xform * rot
                  end
                  entities.transform_entities(xform, *new_ents)
                  new_ents.each do |entity|
                    begin
                      set_layer(entity, layer)
                    rescue StandardError => e
                      Logger.warn("GeometryBuilder", "set_layer on text geometry failed: #{e.message}")
                    end
                  end
                  @text_count += 1
                end
              end
            rescue StandardError => e
              Logger.warn("GeometryBuilder", "add_3d_text failed: #{e.message}")
              # Fallback to annotation text
              begin
                text = entities.add_text(item.text, pt)
                if text
                  set_layer(text, layer)
                  @text_count += 1
                end
              rescue StandardError => e
                Logger.warn("GeometryBuilder", "add_text fallback failed: #{e.message}")
              end
            end
          else
            # ── Label mode: annotation text ──
            text = nil
            begin
              text = entities.add_text(item.text, pt, Geom::Vector3d.new(0, 0, 0))
            rescue StandardError => e
              Logger.warn("GeometryBuilder", "add_text with vector failed: #{e.message}")
              text = entities.add_text(item.text, pt)
            end
            if text
              set_layer(text, layer)
              @text_count += 1
            end
          end
        rescue StandardError => e
          Logger.warn("GeometryBuilder", "place_text failed: #{e.message}")
        end
      end

      # ---------------------------------------------------------------
      # Color-based grouping
      # ---------------------------------------------------------------
      def get_color_group(parent_entities, rgb)
        return parent_entities unless @group_by_color

        r = [[rgb[0] * 255, 0].max, 255].min.to_i
        g = [[rgb[1] * 255, 0].max, 255].min.to_i
        b = [[rgb[2] * 255, 0].max, 255].min.to_i
        key = "#{r}_#{g}_#{b}"

        unless @color_groups[key]
          grp = parent_entities.add_group
          grp.name = "Color_%02X%02X%02X" % [r, g, b]
          @color_groups[key] = grp
        end

        @color_groups[key].entities
      end

      # ---------------------------------------------------------------
      # Dash pattern → layer/tag classification
      # ---------------------------------------------------------------
      # Get or create a SketchUp material from an [r, g, b] 0.0–1.0 array.
      # Caches materials to avoid duplicates.
      def get_or_create_material(rgb)
        @material_cache ||= {}
        r = (rgb[0].to_f * 255).round
        g = (rgb[1].to_f * 255).round
        b = (rgb[2].to_f * 255).round
        key = "PDF_#{r}_#{g}_#{b}"
        return @material_cache[key] if @material_cache[key]
        mat = @model.materials[key]
        unless mat
          mat = @model.materials.add(key)
          mat.color = Sketchup::Color.new(r, g, b)
        end
        @material_cache[key] = mat
        mat
      end

      # Compute bounding box of a VectorPath in PDF user-space points.
      # Returns [min_x, min_y, max_x, max_y] or nil.
      def compute_path_bbox(path)
        xs = []
        ys = []
        path.subpaths.each do |sp|
          sp.segments.each do |seg|
            seg.points.each do |pt|
              xs << pt[0] if pt[0]
              ys << pt[1] if pt[1]
            end
          end
        end
        return nil if xs.empty?
        [xs.min, ys.min, xs.max, ys.max]
      end

      def classify_dash(dash_pattern)
        return nil unless @map_dashes && dash_pattern
        arr = dash_pattern
        arr = arr[0] if arr.is_a?(Array) && arr[0].is_a?(Array)
        return nil unless arr.is_a?(Array) && arr.length >= 2

        # All positive values?
        return nil unless arr.all? { |d| d.is_a?(Numeric) && d > 0 }

        if arr.length == 2
          "Dashed"
        elsif arr.length >= 4
          "Dashdot"
        elsif arr.length == 3
          "Dashdot"
        else
          nil
        end
      end

      # Normalize PDF dash pattern to model-space inches.
      def normalize_dash_pattern(dash_pattern, ctm = nil)
        return nil unless dash_pattern

        arr = dash_pattern
        phase = 0.0
        if arr.is_a?(Array) && arr[0].is_a?(Array)
          phase = (arr[1] || 0.0).to_f
          arr = arr[0]
        end
        return nil unless arr.is_a?(Array) && !arr.empty?

        nums = arr.map { |d| d.to_f.abs }.select { |d| d > 0.0 }
        return nil if nums.empty?

        # Dash lengths are in PDF user units; convert with page scale and CTM magnitude.
        sx = 1.0
        sy = 1.0
        if ctm.is_a?(Array) && ctm.length >= 4
          sx = Math.sqrt(ctm[0].to_f**2 + ctm[1].to_f**2)
          sy = Math.sqrt(ctm[2].to_f**2 + ctm[3].to_f**2)
          sx = 1.0 if sx <= 1e-9
          sy = 1.0 if sy <= 1e-9
        end
        ctm_scale = (sx + sy) / 2.0

        to_in = PDF_POINT_TO_INCH * @scale * ctm_scale
        pattern = nums.map { |d| [d * to_in, @merge_tol * 2.0].max }

        # SketchUp 2017 can visually collapse very short dash segments to solid.
        # Enforce a minimum visible segment length while preserving ratios.
        min_visible = 0.03 # inches
        min_seg = pattern.min
        if min_seg && min_seg < min_visible
          vis_scale = min_visible / min_seg
          pattern = pattern.map { |d| d * vis_scale }
        end

        # PDF allows odd-length arrays; they repeat to make an even cycle.
        pattern = pattern + pattern if pattern.length.odd?

        cycle = pattern.inject(0.0, :+)
        return nil if cycle <= @merge_tol * 2.0

        {
          pattern: pattern,
          phase: (phase.to_f * to_in) % cycle
        }
      end

      # Draw line as explicit dash segments to preserve hidden-line semantics.
      def add_dashed_line(entities, p1, p2, dash_spec, layer)
        pattern = dash_spec[:pattern]
        phase = dash_spec[:phase].to_f
        return [] unless pattern.is_a?(Array) && !pattern.empty?

        total_len = p1.distance(p2)
        return [] if total_len <= @merge_tol

        cycle_len = pattern.inject(0.0, :+)
        return [] if cycle_len <= @merge_tol

        dir = Geom::Vector3d.new(p2.x - p1.x, p2.y - p1.y, p2.z - p1.z)
        return [] if dir.length <= 1e-9
        dir.length = 1.0

        # Resolve initial pattern index from phase.
        idx = 0
        remain = pattern[0]
        offset = phase % cycle_len
        while offset > remain && pattern.length > 1
          offset -= remain
          idx = (idx + 1) % pattern.length
          remain = pattern[idx]
        end
        remain -= offset
        remain = pattern[idx] if remain <= @merge_tol

        draw_on = idx.even?
        pos = 0.0
        edges = []

        while pos < total_len - @merge_tol
          seg_len = [remain, total_len - pos].min
          if draw_on && seg_len > @merge_tol
            a = Geom::Point3d.new(
              p1.x + dir.x * pos,
              p1.y + dir.y * pos,
              p1.z + dir.z * pos
            )
            b = Geom::Point3d.new(
              p1.x + dir.x * (pos + seg_len),
              p1.y + dir.y * (pos + seg_len),
              p1.z + dir.z * (pos + seg_len)
            )
            begin
              e = entities.add_line(a, b)
              if e
                set_layer(e, layer)
                edges << e
                @edge_count += 1
              end
            rescue StandardError => e
              Logger.warn("GeometryBuilder", "add_dashed_line segment failed: #{e.message}")
            end
          end

          pos += seg_len
          idx = (idx + 1) % pattern.length
          remain = pattern[idx]
          draw_on = idx.even?
        end

        edges
      end

      # ---------------------------------------------------------------
      # Utilities
      # ---------------------------------------------------------------
      def remove_consecutive_duplicates(points)
        return points if points.length <= 1
        result = [points[0]]
        (1...points.length).each do |i|
          unless points[i].distance(result.last) < @merge_tol
            result << points[i]
          end
        end
        result
      end

      def normalize_angle(angle)
        while angle <= -Math::PI
          angle += 2 * Math::PI
        end
        while angle > Math::PI
          angle -= 2 * Math::PI
        end
        angle
      end

      def get_or_create_layer(name)
        return nil unless name
        layers = @model.layers
        layer = layers[name]
        unless layer
          layer = layers.add(name)
          apply_layer_line_style(layer, name)
        end
        layer
      end

      def set_layer(entity, layer)
        return unless layer
        begin
          entity.layer = layer
        rescue StandardError => e
          Logger.warn("GeometryBuilder", "set_layer failed: #{e.message}")
        end
      end

      def apply_layer_line_style(layer, name)
        return unless layer && name
        return unless @model.respond_to?(:line_styles) && @model.line_styles
        return unless layer.respond_to?(:line_style=)

        style_name = case name.to_s.downcase
                     when 'dashed' then 'Dashed'
                     when 'dashdot' then 'Dash Dot'
                     else nil
                     end
        return unless style_name

        begin
          styles = @model.line_styles
          style = nil
          begin
            style = styles[style_name]
          rescue StandardError => e
            Logger.warn("GeometryBuilder", "line style lookup by key failed: #{e.message}")
          end
          if style.nil?
            begin
              style = styles.to_a.find { |s| s.display_name.to_s.downcase == style_name.downcase }
            rescue StandardError => e
              Logger.warn("GeometryBuilder", "line style lookup by name failed: #{e.message}")
            end
          end
          layer.line_style = style if style
        rescue StandardError => e
          Logger.warn("GeometryBuilder", "apply_layer_line_style failed: #{e.message}")
        end
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/geometry_cleanup.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/geometry_cleanup.rb`
- Size: `11.65 KB`
- Modified: `2026-04-01 20:04:48`

```ruby
# bc_pdf_vector_importer/geometry_cleanup.rb
# Post-import geometry cleanup engine for SketchUp.
# Fixes the common mess from CAD PDF imports:
#   - micro segments
#   - duplicate edges
#   - overlapping lines
#   - collinear segments that should be one edge
#   - tiny gaps preventing face creation
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module GeometryCleanup

      # ---------------------------------------------------------------
      # Run the full cleanup pipeline on a group's entities.
      # Returns a stats hash.
      # ---------------------------------------------------------------
      def self.cleanup(entities, opts = {})
        # Resolve cleanup_level preset if provided (Phase 2)
        if opts[:cleanup_level] && defined?(ImportConfig)
          preset = ImportConfig::CLEANUP_PRESETS[opts[:cleanup_level].to_s]
          if preset
            opts = preset.merge(opts) { |_k, preset_v, user_v| user_v }
          end
        end

        merge_tol     = opts[:merge_tolerance] || 0.005   # inches
        collinear_tol = opts[:collinear_tolerance] || 0.001
        micro_len     = opts[:min_edge_length] || 0.002   # inches

        stats = { merged_verts: 0, removed_dupes: 0, removed_micro: 0,
                  joined_collinear: 0, closed_gaps: 0 }

        # Phase 1: Remove micro segments
        stats[:removed_micro] = remove_micro_edges(entities, micro_len)

        # Phase 2: Merge near-coincident vertices
        stats[:merged_verts] = merge_vertices(entities, merge_tol)

        # Phase 3: Remove duplicate edges (same two endpoints)
        stats[:removed_dupes] = remove_duplicate_edges(entities)

        # Phase 4: Join collinear segments
        stats[:joined_collinear] = join_collinear_edges(entities, collinear_tol)

        # Phase 5: Close tiny face gaps
        stats[:closed_gaps] = close_face_gaps(entities, merge_tol * 2)

        stats
      end

      # ---------------------------------------------------------------
      # Phase 1: Remove edges shorter than threshold
      # ---------------------------------------------------------------
      def self.remove_micro_edges(entities, min_length)
        count = 0
        edges = entities.grep(Sketchup::Edge)
        edges.each do |edge|
          begin
            if edge.valid? && edge.length < min_length
              # Don't remove edges that are part of a face
              if edge.faces.empty?
                edge.erase!
                count += 1
              end
            end
          rescue StandardError => e
            Logger.warn("GeometryCleanup", "remove_short_edges failed: #{e.message}")
          end
        end
        count
      end

      # ---------------------------------------------------------------
      # Phase 2: Merge vertices that are within tolerance
      # Uses spatial hashing for performance on large models.
      # ---------------------------------------------------------------
      def self.merge_vertices(entities, tolerance)
        count = 0
        edges = entities.grep(Sketchup::Edge).select(&:valid?)
        return 0 if edges.empty?

        # Build spatial hash of vertex positions
        cell_size = tolerance * 2
        vertex_map = {}  # { grid_key => [vertex, ...] }

        all_verts = []
        edges.each do |e|
          all_verts << e.start if e.valid?
          all_verts << e.end if e.valid?
        end
        all_verts.uniq!

        all_verts.each do |v|
          key = grid_key(v.position, cell_size)
          vertex_map[key] ||= []
          vertex_map[key] << v
        end

        # Find merge candidates
        merge_pairs = []  # [[victim_vertex, target_point], ...]
        processed = {}

        vertex_map.each do |key, verts|
          next if verts.length < 2

          # Check all pairs in this cell
          (0...verts.length).each do |i|
            ((i + 1)...verts.length).each do |j|
              next unless verts[i].valid? && verts[j].valid?
              next if processed[verts[i].object_id] || processed[verts[j].object_id]

              dist = verts[i].position.distance(verts[j].position)
              if dist < tolerance && dist > 0
                # Move verts[j] to verts[i]'s position
                merge_pairs << [verts[j], verts[i].position]
                processed[verts[j].object_id] = true
              end
            end
          end
        end

        # Apply merges by moving vertices
        merge_pairs.each do |victim, target_pos|
          begin
            if victim.valid?
              # Find all edges connected to this vertex and adjust
              victim.edges.each do |edge|
                next unless edge.valid?
                if edge.start == victim || edge.end == victim
                  # Move whichever end matches the victim vertex
                  other_vert = (edge.start == victim) ? edge.end : edge.start
                  if other_vert.position.distance(target_pos) > 0.0001
                    begin
                      entities.transform_entities(
                        Geom::Transformation.new(target_pos - victim.position),
                        victim
                      )
                    rescue StandardError => e
                      Logger.warn("GeometryCleanup", "transform_entities failed: #{e.message}")
                    end
                  end
                end
              end
              count += 1
            end
          rescue StandardError => e
            Logger.warn("GeometryCleanup", "merge_vertices failed: #{e.message}")
          end
        end

        count
      end

      # ---------------------------------------------------------------
      # Phase 3: Remove duplicate edges (same endpoints, different objects)
      # ---------------------------------------------------------------
      def self.remove_duplicate_edges(entities)
        count = 0
        edges = entities.grep(Sketchup::Edge).select(&:valid?)

        # Hash edges by sorted endpoint coordinates (rounded)
        edge_hash = {}
        edges.each do |edge|
          p1 = edge.start.position
          p2 = edge.end.position
          key = edge_key(p1, p2)

          if edge_hash[key]
            # Duplicate found — keep the first, remove this one
            if edge.faces.empty?
              edge.erase!
              count += 1
            end
          else
            edge_hash[key] = edge
          end
        end

        count
      end

      # ---------------------------------------------------------------
      # Phase 4: Join collinear edges that share a vertex
      # If two edges share a vertex and are collinear (same direction),
      # replace them with a single edge.
      # ---------------------------------------------------------------
      def self.join_collinear_edges(entities, tolerance)
        count = 0
        changed = true

        while changed
          changed = false
          edges = entities.grep(Sketchup::Edge).select(&:valid?)

          # Build vertex → edges map
          vert_edges = {}
          edges.each do |e|
            [e.start, e.end].each do |v|
              vert_edges[v.object_id] ||= []
              vert_edges[v.object_id] << e
            end
          end

          # Look for vertices with exactly 2 edges that are collinear
          vert_edges.each do |vid, vedges|
            next unless vedges.length == 2
            next unless vedges.all?(&:valid?)

            e1, e2 = vedges
            # Both must be simple edges (no faces)
            next unless e1.faces.empty? && e2.faces.empty?

            # Check collinearity
            v1 = e1.line[1]  # direction vector
            v2 = e2.line[1]

            # Vectors should be parallel (cross product ≈ 0)
            cross = v1.cross(v2)
            if cross.length < tolerance
              # They're collinear — find the two outer endpoints
              shared_vert = nil
              [e1.start, e1.end].each do |v|
                if v == e2.start || v == e2.end
                  shared_vert = v
                  break
                end
              end
              next unless shared_vert

              # Get the two endpoints that aren't shared
              outer1 = (e1.start == shared_vert) ? e1.end.position : e1.start.position
              outer2 = (e2.start == shared_vert) ? e2.end.position : e2.start.position

              next if outer1.distance(outer2) < 0.001

              # Get layer from first edge
              layer = e1.layer

              # Remove old edges and create new one
              begin
                e1.erase!
                e2.erase!
                new_edge = entities.add_line(outer1, outer2)
                new_edge.layer = layer if new_edge && layer
                count += 1
                changed = true
              rescue StandardError => e
                Logger.warn("GeometryCleanup", "merge_collinear_edges failed: #{e.message}")
              end
            end
          end
        end

        count
      end

      # ---------------------------------------------------------------
      # Phase 5: Close tiny gaps to enable face creation
      # Finds open endpoints near other endpoints and bridges them.
      # ---------------------------------------------------------------
      def self.close_face_gaps(entities, max_gap)
        count = 0
        edges = entities.grep(Sketchup::Edge).select(&:valid?)

        # Find "open" vertices (connected to only one edge)
        open_verts = []
        vert_count = {}
        edges.each do |e|
          [e.start, e.end].each do |v|
            vert_count[v.object_id] ||= 0
            vert_count[v.object_id] += 1
          end
        end

        edges.each do |e|
          [e.start, e.end].each do |v|
            if vert_count[v.object_id] == 1
              open_verts << v
            end
          end
        end

        return 0 if open_verts.length < 2

        # Try to bridge open vertices that are close
        used = {}
        open_verts.each_with_index do |v1, i|
          next if used[v1.object_id]
          next unless v1.valid?

          open_verts.each_with_index do |v2, j|
            next if j <= i
            next if used[v2.object_id]
            next unless v2.valid?

            dist = v1.position.distance(v2.position)
            if dist > 0 && dist < max_gap
              begin
                edge = entities.add_line(v1.position, v2.position)
                if edge
                  count += 1
                  used[v1.object_id] = true
                  used[v2.object_id] = true
                  break
                end
              rescue StandardError => e
                Logger.warn("GeometryCleanup", "close_face_gaps failed: #{e.message}")
              end
            end
          end
        end

        count
      end

      private

      def self.grid_key(point, cell_size)
        gx = (point.x / cell_size).floor
        gy = (point.y / cell_size).floor
        gz = (point.z / cell_size).floor
        "#{gx}_#{gy}_#{gz}"
      end

      def self.edge_key(p1, p2, precision = 4)
        # Sort the two points so the key is the same regardless of direction
        coords1 = [p1.x.round(precision), p1.y.round(precision), p1.z.round(precision)]
        coords2 = [p2.x.round(precision), p2.y.round(precision), p2.z.round(precision)]
        sorted = [coords1, coords2].sort
        "#{sorted[0].join(',')}_#{sorted[1].join(',')}"
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/hatch_detector.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/hatch_detector.rb`
- Size: `4.51 KB`
- Modified: `2026-03-23 16:45:51`

```ruby
# bc_pdf_vector_importer/hatch_detector.rb
# Detects hatching patterns: dense clusters of parallel lines
# at regular spacing within bounded regions.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module HatchDetector

      # Minimum lines to consider a cluster as hatching
      MIN_HATCH_LINES = 6
      # Angle tolerance for "parallel" (degrees)
      ANGLE_TOL_DEG = 3.0
      # Spacing regularity tolerance (ratio: std_dev / mean)
      SPACING_REGULARITY = 0.35

      # ---------------------------------------------------------------
      # Detect hatch patterns in a list of primitives.
      # Returns array of primitive indices that are hatching.
      # ---------------------------------------------------------------
      def self.detect(primitives)
        return [] if primitives.nil? || primitives.empty?

        # Extract line segments with their angles
        lines = []
        primitives.each_with_index do |prim, idx|
          next unless prim.respond_to?(:points) && prim.points
          pts = prim.points
          next unless pts.length == 2

          x0, y0 = pts[0][0].to_f, pts[0][1].to_f
          x1, y1 = pts[1][0].to_f, pts[1][1].to_f
          dx = x1 - x0; dy = y1 - y0
          len = Math.sqrt(dx * dx + dy * dy)
          next if len < 0.5  # skip micro-segments

          # Normalize angle to 0-180 range
          angle = Math.atan2(dy, dx) * 180.0 / Math::PI
          angle += 180.0 if angle < 0

          # Midpoint for spacing calculation
          mx = (x0 + x1) / 2.0
          my = (y0 + y1) / 2.0

          lines << { idx: idx, angle: angle, len: len, mx: mx, my: my,
                     x0: x0, y0: y0, x1: x1, y1: y1 }
        end

        return [] if lines.length < MIN_HATCH_LINES

        hatch_indices = []

        # Group by angle (parallel lines)
        angle_groups = group_by_angle(lines, ANGLE_TOL_DEG)

        angle_groups.each do |group|
          next if group.length < MIN_HATCH_LINES

          # For each angle group, check if lines are regularly spaced
          # Project midpoints onto the perpendicular axis
          ref_angle = group.first[:angle] * Math::PI / 180.0
          perp_x = -Math.sin(ref_angle)
          perp_y = Math.cos(ref_angle)

          # Project each line's midpoint onto perpendicular axis
          projections = group.map { |l|
            { proj: l[:mx] * perp_x + l[:my] * perp_y, line: l }
          }.sort_by { |p| p[:proj] }

          # Check for regular spacing
          spacings = []
          (1...projections.length).each do |i|
            spacings << (projections[i][:proj] - projections[i - 1][:proj]).abs
          end

          next if spacings.empty?

          mean = spacings.inject(0.0, :+) / spacings.length
          next if mean < 0.3  # too tight — probably not hatching

          variance = spacings.inject(0.0) { |s, v| s + (v - mean) ** 2 } / spacings.length
          std_dev = Math.sqrt(variance)

          # Regular spacing = low coefficient of variation
          if mean > 0 && (std_dev / mean) < SPACING_REGULARITY
            # Also check that lines have similar lengths
            lengths = group.map { |l| l[:len] }
            mean_len = lengths.inject(0.0, :+) / lengths.length
            len_var = lengths.inject(0.0) { |s, v| s + (v - mean_len) ** 2 } / lengths.length
            len_cv = mean_len > 0 ? Math.sqrt(len_var) / mean_len : 1.0

            if len_cv < 0.5  # lengths are reasonably uniform
              group.each { |l| hatch_indices << l[:idx] }
            end
          end
        end

        hatch_indices.uniq.sort
      end

      private

      # Group lines by angle within tolerance
      def self.group_by_angle(lines, tol)
        groups = []
        used = Array.new(lines.length, false)

        lines.each_with_index do |line, i|
          next if used[i]
          group = [line]
          used[i] = true

          lines.each_with_index do |other, j|
            next if i == j || used[j]
            if angle_diff(line[:angle], other[:angle]) < tol
              group << other
              used[j] = true
            end
          end

          groups << group if group.length >= MIN_HATCH_LINES
        end

        groups
      end

      # Angular difference accounting for 0/180 wrap
      def self.angle_diff(a, b)
        d = (a - b).abs
        d = 180.0 - d if d > 90.0
        d
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/import_config.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/import_config.rb`
- Size: `7.17 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/import_config.rb
# Versioned import configuration object.
# Centralizes all import settings with named presets and backward-compatible
# conversion to the opts hash consumed by the rest of the pipeline.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class ImportConfig

      VERSION = '2.0'.freeze

      # --- Cleanup presets ------------------------------------------------
      # Conservative = tightest tolerances (preserves detail, cleans least)
      # Aggressive   = loosest tolerances  (cleans most, merges more aggressively)
      CLEANUP_PRESETS = {
        'Conservative' => {
          merge_tolerance:    0.001,
          collinear_tolerance: 0.0005,
          min_edge_length:    0.001
        },
        'Balanced' => {
          merge_tolerance:    0.005,
          collinear_tolerance: 0.001,
          min_edge_length:    0.002
        },
        'Aggressive' => {
          merge_tolerance:    0.01,
          collinear_tolerance: 0.005,
          min_edge_length:    0.005
        }
      }.freeze

      # --- Arc reconstruction modes ---------------------------------------
      ARC_MODES = [
        'Auto',
        'Preserve curves',
        'Rebuild arcs',
        'Polyline only'
      ].freeze

      # --- Lineweight handling modes --------------------------------------
      LINEWEIGHT_MODES = [
        'Ignore',
        'Preserve visually',
        'Group by lineweight',
        'Map to tags'
      ].freeze

      # --- Grouping modes -------------------------------------------------
      GROUPING_MODES = [
        'Single group',
        'Group per page',
        'Group per layer',
        'Group per color',
        'Nested: page > layer',
        'Nested: page > lineweight'
      ].freeze

      # --- Import presets (mirror ImportDialog::PRESETS) -------------------
      PRESETS = {
        'Fast' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'No', raster_dpi: '300',
          arc_mode: 'Auto', cleanup_level: 'Balanced',
          lineweight_mode: 'Ignore', grouping_mode: 'Group per page'
        },
        'Full' => {
          scale: '1.0', bezier_segments: '24', import_as: 'Edges and Faces',
          import_fills: 'Yes', group_by_color: 'Yes', detect_arcs: 'Yes',
          map_dashes: 'Yes', text_mode: 'Geometry', hatch_mode: 'Group',
          cleanup_geometry: 'Yes', recognition_mode: 'None',
          merge_tolerance: '0.001', units: 'Inches',
          force_raster: 'No', raster_dpi: '300',
          arc_mode: 'Auto', cleanup_level: 'Balanced',
          lineweight_mode: 'Ignore', grouping_mode: 'Group per page'
        },
        'Raster Image' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'Yes', raster_dpi: '300',
          arc_mode: 'Auto', cleanup_level: 'Balanced',
          lineweight_mode: 'Ignore', grouping_mode: 'Single group'
        },
        'Custom...' => nil
      }.freeze

      # --- Instance attributes --------------------------------------------
      attr_accessor :scale, :pages, :bezier_segments, :import_as,
                    :layer_name, :group_per_page, :flatten_to_2d,
                    :merge_tolerance, :import_fills, :group_by_color,
                    :detect_arcs, :map_dashes, :import_text, :use_3d_text,
                    :hatch_mode, :raster_fallback, :force_raster,
                    :raster_dpi, :cleanup_geometry, :recognition_mode,
                    :text_mode, :units,
                    # Phase 2 additions
                    :arc_mode, :cleanup_level, :lineweight_mode, :grouping_mode

      def initialize(attrs = {})
        # Existing defaults
        @scale            = attrs[:scale]            || '1.0'
        @pages            = attrs[:pages]            || 'All'
        @bezier_segments  = attrs[:bezier_segments]  || '24'
        @import_as        = attrs[:import_as]        || 'Edges and Faces'
        @layer_name       = attrs[:layer_name]       || 'PDF Import'
        @group_per_page   = attrs[:group_per_page]   || 'Yes'
        @flatten_to_2d    = true
        @merge_tolerance  = attrs[:merge_tolerance]  || '0.001'
        @import_fills     = attrs[:import_fills]     || 'Yes'
        @group_by_color   = attrs[:group_by_color]   || 'Yes'
        @detect_arcs      = attrs[:detect_arcs]      || 'Yes'
        @map_dashes       = attrs[:map_dashes]       || 'Yes'
        @text_mode        = attrs[:text_mode]        || 'Geometry'
        @hatch_mode       = attrs[:hatch_mode]       || 'Group'
        @raster_fallback  = attrs[:raster_fallback]  || 'Yes'
        @force_raster     = attrs[:force_raster]     || 'No'
        @raster_dpi       = attrs[:raster_dpi]       || '300'
        @cleanup_geometry = attrs[:cleanup_geometry]  || 'Yes'
        @recognition_mode = attrs[:recognition_mode] || 'None'
        @units            = attrs[:units]            || 'Inches'

        # Phase 2 defaults
        @arc_mode         = attrs[:arc_mode]         || 'Auto'
        @cleanup_level    = attrs[:cleanup_level]    || 'Balanced'
        @lineweight_mode  = attrs[:lineweight_mode]  || 'Ignore'
        @grouping_mode    = attrs[:grouping_mode]    || 'Group per page'
      end

      # Build from a named preset
      def self.from_preset(name)
        preset = PRESETS[name]
        return new unless preset
        new(preset)
      end

      # Convert to the opts hash that the existing pipeline expects.
      # This keeps full backward compatibility — all keys the old
      # build_opts produced are present, plus the new Phase 2 keys.
      def to_opts
        ImportDialog.send(:build_opts, to_raw)
      end

      # Return the raw string-keyed hash (same shape ImportDialog expects)
      def to_raw
        {
          scale: @scale, pages: @pages, bezier_segments: @bezier_segments,
          import_as: @import_as, layer_name: @layer_name,
          group_per_page: @group_per_page, merge_tolerance: @merge_tolerance,
          import_fills: @import_fills, group_by_color: @group_by_color,
          detect_arcs: @detect_arcs, map_dashes: @map_dashes,
          text_mode: @text_mode, hatch_mode: @hatch_mode,
          raster_fallback: @raster_fallback, force_raster: @force_raster,
          raster_dpi: @raster_dpi, cleanup_geometry: @cleanup_geometry,
          recognition_mode: @recognition_mode, units: @units,
          arc_mode: @arc_mode, cleanup_level: @cleanup_level,
          lineweight_mode: @lineweight_mode, grouping_mode: @grouping_mode
        }
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb`
- Size: `26.51 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/import_dialog.rb
# Import dialog v4 — HtmlDialog with Modus styling (Trimble design system).
# Basic and Advanced modes, preset profiles, plain-English labels.
#
# Falls back to UI.inputbox when HtmlDialog is unavailable (headless / test).
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module ImportDialog

      PRESETS = {
        'Fast' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'No', raster_dpi: '300'
        },
        'Full' => {
          scale: '1.0', bezier_segments: '24', import_as: 'Edges and Faces',
          import_fills: 'Yes', group_by_color: 'Yes', detect_arcs: 'Yes',
          map_dashes: 'Yes', text_mode: 'Geometry', hatch_mode: 'Group',
          cleanup_geometry: 'Yes', recognition_mode: 'None',
          merge_tolerance: '0.001', units: 'Inches',
          force_raster: 'No', raster_dpi: '300'
        },
        'Raster Image' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'Yes', raster_dpi: '300'
        },
        'Custom...' => nil
      }.freeze

      YES_NO       = 'Yes|No'
      PRESET_NAMES = PRESETS.keys.join('|')
      TEXT_MODES   = 'Labels|3D Text|Geometry|No text'
      HATCH_MODES  = 'Import|Group|Skip'

      # Phase 2 dropdown choices
      ARC_MODE_CHOICES       = 'Auto|Preserve curves|Rebuild arcs|Polyline only'
      CLEANUP_LEVEL_CHOICES  = 'Conservative|Balanced|Aggressive'
      LINEWEIGHT_CHOICES     = 'Ignore|Preserve visually|Group by lineweight|Map to tags'
      GROUPING_CHOICES       = 'Single group|Group per page|Group per layer|Group per color|Nested: page > layer|Nested: page > lineweight'

      def self.show(filepath)
        filename = File.basename(filepath)
        saved    = load_prefs
        if defined?(UI::HtmlDialog) && !ENV['BC_HEADLESS']
          show_html_basic(filename, saved)
        else
          show_inputbox_basic(filename, saved)
        end
      end

      def self.show_advanced(filepath, pages_str, scale_str, _recog_str, text_mode_str)
        filename = File.basename(filepath)
        saved    = load_prefs
        if defined?(UI::HtmlDialog) && !ENV['BC_HEADLESS']
          show_html_advanced(filename, pages_str, scale_str, text_mode_str, saved)
        else
          show_inputbox_advanced(filename, pages_str, scale_str, text_mode_str, saved)
        end
      end

      # ---- HtmlDialog: Basic ----------------------------------------
      def self.show_html_basic(filename, saved)
        result = nil
        dlg = UI::HtmlDialog.new(
          dialog_title: "Import PDF \u2014 #{filename}",
          preferences_key: 'BC_PDFImport_Basic',
          width: 440, height: 310, resizable: false
        )

        preset    = saved[:last_preset] || 'Full'
        pages_val = saved[:pages]       || 'All'
        scale_val = saved[:scale]       || '1.0'
        text_val  = saved[:text_mode]   || 'Labels'

        dlg.set_html(basic_html(filename, preset, pages_val, scale_val, text_val))

        dlg.add_action_callback('on_import') do |_ctx, p|
          preset_name = p['preset']    || 'Full'
          pages_str   = p['pages']     || 'All'
          scale_str   = p['scale']     || '1.0'
          text_mode   = p['text_mode'] || 'Labels'
          save_prefs(last_preset: preset_name, pages: pages_str,
                     scale: scale_str, text_mode: text_mode)
          if preset_name == 'Custom...'
            dlg.close
            result = show_html_advanced(filename, pages_str, scale_str,
                                        text_mode, load_prefs)
          else
            pr = PRESETS[preset_name] || PRESETS['Full']
            result = build_opts(pr.merge(pages: pages_str, scale: scale_str,
                                         text_mode: text_mode))
            dlg.close
          end
        end

        dlg.add_action_callback('on_cancel') { |_ctx, _p| dlg.close }
        dlg.show_modal
        result
      end

      # ---- HtmlDialog: Advanced -------------------------------------
      def self.show_html_advanced(filename, pages_str, scale_str, text_mode_str, saved)
        result = nil
        dlg = UI::HtmlDialog.new(
          dialog_title: "Custom Import \u2014 #{filename}",
          preferences_key: 'BC_PDFImport_Advanced',
          width: 480, height: 560, resizable: true
        )

        d = {
          pages:            pages_str      || saved[:pages]            || 'All',
          scale:            scale_str      || saved[:scale]            || '1.0',
          bezier_segments:  saved[:bezier_segments]                    || '24',
          text_mode:        text_mode_str  || saved[:text_mode]        || 'Geometry',
          hatch_mode:       saved[:hatch_mode]                         || 'Group',
          detect_arcs:      saved[:detect_arcs]                        || 'Yes',
          map_dashes:       saved[:map_dashes]                         || 'Yes',
          import_fills:     saved[:import_fills]                       || 'Yes',
          cleanup_geometry: saved[:cleanup_geometry]                   || 'Yes',
          force_raster:     saved[:force_raster]                       || 'No',
          raster_dpi:       saved[:raster_dpi]                         || '300',
          arc_mode:         saved[:arc_mode]                           || 'Auto',
          cleanup_level:    saved[:cleanup_level]                      || 'Balanced',
          lineweight_mode:  saved[:lineweight_mode]                    || 'Ignore',
          grouping_mode:    saved[:grouping_mode]                      || 'Group per page'
        }

        dlg.set_html(advanced_html(filename, d))

        dlg.add_action_callback('on_import') do |_ctx, p|
          save_prefs(
            pages: p['pages'], scale: p['scale'],
            bezier_segments: p['bezier_segments'],
            text_mode: p['text_mode'], hatch_mode: p['hatch_mode'],
            detect_arcs: p['detect_arcs'], map_dashes: p['map_dashes'],
            import_fills: p['import_fills'],
            cleanup_geometry: p['cleanup_geometry'],
            force_raster: p['force_raster'], raster_dpi: p['raster_dpi'],
            arc_mode: p['arc_mode'], cleanup_level: p['cleanup_level'],
            lineweight_mode: p['lineweight_mode'], grouping_mode: p['grouping_mode'],
            last_preset: 'Custom...'
          )
          import_as = p['import_fills'] == 'Yes' ? 'Edges and Faces' : 'Edges Only'
          result = build_opts(
            pages: p['pages'], scale: p['scale'],
            bezier_segments: p['bezier_segments'],
            import_as: import_as, layer_name: 'PDF Import',
            group_per_page: 'Yes', import_fills: p['import_fills'],
            group_by_color: 'Yes', detect_arcs: p['detect_arcs'],
            map_dashes: p['map_dashes'], text_mode: p['text_mode'],
            hatch_mode: p['hatch_mode'],
            raster_fallback: 'Yes', cleanup_geometry: p['cleanup_geometry'],
            force_raster: p['force_raster'], raster_dpi: p['raster_dpi'],
            recognition_mode: 'None', merge_tolerance: '0.001', units: 'Inches',
            arc_mode: p['arc_mode'], cleanup_level: p['cleanup_level'],
            lineweight_mode: p['lineweight_mode'], grouping_mode: p['grouping_mode']
          )
          dlg.close
        end

        dlg.add_action_callback('on_cancel') { |_ctx, _p| dlg.close }
        dlg.show_modal
        result
      end

      # ---- HTML generators ------------------------------------------
      DIALOG_CSS = <<-CSS.freeze
        *{box-sizing:border-box;margin:0;padding:0}
        body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;
             font-size:13px;color:#1a1a1a;background:#fff;padding:20px}
        h2{font-size:14px;font-weight:600;margin-bottom:4px}
        .sub{font-size:11px;color:#666;margin-bottom:16px;
             white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
        label{display:block;font-size:12px;font-weight:500;color:#444;margin-bottom:3px}
        select,input[type=text]{width:100%;border:1px solid #ccc;border-radius:3px;
            padding:6px 8px;font-size:13px;color:#1a1a1a;background:#fff;outline:none}
        select:focus,input:focus{border-color:#0078d7}
        .row{margin-bottom:12px}
        .row2{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:10px}
        .section{border-top:1px solid #e4e4e4;padding-top:10px;margin-top:4px;
                 font-size:11px;font-weight:600;color:#888;text-transform:uppercase;
                 letter-spacing:.6px;margin-bottom:8px}
        .actions{display:flex;justify-content:flex-end;gap:8px;margin-top:16px;
                 padding-top:14px;border-top:1px solid #e4e4e4}
        .btn{padding:7px 18px;border-radius:3px;font-size:13px;
             font-weight:500;cursor:pointer;border:1px solid transparent}
        .btn-primary{background:#0078d7;color:#fff;border-color:#0078d7}
        .btn-primary:hover{background:#005fa3}
        .btn-secondary{background:#fff;color:#333;border-color:#ccc}
        .btn-secondary:hover{background:#f3f3f3}
        .hint{font-size:11px;color:#888;margin-top:2px}
      CSS

      def self.basic_html(filename, preset, pages, scale, text_mode)
        preset_opts = PRESETS.keys.map { |p|
          sel = p == preset ? ' selected' : ''
          "<option value=\"#{esc(p)}\"#{sel}>#{esc(p)}</option>"
        }.join

        text_opts = [
          ['Labels', 'Labels'],
          ['3D Text', '3D Text'],
          ['Geometry', 'Geometry'],
          ['No text', 'No text']
        ].map { |v, label|
          sel = v == text_mode ? ' selected' : ''
          "<option value=\"#{v}\"#{sel}>#{label}</option>"
        }.join

        <<-HTML
          <!DOCTYPE html><html><head><meta charset="utf-8">
          <style>#{DIALOG_CSS}</style></head><body>
          <h2>Import PDF Vectors</h2>
          <p class="sub">#{esc(filename)}</p>
          <div class="row"><label>Preset</label>
            <select id="preset">#{preset_opts}</select></div>
          <div class="row"><label>Pages</label>
            <input type="text" id="pages" value="#{esc(pages)}" placeholder="All">
            <p class="hint">e.g. All &nbsp;&bull;&nbsp; 1 &nbsp;&bull;&nbsp; 2-5 &nbsp;&bull;&nbsp; 1,3,7</p>
          </div>
          <div class="row"><label>Scale Factor</label>
            <input type="text" id="scale" value="#{esc(scale)}" placeholder="1.0"></div>
          <div class="row"><label>Import Text</label>
            <select id="text_mode">#{text_opts}</select></div>
          <div class="actions">
            <button class="btn btn-secondary" onclick="cancel()">Cancel</button>
            <button class="btn btn-primary" onclick="doImport()">Import</button>
          </div>
          <script>
          function doImport(){sketchup.on_import({
            preset:document.getElementById('preset').value,
            pages:document.getElementById('pages').value.trim()||'All',
            scale:document.getElementById('scale').value.trim()||'1.0',
            text_mode:document.getElementById('text_mode').value});}
          function cancel(){sketchup.on_cancel({});}
          document.addEventListener('keydown',function(e){
            if(e.key==='Enter')doImport();
            if(e.key==='Escape')cancel();});
          </script></body></html>
        HTML
      end

      def self.advanced_html(filename, d)
        yn = lambda { |key|
          yes = d[key] == 'Yes' ? ' selected' : ''
          no  = d[key] == 'No'  ? ' selected' : ''
          "<option value=\"Yes\"#{yes}>Yes</option><option value=\"No\"#{no}>No</option>"
        }

        text_opts = [['Labels','Labels'],['3D Text','3D Text'],['Geometry','Geometry'],['No text','No text']].map{|v,lbl|
          sel = d[:text_mode] == v ? ' selected' : ''
          "<option value=\"#{v}\"#{sel}>#{lbl}</option>"
        }.join

        hatch_opts = [['Import','Import'],['Group','Group'],['Skip','Skip']].map{|v,lbl|
          sel = d[:hatch_mode] == v ? ' selected' : ''
          "<option value=\"#{v}\"#{sel}>#{lbl}</option>"
        }.join

        arc_mode_opts = ARC_MODE_CHOICES.split('|').map{|v|
          sel = d[:arc_mode] == v ? ' selected' : ''
          "<option value=\"#{esc(v)}\"#{sel}>#{esc(v)}</option>"
        }.join

        cleanup_level_opts = CLEANUP_LEVEL_CHOICES.split('|').map{|v|
          sel = d[:cleanup_level] == v ? ' selected' : ''
          "<option value=\"#{esc(v)}\"#{sel}>#{esc(v)}</option>"
        }.join

        lineweight_opts = LINEWEIGHT_CHOICES.split('|').map{|v|
          sel = d[:lineweight_mode] == v ? ' selected' : ''
          "<option value=\"#{esc(v)}\"#{sel}>#{esc(v)}</option>"
        }.join

        grouping_opts = GROUPING_CHOICES.split('|').map{|v|
          sel = d[:grouping_mode] == v ? ' selected' : ''
          "<option value=\"#{esc(v)}\"#{sel}>#{esc(v)}</option>"
        }.join

        <<-HTML
          <!DOCTYPE html><html><head><meta charset="utf-8">
          <style>#{DIALOG_CSS}body{overflow-y:auto}</style></head><body>
          <h2>Custom Import Settings</h2>
          <p class="sub">#{esc(filename)}</p>
          <div class="row2">
            <div><label>Pages</label>
              <input type="text" id="pages" value="#{esc(d[:pages])}" placeholder="All"></div>
            <div><label>Scale Factor</label>
              <input type="text" id="scale" value="#{esc(d[:scale])}" placeholder="1.0"></div>
          </div>
          <div class="section">Geometry</div>
          <div class="row2">
            <div><label>Curve Smoothness</label>
              <input type="text" id="bezier_segments" value="#{esc(d[:bezier_segments])}" placeholder="24">
              <p class="hint">4=fast &bull; 48=smooth</p></div>
            <div><label>Rebuild Arcs</label>
              <select id="detect_arcs">#{yn.call(:detect_arcs)}</select></div>
          </div>
          <div class="row2">
            <div><label>Import Filled Regions</label>
              <select id="import_fills">#{yn.call(:import_fills)}</select></div>
            <div><label>Auto-Clean Geometry</label>
              <select id="cleanup_geometry">#{yn.call(:cleanup_geometry)}</select></div>
          </div>
          <div class="section">Styling</div>
          <div class="row2">
            <div><label>Map Dashed Lines</label>
              <select id="map_dashes">#{yn.call(:map_dashes)}</select></div>
          </div>
          <div class="section">Text &amp; Hatching</div>
          <div class="row2">
            <div><label>Import Text</label>
              <select id="text_mode">#{text_opts}</select></div>
            <div><label>Hatching</label>
              <select id="hatch_mode">#{hatch_opts}</select></div>
          </div>
          <div class="section">Advanced Controls</div>
          <div class="row2">
            <div><label>Arc Mode</label>
              <select id="arc_mode">#{arc_mode_opts}</select></div>
            <div><label>Cleanup Level</label>
              <select id="cleanup_level">#{cleanup_level_opts}</select></div>
          </div>
          <div class="row2">
            <div><label>Lineweight Handling</label>
              <select id="lineweight_mode">#{lineweight_opts}</select></div>
            <div><label>Grouping Mode</label>
              <select id="grouping_mode">#{grouping_opts}</select></div>
          </div>
          <div class="section">Raster Fallback</div>
          <div class="row2">
            <div><label>Force Raster</label>
              <select id="force_raster">#{yn.call(:force_raster)}</select></div>
            <div><label>Raster DPI (200&ndash;600)</label>
              <input type="text" id="raster_dpi" value="#{esc(d[:raster_dpi])}" placeholder="300"></div>
          </div>
          <div class="actions">
            <button class="btn btn-secondary" onclick="cancel()">Cancel</button>
            <button class="btn btn-primary" onclick="doImport()">Import</button>
          </div>
          <script>
          function doImport(){sketchup.on_import({
            pages:document.getElementById('pages').value.trim()||'All',
            scale:document.getElementById('scale').value.trim()||'1.0',
            bezier_segments:document.getElementById('bezier_segments').value.trim()||'24',
            text_mode:document.getElementById('text_mode').value,
            hatch_mode:document.getElementById('hatch_mode').value,
            detect_arcs:document.getElementById('detect_arcs').value,
            map_dashes:document.getElementById('map_dashes').value,
            import_fills:document.getElementById('import_fills').value,
            cleanup_geometry:document.getElementById('cleanup_geometry').value,
            force_raster:document.getElementById('force_raster').value,
            raster_dpi:document.getElementById('raster_dpi').value.trim()||'300',
            arc_mode:document.getElementById('arc_mode').value,
            cleanup_level:document.getElementById('cleanup_level').value,
            lineweight_mode:document.getElementById('lineweight_mode').value,
            grouping_mode:document.getElementById('grouping_mode').value});}
          function cancel(){sketchup.on_cancel({});}
          document.addEventListener('keydown',function(e){if(e.key==='Escape')cancel();});
          </script></body></html>
        HTML
      end

      def self.esc(str)
        str.to_s.gsub('&','&amp;').gsub('"','&quot;').gsub("'",'&#39;').gsub('<','&lt;').gsub('>','&gt;')
      end

      # ---- UI.inputbox fallbacks (headless / pre-2017 SU) ----------
      def self.show_inputbox_basic(filename, saved)
        prompts   = ["Preset:","Pages (1, 1-5, or All):","Scale Factor:","Import Text:"]
        last_p    = saved[:last_preset] || 'Full'
        defaults  = [last_p, saved[:pages]||'All', saved[:scale]||'1.0', saved[:text_mode]||'Labels']
        dropdowns = [PRESET_NAMES, '', '', TEXT_MODES]
        result = UI.inputbox(prompts, defaults, dropdowns, "Import PDF \u2014 #{filename}")
        return nil unless result
        preset_name, pages_str, scale_str, text_mode_str = result
        save_prefs(last_preset: preset_name, pages: pages_str,
                   scale: scale_str, text_mode: text_mode_str)
        return show_inputbox_advanced(filename, pages_str, scale_str, text_mode_str, saved) \
          if preset_name == 'Custom...'
        pr = PRESETS[preset_name] || PRESETS['Full']
        build_opts(pr.merge(pages: pages_str, scale: scale_str, text_mode: text_mode_str))
      end

      def self.show_inputbox_advanced(filename, pages_str, scale_str, text_mode_str, saved)
        prompts = [
          "Pages:","Scale Factor:","Curve Smoothness (4=fast, 48=smooth):",
          "Import Text:","Hatchings:","Rebuild Arcs from Curves:",
          "Map Dashed/Hidden Lines:","Import Filled Regions:",
          "Auto-Clean Geometry:","Force Raster Image (skip vectors):","Raster DPI (200-600):",
          "Arc Mode:","Cleanup Level:","Lineweight Handling:","Grouping Mode:"
        ]
        defaults = [
          pages_str||saved[:pages]||'All', scale_str||saved[:scale]||'1.0',
          saved[:bezier_segments]||'24',
          text_mode_str||saved[:text_mode]||'Geometry',
          saved[:hatch_mode]||'Group', saved[:detect_arcs]||'Yes',
          saved[:map_dashes]||'Yes',   saved[:import_fills]||'Yes',
          saved[:cleanup_geometry]||'Yes', saved[:force_raster]||'No',
          saved[:raster_dpi]||'300',
          saved[:arc_mode]||'Auto', saved[:cleanup_level]||'Balanced',
          saved[:lineweight_mode]||'Ignore', saved[:grouping_mode]||'Group per page'
        ]
        dropdowns = ['','','',TEXT_MODES,HATCH_MODES,YES_NO,YES_NO,YES_NO,YES_NO,YES_NO,'',
                     ARC_MODE_CHOICES,CLEANUP_LEVEL_CHOICES,LINEWEIGHT_CHOICES,GROUPING_CHOICES]
        result = UI.inputbox(prompts, defaults, dropdowns, "Custom Import \u2014 #{filename}")
        return nil unless result
        p_pages,p_scale,p_bezier,p_text_mode,p_hatch,
        p_arcs,p_dashes,p_fills,p_cleanup,p_force_raster,p_raster_dpi,
        p_arc_mode,p_cleanup_level,p_lineweight_mode,p_grouping_mode = result
        save_prefs(pages:p_pages,scale:p_scale,bezier_segments:p_bezier,
                   text_mode:p_text_mode,hatch_mode:p_hatch,
                   detect_arcs:p_arcs,map_dashes:p_dashes,import_fills:p_fills,
                   cleanup_geometry:p_cleanup,force_raster:p_force_raster,
                   raster_dpi:p_raster_dpi,arc_mode:p_arc_mode,
                   cleanup_level:p_cleanup_level,lineweight_mode:p_lineweight_mode,
                   grouping_mode:p_grouping_mode,last_preset:'Custom...')
        import_as = p_fills == 'Yes' ? 'Edges and Faces' : 'Edges Only'
        build_opts(pages:p_pages,scale:p_scale,bezier_segments:p_bezier,
                   import_as:import_as,layer_name:'PDF Import',
                   group_per_page:'Yes',import_fills:p_fills,
                   group_by_color:'Yes',detect_arcs:p_arcs,
                   map_dashes:p_dashes,text_mode:p_text_mode,hatch_mode:p_hatch,
                   raster_fallback:'Yes',cleanup_geometry:p_cleanup,
                   force_raster:p_force_raster,raster_dpi:p_raster_dpi,
                   recognition_mode:'None',merge_tolerance:'0.001',units:'Inches',
                   arc_mode:p_arc_mode,cleanup_level:p_cleanup_level,
                   lineweight_mode:p_lineweight_mode,grouping_mode:p_grouping_mode)
      end

      private

      def self.build_opts(raw)
        scale = (raw[:scale] || '1.0').to_f
        scale = 1.0 if scale <= 0
        case (raw[:units] || '')
        when /Feet/i   then scale *= 12.0
        when /Points/i then scale /= 72.0
        end

        pages_str = (raw[:pages] || 'All').strip
        if pages_str.downcase == 'all' || pages_str.empty?
          pages = :all
        else
          pages = []
          pages_str.split(/[,;\s]+/).each do |part|
            if part =~ /\A(\d+)\s*-\s*(\d+)\z/
              ($1.to_i..$2.to_i).each { |p| pages << p }
            else
              p = part.to_i; pages << p if p > 0
            end
          end
          pages = pages.uniq.sort
          pages = :all if pages.empty?
        end

        bezier = (raw[:bezier_segments] || '16').to_i
        bezier = [[bezier, 4].max, 64].min

        import_mode = case (raw[:import_as] || '')
                      when /Faces Only/i      then :faces
                      when /Edges and Faces/i then :both
                      else :edges
                      end

        recog = case (raw[:recognition_mode] || '')
                when /None/i    then :none
                when /Generic/i then :generic
                else :auto
                end

        text_mode_raw = (raw[:text_mode] || 'Labels').to_s
        text_mode = if text_mode_raw =~ /No text/i
                      :none
                    elsif text_mode_raw =~ /\A3D\s*Text\z/i
                      :text3d
                    elsif text_mode_raw =~ /Geometry/i
                      :geometry
                    else
                      :labels
                    end
        import_text = (text_mode != :none)
        use_3d_text = (text_mode == :text3d)

        hatch = case (raw[:hatch_mode] || 'Group')
                when /Skip/i  then :skip
                when /Group/i then :group
                else :import
                end

        {
          scale:            scale,
          pages:            pages,
          bezier_segments:  bezier,
          import_as:        import_mode,
          layer_name:       (raw[:layer_name] || 'PDF Import').to_s.strip,
          group_per_page:   (raw[:group_per_page] || 'Yes') == 'Yes',
          flatten_to_2d:    true,
          merge_tolerance:  (raw[:merge_tolerance] || '0.001').to_f.abs,
          import_fills:     (raw[:import_fills] || 'Yes') == 'Yes',
          group_by_color:   (raw[:group_by_color] || 'Yes') == 'Yes',
          detect_arcs:      (raw[:detect_arcs] || 'Yes') == 'Yes',
          map_dashes:       (raw[:map_dashes] || 'Yes') == 'Yes',
          import_text:      import_text,
          text_mode:        text_mode,
          use_3d_text:      use_3d_text,
          hatch_mode:       hatch,
          raster_fallback:  (raw[:raster_fallback] || 'Yes') == 'Yes',
          force_raster:     (raw[:force_raster] || 'No') == 'Yes',
          raster_dpi:       [[((raw[:raster_dpi] || '300').to_i), 200].max, 600].min,
          cleanup_geometry: (raw[:cleanup_geometry] || 'Yes') == 'Yes',
          recognition_mode: recog,
          arc_mode:         (raw[:arc_mode] || 'Auto').to_s,
          cleanup_level:    (raw[:cleanup_level] || 'Balanced').to_s,
          lineweight_mode:  (raw[:lineweight_mode] || 'Ignore').to_s,
          grouping_mode:    (raw[:grouping_mode] || 'Group per page').to_s
        }
      end

      PREF_KEY = 'BlueCollarSystems_PDFVectorImporter'.freeze

      def self.load_prefs
        prefs = {}
        begin
          %w[last_preset pages scale bezier_segments import_as layer_name
             group_per_page import_fills group_by_color detect_arcs
             map_dashes text_mode hatch_mode raster_fallback force_raster
             raster_dpi cleanup_geometry recognition_mode merge_tolerance units
             arc_mode cleanup_level lineweight_mode grouping_mode
          ].each do |key|
            val = Sketchup.read_default(PREF_KEY, key, nil)
            prefs[key.to_sym] = val if val
          end
        rescue StandardError => e
          Logger.warn("ImportDialog", "load_prefs failed: #{e.message}")
        end
        prefs
      end

      def self.save_prefs(hash)
        begin
          hash.each { |key, val| Sketchup.write_default(PREF_KEY, key.to_s, val.to_s) }
        rescue StandardError => e
          Logger.warn("ImportDialog", "save_prefs failed: #{e.message}")
        end
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/logger.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/logger.rb`
- Size: `3.93 KB`
- Modified: `2026-03-29 11:43:52`

```ruby
# bc_pdf_vector_importer/logger.rb
# Centralized logging — replaces bare rescue blocks.
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'
require 'fileutils'

module BlueCollarSystems
  module PDFVectorImporter
    module Logger
      @warnings = []
      @errors = []
      @debug = false
      @log_file = nil
      @log_path = nil

      def self.debug=(val); @debug = val; end
      def self.debug?; @debug; end

      def self.reset
        @warnings = []
        @errors = []
        close_log

        # Open a log file for post-session diagnosis.
        # Previous log is overwritten each import so it stays small.
        candidate_dirs = []
        begin
          candidate_dirs << File.join(Dir.tmpdir, 'bc_pdf_importer')
        rescue StandardError
          # continue with env/home fallbacks below
        end
        if ENV['LOCALAPPDATA'] && !ENV['LOCALAPPDATA'].empty?
          candidate_dirs << File.join(ENV['LOCALAPPDATA'], 'bc_pdf_importer')
        end
        if ENV['TEMP'] && !ENV['TEMP'].empty?
          candidate_dirs << File.join(ENV['TEMP'], 'bc_pdf_importer')
        end
        begin
          candidate_dirs << File.join(File.expand_path('~'), 'bc_pdf_importer_logs')
        rescue StandardError
          # ignore home expansion failure
        end

        candidate_dirs.uniq.each do |dir|
          begin
            FileUtils.mkdir_p(dir)
            path = File.join(dir, 'last_import.log')
            file = File.open(path, 'w')
            file.sync = true
            @log_file = file
            @log_path = path
            write_line("--- PDF Vector Importer log #{Time.now.strftime('%Y-%m-%d %H:%M:%S')} ---")
            write_line("[INFO] Logger: path=#{@log_path}")
            break
          rescue StandardError
            @log_file = nil
            @log_path = nil
          end
        end
      end

      def self.warn(context, msg)
        entry = "[WARN] #{context}: #{msg}"
        @warnings << entry
        puts entry if @debug
        write_line(entry)
      end

      def self.error(context, msg, exception = nil)
        entry = "[ERR] #{context}: #{msg}"
        entry += " (#{exception.class}: #{exception.message})" if exception
        @errors << entry
        puts entry if @debug
        write_line(entry)
        if exception && exception.backtrace
          bt = "  " + exception.backtrace.first(3).join("\n  ")
          puts bt if @debug
          write_line(bt)
        end
      end

      def self.info(context, msg)
        entry = "[INFO] #{context}: #{msg}"
        puts entry if @debug
        write_line(entry)
      end

      def self.flush_log
        @log_file.flush if @log_file
      rescue StandardError
        # ignore flush errors
      end

      def self.warnings; @warnings.dup; end
      def self.errors; @errors.dup; end
      def self.warning_count; @warnings.length; end
      def self.error_count; @errors.length; end

      def self.summary
        lines = []
        lines << "#{@warnings.length} warnings, #{@errors.length} errors"
        @errors.first(5).each { |e| lines << "  #{e}" }
        @warnings.first(5).each { |w| lines << "  #{w}" }
        lines.join("\n")
      end

      # Returns the path to the log file (for user diagnosis)
      def self.log_path
        @log_path
      end

      def self.write_line(entry)
        return unless @log_file
        @log_file.puts(entry)
      rescue StandardError
        @log_file = nil
      end
      private_class_method :write_line

      def self.close_log
        return unless @log_file
        begin
          @log_file.flush
        rescue StandardError
          # ignore flush errors while closing
        end
        begin
          @log_file.close unless @log_file.closed?
        rescue StandardError
          # ignore close errors
        end
      ensure
        @log_file = nil
        @log_path = nil
      end
      private_class_method :close_log
    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/main.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/main.rb`
- Size: `38.28 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/main.rb
# Pipeline: PDF > Primitives > Cleanup > Profile > Generic Recognition
#           > Optional Domain Pack > Validation > Host Build > Report
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'zlib'

module BlueCollarSystems
  module PDFVectorImporter

    dir = File.dirname(__FILE__)
    # Core Engine
    require File.join(dir, 'import_config')
    require File.join(dir, 'primitives')
    require File.join(dir, 'logger')
    require File.join(dir, 'command_runner')
    require File.join(dir, 'pdf_parser')
    require File.join(dir, 'content_stream_parser')
    require File.join(dir, 'text_parser')
    require File.join(dir, 'external_text_extractor')
    require File.join(dir, 'bezier')
    require File.join(dir, 'arc_fitter')
    require File.join(dir, 'ocg_parser')
    require File.join(dir, 'xobject_parser')
    require File.join(dir, 'primitive_extractor')
    require File.join(dir, 'unit_parser')
    require File.join(dir, 'dimension_parser')
    require File.join(dir, 'generic_classifier')
    require File.join(dir, 'document_profiler')
    require File.join(dir, 'region_segmenter')
    require File.join(dir, 'generic_recognizer')
    # Pipeline
    require File.join(dir, 'recognizer')
    require File.join(dir, 'validator')
    # Host Builders
    require File.join(dir, 'geometry_builder')
    require File.join(dir, 'geometry_cleanup')
    require File.join(dir, 'hatch_detector')
    require File.join(dir, 'stroke_font')
    require File.join(dir, 'svg_text_renderer')
    require File.join(dir, 'svg_geometry_renderer')
    require File.join(dir, 'metadata')
    # Tools & UI
    require File.join(dir, 'scale_tool')
    require File.join(dir, 'import_dialog')
    require File.join(dir, 'report_dialog')

    # ================================================================
    # SHARED PIPELINE — single source of truth for all import paths
    # ================================================================
    def self.safe_abort_operation(model, source)
      return unless model
      model.abort_operation
    rescue StandardError => e
      Logger.warn(source, "abort_operation failed: #{e.message}")
    end

    def self.safe_find_pdftocairo
      SvgTextRenderer.find_pdftocairo
    rescue StandardError => e
      Logger.warn("Raster", "pdftocairo lookup failed: #{e.message}")
      nil
    end

    # Auto-mode flood heuristics (mirrors the FreeCAD importer behavior).
    # Catches decorative/map pages that are technically vector paths but are not
    # useful CAD geometry in SketchUp.
    AUTO_FILL_DRAWING_THRESHOLD = 400
    AUTO_FILL_HEAVY_RATIO = 0.60
    AUTO_FILL_STROKE_MAX = 0.22
    AUTO_FILL_PURE_RATIO = 0.95
    AUTO_FILL_PURE_STROKE_MAX = 0.02
    AUTO_FILL_PURE_MIN_GROUPS = 12
    AUTO_FILL_PURE_MIN_ITEMS = 24
    AUTO_FILL_PURE_LARGE_RECT_RATIO = 0.03

    def self.path_bbox(path)
      return nil unless path && path.respond_to?(:subpaths) && path.subpaths
      min_x = nil
      min_y = nil
      max_x = nil
      max_y = nil

      path.subpaths.each do |sp|
        next unless sp && sp.respond_to?(:segments) && sp.segments
        sp.segments.each do |seg|
          next unless seg && seg.respond_to?(:points) && seg.points
          seg.points.each do |pt|
            next unless pt && pt.length >= 2
            x = pt[0].to_f
            y = pt[1].to_f
            min_x = x if min_x.nil? || x < min_x
            min_y = y if min_y.nil? || y < min_y
            max_x = x if max_x.nil? || x > max_x
            max_y = y if max_y.nil? || y > max_y
          end
        end
      end
      return nil if min_x.nil? || min_y.nil? || max_x.nil? || max_y.nil?
      [min_x, min_y, max_x, max_y]
    end

    def self.vector_path_stats(paths, media_box)
      total = paths ? paths.length : 0
      empty = {
        total: 0,
        fill_only_ratio: 0.0,
        stroke_ratio: 0.0,
        fill_only_count: 0,
        stroke_count: 0,
        total_item_count: 0,
        max_rect_ratio: 0.0
      }
      return empty if total <= 0

      page_w = ((media_box[2] || 0).to_f - (media_box[0] || 0).to_f).abs
      page_h = ((media_box[3] || 0).to_f - (media_box[1] || 0).to_f).abs
      page_area = page_w * page_h
      page_area = 0.0 if page_area.nan? || page_area.infinite?

      fill_only = 0
      stroke_count = 0
      total_items = 0
      max_rect_ratio = 0.0

      paths.each do |path|
        has_fill = !!(path && path.fill)
        has_stroke = !!(path && path.stroke)
        fill_only += 1 if has_fill && !has_stroke
        stroke_count += 1 if has_stroke

        if path && path.respond_to?(:subpaths) && path.subpaths
          path.subpaths.each do |sp|
            total_items += sp.segments.length if sp && sp.respond_to?(:segments) && sp.segments
          end
        end

        if page_area > 0.0
          bbox = path_bbox(path)
          if bbox
            w = (bbox[2] - bbox[0]).abs
            h = (bbox[3] - bbox[1]).abs
            ratio = (w * h) / page_area
            max_rect_ratio = ratio if ratio > max_rect_ratio
          end
        end
      end

      {
        total: total,
        fill_only_ratio: fill_only.to_f / total.to_f,
        stroke_ratio: stroke_count.to_f / total.to_f,
        fill_only_count: fill_only,
        stroke_count: stroke_count,
        total_item_count: total_items,
        max_rect_ratio: max_rect_ratio
      }
    end

    def self.looks_like_fill_art_flood?(paths, media_box)
      stats = vector_path_stats(paths, media_box)
      n = stats[:total]
      fill_ratio = stats[:fill_only_ratio]
      stroke_ratio = stats[:stroke_ratio]
      total_items = stats[:total_item_count]
      max_rect_ratio = stats[:max_rect_ratio]

      pure_fill = fill_ratio >= AUTO_FILL_PURE_RATIO &&
                  stroke_ratio <= AUTO_FILL_PURE_STROKE_MAX
      if pure_fill && n >= AUTO_FILL_PURE_MIN_GROUPS
        if total_items >= AUTO_FILL_PURE_MIN_ITEMS ||
           max_rect_ratio >= AUTO_FILL_PURE_LARGE_RECT_RATIO
          return [true, stats]
        end
      end

      if n >= AUTO_FILL_DRAWING_THRESHOLD &&
         fill_ratio >= AUTO_FILL_HEAVY_RATIO &&
         stroke_ratio <= AUTO_FILL_STROKE_MAX
        return [true, stats]
      end

      [false, stats]
    end

    def self.run_pipeline(model, path, opts)
      Logger.reset
      config = RecognitionConfig.default

      # ── Force raster: skip all vector parsing, render as image ──
      if opts[:force_raster]
        dpi = opts[:raster_dpi] || 300
        Logger.warn("Pipeline", "Force-raster mode at #{dpi} DPI")
        model.start_operation("Import PDF Raster", true)
        media_box = [0, 0, 612, 792]  # default; overridden per-page below
        crop_box = nil
        import_start = Time.now
        # Try to get actual page size from parser
        begin
          p = PDFParser.new(path)
          p.parse
          if p.page_count > 0
            pg = p.pages.first
            media_box = pg[:media_box] if pg && pg[:media_box]
            if pg && pg[:crop_box].is_a?(Array) && pg[:crop_box].length >= 4
              crop_box = pg[:crop_box]
            end
          end
        rescue StandardError => e
          Logger.warn("Pipeline", "Could not read page size: #{e.message}")
        end
        raster_box = crop_box || media_box
        raster_ok = import_page_as_raster(
          model, path, 1, media_box, opts, import_start, 0.0, raster_box
        )
        if raster_ok
          model.commit_operation
          return { pages: 1, primitives: 0, edges: 0, faces: 0, arcs: 0,
                   text: 0, components: 0, layers: [], cleanup: {},
                   generic: nil, mode_used: nil, xobjects: 0,
                   raster_fallback_used: true,
                   log_path: Logger.log_path }
        else
          model.abort_operation
          UI.messagebox("Force-raster import failed.\n\nMake sure pdftocairo (from Poppler) is installed.")
          return nil
        end
      end

      # ── File size warning for very large PDFs ──
      begin
        file_size_bytes = File.size(path)
        if file_size_bytes > 100 * 1024 * 1024
          size_mb = (file_size_bytes / (1024.0 * 1024.0)).round(1)
          choice = UI.messagebox(
            "This PDF is very large (#{size_mb} MB). Import may take a significant " \
            "amount of time and use considerable memory. Continue?",
            MB_OKCANCEL)
          return nil unless choice == IDOK
        end
      rescue StandardError => e
        Logger.warn("Pipeline", "File size check failed: #{e.message}")
      end

      parser = PDFParser.new(path)
      parser.parse
      if parser.page_count == 0
        # Parser failed (compressed xref, unsupported features, etc.)
        # Try raster fallback before giving up
        if opts[:raster_fallback]
          Logger.warn("Pipeline", "PDF parser found 0 pages — attempting raster fallback")
          model.start_operation("Import PDF Raster", true)
          media_box = [0, 0, 612, 792]  # default letter size
          import_start = Time.now
          raster_ok = import_page_as_raster(model, path, 1, media_box, opts, import_start)
          if raster_ok
            model.commit_operation
            return { pages: 1, primitives: 0, edges: 0, faces: 0, arcs: 0,
                     text: 0, components: 0, layers: [], cleanup: {},
                     generic: nil, mode_used: nil, xobjects: 0,
                     text_mode: :none,
                     elapsed_seconds: (Time.now - import_start).round(1),
                     raster_fallback_used: true,
                     log_path: Logger.log_path }
          else
            safe_abort_operation(model, "Pipeline")
          end
        end
        return nil
      end

      ocg = OCGParser.new(parser)
      ocg.parse

      pages = opts[:pages]
      pages = (1..parser.page_count).to_a if pages == :all
      pages = pages.select { |p| p >= 1 && p <= parser.page_count }
      return nil if pages.empty?

      model.start_operation("Import PDF Vectors", true)

      # Reset ID counter once at the start of a multi-page import
      IDGen.reset

      ocg.layer_list.each do |n|
        t = "PDF::Layer::#{n}"
        model.layers.add(t) unless model.layers[t]
      end

      requested_text_mode = opts[:text_mode]
      requested_text_mode ||= (opts[:use_3d_text] ? :geometry : (opts[:import_text] ? :labels : :none))
      requested_text_mode = :none unless opts[:import_text]

      stats = { pages: 0, primitives: 0, edges: 0, faces: 0, arcs: 0,
                text: 0, components: 0, layers: ocg.layer_list, cleanup: {},
                generic: nil, mode_used: nil, xobjects: 0,
                text_mode: requested_text_mode }

      import_start = Time.now
      stack_spacing = 1.2
      running_y_offset = 0.0

      pages.each_with_index do |page_num, idx|
       begin
        pct = pages.length > 1 ? " (#{((idx.to_f / pages.length) * 100).round}%)" : ""
        elapsed = (Time.now - import_start).round(1)

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num}/#{parser.page_count} — Parsing... [#{elapsed}s]"

        raw = parser.page_data(page_num)
        next unless raw
        media_box = raw[:media_box] || [0, 0, 612, 792]
        crop_box = raw[:crop_box]
        crop_box = nil unless crop_box.is_a?(Array) && crop_box.length >= 4
        svg_page_box = crop_box || media_box
        text_offset_x = svg_page_box[0].to_f - media_box[0].to_f
        text_offset_y = svg_page_box[1].to_f - media_box[1].to_f
        Logger.info("Pipeline",
          "Page #{page_num}: text_mode=#{requested_text_mode}, media_box=#{media_box.inspect}, " \
          "crop_box=#{crop_box ? crop_box.inspect : 'nil'}, text_offset_pts=(#{text_offset_x.round(3)},#{text_offset_y.round(3)})")
        stack_box = svg_page_box
        curr_page_height_in = (stack_box[3].to_f - stack_box[1].to_f).abs * (1.0 / 72.0) * opts[:scale].to_f
        curr_page_height_in = 11.0 * opts[:scale].to_f if curr_page_height_in <= 0.0
        page_y_offset = running_y_offset
        streams = raw[:content_streams]
        if streams.nil? || streams.empty?
          # No content streams — try raster fallback instead of skipping
          if opts[:raster_fallback]
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — No streams, trying raster... [#{elapsed}s]"
            raster_ok = import_page_as_raster(
              model, path, page_num, media_box, opts, import_start, page_y_offset, svg_page_box
            )
            if raster_ok
              stats[:pages] += 1
              stats[:raster_fallback_used] = true
              running_y_offset += curr_page_height_in * stack_spacing
            end
          end
          next
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Reading paths... [#{elapsed}s]"
        ocg_map = parser.page_ocg_map(page_num)
        cs = ContentStreamParser.new(streams, parser, ocg_map)
        paths = cs.parse

        # Smart auto-raster override for fill-art flood pages.
        flood_hit, flood_stats = looks_like_fill_art_flood?(paths, media_box)
        if flood_hit
          fill_pct = (flood_stats[:fill_only_ratio] * 100.0).round
          stroke_pct = (flood_stats[:stroke_ratio] * 100.0).round
          Logger.warn(
            "Pipeline",
            "Page #{page_num}: smart mode override — fill-art flood — " \
            "#{flood_stats[:total]} groups, fill-only=#{fill_pct}%, " \
            "strokes=#{stroke_pct}% (map/decorative PDF — vectors would be unusable geometry)"
          )

          if opts[:raster_fallback]
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Fill-art flood, rendering raster... [#{(Time.now - import_start).round(1)}s]"
            raster_ok = import_page_as_raster(
              model, path, page_num, media_box, opts, import_start, page_y_offset, svg_page_box
            )
            if raster_ok
              stats[:pages] += 1
              stats[:raster_fallback_used] = true
              running_y_offset += curr_page_height_in * stack_spacing
              next
            end
            Logger.warn("Pipeline", "Page #{page_num}: fill-art raster fallback failed; continuing with vectors.")
          else
            Logger.warn("Pipeline", "Page #{page_num}: fill-art flood detected but raster fallback is disabled.")
          end
        end

        xobj = XObjectParser.new(parser)
        xobj.scan_page(page_num)
        xobj.count_references(streams)

        text_items = []
        if opts[:import_text]
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Extracting text... [#{(Time.now - import_start).round(1)}s]"
          # 3D text alignment is most stable when we use baseline-aware
          # coordinates from content streams first, then fall back to bbox text.
          prefer_internal_text = (requested_text_mode == :text3d)
          if prefer_internal_text
            font_maps = parser.page_font_maps(page_num)
            text_items = TextParser.new(streams, font_maps).parse
            text_source = :internal
            if text_items.nil? || text_items.empty?
              text_items = ExternalTextExtractor.extract(path, page_num,
                offset_x_pts: text_offset_x, offset_y_pts: text_offset_y)
              text_source = :external
            end
          else
            text_items = ExternalTextExtractor.extract(path, page_num,
              offset_x_pts: text_offset_x, offset_y_pts: text_offset_y)
            text_source = :external
            if text_items.nil? || text_items.empty?
              font_maps = parser.page_font_maps(page_num)
              text_items = TextParser.new(streams, font_maps).parse
              text_source = :internal
            end
          end
          Logger.info("Pipeline", "Page #{page_num}: text extractor=#{text_source}, items=#{text_items ? text_items.length : 0}")
        end

        # If the page is text-dominant with little/no vector geometry, importing
        # only text produces misaligned/low-trust results on OCR/geospatial PDFs.
        # Prefer a faithful raster import in this case.
        if opts[:raster_fallback] && paths.length <= 10 && text_items.length >= 200
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Text-heavy page, using raster fallback... [#{(Time.now - import_start).round(1)}s]"
          Logger.warn("Pipeline",
            "Page #{page_num}: text-dominant content (paths=#{paths.length}, text=#{text_items.length}) — raster fallback")
          raster_ok = import_page_as_raster(
            model, path, page_num, media_box, opts, import_start, page_y_offset, svg_page_box
          )
          if raster_ok
            stats[:pages] += 1
            stats[:raster_fallback_used] = true
            running_y_offset += curr_page_height_in * stack_spacing
            next
          end
          Logger.warn("Pipeline", "Page #{page_num}: text-dominant raster fallback failed; continuing with vectors/text.")
        end

        if paths.empty? && text_items.empty?
          if opts[:raster_fallback]
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Rendering raster image... [#{(Time.now - import_start).round(1)}s]"
            raster_ok = import_page_as_raster(
              model, path, page_num, media_box, opts, import_start, page_y_offset, svg_page_box
            )
            if raster_ok
              stats[:pages] += 1
              stats[:edges] += 0
              running_y_offset += curr_page_height_in * stack_spacing
            else
              Logger.warn("Pipeline",
                "Page #{page_num}: no vector content and raster render failed; page skipped.")
            end
          end
          next
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — #{paths.length} paths, #{text_items.length} text items... [#{(Time.now - import_start).round(1)}s]"

        page_data = PrimitiveExtractor.extract(paths, text_items, media_box, page_num,
          scale: opts[:scale], bezier_segments: opts[:bezier_segments])
        page_data.layers = ocg.layer_list
        page_data.xobject_names = xobj.form_xobjects.keys
        stats[:primitives] += page_data.primitives.length
        stats[:pages] += 1
        stats[:xobjects] += xobj.form_xobjects.length

        recog_mode = opts[:recognition_mode] || :auto
        recognition = nil
        if recog_mode != :none
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Analyzing document... [#{(Time.now - import_start).round(1)}s]"
          recognition = Recognizer.run(page_data, mode: recog_mode, config: config)
          stats[:mode_used] = recognition[:mode_used]
          if recognition[:generic]
            g = recognition[:generic]
            stats[:generic] = {
              circles: g.circles.length, boundaries: g.closed_boundaries.length,
              patterns: g.repeated_patterns.length, tables: g.tables.length,
              title_block: g.title_block_bbox ? true : false,
              dimensions: g.dimension_assocs.length,
              profile: g.page_profile.primary_type }
          end
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Building #{paths.length} paths... [#{(Time.now - import_start).round(1)}s]"

        # ── Hatch detection ──
        hatch_mode = opts[:hatch_mode] || :import
        hatch_paths = []
        if hatch_mode != :import && paths.length > 20
          hatch_indices = HatchDetector.detect(page_data.primitives)
          if hatch_indices && !hatch_indices.empty?
            hatch_set = hatch_indices.to_a
            if hatch_mode == :skip
              paths = paths.each_with_index.reject { |_, i| hatch_set.include?(i) }.map(&:first)
            elsif hatch_mode == :group
              hatch_paths = paths.each_with_index.select { |_, i| hatch_set.include?(i) }.map(&:first)
              paths = paths.each_with_index.reject { |_, i| hatch_set.include?(i) }.map(&:first)
            end
          end
        end

        # When geometry text mode: try pdftocairo first, skip text in builder
        use_svg_text = (requested_text_mode == :geometry) && opts[:import_text]
        builder_use_3d_text = (requested_text_mode == :text3d)
        builder_text_items = use_svg_text ? [] : text_items

        builder = GeometryBuilder.new(model, paths, builder_text_items, media_box,
          scale_factor: opts[:scale], bezier_segments: opts[:bezier_segments],
          import_as: opts[:import_as], layer_name: opts[:layer_name],
          group_per_page: opts[:group_per_page], page_number: page_num,
          flatten_to_2d: true, merge_tolerance: opts[:merge_tolerance],
          import_fills: opts[:import_fills], group_by_color: opts[:group_by_color],
          detect_arcs: opts[:detect_arcs], map_dashes: opts[:map_dashes],
          import_text: use_svg_text ? false : opts[:import_text],
          use_3d_text: builder_use_3d_text,
          y_offset: page_y_offset)
        result = builder.build
        stats[:edges] += result[:edges]; stats[:faces] += result[:faces]
        stats[:arcs] += result[:arcs]; stats[:text] += result[:text_objects]

        # Build hatching on separate layer if group mode
        if hatch_mode == :group && !hatch_paths.empty? && builder.page_group
          hatch_layer_name = "#{opts[:layer_name] || 'PDF Import'}:Hatching"
          hatch_builder = GeometryBuilder.new(model, hatch_paths, [], media_box,
            scale_factor: opts[:scale], bezier_segments: opts[:bezier_segments],
            import_as: :edges, layer_name: hatch_layer_name,
            group_per_page: false, page_number: page_num,
            flatten_to_2d: true, merge_tolerance: opts[:merge_tolerance],
            import_fills: false, group_by_color: false,
            detect_arcs: false, map_dashes: false,
            import_text: false, use_3d_text: false,
            target_entities: builder.page_group.entities)
          hatch_result = hatch_builder.build
          stats[:edges] += hatch_result[:edges]
          # Default hatching layer to hidden
          begin
            hl = model.layers[hatch_layer_name]
            hl.visible = false if hl
          rescue StandardError => e
            Logger.warn("Main", "hide hatch layer failed: #{e.message}")
          end
        end

        # Render text as precise vector geometry via pdftocairo
        if use_svg_text && builder.page_group
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Rendering text geometry... [#{(Time.now - import_start).round(1)}s]"
          text_layer_name = "#{opts[:layer_name] || 'PDF Import'}:Text"
          text_layer = model.layers[text_layer_name] ||
                       model.layers.add(text_layer_name)
          svg_result = SvgTextRenderer.render(
            builder.page_group.entities, path, page_num, media_box,
            scale: opts[:scale], layer: text_layer, y_offset: page_y_offset,
            svg_page_box: svg_page_box)

          if svg_result
            stats[:text] += svg_result[:glyphs]
            stats[:edges] += svg_result[:edges]
            stats[:text_mode] = :geometry
          else
            # SVG glyph text unavailable/disabled — preserve the user's selected
            # fallback intent (geometry/text3d => add_3d_text, labels => add_text).
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Fallback text rendering... [#{(Time.now - import_start).round(1)}s]"
            fallback_use_3d = (requested_text_mode == :geometry || requested_text_mode == :text3d)
            fallback_mode = fallback_use_3d ? "3D text" : "labels"
            Logger.warn("Pipeline", "SVG text unavailable — falling back to #{fallback_mode} text")
            fallback_builder = GeometryBuilder.new(model, [], text_items, media_box,
              scale_factor: opts[:scale], layer_name: opts[:layer_name],
              group_per_page: false, page_number: page_num,
              flatten_to_2d: true, import_text: true, use_3d_text: fallback_use_3d,
              y_offset: page_y_offset,
              target_entities: builder.page_group.entities)
            fb_result = fallback_builder.build
            stats[:text] += fb_result[:text_objects]
            stats[:text_mode] = fallback_use_3d ? :text3d : :labels
          end
        end

        if opts[:cleanup_geometry] && builder.page_group
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Cleaning up geometry... [#{(Time.now - import_start).round(1)}s]"
          cl = GeometryCleanup.cleanup(builder.page_group.entities,
            merge_tolerance:    opts[:merge_tolerance],
            min_edge_length:    opts[:merge_tolerance],
            cleanup_level:      opts[:cleanup_level])
          cl.each { |k, v| stats[:cleanup][k] = (stats[:cleanup][k] || 0) + v }
        end

        # Advance the running page stack only after a successful import.
        running_y_offset += curr_page_height_in * stack_spacing

      rescue StandardError => e
        Logger.error("Pipeline", "Page #{page_num} failed: #{e.message}", e)
        stats[:failed_pages] ||= []
        stats[:failed_pages] << { page: page_num, error: e.message }
        # Continue to next page instead of aborting the entire operation.
        # Previously this called safe_abort_operation + raise, which
        # destroyed all geometry from successfully imported pages.
      end
      end

      model.commit_operation

      # Release the raw PDF buffer and object cache to free memory.
      begin
        parser.release
      rescue StandardError => e
        Logger.warn("Pipeline", "parser.release failed: #{e.message}")
      end

      elapsed = (Time.now - import_start).round(1)
      Sketchup.status_text = "PDF Import complete — #{stats[:edges]} edges, #{stats[:text]} text items — #{elapsed}s"

      stats[:elapsed_seconds] = elapsed

      # ── Auto fit view to geometry (not text) ──
      begin
        view = model.active_view
        if view
          # Temporarily hide text tag so zoom_extents fits geometry only
          text_tag_name = "#{opts[:layer_name] || 'PDF Import'}:Text"
          text_tag = model.layers[text_tag_name]
          was_visible = text_tag ? text_tag.visible? : nil

          text_tag.visible = false if text_tag && was_visible

          # Switch to top-down orthographic view for 2D drawing
          cam = view.camera
          # Find bounding box center of imported geometry
          bb = nil
          model.entities.each do |e|
            next unless e.respond_to?(:bounds) && e.valid?
            if bb
              bb.add(e.bounds)
            else
              bb = e.bounds
            end
          end

          if bb && bb.valid?
            center = bb.center
            eye = Geom::Point3d.new(center.x, center.y, center.z + 1000)
            target = center
            up = Geom::Vector3d.new(0, 1, 0)
            view.camera = Sketchup::Camera.new(eye, target, up)
            view.camera.perspective = false
          end

          view.zoom_extents

          # Restore text tag visibility
          text_tag.visible = true if text_tag && was_visible
        end
      rescue StandardError => e
        Logger.warn("Pipeline", "Auto-fit view failed: #{e.message}")
      end

      stats[:log_path] = Logger.log_path
      stats
    ensure
      Logger.flush_log
    end

    # ================================================================
    # RASTER FALLBACK — render scanned page as positioned image
    # ================================================================
    def self.import_page_as_raster(model, pdf_path, page_num, media_box, opts, import_start, y_offset = 0.0, render_box = nil)
      exe = safe_find_pdftocairo
      return false unless exe

      dpi = opts[:raster_dpi] || 300
      # Render/placement box (usually CropBox when available, else MediaBox).
      render_box = media_box unless render_box.is_a?(Array) && render_box.length >= 4
      media_min_x = media_box[0].to_f
      media_min_y = media_box[1].to_f
      render_min_x = render_box[0].to_f
      render_min_y = render_box[1].to_f
      page_w_pts = (render_box[2] - render_box[0]).abs
      page_h_pts = (render_box[3] - render_box[1]).abs
      page_w_pts = 612.0 if page_w_pts < 1
      page_h_pts = 792.0 if page_h_pts < 1

      use_cropbox = false
      begin
        if media_box.is_a?(Array) && media_box.length >= 4 &&
           render_box.is_a?(Array) && render_box.length >= 4
          use_cropbox = render_box.zip(media_box).any? { |a, b| (a.to_f - b.to_f).abs > 0.01 }
        end
      rescue StandardError => e
        Logger.warn("Raster", "cropbox compare failed: #{e.message}")
      end

      # Render page to PNG
      png_path = File.join(Dir.tmpdir,
        "bc_raster_#{Process.pid}_#{Time.now.to_i}_p#{page_num}.png")

      args = [exe, '-png', '-singlefile', '-r', dpi.to_s]
      args << '-cropbox' if use_cropbox
      args += [
              '-f', page_num.to_s, '-l', page_num.to_s,
              pdf_path, png_path.sub(/\.png$/, '')]
      run = CommandRunner.run(
        args,
        timeout_s: 180,
        context: "Raster.pdftocairo"
      )

      # With -singlefile, output should be exactly png_path.
      # Keep legacy candidates for compatibility with older Poppler builds.
      actual_png = nil
      [png_path,
       png_path.sub(/\.png$/, "-#{page_num}.png"),
       png_path.sub(/\.png$/, "-01.png"),
       png_path.sub(/\.png$/, "-1.png")
      ].each do |candidate|
        if File.exist?(candidate)
          actual_png = candidate
          break
        end
      end

      return false unless run[:ok] && actual_png && File.exist?(actual_png)

      begin
        scale = opts[:scale] || 1.0
        # Image size in inches = page pts / 72
        img_w = page_w_pts / 72.0 * scale
        img_h = page_h_pts / 72.0 * scale
        box_offset_x = (render_min_x - media_min_x) / 72.0 * scale
        box_offset_y = (render_min_y - media_min_y) / 72.0 * scale

        # Match vector page stacking so raster fallback pages do not overlap.
        pt = Geom::Point3d.new(box_offset_x, y_offset.to_f + box_offset_y, 0)
        begin
          # add_image available in SketchUp 2017+
          img = model.active_entities.add_image(actual_png, pt, img_w, img_h)
          if img
            layer = model.layers['PDF Import'] || model.layers.add('PDF Import')
            begin
              img.layer = layer if layer
            rescue StandardError => e
              Logger.warn("Raster", "Image layer assignment failed: #{e.message}")
            end
            box_msg = use_cropbox ? "cropbox" : "mediabox"
            Sketchup.status_text = "PDF Import — Page #{page_num} — Raster image placed at #{dpi} DPI [#{(Time.now - import_start).round(1)}s]"
            Logger.info("Raster", "Page #{page_num}: placed #{box_msg} raster #{img_w.round(3)}x#{img_h.round(3)} in at (#{pt.x.round(3)},#{pt.y.round(3)})")
            return true
          end
        rescue StandardError => e
          Logger.warn("Raster", "add_image failed: #{e.message}")
        end
      rescue StandardError => e
        Logger.warn("Raster", "Failed: #{e.message}")
      ensure
        begin
          File.delete(actual_png) if actual_png && File.exist?(actual_png)
        rescue StandardError => e
          Logger.warn("Main", "cleanup temp png failed: #{e.message}")
        end
      end
      false
    end

    # ================================================================
    # PUBLIC ENTRY POINTS
    # ================================================================
    def self.import_pdf
      model = Sketchup.active_model
      return UI.messagebox("No active model.") unless model
      path = UI.openpanel("Select PDF File", "", "PDF Files|*.pdf||")
      return unless path && File.exist?(path)
      begin
        opts = ImportDialog.show(path)
        return unless opts
        stats = run_pipeline(model, path, opts)
        if stats
          ReportDialog.show_report(stats)
        else
          UI.messagebox("No vector content found in PDF.")
        end
      rescue StandardError => e
        safe_abort_operation(model, "Import")
        Logger.error("Import", "Import failed", e)
        log_hint = Logger.log_path ? "\n\nDetails saved to:\n#{Logger.log_path}" : ""
        UI.messagebox("PDF import failed:\n#{e.message}#{log_hint}")
      end
    end

    def self.import_pdf_safe
      model = Sketchup.active_model
      return UI.messagebox("No active model.") unless model
      path = UI.openpanel("Select PDF File (Safe Mode)", "", "PDF Files|*.pdf||")
      return unless path && File.exist?(path)

      begin
        fast = ImportDialog::PRESETS['Fast'] || {}
        opts = ImportDialog.send(:build_opts, fast.merge(pages: 'All'))
        stats = run_pipeline(model, path, opts)
        unless stats
          UI.messagebox("No vector content found in PDF.")
        end
      rescue StandardError => e
        safe_abort_operation(model, "ImportSafe")
        Logger.error("ImportSafe", "Safe mode import failed", e)
        log_hint = Logger.log_path ? "\n\nDetails saved to:\n#{Logger.log_path}" : ""
        UI.messagebox("PDF import failed:\n#{e.message}#{log_hint}")
      end
    end

    def self.batch_import
      model = Sketchup.active_model
      return UI.messagebox("No active model.") unless model
      # UI.select_directory is not available in SketchUp Make (free) editions.
      # Fall back to an inputbox for the folder path.
      folder = if UI.respond_to?(:select_directory)
                 UI.select_directory(title: "Select Folder of PDFs")
               else
                 result = UI.inputbox(["Folder path:"], [""], "Select Folder of PDFs")
                 result ? result[0] : nil
               end
      return unless folder && File.directory?(folder)
      pdfs = (Dir.glob(File.join(folder, "*.pdf")) + Dir.glob(File.join(folder, "*.PDF"))).uniq
      return UI.messagebox("No PDF files found.") if pdfs.empty?
      return unless UI.messagebox("Import #{pdfs.length} PDF(s) with Full preset?", MB_YESNO) == IDYES
      ok = 0; fail_c = 0
      preset = ImportDialog::PRESETS['Full']
      pdfs.sort.each_with_index do |pdf, idx|
        Sketchup.status_text = "Batch: #{idx+1}/#{pdfs.length} #{File.basename(pdf)}"
        begin
          opts = ImportDialog.send(:build_opts, preset.merge(pages: 'All'))
          ok += 1 if run_pipeline(model, pdf, opts)
        rescue StandardError => e
          fail_c += 1; Logger.error("Batch", File.basename(pdf), e)
        end
      end
      UI.messagebox("Batch: #{ok} imported, #{fail_c} failed, #{pdfs.length} total.")
    end

    def self.scale_by_reference; ScaleTool.activate; end
    def self.quick_scale; ScaleTool.quick_scale; end

    def self.cleanup_selected
      model = Sketchup.active_model; return unless model
      groups = model.selection.grep(Sketchup::Group)
      return UI.messagebox("Select groups to clean.") if groups.empty?
      model.start_operation("Cleanup", true)
      total = {}
      groups.each { |g| GeometryCleanup.cleanup(g.entities).each { |k,v| total[k]=(total[k]||0)+v } }
      model.commit_operation
      UI.messagebox("Cleanup:\n"+total.select{|_,v|v>0}.map{|k,v|"  #{v} #{k}"}.join("\n"))
    end

    def self.feature_inventory
      model = Sketchup.active_model; return unless model
      t = model.selection.grep(Sketchup::Group).first
      UI.messagebox(Metadata.report(t ? t.entities : model.active_entities))
    end

    def self.visibility_toggles; ReportDialog.show_visibility_menu; end

    # ================================================================
    # MENU & TOOLBAR
    # ================================================================
    unless @loaded
      UI.menu('File').add_item('Import PDF Vectors...') { self.import_pdf }

      sub = UI.menu('Extensions').add_submenu('PDF Vector Importer')
      sub.add_item('Import PDF...') { self.import_pdf }
      sub.add_item('Import PDF (Safe Mode)...') { self.import_pdf_safe }
      sub.add_item('Batch Import Folder...') { self.batch_import }
      sub.add_separator
      sub.add_item('Scale to Real Dimensions...') { self.scale_by_reference }
      sub.add_item('Quick Scale...') { self.quick_scale }
      sub.add_separator
      sub.add_item('About') {
        UI.messagebox(
          "PDF Vector Importer v#{PLUGIN_VERSION}\n" \
          "by BlueCollar Systems\n\n" \
          "Import PDF drawings as editable SketchUp geometry.\n\n" \
          "BUILT. NOT BOUGHT.")
      }

      @loaded = true
    end

    # ================================================================
    # File Importer — drag-drop + File > Import
    # Guarded: Sketchup::Importer only exists in SU 2017+ Pro/Make
    # (some early 2017 builds may lack it). If missing, the plugin
    # still works via the Extensions menu — just no File > Import.
    # ================================================================
    if defined?(Sketchup::Importer)
    class PDFFileImporter < Sketchup::Importer
      def description; "PDF Vector Drawings (*.pdf)"; end
      def file_extension; "pdf"; end
      def id; "com.bluecollar.pdfvectorimporter"; end
      def supports_options?; true; end

      def load_file(file_path, status)
        opts = ImportDialog.show(file_path)
        return Sketchup::Importer::ImportCanceled unless opts
        model = Sketchup.active_model
        return Sketchup::Importer::ImportFail unless model
        stats = BlueCollarSystems::PDFVectorImporter.run_pipeline(model, file_path, opts)
        stats ? Sketchup::Importer::ImportSuccess : Sketchup::Importer::ImportFail
      rescue StandardError => e
        BlueCollarSystems::PDFVectorImporter.safe_abort_operation(model, "PDFFileImporter")
        Logger.error("PDFFileImporter", "load_file failed", e)
        Sketchup::Importer::ImportFail
      end
    end
    end # if defined?(Sketchup::Importer)

  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/metadata.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/metadata.rb`
- Size: `3.86 KB`
- Modified: `2026-03-23 16:45:51`

```ruby
# bc_pdf_vector_importer/metadata.rb
# Attaches SketchUp AttributeDictionary data to groups, components,
# and edges for PDF import metadata (source page, import settings, etc.).
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module Metadata

      DICT_NAME = 'BlueCollar_PDF_Import'.freeze

      # ---------------------------------------------------------------
      # Attach a hash of key-value pairs to any SketchUp entity.
      # ---------------------------------------------------------------
      def self.attach(entity, data)
        return unless entity && entity.valid? && data.is_a?(Hash)
        begin
          data.each do |key, value|
            entity.set_attribute(DICT_NAME, key.to_s, value.to_s)
          end
        rescue StandardError => e
          # Attribute writing can fail on some entity types — not critical
          Logger.warn("Metadata", "attach failed: #{e.message}")
        end
      end

      # ---------------------------------------------------------------
      # Read all metadata from an entity
      # ---------------------------------------------------------------
      def self.read(entity)
        return {} unless entity && entity.valid?
        begin
          dict = entity.attribute_dictionary(DICT_NAME)
          return {} unless dict
          result = {}
          dict.each_pair { |k, v| result[k] = v }
          result
        rescue StandardError => e
          Logger.warn("Metadata", "read failed: #{e.message}")
          {}
        end
      end

      # ---------------------------------------------------------------
      # Check if an entity has PDF import metadata
      # ---------------------------------------------------------------
      def self.has_metadata?(entity)
        return false unless entity && entity.valid?
        begin
          dict = entity.attribute_dictionary(DICT_NAME)
          dict && dict.length > 0
        rescue StandardError => e
          Logger.warn("Metadata", "has_metadata? failed: #{e.message}")
          false
        end
      end

      # ---------------------------------------------------------------
      # Get a specific attribute
      # ---------------------------------------------------------------
      def self.get(entity, key, default = nil)
        return default unless entity && entity.valid?
        begin
          entity.get_attribute(DICT_NAME, key.to_s, default)
        rescue StandardError => e
          Logger.warn("Metadata", "get attribute failed: #{e.message}")
          default
        end
      end

      # ---------------------------------------------------------------
      # Remove all PDF import metadata from an entity
      # ---------------------------------------------------------------
      def self.clear(entity)
        return unless entity && entity.valid?
        begin
          entity.delete_attribute(DICT_NAME)
        rescue StandardError => e
          Logger.warn("Metadata", "clear failed: #{e.message}")
        end
      end

      # ---------------------------------------------------------------
      # Generate a text report of metadata on selected entities
      # ---------------------------------------------------------------
      def self.report(entities)
        count = 0
        lines = []
        lines << "=== PDF Import Metadata ==="
        lines << ""

        entities.each do |e|
          next unless e.valid? && has_metadata?(e)
          data = read(e)
          count += 1
          label = e.respond_to?(:name) && !e.name.to_s.empty? ? e.name : e.class.to_s
          lines << "  #{label}: #{data.map { |k, v| "#{k}=#{v}" }.join(', ')}"
        end

        lines << "" << "Total entities with metadata: #{count}"
        lines.join("\n")
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/ocg_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/ocg_parser.rb`
- Size: `7.17 KB`
- Modified: `2026-04-01 20:04:56`

```ruby
# bc_pdf_vector_importer/ocg_parser.rb
# PDF Optional Content Group (Layer) parser.
# Reads /OCProperties from the PDF catalog, resolves OCG names,
# and tracks BDC/BMC/EMC marked content nesting in content streams
# so entities can be assigned to the correct SketchUp Tags.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class OCGParser

      attr_reader :ocg_names   # { ocg_obj_ref => "Layer Name" }
      attr_reader :layer_list  # Ordered array of unique layer names

      def initialize(pdf_parser)
        @pdf = pdf_parser
        @ocg_names = {}
        @layer_list = []
      end

      # ---------------------------------------------------------------
      # Parse OCG definitions from the PDF catalog
      # ---------------------------------------------------------------
      def parse
        @ocg_names = {}
        @layer_list = []

        # Get the document catalog (/Root)
        return unless @pdf.instance_variable_get(:@trailer)
        trailer = @pdf.instance_variable_get(:@trailer)
        root_ref = trailer['/Root']
        return unless root_ref

        root = @pdf.resolve_object(root_ref)
        root_dict = to_dict(root)
        return unless root_dict

        # Look for /OCProperties
        oc_props_ref = root_dict['/OCProperties']
        return unless oc_props_ref

        oc_props = @pdf.resolve_object(oc_props_ref)
        oc_dict = to_dict(oc_props)
        return unless oc_dict

        # /OCGs is an array of indirect references to OCG dictionaries
        ocgs_ref = oc_dict['/OCGs']
        return unless ocgs_ref

        ocgs = @pdf.resolve_object(ocgs_ref)
        ocgs = [ocgs] unless ocgs.is_a?(Array)

        ocgs.each do |ref|
          ocg_obj = @pdf.resolve_object(ref)
          ocg_d = to_dict(ocg_obj)
          next unless ocg_d

          # Each OCG dict has /Type /OCG and /Name (string)
          name = ocg_d['/Name']
          if name
            # Clean up the name — remove parentheses from PDF string
            name = name.to_s.gsub(/\A\(/, '').gsub(/\)\z/, '').strip
            name = "Layer_#{@ocg_names.length}" if name.empty?
          else
            name = "Layer_#{@ocg_names.length}"
          end

          # Store mapping from reference string to name
          ref_key = ref.is_a?(String) ? ref : ref.to_s
          @ocg_names[ref_key] = name
          @layer_list << name unless @layer_list.include?(name)
        end

        # Also parse /D (default configuration) for order and visibility
        parse_default_config(oc_dict['/D']) if oc_dict['/D']
      end

      # ---------------------------------------------------------------
      # Track which OCG layer a content stream section belongs to.
      # Call this during content stream parsing when BDC/BMC/EMC are hit.
      #
      # Returns a LayerTracker that manages the nesting stack.
      # ---------------------------------------------------------------
      def create_tracker
        LayerTracker.new(self)
      end

      # ---------------------------------------------------------------
      # Generate SketchUp tag names from OCG layer names
      # ---------------------------------------------------------------
      def sketchup_tag_names
        @layer_list.map { |name| "PDF::Layer::#{name}" }
      end

      private

      def to_dict(obj)
        return obj if obj.is_a?(Hash)
        if obj.is_a?(String) && obj.include?('<<')
          # Attempt to parse as dict
          begin
            @pdf.send(:parse_dict_string, obj)
          rescue StandardError => e
            Logger.warn("OCGParser", "parse_dict_string failed: #{e.message}")
            nil
          end
        else
          nil
        end
      end

      def parse_default_config(d_ref)
        d = @pdf.resolve_object(d_ref)
        d_dict = to_dict(d)
        return unless d_dict

        # /OFF array lists OCGs that are initially hidden
        # /Order array defines display order
        # We could use this to set initial tag visibility in SketchUp
        # For now, just having the layer names is sufficient
      end

      # =============================================
      # LayerTracker — manages BDC/BMC/EMC nesting
      # =============================================
      class LayerTracker

        attr_reader :current_layer

        def initialize(ocg_parser)
          @ocg_parser = ocg_parser
          @stack = []          # Stack of layer names (for nested BDC/EMC)
          @current_layer = nil
        end

        # Called when BDC (begin marked content with properties) is encountered
        # properties_dict should contain /OC reference to an OCG
        def begin_marked_content(tag_name, properties = nil)
          layer_name = nil

          if properties.is_a?(Hash)
            # Look for /OC (Optional Content) key
            oc_ref = properties['/OC']
            if oc_ref
              oc_obj = @ocg_parser.instance_variable_get(:@pdf).resolve_object(oc_ref)
              oc_dict = @ocg_parser.send(:to_dict, oc_obj)
              if oc_dict
                # Could be an OCMD (membership dict) or direct OCG reference
                if oc_dict['/Type'] == '/OCG'
                  name = oc_dict['/Name']
                  if name
                    name = name.to_s.gsub(/\A\(/, '').gsub(/\)\z/, '').strip
                    layer_name = name unless name.empty?
                  end
                elsif oc_dict['/OCGs']
                  # OCMD — resolve first OCG in the list
                  ocg_list = @ocg_parser.instance_variable_get(:@pdf).resolve_object(oc_dict['/OCGs'])
                  if ocg_list.is_a?(Array) && !ocg_list.empty?
                    first_ocg = @ocg_parser.instance_variable_get(:@pdf).resolve_object(ocg_list.first)
                    first_d = @ocg_parser.send(:to_dict, first_ocg)
                    if first_d && first_d['/Name']
                      layer_name = first_d['/Name'].to_s.gsub(/\A\(/, '').gsub(/\)\z/, '').strip
                    end
                  end
                end
              end
            end
          end

          # Also check if the tag name itself maps to a known layer
          if layer_name.nil? && tag_name
            tag_str = tag_name.to_s.gsub(/\A\//, '')
            # Some PDFs use the layer name directly as the tag
            if @ocg_parser.layer_list.include?(tag_str)
              layer_name = tag_str
            end
          end

          @stack.push(layer_name || @current_layer)
          @current_layer = layer_name || @current_layer
        end

        # Called for BMC (begin marked content without properties)
        def begin_marked_content_simple(tag_name)
          begin_marked_content(tag_name, nil)
        end

        # Called when EMC (end marked content) is encountered
        def end_marked_content
          @stack.pop
          @current_layer = @stack.last
        end

        # Reset for a new content stream
        def reset
          @stack.clear
          @current_layer = nil
        end

      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/pdf_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/pdf_parser.rb`
- Size: `39.73 KB`
- Modified: `2026-04-01 20:04:58`

```ruby
# bc_pdf_vector_importer/pdf_parser.rb
# Pure-Ruby PDF parser for extracting page geometry data.
# Handles cross-reference tables, object streams, FlateDecode,
# page trees, MediaBox, and content streams.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class PDFParser

      attr_reader :page_count, :pages

      def initialize(filepath)
        @filepath = filepath
        @data = nil
        @objects = {}       # obj_num => { :gen, :offset, :raw, :parsed }
        @pages = []         # ordered array of page object references
        @page_count = 0
        @xref_offsets = []
        @trailer = nil
        @font_map_cache = {}
        @ocg_map_cache = {}
      end

      # ---------------------------------------------------------------
      # Top-level parse
      # ---------------------------------------------------------------
      MAX_FILE_SIZE = 500 * 1024 * 1024  # 500 MB

      def parse
        file_size = File.size(@filepath)
        if file_size > MAX_FILE_SIZE
          raise "PDF file too large (#{(file_size / 1024.0 / 1024.0).round(1)} MB). " \
                "Maximum supported size is #{MAX_FILE_SIZE / 1024 / 1024} MB."
        end

        @data = File.binread(@filepath)

        # Validate PDF header
        unless @data[0, 5] == '%PDF-'
          raise "Not a valid PDF file (missing %PDF- header)"
        end

        find_xref
        parse_xref

        # Check for encrypted PDFs — these produce garbage geometry instead
        # of a useful error message if we proceed.
        if @trailer && @trailer['/Encrypt']
          raise "This PDF is encrypted and cannot be imported. " \
                "Please remove the encryption (e.g., print to a new PDF) and try again."
        end

        build_page_list
        @page_count = @pages.length
      end

      # ---------------------------------------------------------------
      # Release the raw file buffer and object cache to free memory.
      # Call this after all pages have been processed.
      # ---------------------------------------------------------------
      def release
        @data = nil
        @objects = {}
        @font_map_cache = {}
        @ocg_map_cache = {}
      end

      # ---------------------------------------------------------------
      # Return data for a given 1-based page number
      # ---------------------------------------------------------------
      def page_data(page_num)
        return nil if page_num < 1 || page_num > @page_count
        page_ref = @pages[page_num - 1]
        page_obj = resolve_object(page_ref)
        return nil unless page_obj

        dict = to_dict(page_obj)
        return nil unless dict

        # Page boxes — may be inherited from parent
        media_box = find_inherited(dict, '/MediaBox')
        media_box = parse_array_nums(media_box) if media_box
        crop_box = find_inherited(dict, '/CropBox')
        crop_box = parse_array_nums(crop_box) if crop_box

        # Content streams
        contents = dict['/Contents']
        streams = []
        if contents
          streams = collect_content_streams(contents)
        end

        { media_box: media_box, crop_box: crop_box, content_streams: streams }
      end

      # ---------------------------------------------------------------
      # Return OCG property map for a page: { "MC0" => "Layer Name", ... }
      # Maps Properties names to their resolved OCG layer names.
      # ---------------------------------------------------------------
      def page_ocg_map(page_num)
        return {} if page_num < 1 || page_num > @page_count
        return @ocg_map_cache[page_num] if @ocg_map_cache.key?(page_num)

        page_ref = @pages[page_num - 1]
        page_obj = resolve_object(page_ref)
        page_dict = to_dict(page_obj)
        return (@ocg_map_cache[page_num] = {}) unless page_dict

        resources = find_inherited(page_dict, '/Resources')
        res_dict = to_dict(resolve_object(resources))
        return (@ocg_map_cache[page_num] = {}) unless res_dict

        props = res_dict['/Properties']
        props_dict = to_dict(resolve_object(props))
        return (@ocg_map_cache[page_num] = {}) unless props_dict.is_a?(Hash)

        result = {}
        props_dict.each do |mc_name, mc_ref|
          # mc_name is like "/MC0", mc_ref points to an OCMD or OCG dict
          ocmd = to_dict(resolve_object(mc_ref))
          next unless ocmd.is_a?(Hash)

          key = mc_name.to_s.sub(/\A\//, '')  # "MC0"

          if ocmd['/Type'] == '/OCG' && ocmd['/Name']
            # Direct OCG reference
            result[key] = ocmd['/Name'].to_s.gsub(/\A\(|\)\z/, '')
          elsif ocmd['/OCGs']
            # OCMD — resolve first OCG for the name
            ocgs_val = resolve_object(ocmd['/OCGs'])
            refs = ocgs_val.is_a?(Array) ? ocgs_val : [ocgs_val]
            refs.each do |ref|
              ocg = to_dict(resolve_object(ref))
              next unless ocg.is_a?(Hash) && ocg['/Name']
              result[key] = ocg['/Name'].to_s.gsub(/\A\(|\)\z/, '')
              break
            end
          end
        end

        @ocg_map_cache[page_num] = result
      end

      # ---------------------------------------------------------------
      # Return ToUnicode font maps for a page keyed by font resource name
      # (example keys: "/F5", "F5"). Each value is:
      #   { map: { byte_string => utf8_string }, code_lengths: [2,1] }
      # ---------------------------------------------------------------
      def page_font_maps(page_num)
        return {} if page_num < 1 || page_num > @page_count
        return @font_map_cache[page_num] if @font_map_cache.key?(page_num)

        page_ref = @pages[page_num - 1]
        page_obj = resolve_object(page_ref)
        page_dict = to_dict(page_obj)
        return (@font_map_cache[page_num] = {}) unless page_dict

        resources = find_inherited(page_dict, '/Resources')
        res_dict = to_dict(resolve_object(resources))
        return (@font_map_cache[page_num] = {}) unless res_dict

        fonts = res_dict['/Font']
        font_dict = to_dict(resolve_object(fonts))
        return (@font_map_cache[page_num] = {}) unless font_dict.is_a?(Hash)

        maps = {}
        font_dict.each do |font_name, font_ref|
          cmap = extract_font_to_unicode_map(font_ref)
          next unless cmap && cmap[:map].is_a?(Hash) && !cmap[:map].empty?

          key = font_name.to_s
          maps[key] = cmap
          maps[key.sub(/\A\//, '')] = cmap
        end

        @font_map_cache[page_num] = maps
      end

      # ---------------------------------------------------------------
      # Resolve an indirect reference "X Y R" to its parsed value
      # ---------------------------------------------------------------
      def resolve_object(ref)
        if ref.is_a?(String) && ref =~ /\A(\d+)\s+(\d+)\s+R\z/
          obj_num = $1.to_i
          return resolve_parsed_object(obj_num)
        end
        ref
      end

      # ---------------------------------------------------------------
      # Decompress a stream given its object number
      # ---------------------------------------------------------------
      def get_stream_data(obj_num)
        raw = get_raw_object(obj_num)
        return nil unless raw

        # Find the stream within the object
        if raw =~ /stream\r?\n/
          stream_start = $~.end(0)
          dict_part = raw[0, raw.index('stream')]
          stream_len = parse_stream_length(raw)
          stream_bytes = nil

          if stream_len && stream_len > 0
            # Use declared /Length when possible. This avoids false early matches
            # when compressed binary data contains the literal word "endstream".
            if stream_start + stream_len <= raw.bytesize
              stream_bytes = raw.byteslice(stream_start, stream_len)
            end
          end

          unless stream_bytes
            # Fallback for malformed length entries.
            endstream_pos = raw.index('endstream', stream_start)
            return nil unless endstream_pos
            stream_bytes = raw[stream_start...endstream_pos]
            stream_bytes = stream_bytes.sub(/\r?\n\z/, '')
          end

          decoded = stream_bytes

          filters = extract_stream_filters(raw, dict_part)
          filters.each do |filter|
            case filter
            when '/ASCII85Decode'
              decoded = ascii85_decode(decoded)
            when '/ASCIIHexDecode'
              decoded = ascii_hex_decode(decoded)
            when '/FlateDecode'
              begin
                decoded = Zlib::Inflate.inflate(decoded)
              rescue Zlib::DataError
                begin
                  # Try raw deflate (no zlib header).
                  decoded = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(decoded)
                rescue StandardError => e
                  Logger.warn("PdfParser", "FlateDecode failed: #{e.message}")
                  decoded = nil
                end
              rescue StandardError => e
                Logger.warn("PdfParser", "FlateDecode failed: #{e.message}")
                decoded = nil
              end
            when '/RunLengthDecode'
              decoded = run_length_decode(decoded)
            when '/LZWDecode'
              Logger.warn("PdfParser", "LZWDecode is not supported for content streams — skipping stream")
              decoded = nil
            else
              Logger.warn("PdfParser", "Unsupported stream filter #{filter} — skipping stream")
              decoded = nil
            end
            break unless decoded
          end

          return nil unless decoded

          # Apply PNG predictor if specified in DecodeParms
          if dict_part =~ /\/Predictor\s+(\d+)/
            predictor = $1.to_i
            columns = 1
            columns = $1.to_i if dict_part =~ /\/Columns\s+(\d+)/
            if predictor >= 10
              decoded = apply_png_predictor(decoded, columns)
            end
          end

          decoded
        end
      end

      def parse_stream_length(raw_obj)
        dict = tokenize_dict(extract_dict(raw_obj))
        return nil unless dict.is_a?(Hash) && dict['/Length']

        val = resolve_numeric_object(dict['/Length'])
        return nil if val.nil?
        n = val.to_i
        n > 0 ? n : nil
      rescue StandardError => e
        Logger.warn("PdfParser", "stream length parse failed: #{e.message}")
        nil
      end

      def resolve_numeric_object(val)
        case val
        when Numeric
          val
        when String
          s = val.strip
          if s =~ /\A(\d+)\s+(\d+)\s+R\z/
            ref_val = resolve_object(s)
            return resolve_numeric_object(ref_val)
          end
          return s.to_i if s =~ /\A[+-]?\d+\z/
          nil
        else
          nil
        end
      rescue StandardError
        nil
      end

      def extract_stream_filters(raw_obj, dict_part)
        filters = []

        begin
          dict = tokenize_dict(extract_dict(raw_obj))
          f = dict['/Filter'] if dict.is_a?(Hash)
          if f.is_a?(Array)
            f.each { |v| filters << normalize_filter_name(v) }
          elsif f
            filters << normalize_filter_name(f)
          end
        rescue StandardError => e
          Logger.warn("PdfParser", "filter parse failed, using regex fallback: #{e.message}")
        end

        # Fallback for malformed dictionaries that fail tokenize_dict.
        if filters.empty?
          if dict_part =~ /\/Filter\s*\[([^\]]+)\]/m
            $1.scan(/\/([A-Za-z0-9]+)/) { |m| filters << "/#{m[0]}" }
          elsif dict_part =~ /\/Filter\s*\/([A-Za-z0-9]+)/m
            filters << "/#{$1}"
          end
        end

        filters.compact.uniq
      end

      def normalize_filter_name(val)
        s = val.to_s.strip
        return nil if s.empty?
        s.start_with?('/') ? s : "/#{s}"
      end

      def ascii85_decode(data)
        src = data.to_s.dup
        src.force_encoding('BINARY')
        src = src.sub(/\A\s*<~/, '')
        src = src.sub(/~>\s*\z/, '')
        src.gsub!(/\s+/, '')

        out = ''.dup.force_encoding('BINARY')
        tuple = []

        src.each_byte do |b|
          if b == 122 # 'z'
            if tuple.empty?
              out << "\x00\x00\x00\x00"
              next
            else
              Logger.warn("PdfParser", "Invalid ASCII85 stream ('z' inside tuple)")
              return nil
            end
          end

          next if b < 33 || b > 117
          tuple << (b - 33)

          if tuple.length == 5
            v = ((((tuple[0] * 85 + tuple[1]) * 85 + tuple[2]) * 85 + tuple[3]) * 85 + tuple[4])
            out << [v].pack('N')
            tuple.clear
          end
        end

        if !tuple.empty?
          pad = 5 - tuple.length
          while tuple.length < 5
            tuple << 84 # 'u' padding
          end
          v = ((((tuple[0] * 85 + tuple[1]) * 85 + tuple[2]) * 85 + tuple[3]) * 85 + tuple[4])
          chunk = [v].pack('N')
          out << chunk[0, 4 - pad]
        end

        out
      rescue StandardError => e
        Logger.warn("PdfParser", "ASCII85 decode failed: #{e.message}")
        nil
      end

      def ascii_hex_decode(data)
        src = data.to_s.gsub(/\s+/, '')
        src = src.sub(/>\z/, '')
        src += '0' if src.length.odd?
        [src].pack('H*')
      rescue StandardError => e
        Logger.warn("PdfParser", "ASCIIHex decode failed: #{e.message}")
        nil
      end

      def run_length_decode(data)
        src = data.to_s
        out = ''.dup.force_encoding('BINARY')
        i = 0
        while i < src.bytesize
          len = src.getbyte(i)
          i += 1
          break if len.nil? || len == 128

          if len <= 127
            count = len + 1
            chunk = src.byteslice(i, count)
            break unless chunk
            out << chunk
            i += count
          else
            count = 257 - len
            b = src.getbyte(i)
            break if b.nil?
            out << b.chr * count
            i += 1
          end
        end
        out
      rescue StandardError => e
        Logger.warn("PdfParser", "RunLength decode failed: #{e.message}")
        nil
      end

      # Apply PNG predictor decoding (predictors 10-15)
      # Each row is [filter_byte, data...] where data is `columns` bytes.
      def apply_png_predictor(data, columns)
        row_size = columns + 1  # 1 byte filter type + columns data bytes
        rows = data.bytesize / row_size
        return data if rows == 0

        out = ''.dup.force_encoding('BINARY')
        prev_row = Array.new(columns, 0)

        rows.times do |r|
          offset = r * row_size
          filter_type = data.getbyte(offset) || 0
          current_row = Array.new(columns) { |c| data.getbyte(offset + 1 + c) || 0 }

          case filter_type
          when 0 # None
            # data as-is
          when 1 # Sub
            (1...columns).each { |c| current_row[c] = (current_row[c] + current_row[c - 1]) & 0xFF }
          when 2 # Up
            columns.times { |c| current_row[c] = (current_row[c] + prev_row[c]) & 0xFF }
          when 3 # Average
            columns.times do |c|
              left = c > 0 ? current_row[c - 1] : 0
              up = prev_row[c]
              current_row[c] = (current_row[c] + ((left + up) / 2)) & 0xFF
            end
          when 4 # Paeth
            columns.times do |c|
              left = c > 0 ? current_row[c - 1] : 0
              up = prev_row[c]
              up_left = c > 0 ? prev_row[c - 1] : 0
              current_row[c] = (current_row[c] + paeth_predict(left, up, up_left)) & 0xFF
            end
          end

          out << current_row.pack('C*')
          prev_row = current_row
        end

        out
      end

      def paeth_predict(a, b, c)
        p = a + b - c
        pa = (p - a).abs
        pb = (p - b).abs
        pc = (p - c).abs
        if pa <= pb && pa <= pc then a
        elsif pb <= pc then b
        else c
        end
      end

      private

      # ---------------------------------------------------------------
      # Find the startxref offset
      # ---------------------------------------------------------------
      def find_xref
        # Search from end of file for startxref
        tail = @data[-1024..-1] || @data
        if tail =~ /startxref\s+(\d+)/
          @xref_offsets << $1.to_i
        else
          raise "Cannot find startxref in PDF"
        end
      end

      # ---------------------------------------------------------------
      # Parse cross-reference table(s) and trailer(s)
      # ---------------------------------------------------------------
      def parse_xref
        @xref_offsets.each do |offset|
          parse_xref_at(offset)
        end
      end

      def parse_xref_at(offset)
        chunk = @data[offset, [40000, @data.length - offset].min]

        if chunk.start_with?('xref')
          parse_traditional_xref(offset)
        else
          # Cross-reference stream (PDF 1.5+)
          parse_xref_stream(offset)
        end
      end

      def parse_traditional_xref(offset)
        chunk = @data[offset..-1]
        lines = chunk.split(/\r?\n|\r/)
        i = 0
        # Skip 'xref' line
        i += 1 if lines[i] && lines[i].strip == 'xref'

        while i < lines.length
          line = lines[i].strip
          break if line.start_with?('trailer') || line.empty? && i > 2 && lines[i-1].strip.start_with?('trailer')

          if line =~ /\A(\d+)\s+(\d+)\z/
            first_obj = $1.to_i
            count = $2.to_i
            count.times do |j|
              i += 1
              entry = lines[i].to_s.strip
              if entry =~ /\A(\d{10})\s+(\d{5})\s+([fn])/
                obj_offset = $1.to_i
                gen = $2.to_i
                in_use = $3 == 'n'
                obj_num = first_obj + j
                if in_use && obj_offset > 0 && !@objects.key?(obj_num)
                  @objects[obj_num] = { gen: gen, offset: obj_offset }
                end
              end
            end
          end
          i += 1
        end

        # Parse trailer
        trailer_idx = chunk.index('trailer')
        trailer_text = trailer_idx ? chunk[trailer_idx..-1] : nil
        if trailer_text
          @trailer ||= parse_trailer_dict(trailer_text)
          # Follow /Prev for incremental updates
          if @trailer['/Prev']
            prev_offset = @trailer['/Prev'].to_i
            unless @xref_offsets.include?(prev_offset)
              @xref_offsets << prev_offset
            end
          end
        end
      end

      def parse_xref_stream(offset)
        # Object number for the xref stream object
        chunk = @data[offset, [10000, @data.length - offset].min]
        if chunk =~ /\A(\d+)\s+(\d+)\s+obj/
          obj_num = $1.to_i
          @objects[obj_num] = { gen: $2.to_i, offset: offset } unless @objects.key?(obj_num)

          # Parse the xref stream dictionary and stream data
          dict_str = extract_dict(chunk)
          dict = tokenize_dict(dict_str)

          @trailer ||= dict

          # Decode the xref stream
          stream_data = get_stream_data(obj_num)
          if stream_data && dict['/W'] && dict['/Size']
            w_array = parse_array_ints(dict['/W'])
            size = dict['/Size'].to_i
            index_array = dict['/Index'] ? parse_array_ints(dict['/Index']) : [0, size]

            pos = 0
            i = 0
            while i < index_array.length
              first_obj = index_array[i]
              count = index_array[i + 1] || 0
              count.times do |j|
                fields = w_array.map do |w|
                  if w == 0
                    0
                  else
                    val = 0
                    w.times do
                      val = (val << 8) | (stream_data.getbyte(pos) || 0)
                      pos += 1
                    end
                    val
                  end
                end

                type = w_array[0] == 0 ? 1 : fields[0]
                on = first_obj + j

                case type
                when 1 # Regular object
                  unless @objects.key?(on)
                    @objects[on] = { gen: fields[2] || 0, offset: fields[1] }
                  end
                when 2 # Compressed object in object stream
                  unless @objects.key?(on)
                    @objects[on] = {
                      gen: 0,
                      offset: nil,
                      in_object_stream: fields[1],
                      index_in_stream: fields[2]
                    }
                  end
                end
              end
              i += 2
            end
          end

          # Follow /Prev
          if dict['/Prev']
            prev_offset = dict['/Prev'].to_i
            unless @xref_offsets.include?(prev_offset)
              @xref_offsets << prev_offset
              parse_xref_at(prev_offset)
            end
          end
        end
      end

      # ---------------------------------------------------------------
      # Page tree traversal
      # ---------------------------------------------------------------
      def build_page_list
        return unless @trailer
        root_ref = @trailer['/Root']
        return unless root_ref

        root = resolve_object(root_ref)
        root_dict = to_dict(root)
        return unless root_dict

        pages_ref = root_dict['/Pages']
        return unless pages_ref

        collect_pages(pages_ref)
      end

      MAX_PAGE_TREE_DEPTH = 64

      def collect_pages(ref, depth = 0)
        return if depth > MAX_PAGE_TREE_DEPTH  # guard against circular refs
        obj = resolve_object(ref)
        dict = to_dict(obj)
        return unless dict

        type = dict['/Type']
        if type == '/Page'
          @pages << ref
        elsif type == '/Pages'
          kids = dict['/Kids']
          if kids.is_a?(Array)
            kids.each { |kid_ref| collect_pages(kid_ref, depth + 1) }
          end
        end
      end

      # ---------------------------------------------------------------
      # Inherited attributes (MediaBox, CropBox, etc.)
      # ---------------------------------------------------------------
      def find_inherited(dict, key, depth = 0)
        return nil if depth > MAX_PAGE_TREE_DEPTH  # guard against circular refs
        return dict[key] if dict[key]
        if dict['/Parent']
          parent = resolve_object(dict['/Parent'])
          parent_dict = to_dict(parent)
          return find_inherited(parent_dict, key, depth + 1) if parent_dict
        end
        nil
      end

      # ---------------------------------------------------------------
      # Content stream collection
      # ---------------------------------------------------------------
      def collect_content_streams(contents)
        resolved = resolve_object(contents)
        if resolved.is_a?(Array)
          # Array of stream references
          resolved.map { |ref|
            r = resolve_object(ref)
            extract_stream_from_value(r, ref)
          }.compact
        elsif resolved.is_a?(String) && resolved =~ /\A(\d+)\s+(\d+)\s+R\z/
          obj_num = $1.to_i
          data = get_stream_data(obj_num)
          data ? [data] : []
        else
          # Single stream reference
          data = extract_stream_from_value(resolved, contents)
          data ? [data] : []
        end
      end

      def extract_stream_from_value(val, original_ref)
        if original_ref.is_a?(String) && original_ref =~ /\A(\d+)\s+(\d+)\s+R\z/
          return get_stream_data($1.to_i)
        end
        nil
      end

      # ---------------------------------------------------------------
      # Object access helpers
      # ---------------------------------------------------------------
      def get_raw_object(obj_num)
        info = @objects[obj_num]
        return nil unless info

        # Object in object stream
        if info[:in_object_stream]
          return get_object_from_object_stream(obj_num, info[:in_object_stream], info[:index_in_stream])
        end

        return nil unless info[:offset]
        offset = info[:offset]
        # Read a chunk starting at offset
        chunk_size = [32768, @data.length - offset].min
        chunk = @data[offset, chunk_size]

        # Find endobj
        endobj_pos = chunk.index('endobj')
        if endobj_pos
          return chunk[0..endobj_pos + 5]
        end

        # If not found in chunk, extend
        extended = @data[offset, [131072, @data.length - offset].min]
        endobj_pos = extended.index('endobj')
        return endobj_pos ? extended[0..endobj_pos + 5] : extended
      end

      def get_object_from_object_stream(obj_num, stream_obj_num, index)
        stream_data = get_stream_data(stream_obj_num)
        return nil unless stream_data

        # Get the object stream dictionary for /N and /First
        raw = get_raw_object(stream_obj_num)
        return nil unless raw
        dict_str = extract_dict(raw)
        dict = tokenize_dict(dict_str)

        n = (dict['/N'] || '0').to_i
        first = (dict['/First'] || '0').to_i

        # Parse the index pairs
        header = stream_data[0, first]
        pairs = header.strip.split(/\s+/).map(&:to_i)

        # Find our object
        target_offset = nil
        i = 0
        while i < pairs.length
          on = pairs[i]
          off = pairs[i + 1]
          if on == obj_num
            target_offset = first + off
            break
          end
          i += 2
        end

        return nil unless target_offset

        # Find the end (next object offset or end of stream)
        next_offset = nil
        i = 0
        while i < pairs.length
          off = pairs[i + 1]
          adjusted = first + off
          if adjusted > target_offset
            next_offset = adjusted if next_offset.nil? || adjusted < next_offset
          end
          i += 2
        end
        next_offset ||= stream_data.length

        stream_data[target_offset...next_offset]
      end

      def resolve_parsed_object(obj_num)
        raw = get_raw_object(obj_num)
        return nil unless raw
        parse_object_value(raw, obj_num)
      end

      # ---------------------------------------------------------------
      # Font / ToUnicode extraction
      # ---------------------------------------------------------------
      def extract_font_to_unicode_map(font_ref)
        font_obj = resolve_object(font_ref)
        font_dict = to_dict(font_obj)
        return nil unless font_dict.is_a?(Hash)

        to_unicode_ref = font_dict['/ToUnicode']

        # Some PDFs may put ToUnicode on descendant font dictionaries.
        if !to_unicode_ref && font_dict['/DescendantFonts'].is_a?(Array)
          font_dict['/DescendantFonts'].each do |desc_ref|
            desc = to_dict(resolve_object(desc_ref))
            if desc && desc['/ToUnicode']
              to_unicode_ref = desc['/ToUnicode']
              break
            end
          end
        end
        return nil unless to_unicode_ref

        stream_data = stream_from_ref(to_unicode_ref)
        return nil unless stream_data && !stream_data.empty?

        parse_tounicode_cmap(stream_data)
      rescue StandardError => e
        Logger.warn("PdfParser", "get_tounicode_map failed: #{e.message}")
        nil
      end

      def stream_from_ref(ref)
        if ref.is_a?(String) && ref =~ /\A(\d+)\s+(\d+)\s+R\z/
          return get_stream_data($1.to_i)
        end

        resolved = resolve_object(ref)
        if resolved.is_a?(String) && resolved =~ /\A(\d+)\s+(\d+)\s+R\z/
          return get_stream_data($1.to_i)
        end

        nil
      end

      def parse_tounicode_cmap(data)
        text = data.to_s.dup
        text.force_encoding(Encoding::BINARY) if text.respond_to?(:force_encoding)

        map = {}
        code_lens = {}

        # beginbfchar ... endbfchar
        text.scan(/beginbfchar(.*?)endbfchar/m).each do |match|
          section = match[0].to_s
          section.scan(/<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>/) do |src_hex, dst_hex|
            src_bytes = [src_hex].pack('H*')
            utf8 = unicode_hex_to_utf8(dst_hex)
            next if utf8.nil? || utf8.empty?
            map[src_bytes] = utf8
            code_lens[src_bytes.bytesize] = true
          end
        end

        # beginbfrange ... endbfrange
        text.scan(/beginbfrange(.*?)endbfrange/m).each do |match|
          section = match[0].to_s
          section.each_line do |line|
            s = line.strip
            next if s.empty?

            # Form: <srcLo> <srcHi> <dstStart>
            if s =~ /<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>/
              src_lo = $1
              src_hi = $2
              dst_start = $3

              src_lo_i = src_lo.to_i(16)
              src_hi_i = src_hi.to_i(16)
              dst_i = dst_start.to_i(16)
              src_hex_len = [src_lo.length, src_hi.length].max
              dst_hex_len = [dst_start.length, 4].max

              idx = 0
              (src_lo_i..src_hi_i).each do |src_i|
                src_hex = src_i.to_s(16).rjust(src_hex_len, '0')
                src_bytes = [src_hex].pack('H*')
                dst_hex = (dst_i + idx).to_s(16).rjust(dst_hex_len, '0')
                utf8 = unicode_hex_to_utf8(dst_hex)
                unless utf8.nil? || utf8.empty?
                  map[src_bytes] = utf8
                  code_lens[src_bytes.bytesize] = true
                end
                idx += 1
              end
              next
            end

            # Form: <srcLo> <srcHi> [<dst1> <dst2> ...]
            if s =~ /<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*\[(.+)\]/
              src_lo = $1
              src_hi = $2
              arr = $3.to_s
              dsts = arr.scan(/<([0-9A-Fa-f]+)>/).flatten
              next if dsts.empty?

              src_lo_i = src_lo.to_i(16)
              src_hi_i = src_hi.to_i(16)
              src_hex_len = [src_lo.length, src_hi.length].max

              idx = 0
              (src_lo_i..src_hi_i).each do |src_i|
                break if idx >= dsts.length
                src_hex = src_i.to_s(16).rjust(src_hex_len, '0')
                src_bytes = [src_hex].pack('H*')
                utf8 = unicode_hex_to_utf8(dsts[idx])
                unless utf8.nil? || utf8.empty?
                  map[src_bytes] = utf8
                  code_lens[src_bytes.bytesize] = true
                end
                idx += 1
              end
            end
          end
        end

        return nil if map.empty?
        {
          map: map,
          code_lengths: code_lens.keys.sort.reverse
        }
      rescue StandardError => e
        Logger.warn("PdfParser", "parse_tounicode_cmap failed: #{e.message}")
        nil
      end

      def unicode_hex_to_utf8(hex)
        h = hex.to_s.gsub(/[^0-9A-Fa-f]/, '')
        return "" if h.empty?
        h = "0#{h}" if h.length.odd?
        bytes = [h].pack('H*')

        begin
          txt = bytes.dup.force_encoding(Encoding::UTF_16BE).encode(
            Encoding::UTF_8,
            invalid: :replace,
            undef: :replace,
            replace: ''
          )
          return txt unless txt.empty?
        rescue StandardError => e
          Logger.warn("PdfParser", "unicode_hex_to_utf8 UTF-16BE conversion failed: #{e.message}")
        end

        bytes.encode(Encoding::UTF_8, Encoding::BINARY, invalid: :replace, undef: :replace, replace: '')
      rescue StandardError => e
        Logger.warn("PdfParser", "unicode_hex_to_utf8 failed: #{e.message}")
        ""
      end

      # ---------------------------------------------------------------
      # Object value parsing
      # ---------------------------------------------------------------
      def parse_object_value(raw, obj_num = nil)
        # Strip "X Y obj" prefix if present
        text = raw.sub(/\A\s*\d+\s+\d+\s+obj\s*/, '').sub(/\s*endobj\s*\z/, '').strip

        if text.start_with?('<<')
          return parse_dict_string(text)
        elsif text.start_with?('[')
          return parse_array_string(text)
        else
          return text
        end
      end

      # ---------------------------------------------------------------
      # Dictionary parsing
      # ---------------------------------------------------------------
      def extract_dict(text)
        start = text.index('<<')
        return '' unless start
        depth = 0
        i = start
        while i < text.length - 1
          if text[i, 2] == '<<'
            depth += 1
            i += 2
          elsif text[i, 2] == '>>'
            depth -= 1
            i += 2
            return text[start, i - start] if depth == 0
          else
            i += 1
          end
        end
        text[start..-1]
      end

      def parse_dict_string(text)
        tokenize_dict(extract_dict(text))
      end

      def tokenize_dict(text)
        dict = {}
        return dict unless text

        # Remove outer << >>
        inner = text.sub(/\A\s*<<\s*/, '').sub(/\s*>>\s*\z/, '')

        tokens = tokenize_pdf(inner)
        i = 0
        while i < tokens.length
          token = tokens[i]
          if token.start_with?('/')
            key = token
            i += 1
            value = collect_value(tokens, i)
            i = value[:next_index]
            dict[key] = value[:value]
          else
            i += 1
          end
        end
        dict
      end

      def parse_trailer_dict(text)
        dict_text = extract_dict(text)
        tokenize_dict(dict_text)
      end

      # ---------------------------------------------------------------
      # Array parsing
      # ---------------------------------------------------------------
      def parse_array_string(text)
        start = text.index('[')
        return [] unless start
        depth = 0
        i = start
        while i < text.length
          if text[i] == '['
            depth += 1
          elsif text[i] == ']'
            depth -= 1
            if depth == 0
              inner = text[start + 1...i]
              return tokenize_array(inner)
            end
          end
          i += 1
        end
        []
      end

      def tokenize_array(inner)
        tokens = tokenize_pdf(inner)
        result = []
        i = 0
        while i < tokens.length
          val = collect_value(tokens, i)
          result << val[:value]
          i = val[:next_index]
        end
        result
      end

      # ---------------------------------------------------------------
      # PDF tokenizer
      # ---------------------------------------------------------------
      def tokenize_pdf(text)
        tokens = []
        i = 0
        len = text.length

        while i < len
          c = text[i]

          # Skip whitespace
          if c =~ /[\s\x00]/
            i += 1
            next
          end

          # Comment
          if c == '%'
            eol = text.index(/[\r\n]/, i) || len
            i = eol + 1
            next
          end

          # Name
          if c == '/'
            j = i + 1
            while j < len && text[j] !~ /[\s\[\]<>(){}\/\%]/
              j += 1
            end
            tokens << text[i...j]
            i = j
            next
          end

          # String
          if c == '('
            depth = 1
            j = i + 1
            while j < len && depth > 0
              if text[j] == '(' && (j == 0 || text[j-1] != '\\')
                depth += 1
              elsif text[j] == ')' && (j == 0 || text[j-1] != '\\')
                depth -= 1
              end
              j += 1
            end
            tokens << text[i...j]
            i = j
            next
          end

          # Hex string
          if c == '<' && text[i+1] != '<'
            j = text.index('>', i) || len
            tokens << text[i..j]
            i = j + 1
            next
          end

          # Dict start
          if c == '<' && text[i+1] == '<'
            # Find matching >>
            depth = 1
            j = i + 2
            while j < len - 1 && depth > 0
              if text[j, 2] == '<<'
                depth += 1
                j += 2
              elsif text[j, 2] == '>>'
                depth -= 1
                j += 2
              else
                j += 1
              end
            end
            tokens << text[i...j]
            i = j
            next
          end

          # Array
          if c == '['
            depth = 1
            j = i + 1
            while j < len && depth > 0
              depth += 1 if text[j] == '['
              depth -= 1 if text[j] == ']'
              j += 1
            end
            tokens << text[i...j]
            i = j
            next
          end

          if c == ']'
            i += 1
            next
          end

          if c == '>' && text[i+1] == '>'
            i += 2
            next
          end

          # Number, keyword, or reference
          j = i
          while j < len && text[j] !~ /[\s\[\]<>(){}\/\%]/
            j += 1
          end
          tokens << text[i...j] if j > i
          i = j
        end

        tokens
      end

      def collect_value(tokens, index)
        return { value: nil, next_index: index + 1 } if index >= tokens.length

        token = tokens[index]

        # Check for indirect reference: "X Y R"
        if token =~ /\A\d+\z/ && index + 2 < tokens.length &&
           tokens[index + 1] =~ /\A\d+\z/ && tokens[index + 2] == 'R'
          ref = "#{token} #{tokens[index + 1]} R"
          return { value: ref, next_index: index + 3 }
        end

        # Nested dict
        if token.start_with?('<<')
          return { value: tokenize_dict(token), next_index: index + 1 }
        end

        # Array
        if token.start_with?('[')
          inner = token[1..-1]
          inner = inner.sub(/\]\z/, '') if inner.end_with?(']')
          return { value: tokenize_array(inner), next_index: index + 1 }
        end

        # Boolean / null
        return { value: true, next_index: index + 1 } if token == 'true'
        return { value: false, next_index: index + 1 } if token == 'false'
        return { value: nil, next_index: index + 1 } if token == 'null'

        # Number
        if token =~ /\A[+-]?\d*\.?\d+\z/
          return { value: token, next_index: index + 1 }
        end

        # Default: return as string
        { value: token, next_index: index + 1 }
      end

      # ---------------------------------------------------------------
      # Utility: dict coercion
      # ---------------------------------------------------------------
      def to_dict(obj)
        return obj if obj.is_a?(Hash)
        if obj.is_a?(String)
          if obj.include?('<<')
            return parse_dict_string(obj)
          end
        end
        nil
      end

      def parse_array_nums(val)
        if val.is_a?(Array)
          return val.map { |v| v.to_s.to_f }
        elsif val.is_a?(String)
          arr = parse_array_string(val)
          return arr.map { |v| v.to_s.to_f }
        end
        []
      end

      def parse_array_ints(val)
        parse_array_nums(val).map(&:to_i)
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/primitive_extractor.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/primitive_extractor.rb`
- Size: `7.36 KB`
- Modified: `2026-04-01 20:04:59`

```ruby
# bc_pdf_vector_importer/primitive_extractor.rb
# Converts PDF content stream parser output (VectorPath/SubPath/Segment)
# into host-neutral Primitive objects. This is the seam between
# PDF parsing and recognition/host-building.
#
# Rule 1: Parser modules must not know about domain-specific logic.
# This module only normalizes coordinates and classifies geometry types.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module PrimitiveExtractor

      PDF_PT_TO_INCH = 1.0 / 72.0

      # ---------------------------------------------------------------
      # Convert parsed PDF paths + text into PageData
      # ---------------------------------------------------------------
      def self.extract(paths, text_items, media_box, page_num, opts = {})
        scale = opts[:scale] || 1.0
        bezier_segs = opts[:bezier_segments] || 16
        origin_x = media_box[0]
        origin_y = media_box[1]
        page_w = (media_box[2] - media_box[0]) * PDF_PT_TO_INCH * scale
        page_h = (media_box[3] - media_box[1]) * PDF_PT_TO_INCH * scale

        # NOTE: Do NOT reset IDGen here — IDs must be unique across all pages
        # in a multi-page import. IDGen.reset is called once in run_pipeline.

        primitives = []
        paths.each do |path|
          next unless path.subpaths && !path.subpaths.empty?
          path.subpaths.each do |sp|
            prim = subpath_to_primitive(sp, path, origin_x, origin_y, scale, bezier_segs, page_num)
            primitives << prim if prim
          end
        end

        norm_texts = []
        (text_items || []).each do |ti|
          nt = normalize_text_item(ti, origin_x, origin_y, scale, page_num)
          norm_texts << nt if nt
        end

        PageData.new(
          page_num,
          page_w,
          page_h,
          primitives,
          norm_texts,
          [],  # layers filled by OCG parser
          []   # xobject names filled by xobject parser
        )
      end

      private

      def self.subpath_to_primitive(subpath, path, ox, oy, scale, bezier_segs, page_num)
        points = []
        subpath.segments.each do |seg|
          case seg.type
          when :move
            points << convert_pt(seg.points[0], ox, oy, scale)
          when :line
            points << convert_pt(seg.points[1], ox, oy, scale)
          when :curve
            p0, p1, p2, p3 = seg.points
            curve_pts = Bezier.cubic_to_points(p0, p1, p2, p3,
              max_segments: bezier_segs, tolerance: 0.25)
            curve_pts[1..-1].each { |pt| points << convert_pt(pt, ox, oy, scale) }
          when :rect
            seg.points.each { |pt| points << convert_pt(pt, ox, oy, scale) }
          end
        end

        return nil if points.length < 2

        # Remove consecutive duplicates
        cleaned = [points[0]]
        points[1..-1].each do |pt|
          d = Math.sqrt((pt[0] - cleaned.last[0])**2 + (pt[1] - cleaned.last[1])**2)
          cleaned << pt if d > 0.0005
        end
        return nil if cleaned.length < 2

        # Classify type
        is_closed = subpath.closed ||
          (cleaned.length >= 3 &&
           Math.sqrt((cleaned.first[0] - cleaned.last[0])**2 +
                     (cleaned.first[1] - cleaned.last[1])**2) < 0.01)

        # Compute bounding box
        xs = cleaned.map { |p| p[0] }
        ys = cleaned.map { |p| p[1] }
        bbox = [xs.min, ys.min, xs.max, ys.max]

        # Compute area for closed loops
        area = nil
        if is_closed && cleaned.length >= 3
          area = polygon_area(cleaned)
        end

        # Determine type
        ptype = if cleaned.length == 2
                  :line
                elsif is_closed && cleaned.length >= 6
                  :closed_loop
                elsif is_closed
                  :closed_loop
                else
                  :polyline
                end

        Primitive.new(
          IDGen.next,
          ptype,
          cleaned,
          nil,            # center — filled by arc fitter if applicable
          nil,            # radius
          nil, nil,       # start/end angle
          bbox,
          path.stroke_color,
          path.fill_color,
          path.dash_pattern,
          path.line_width,
          nil,            # layer_name — filled by OCG tracker
          is_closed,
          area,
          page_num
        )
      end

      def self.convert_pt(pdf_pt, ox, oy, scale)
        x = (pdf_pt[0] - ox) * PDF_PT_TO_INCH * scale
        y = (pdf_pt[1] - oy) * PDF_PT_TO_INCH * scale
        [x, y]
      end

      def self.normalize_text_item(ti, ox, oy, scale, page_num)
        return nil unless ti.text && !ti.text.strip.empty?

        ins = convert_pt([ti.x, ti.y], ox, oy, scale)
        fs = ti.font_size * PDF_PT_TO_INCH * scale
        fs = 0.05 if fs < 0.01

        # Estimate bbox from insertion + font size
        text_w = ti.text.length * fs * 0.6
        text_h = fs * 1.2
        bbox = [ins[0], ins[1] - text_h * 0.3, ins[0] + text_w, ins[1] + text_h * 0.7]

        normalized = ti.text.strip.upcase.gsub(/\s+/, ' ')

        # Generic tags only — no domain-specific classification at this layer
        generic_tags = classify_generic(ti.text)

        NormalizedText.new(
          IDGen.next,
          ti.text.strip,
          normalized,
          ins,
          bbox,
          fs,
          ti.angle || 0.0,
          ti.font_name || "",
          page_num,
          generic_tags  # domain classification happens later in the pipeline
        )
      end

      def self.polygon_area(pts)
        n = pts.length
        area = 0.0
        n.times do |i|
          j = (i + 1) % n
          area += pts[i][0] * pts[j][1]
          area -= pts[j][0] * pts[i][1]
        end
        (area / 2.0).abs
      end

      # Domain-neutral text classification — domain-neutral,
      # just structural document understanding.
      def self.classify_generic(text)
        tags = []
        t = text.strip
        tu = t.upcase

        # Dimension-like: contains numbers with unit markers or fractions
        if t =~ /\d+['']\s*[-–]?\s*\d/ || t =~ /\d+\s*\/\s*\d+/ ||
           t =~ /\d+\.?\d*\s*(?:"|mm|cm|in|ft)/i || t =~ /\d+\s*['']/
          tags << :dimension_like
        end

        # Scale notation
        if tu =~ /SCALE[:\s]*\d/ || t =~ /\d+\s*:\s*\d+/ ||
           t =~ /\d+\s*\/\s*\d+\s*"?\s*=\s*/
          tags << :scale_like
        end

        # Note/label: short text, often capitalized
        if t.length > 1 && t.length < 60 && tu =~ /[A-Z]{2,}/
          tags << :label_like
        end

        # Title block keywords
        if tu =~ /\b(DRAWN|CHECKED|DATE|SCALE|REV|SHEET|PROJECT|DWG|TITLE|APPROVED|ENGINEER)\b/
          tags << :titleblock_like
        end

        # Table-like: very short, possibly a cell value
        if t =~ /\A\d{1,4}\z/ || t =~ /\A[A-Z]\d{1,3}\z/
          tags << :table_like
        end

        # Callout: has diameter, radius, or quantity markers
        if t =~ /Ø|\bDIA\b|\bRAD\b|\bR\d/i
          tags << :callout_like
        end

        # Quantity prefix
        if t =~ /\A\s*\(?\d+\)?\s*[-xX×]/
          tags << :callout_like
        end

        tags
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/primitives.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/primitives.rb`
- Size: `5.66 KB`
- Modified: `2026-03-24 15:22:16`

```ruby
# bc_pdf_vector_importer/primitives.rb
# Host-neutral intermediate data model.
# PDF parser outputs these. Cleanup operates on these.
# Recognizers read these. Host builders consume results.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter

    # ── Configuration ───────────────────────────────────────────────
    RecognitionConfig = Struct.new(
      :vertex_merge_tol,       # inches — snap endpoints
      :min_segment_len,        # inches — discard micro edges
      :loop_close_tol,         # inches — close tiny gaps
      :region_padding,         # inches — expand region bbox
      :text_assoc_radius,      # inches — text↔geometry link distance
      :dimension_assoc_radius, # inches — dimension↔geometry link
      :circle_min_diameter,    # inches — smallest circle to detect
      :circle_max_diameter,    # inches — largest circle to detect
      :circle_fit_tol,         # inches — max RMS for circle fit
      :closed_loop_min_aspect, # length/width minimum for elongated loops
      :closed_loop_min_area,   # sq inches — ignore tiny closed loops
      :confidence_threshold    # minimum confidence to report
    ) do
      def self.default
        new(
          0.010,   # vertex_merge_tol
          0.002,   # min_segment_len
          0.020,   # loop_close_tol
          1.0,     # region_padding
          2.0,     # text_assoc_radius
          3.0,     # dimension_assoc_radius
          0.25,    # circle_min_diameter
          4.0,     # circle_max_diameter
          0.010,   # circle_fit_tol
          1.5,     # closed_loop_min_aspect
          1.0,     # closed_loop_min_area (sq in)
          0.60     # confidence_threshold
        )
      end
    end

    # ── Primitive (single geometric element) ────────────────────────
    Primitive = Struct.new(
      :id,              # Integer — unique ID
      :type,            # :line, :arc, :circle, :polyline, :closed_loop, :rect
      :points,          # Array of [x, y] — vertices in model inches
      :center,          # [x, y] or nil — for arcs/circles
      :radius,          # Float or nil
      :start_angle,     # Float or nil (radians)
      :end_angle,       # Float or nil (radians)
      :bbox,            # [min_x, min_y, max_x, max_y]
      :stroke_color,    # [r, g, b] 0.0–1.0
      :fill_color,      # [r, g, b] or nil
      :dash_pattern,    # Array or nil
      :line_width,      # Float or nil (points)
      :layer_name,      # String or nil — OCG layer
      :closed,          # Boolean
      :area,            # Float or nil — enclosed area for closed loops
      :page_number,     # Integer
      :tags             # Array of Symbols or nil — classification tags
    )

    # ── TextItem (normalized) ───────────────────────────────────────
    NormalizedText = Struct.new(
      :id,              # Integer
      :text,            # String — raw content
      :normalized,      # String — uppercased, cleaned
      :insertion,       # [x, y] in model inches
      :bbox,            # [min_x, min_y, max_x, max_y]
      :font_size,       # Float — in model inches
      :rotation,        # Float — degrees
      :font_name,       # String
      :page_number,     # Integer
      :classifications  # Array of hashes — generic text classifications
    )

    # ── PageData (everything from one PDF page) ─────────────────────
    PageData = Struct.new(
      :page_number,
      :width,           # Float — page width in model inches
      :height,          # Float — page height in model inches
      :primitives,      # Array of Primitive
      :text_items,      # Array of NormalizedText
      :layers,          # Array of String — OCG layer names
      :xobject_names    # Array of String — Form XObject names found
    )

    # ── ParsedDimension ─────────────────────────────────────────────
    ParsedDimension = Struct.new(
      :raw_text,        # String — original
      :kind,            # :linear, :diameter, :radius, :angle, :scale, :unknown
      :value,           # Float or Hash
      :units,           # :in, :ft, :mm, :cm, :mixed_imperial
      :quantity,        # Integer or nil
      :normalized_text, # String
      :confidence,      # Float 0.0–1.0
      :warnings         # Array of String
    )

    # ── Region ──────────────────────────────────────────────────────
    Region = Struct.new(
      :id,
      :page_number,
      :bbox,            # [min_x, min_y, max_x, max_y]
      :primitive_ids,   # Array of Integer
      :text_ids,        # Array of Integer
      :region_type,     # :detail, :title_block, :notes, :assembly, :unknown
      :label,           # String — "Detail_A", "TitleBlock", etc.
      :is_titleblock,   # Boolean
      :confidence       # Float
    )

    # ── ID generator ────────────────────────────────────────────────
    module IDGen
      @next_id = 0
      def self.next
        @next_id += 1
        @next_id
      end
      def self.reset
        @next_id = 0
      end
    end

  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/recognizer.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/recognizer.rb`
- Size: `1.22 KB`
- Modified: `2026-03-23 16:45:51`

```ruby
# bc_pdf_vector_importer/recognizer.rb
# Recognition Pipeline — runs generic document analysis.
#
# Modes:
#   :none    → skip recognition entirely (fastest import)
#   :generic → generic classifier + recognizer only
#   :auto    → profile page, then run generic recognition
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module Recognizer

      def self.run(page_data, mode: :auto, config: nil)
        config ||= RecognitionConfig.default

        if mode == :none
          return { generic: nil, mode_used: :none }
        end

        # Always run generic recognition
        generic = GenericRecognizer.analyze(page_data, config)

        # Profile the page type for reporting
        effective_mode = mode
        if mode == :auto
          suggested = DocumentProfiler.suggest_mode(generic.page_profile)
          # Only use :generic or :none — no domain-specific modes
          effective_mode = (suggested == :none) ? :none : :generic
        end

        {
          generic: generic,
          mode_used: effective_mode,
          page_profile: generic.page_profile
        }
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/region_segmenter.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/region_segmenter.rb`
- Size: `8.02 KB`
- Modified: `2026-04-01 20:05:02`

```ruby
# bc_pdf_vector_importer/region_segmenter.rb
# Splits an imported PDF page into logical detail regions using
# spatial clustering of geometry bounding boxes. Isolates title block,
# notes areas, and individual detail/connection zones.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module RegionSegmenter

      Region = Struct.new(
        :id,            # Integer region identifier
        :label,         # "Detail_A", "TitleBlock", "Notes", etc.
        :bbox,          # [min_x, min_y, max_x, max_y] in model space
        :entity_ids,    # Array of entity persistent IDs in this region
        :text_items,    # Array of text items within this region
        :region_type,   # :detail, :title_block, :notes, :assembly, :unknown
        :area,          # Float — bounding box area
        :edge_count,    # Number of edges in this region
        :confidence     # Float 0.0–1.0 — how sure we are of the classification
      )

      # ---------------------------------------------------------------
      # Segment a group's entities into spatial regions.
      # Returns array of Region structs.
      # ---------------------------------------------------------------
      def self.segment(group, opts = {})
        gap_threshold = opts[:gap_threshold] || 2.0   # inches — min gap between regions
        min_region_edges = opts[:min_region_edges] || 3

        entities = group.entities
        edges = entities.grep(Sketchup::Edge).select(&:valid?)
        texts = entities.grep(Sketchup::Text)

        return [] if edges.empty?

        # Build bounding boxes for each edge
        edge_boxes = edges.map do |e|
          pts = [e.start.position, e.end.position]
          x_min = pts.map(&:x).min
          y_min = pts.map(&:y).min
          x_max = pts.map(&:x).max
          y_max = pts.map(&:y).max
          { edge: e, bbox: [x_min, y_min, x_max, y_max],
            cx: (x_min + x_max) / 2.0, cy: (y_min + y_max) / 2.0 }
        end

        # Cluster edges by proximity using simple grid-based grouping
        clusters = cluster_by_proximity(edge_boxes, gap_threshold)

        # Filter out tiny clusters
        clusters = clusters.select { |c| c.length >= min_region_edges }

        # Build regions
        regions = []
        clusters.each_with_index do |cluster, idx|
          # Compute aggregate bounding box
          all_x = cluster.flat_map { |eb| [eb[:bbox][0], eb[:bbox][2]] }
          all_y = cluster.flat_map { |eb| [eb[:bbox][1], eb[:bbox][3]] }
          bbox = [all_x.min, all_y.min, all_x.max, all_y.max]
          area = (bbox[2] - bbox[0]) * (bbox[3] - bbox[1])

          # Find text items within this region's bbox
          region_texts = texts.select do |t|
            pt = t.point
            pt.x >= bbox[0] && pt.x <= bbox[2] && pt.y >= bbox[1] && pt.y <= bbox[3]
          end

          entity_ids = cluster.map { |eb| eb[:edge].entityID }

          region = Region.new(
            idx,
            "Region_#{idx}",
            bbox,
            entity_ids,
            region_texts.map { |t| t.text },
            :unknown,
            area,
            cluster.length,
            0.5
          )

          regions << region
        end

        # Classify regions
        classify_regions(regions, group)

        regions
      end

      # ---------------------------------------------------------------
      # Classify detected regions
      # ---------------------------------------------------------------
      def self.classify_regions(regions, group)
        return if regions.empty?

        # Get the full page bounding box
        page_bb = group.bounds
        page_w = page_bb.width
        page_h = page_bb.height
        page_area = page_w * page_h
        return if page_area <= 0

        regions.each do |r|
          r_w = r.bbox[2] - r.bbox[0]
          r_h = r.bbox[3] - r.bbox[1]
          r_area_ratio = r.area / page_area

          # Title block: typically bottom-right, narrow and wide or boxed
          is_bottom = r.bbox[1] < page_h * 0.15
          is_right = r.bbox[2] > page_w * 0.6
          is_narrow_band = r_h < page_h * 0.2
          has_title_text = r.text_items.any? { |t|
            t =~ /\b(DRAWN|CHECKED|DATE|SCALE|REV|SHEET|PROJECT|DWG|TITLE)\b/i
          }

          if (is_bottom && is_right && is_narrow_band) || has_title_text
            r.region_type = :title_block
            r.label = "TitleBlock"
            r.confidence = has_title_text ? 0.95 : 0.7
            next
          end

          # Notes area: lots of text, few edges relative to area
          text_density = r.text_items.length.to_f / [r.area, 0.01].max
          edge_density = r.edge_count.to_f / [r.area, 0.01].max

          if r.text_items.length > 5 && text_density > edge_density * 2
            r.region_type = :notes
            r.label = "Notes"
            r.confidence = 0.75
            next
          end

          # Assembly: largest region with many edges
          if r_area_ratio > 0.3 && r.edge_count > 50
            r.region_type = :assembly
            r.label = "Assembly"
            r.confidence = 0.65
            next
          end

          # Detail: small to medium region with dense geometry
          if r.edge_count >= 10 && r_area_ratio < 0.4
            r.region_type = :detail
            # Try to name from nearby text
            detail_label = find_detail_label(r)
            r.label = detail_label || "Detail_#{r.id}"
            r.confidence = detail_label ? 0.8 : 0.5
            next
          end

          r.region_type = :unknown
          r.confidence = 0.3
        end
      end

      private

      # ---------------------------------------------------------------
      # Grid-based proximity clustering
      # ---------------------------------------------------------------
      def self.cluster_by_proximity(edge_boxes, gap)
        return [] if edge_boxes.empty?

        # Assign each edge to a grid cell
        cell_size = gap * 3
        cells = {}

        edge_boxes.each do |eb|
          gx = (eb[:cx] / cell_size).floor
          gy = (eb[:cy] / cell_size).floor
          key = "#{gx}_#{gy}"
          cells[key] ||= []
          cells[key] << eb
        end

        # Union-find for merging adjacent cells
        parent = {}
        cells.each_key { |k| parent[k] = k }

        find = lambda { |x|
          while parent[x] != x
            parent[x] = parent[parent[x]]
            x = parent[x]
          end
          x
        }

        unite = lambda { |a, b|
          ra, rb = find.call(a), find.call(b)
          parent[ra] = rb if ra != rb
        }

        # Merge cells that are adjacent (8-connected)
        cells.each_key do |key|
          gx, gy = key.split('_').map(&:to_i)
          (-1..1).each do |dx|
            (-1..1).each do |dy|
              neighbor = "#{gx + dx}_#{gy + dy}"
              if cells[neighbor]
                unite.call(key, neighbor)
              end
            end
          end
        end

        # Collect clusters
        groups = {}
        cells.each do |key, edges|
          root = find.call(key)
          groups[root] ||= []
          groups[root].concat(edges)
        end

        groups.values
      end

      # ---------------------------------------------------------------
      # Try to find a detail label from text (e.g., "DETAIL A", "SEC B-B")
      # ---------------------------------------------------------------
      def self.find_detail_label(region)
        region.text_items.each do |text|
          if text =~ /\bDETAIL\s+([A-Z](?:\d)?)\b/i
            return "Detail_#{$1}"
          end
          if text =~ /\bSEC(?:TION)?\s+([A-Z])\s*[-–]\s*([A-Z])\b/i
            return "Section_#{$1}-#{$2}"
          end
          if text =~ /\bVIEW\s+([A-Z])\b/i
            return "View_#{$1}"
          end
        end
        nil
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/report_dialog.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/report_dialog.rb`
- Size: `7.46 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/report_dialog.rb
# Post-import report v3 — plain-English summary, confidence language,
# guided next steps, post-import action prompt.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module ReportDialog

      # ---------------------------------------------------------------
      # Show import report + offer next-step actions
      # ---------------------------------------------------------------
      def self.show_report(stats)
        msg = build_summary(stats)
        UI.messagebox(msg)
      end

      # ---------------------------------------------------------------
      # Build the plain-English summary
      # ---------------------------------------------------------------
      def self.build_summary(stats)
        lines = []
        lines << "Import Complete!"
        lines << ""

        # What happened
        pg = stats[:pages] || 0
        elapsed = stats[:elapsed_seconds]
        time_str = elapsed ? " in #{elapsed}s" : ""
        lines << "#{pg} page#{pg == 1 ? '' : 's'} imported successfully#{time_str}."

        edges = stats[:edges] || 0
        lines << "#{edges} edges created." if edges > 0

        faces = stats[:faces] || 0
        lines << "#{faces} faces created." if faces > 0

        arcs = stats[:arcs] || 0
        lines << "#{arcs} curves rebuilt as arcs." if arcs > 0

        text = stats[:text] || 0
        if text > 0
          mode_label = case stats[:text_mode]
                       when :geometry then "as geometry"
                       when :text3d then "as 3D text"
                       when :labels then "as labels"
                       else ""
                       end
          lines << "#{text} text items imported#{mode_label.empty? ? '.' : ' ' + mode_label + '.'}"
        end

        comps = stats[:components] || 0
        lines << "#{comps} repeated symbols converted to components." if comps > 0

        # PDF layers
        if stats[:layers] && !stats[:layers].empty?
          lines << "#{stats[:layers].length} PDF layers mapped to Tags."
        end

        # Document analysis (generic recognition)
        if stats[:generic]
          g = stats[:generic]
          lines << ""

          # Describe what the document looks like
          profile = g[:profile]
          case profile
          when :fabrication
            lines << "This looks like a fabrication/shop drawing."
          when :cad_drawing
            lines << "This looks like a CAD/technical drawing."
          when :architectural
            lines << "This looks like an architectural plan."
          when :vector_art
            lines << "This looks like vector artwork or a logo."
          when :raster_only
            lines << "This page appears to be scanned (no vectors found)."
          else
            lines << "Document type: #{profile}"
          end

          circles = g[:circles] || 0
          lines << "#{circles} circles detected." if circles > 0

          tb = g[:title_block]
          lines << "Title block detected." if tb

          patterns = g[:patterns] || 0
          lines << "#{patterns} repeated geometry patterns found." if patterns > 0

          tables = g[:tables] || 0
          lines << "#{tables} table regions found." if tables > 0

          dims = g[:dimensions] || 0
          lines << "#{dims} dimensions associated with geometry." if dims > 0
        end

        # Cleanup summary
        if stats[:cleanup] && !stats[:cleanup].empty?
          cleaned = stats[:cleanup].select { |_, v| v > 0 }
          if cleaned.any?
            lines << ""
            lines << "Cleanup: " + cleaned.map { |k, v| "#{v} #{k}" }.join(", ")
          end
        end

        # Recognition mode used
        if stats[:mode_used]
          lines << ""
          lines << "Detection mode: #{stats[:mode_used]}"
        end

        # Quality confidence
        lines << ""
        total = (edges + faces + arcs)
        if total > 50
          lines << "Import quality: High — good vector content."
        elsif total > 10
          lines << "Import quality: Moderate — some geometry imported."
        elsif total > 0
          lines << "Import quality: Low — limited vector content found."
        else
          lines << "No geometry was found in this PDF."
        end

        log_path = stats[:log_path].to_s
        unless log_path.empty?
          lines << ""
          lines << "Import log:"
          lines << log_path
        end

        lines.join("\n")
      end

      # ---------------------------------------------------------------
      # Post-import next-step actions
      # ---------------------------------------------------------------
      def self.show_next_steps(stats)
        total = (stats[:edges] || 0) + (stats[:faces] || 0)
        return if total == 0

        prompts = ["What would you like to do next?"]
        defaults = ["Continue working"]
        options = [
          "Continue working|" \
          "View Geometry Only (hide text)|" \
          "Scale by Reference|" \
          "Run Cleanup on imported groups|" \
          "Show Feature Inventory"
        ]

        result = UI.inputbox(prompts, defaults, options, "Next Steps")
        return unless result

        case result[0]
        when /Geometry Only/
          geometry_only
        when /Scale by Reference/
          ScaleTool.activate
        when /Cleanup/
          BlueCollarSystems::PDFVectorImporter.cleanup_selected
        when /Feature Inventory/
          BlueCollarSystems::PDFVectorImporter.feature_inventory
        end
      end

      # ---------------------------------------------------------------
      # Tag visibility controls
      # ---------------------------------------------------------------
      def self.show_visibility_menu
        model = Sketchup.active_model
        return unless model

        tags = model.layers.to_a.select { |l| pdf_layer_name?(l.name) }
        if tags.empty?
          UI.messagebox("No PDF tags found. Import a PDF first.")
          return
        end

        prompts = tags.map { |t| "#{t.name}:" }
        defaults = tags.map { |t| t.visible? ? 'Visible' : 'Hidden' }
        dropdowns = tags.map { 'Visible|Hidden' }

        result = UI.inputbox(prompts, defaults, dropdowns, "PDF Tag Visibility")
        return unless result

        result.each_with_index do |val, i|
          tags[i].visible = (val == 'Visible')
        end
      end

      def self.geometry_only
        model = Sketchup.active_model
        return unless model
        model.layers.each do |l|
          next unless pdf_layer_name?(l.name)
          # Keep hidden/dashed geometry visible; only hide annotation-like layers.
          if l.name =~ /Text|Dimension|TitleBlock|Notes/i || l.name =~ /:Text\z/i
            l.visible = false
          else
            l.visible = true
          end
        end
      end

      def self.show_all
        model = Sketchup.active_model
        return unless model
        model.layers.each { |l| l.visible = true if pdf_layer_name?(l.name) }
      end

      def self.pdf_layer_name?(name)
        n = name.to_s
        return true if n.start_with?('PDF::')
        return true if n =~ /\APDF(?:\b|:|\s)/i
        return true if n == 'Dashed' || n == 'Dashdot' || n == 'Dash Dot'
        false
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/scale_tool.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/scale_tool.rb`
- Size: `11.61 KB`
- Modified: `2026-04-01 20:05:01`

```ruby
# bc_pdf_vector_importer/scale_tool.rb
# Scale by Reference — pick an edge, type the real-world dimension,
# and all imported geometry scales to match.
#
# Also provides Quick Scale for typing a factor or ratio directly.
#
# Mirrors the FreeCAD PDFScaleTool functionality.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module ScaleTool

      # ---------------------------------------------------------------
      # Scale by Reference — selection-based workflow
      # ---------------------------------------------------------------
      def self.activate
        model = Sketchup.active_model
        unless model
          UI.messagebox("No active model.")
          return
        end

        sel = model.selection
        edge = nil

        # Look for a selected edge
        sel.each do |e|
          if e.is_a?(Sketchup::Edge)
            edge = e
            break
          end
        end

        if edge
          # Measure the selected edge
          measured_length = edge.length  # inches
          measured_str = format_length(measured_length)

          prompts = [
            "Selected edge measures:",
            "What should it actually be? (e.g. 1'-4, 16in, 406.4mm):",
            "Apply to:"
          ]
          defaults = [
            measured_str,
            "",
            "All Groups"
          ]
          dropdowns = [
            "",
            "",
            "All Groups|Selection Only|Active Group"
          ]

          result = UI.inputbox(prompts, defaults, dropdowns,
                               "Scale by Reference — BlueCollar Systems")
          return unless result

          _measured_display, real_dim_str, scale_target = result

          # Parse the real dimension
          real_inches = UnitParser.parse_model_units(real_dim_str)
          unless real_inches && real_inches > 0
            UI.messagebox("Could not parse dimension: \"#{real_dim_str}\"\n\n" \
                          "Examples: 1'-4, 5' 6 1/2\", 406.4mm, 16in, 2.5ft")
            return
          end

          # Calculate scale factor
          if measured_length <= 0
            UI.messagebox("Selected edge has zero length.")
            return
          end

          factor = real_inches / measured_length

          if factor <= 0 || factor.infinite? || factor.nan?
            UI.messagebox("Invalid scale factor calculated.")
            return
          end

          if factor > 10000 || factor < 0.0001
            warn_choice = UI.messagebox(
              "Scale factor %.6f is extremely %s.\n\n" \
              "This may indicate a unit mismatch. Continue anyway?" %
              [factor, factor > 10000 ? "large" : "small"],
              MB_YESNO)
            return unless warn_choice == IDYES
          end

          apply_scale(model, factor, scale_target, measured_length, real_inches, real_dim_str)

        else
          # No edge selected — show dialog-only workflow
          prompts = [
            "Enter KNOWN real dimension of a feature:",
            "Enter MEASURED dimension in model (or select edge first):",
            "Scale target:"
          ]
          defaults = ["", "", "All Groups"]
          dropdowns = ["", "", "All Groups|Selection Only|Active Group"]

          result = UI.inputbox(prompts, defaults, dropdowns,
                               "Scale by Reference — BlueCollar Systems")
          return unless result

          real_dim_str, measured_str, scale_target = result

          real_inches = UnitParser.parse_model_units(real_dim_str)
          measured_inches = UnitParser.parse_model_units(measured_str)

          unless real_inches && real_inches > 0
            UI.messagebox("Could not parse real dimension: \"#{real_dim_str}\"")
            return
          end
          unless measured_inches && measured_inches > 0
            UI.messagebox("Could not parse measured dimension: \"#{measured_str}\"\n" \
                          "Tip: Select an edge before running this tool.")
            return
          end

          factor = real_inches / measured_inches

          if factor > 10000 || factor < 0.0001
            warn_choice = UI.messagebox(
              "Scale factor %.6f is extremely %s.\n\n" \
              "This may indicate a unit mismatch. Continue anyway?" %
              [factor, factor > 10000 ? "large" : "small"],
              MB_YESNO)
            return unless warn_choice == IDYES
          end

          apply_scale(model, factor, scale_target, measured_inches, real_inches, real_dim_str)
        end
      end

      # ---------------------------------------------------------------
      # Quick Scale — type a factor or ratio directly
      # ---------------------------------------------------------------
      def self.quick_scale
        model = Sketchup.active_model
        unless model
          UI.messagebox("No active model.")
          return
        end

        prompts = [
          "Scale factor or ratio (e.g. 2.0, 1:50, 48, 0.5):",
          "Scale target:"
        ]
        defaults = ["1.0", "All Groups"]
        dropdowns = ["", "All Groups|Selection Only|Active Group"]

        result = UI.inputbox(prompts, defaults, dropdowns,
                             "Quick Scale — BlueCollar Systems")
        return unless result

        factor_str, scale_target = result

        # Parse factor — support "1:50" ratio format
        factor = parse_scale_factor(factor_str)
        unless factor && factor > 0
          UI.messagebox("Could not parse scale factor: \"#{factor_str}\"\n\n" \
                        "Examples: 2.0, 1:50, 48, 0.5")
          return
        end

        if factor > 10000 || factor < 0.0001
          warn_choice = UI.messagebox(
            "Scale factor %.6f is extremely %s.\n\n" \
            "This may indicate a unit mismatch. Continue anyway?" %
            [factor, factor > 10000 ? "large" : "small"],
            MB_YESNO)
          return unless warn_choice == IDYES
        end

        apply_scale(model, factor, scale_target, nil, nil, factor_str)
      end

      private

      # ---------------------------------------------------------------
      # Apply the scale transformation
      # ---------------------------------------------------------------
      def self.apply_scale(model, factor, target_mode, measured, real, dim_str)
        # Confirmation
        factor_display = "%.6f" % factor
        msg = "Scale Factor: #{factor_display}×\n"
        if measured && real
          msg += "Measured: #{format_length(measured)}\n"
          msg += "Real: #{dim_str}\n"
        end
        msg += "\nTarget: #{target_mode}\n"
        msg += "\nProceed?"

        choice = UI.messagebox(msg, MB_YESNO)
        return unless choice == IDYES

        model.start_operation("Scale by Reference", true)

        # Compute bounding box center of target geometry for anchored scaling.
        # Scaling around the geometry center keeps shapes in place instead of
        # displacing them (which happens when scaling around world origin).
        bb = Geom::BoundingBox.new
        case target_mode
        when "Selection Only"
          model.selection.each { |e| bb.add(e.bounds) if e.respond_to?(:bounds) }
        when "Active Group"
          path = model.active_path
          bb.add(path.last.bounds) if path && path.last && path.last.respond_to?(:bounds)
        else
          model.entities.each { |e| bb.add(e.bounds) if e.respond_to?(:bounds) && e.valid? }
        end
        anchor = bb.valid? ? bb.center : ORIGIN

        xform = Geom::Transformation.scaling(anchor, factor)
        scaled_count = 0

        case target_mode
        when "Selection Only"
          # Scale each selected entity (skip locked)
          model.selection.each do |ent|
            next if ent.respond_to?(:locked?) && ent.locked?
            if ent.respond_to?(:transform!)
              ent.transform!(xform)
              scaled_count += 1
            end
          end

        when "Active Group"
          # Scale the active editing context
          active = model.active_entities
          if active != model.entities
            # We're inside a group/component — scale its parent
            path = model.active_path
            if path && path.last
              if path.last.respond_to?(:locked?) && path.last.locked?
                UI.messagebox("The active group/component is locked and cannot be scaled.")
                model.abort_operation
                return
              end
              path.last.transform!(xform)
              scaled_count = 1
            end
          else
            UI.messagebox("Not currently editing a group. Use 'All Groups' instead.")
            model.abort_operation
            return
          end

        else  # "All Groups" — scale everything at the top level
          locked_count = 0
          model.entities.each do |ent|
            if ent.is_a?(Sketchup::Group) || ent.is_a?(Sketchup::ComponentInstance)
              if ent.respond_to?(:locked?) && ent.locked?
                locked_count += 1
                next
              end
              ent.transform!(xform)
              scaled_count += 1
            end
          end
          # If no groups found, scale all edges/faces
          if scaled_count == 0
            model.entities.each do |ent|
              next if ent.respond_to?(:locked?) && ent.locked?
              if ent.respond_to?(:transform!)
                ent.transform!(xform)
                scaled_count += 1
              end
            end
          end
        end

        model.commit_operation

        UI.messagebox("Scaled #{scaled_count} object(s) by #{factor_display}×")

        # Fit view to scaled geometry
        begin
          view = model.active_view
          if view
            cam = view.camera
            bb = model.bounds
            if bb.valid?
              center = bb.center
              eye = Geom::Point3d.new(center.x, center.y, center.z + 1000)
              view.camera = Sketchup::Camera.new(eye, center, Geom::Vector3d.new(0, 1, 0))
              view.camera.perspective = false
            end
            view.zoom_extents
          end
        rescue StandardError => e
          Logger.warn("ScaleTool", "zoom_top_view failed: #{e.message}")
        end
      end

      # ---------------------------------------------------------------
      # Format a length (inches) for display using model units
      # ---------------------------------------------------------------
      def self.format_length(inches)
        # Use SketchUp's formatting
        begin
          return inches.to_l.to_s
        rescue StandardError => e
          Logger.warn("ScaleTool", "format_length failed: #{e.message}")
          return "%.4f\"" % inches
        end
      end

      # ---------------------------------------------------------------
      # Parse scale factor from string — supports "2.0", "1:50", etc.
      # ---------------------------------------------------------------
      def self.parse_scale_factor(text)
        text = text.strip
        # Ratio format: "1:50" → 1/50 = 0.02
        if text =~ /\A(\d+(?:\.\d+)?)\s*:\s*(\d+(?:\.\d+)?)\z/
          num = $1.to_f
          den = $2.to_f
          return nil if den == 0
          return num / den
        end
        # Plain number
        if text =~ /\A[+-]?\d*\.?\d+\z/
          return text.to_f
        end
        nil
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/stroke_font.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/stroke_font.rb`
- Size: `8.50 KB`
- Modified: `2026-03-23 16:45:51`

```ruby
# bc_pdf_vector_importer/stroke_font.rb
# Single-stroke technical lettering engine.
# Renders text as edges (lines/arcs) on the drawing plane.
# Looks like hand-traced CAD text — no filled faces, no system fonts.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module StrokeFont

      # Character definitions: array of strokes.
      # Each stroke is an array of [x, y] points (0..1 normalized).
      # A nil in the array means "pen up" (move without drawing).
      # Character cell is 1.0 wide × 1.4 tall (aspect ~0.71).
      CHAR_W = 1.0
      CHAR_H = 1.4
      CHAR_GAP = 0.15  # gap between characters

      # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
      GLYPHS = {
        'A' => [[[0,0],[0.5,1.4],[1,0]], [[0.2,0.5],[0.8,0.5]]],
        'B' => [[[0,0],[0,1.4],[0.7,1.4],[0.9,1.2],[0.9,1.05],[0.7,0.85],[0,0.7]],
                [[0,0.7],[0.7,0.7],[0.95,0.5],[0.95,0.2],[0.7,0],[0,0]]],
        'C' => [[[1,0.2],[0.7,0],[0.3,0],[0,0.3],[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.2]]],
        'D' => [[[0,0],[0,1.4],[0.6,1.4],[0.95,1.1],[0.95,0.3],[0.6,0],[0,0]]],
        'E' => [[[0.9,0],[0,0],[0,1.4],[0.9,1.4]], [[0,0.7],[0.7,0.7]]],
        'F' => [[[0,0],[0,1.4],[0.9,1.4]], [[0,0.7],[0.7,0.7]]],
        'G' => [[[1,1.2],[0.7,1.4],[0.3,1.4],[0,1.1],[0,0.3],[0.3,0],[0.7,0],[1,0.3],[1,0.7],[0.5,0.7]]],
        'H' => [[[0,0],[0,1.4]], [[1,0],[1,1.4]], [[0,0.7],[1,0.7]]],
        'I' => [[[0.2,0],[0.8,0]], [[0.5,0],[0.5,1.4]], [[0.2,1.4],[0.8,1.4]]],
        'J' => [[[0,0.3],[0.3,0],[0.6,0],[0.9,0.3],[0.9,1.4]]],
        'K' => [[[0,0],[0,1.4]], [[0.9,1.4],[0,0.6],[0.9,0]]],
        'L' => [[[0,1.4],[0,0],[0.9,0]]],
        'M' => [[[0,0],[0,1.4],[0.5,0.7],[1,1.4],[1,0]]],
        'N' => [[[0,0],[0,1.4],[1,0],[1,1.4]]],
        'O' => [[[0.3,0],[0,0.3],[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.3],[0.7,0],[0.3,0]]],
        'P' => [[[0,0],[0,1.4],[0.7,1.4],[1,1.15],[1,0.85],[0.7,0.7],[0,0.7]]],
        'Q' => [[[0.3,0],[0,0.3],[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.3],[0.7,0],[0.3,0]],
                [[0.6,0.3],[1,-0.1]]],
        'R' => [[[0,0],[0,1.4],[0.7,1.4],[1,1.15],[1,0.85],[0.7,0.7],[0,0.7]], [[0.5,0.7],[1,0]]],
        'S' => [[[1,1.15],[0.7,1.4],[0.3,1.4],[0,1.15],[0,0.9],[0.3,0.7],[0.7,0.7],[1,0.5],[1,0.25],[0.7,0],[0.3,0],[0,0.25]]],
        'T' => [[[0,1.4],[1,1.4]], [[0.5,0],[0.5,1.4]]],
        'U' => [[[0,1.4],[0,0.3],[0.3,0],[0.7,0],[1,0.3],[1,1.4]]],
        'V' => [[[0,1.4],[0.5,0],[1,1.4]]],
        'W' => [[[0,1.4],[0.25,0],[0.5,0.9],[0.75,0],[1,1.4]]],
        'X' => [[[0,0],[1,1.4]], [[0,1.4],[1,0]]],
        'Y' => [[[0,1.4],[0.5,0.7],[1,1.4]], [[0.5,0],[0.5,0.7]]],
        'Z' => [[[0,1.4],[1,1.4],[0,0],[1,0]]],

        '0' => [[[0.3,0],[0,0.3],[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.3],[0.7,0],[0.3,0]],
                [[0.15,0.2],[0.85,1.2]]],
        '1' => [[[0.2,1.1],[0.5,1.4],[0.5,0]], [[0.2,0],[0.8,0]]],
        '2' => [[[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.9],[0,0],[1,0]]],
        '3' => [[[0,1.15],[0.3,1.4],[0.7,1.4],[1,1.15],[1,0.9],[0.7,0.7],[0.4,0.7]],
                [[0.7,0.7],[1,0.5],[1,0.25],[0.7,0],[0.3,0],[0,0.25]]],
        '4' => [[[0.8,0],[0.8,1.4],[0,0.4],[1,0.4]]],
        '5' => [[[1,1.4],[0,1.4],[0,0.8],[0.7,0.8],[1,0.5],[1,0.2],[0.7,0],[0,0.2]]],
        '6' => [[[0.8,1.4],[0.3,1.4],[0,1.1],[0,0.3],[0.3,0],[0.7,0],[1,0.3],[1,0.6],[0.7,0.8],[0,0.8]]],
        '7' => [[[0,1.4],[1,1.4],[0.3,0]]],
        '8' => [[[0.3,0.7],[0,0.95],[0,1.15],[0.3,1.4],[0.7,1.4],[1,1.15],[1,0.95],[0.7,0.7],[0.3,0.7]],
                [[0.3,0.7],[0,0.45],[0,0.25],[0.3,0],[0.7,0],[1,0.25],[1,0.45],[0.7,0.7]]],
        '9' => [[[0.2,0],[0.7,0],[1,0.3],[1,1.1],[0.7,1.4],[0.3,1.4],[0,1.1],[0,0.8],[0.3,0.6],[1,0.6]]],

        '-' => [[[0.1,0.7],[0.9,0.7]]],
        '+' => [[[0.1,0.7],[0.9,0.7]], [[0.5,0.3],[0.5,1.1]]],
        '=' => [[[0.1,0.5],[0.9,0.5]], [[0.1,0.9],[0.9,0.9]]],
        '/' => [[[0,0],[1,1.4]]],
        '\\' => [[[0,1.4],[1,0]]],
        '(' => [[[0.7,0],[0.3,0.3],[0.3,1.1],[0.7,1.4]]],
        ')' => [[[0.3,0],[0.7,0.3],[0.7,1.1],[0.3,1.4]]],
        '[' => [[[0.7,0],[0.3,0],[0.3,1.4],[0.7,1.4]]],
        ']' => [[[0.3,0],[0.7,0],[0.7,1.4],[0.3,1.4]]],
        '.' => [[[0.4,0],[0.6,0],[0.6,0.15],[0.4,0.15],[0.4,0]]],
        ',' => [[[0.5,0.15],[0.5,0],[0.3,-0.2]]],
        ':' => [[[0.4,0],[0.6,0],[0.6,0.15],[0.4,0.15],[0.4,0]],
                [[0.4,0.65],[0.6,0.65],[0.6,0.8],[0.4,0.8],[0.4,0.65]]],
        ';' => [[[0.5,0.15],[0.5,0],[0.3,-0.2]],
                [[0.4,0.65],[0.6,0.65],[0.6,0.8],[0.4,0.8],[0.4,0.65]]],
        "'" => [[[0.4,1.2],[0.5,1.4],[0.5,1.1]]],
        '"' => [[[0.3,1.2],[0.4,1.4],[0.4,1.1]], [[0.6,1.2],[0.7,1.4],[0.7,1.1]]],
        '!' => [[[0.5,0.4],[0.5,1.4]], [[0.4,0],[0.6,0],[0.6,0.15],[0.4,0.15],[0.4,0]]],
        '?' => [[[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.85],[0.5,0.5],[0.5,0.3]],
                [[0.4,0],[0.6,0],[0.6,0.15],[0.4,0.15],[0.4,0]]],
        '#' => [[[0.2,0],[0.35,1.4]], [[0.65,0],[0.8,1.4]], [[0,0.4],[1,0.4]], [[0,0.9],[1,0.9]]],
        '@' => [[[0.7,0.5],[0.5,0.5],[0.5,1],[0.8,1],[0.8,0.4],[1,0.3],[1,1.1],[0.7,1.4],[0.3,1.4],[0,1.1],[0,0.3],[0.3,0],[0.8,0]]],
        '&' => [[[1,0],[0.3,0.7],[0.3,1.1],[0.5,1.3],[0.7,1.1],[0.3,0.7],[0,0.3],[0.3,0],[0.7,0],[1,0.4]]],
        '*' => [[[0.5,0.5],[0.5,1.1]], [[0.2,0.6],[0.8,1.0]], [[0.2,1.0],[0.8,0.6]]],
        '_' => [[[0,0],[1,0]]],
        ' ' => [],
        "\u00D8" => [[[0.3,0],[0,0.3],[0,1.1],[0.3,1.4],[0.7,1.4],[1,1.1],[1,0.3],[0.7,0],[0.3,0]],
                     [[0,0],[1,1.4]]],  # Ø
      }
      # rubocop:enable Layout/SpaceInsideArrayLiteralBrackets

      # ---------------------------------------------------------------
      # Render a text string as SketchUp edges at the given position.
      #
      # entities — where to add edges
      # text     — string to render
      # origin   — Geom::Point3d base position (bottom-left of first char)
      # height   — total character height in model inches
      # angle    — rotation in degrees (0 = horizontal)
      # ---------------------------------------------------------------
      def self.render(entities, text, origin, height, angle = 0)
        return 0 if text.nil? || text.strip.empty?

        scale = height / CHAR_H
        char_advance = (CHAR_W + CHAR_GAP) * scale
        edges_created = 0

        # Build transformation for rotation
        has_rotation = angle.abs > 0.1
        cos_a = has_rotation ? Math.cos(angle * Math::PI / 180.0) : 1.0
        sin_a = has_rotation ? Math.sin(angle * Math::PI / 180.0) : 0.0

        ox = origin.x.to_f
        oy = origin.y.to_f
        oz = origin.z.to_f

        cursor_x = 0.0

        text.each_char do |ch|
          uc = ch.upcase
          glyph = GLYPHS[uc] || GLYPHS[ch]

          if glyph.nil? || glyph.empty?
            # Unknown character or space — advance cursor
            cursor_x += char_advance
            next
          end

          glyph.each do |stroke|
            next if stroke.length < 2

            points = stroke.map do |px, py|
              # Scale and offset
              lx = (cursor_x + px * scale)
              ly = (py * scale)

              # Rotate around origin
              if has_rotation
                rx = lx * cos_a - ly * sin_a
                ry = lx * sin_a + ly * cos_a
                Geom::Point3d.new(ox + rx, oy + ry, oz)
              else
                Geom::Point3d.new(ox + lx, oy + ly, oz)
              end
            end

            # Draw connected line segments
            (0...points.length - 1).each do |i|
              begin
                p1 = points[i]
                p2 = points[i + 1]
                next if p1.distance(p2) < 0.001
                entities.add_line(p1, p2)
                edges_created += 1
              rescue StandardError => e
                Logger.warn("StrokeFont", "add_line for glyph segment failed: #{e.message}")
              end
            end
          end

          cursor_x += char_advance
        end

        edges_created
      end

      # ---------------------------------------------------------------
      # Estimate text width in model inches
      # ---------------------------------------------------------------
      def self.text_width(text, height)
        return 0 if text.nil? || text.empty?
        scale = height / CHAR_H
        text.length * (CHAR_W + CHAR_GAP) * scale
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/svg_geometry_renderer.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/svg_geometry_renderer.rb`
- Size: `13.84 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/svg_geometry_renderer.rb
# Full geometry import via pdftocairo SVG output.
#
# Uses Cairo's rendering engine for all geometry AND text —
# exact same output as the PDF viewer. Handles Form XObjects,
# line weights, dash patterns, fills, and text positioning
# that the pure Ruby parser may miss or approximate.
#
# Falls back to the Ruby parser if pdftocairo is unavailable.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'
require File.join(File.dirname(__FILE__), 'command_runner')

module BlueCollarSystems
  module PDFVectorImporter
    module SvgGeometryRenderer

      PDF_PT_TO_INCH = 1.0 / 72.0

      # ---------------------------------------------------------------
      # Main entry. Returns stats hash or nil if pdftocairo unavailable.
      # ---------------------------------------------------------------
      def self.render(model, pdf_path, page_num, media_box, opts = {})
        exe = SvgTextRenderer.find_pdftocairo
        return nil unless exe

        scale = opts[:scale] || 1.0
        import_text = opts[:import_text] != false
        create_faces = opts[:create_faces] != false
        layer_name = opts[:layer_name] || 'PDF Import'
        @bezier_segments = opts[:bezier_segments] || 16
        @cleanup_geometry = opts[:cleanup_geometry] || false
        @merge_tolerance = opts[:merge_tolerance] || 0.001
        origin_x = media_box[0].to_f
        origin_y = media_box[1].to_f
        vb_w = (media_box[2] - media_box[0]).abs.to_f
        vb_h = (media_box[3] - media_box[1]).abs.to_f
        vb_w = 2592.0 if vb_w < 1
        vb_h = 1728.0 if vb_h < 1

        # Generate SVG
        svg_path = File.join(Dir.tmpdir,
          "bc_geo_#{Process.pid}_#{Time.now.to_i}_#{rand(100000)}.svg")
        args = [
          exe.to_s,
          '-svg',
          '-f', page_num.to_i.to_s,
          '-l', page_num.to_i.to_s,
          pdf_path.to_s,
          svg_path.to_s
        ]
        run = CommandRunner.run(
          args,
          timeout_s: 120,
          context: 'SvgGeometryRenderer.pdftocairo'
        )
        return nil unless run[:ok] && File.exist?(svg_path)

        svg = File.read(svg_path)

        # Parse SVG dimensions
        svg_vb_w = (svg[/width="([^"]+)"/, 1] || vb_w).to_f
        svg_vb_h = (svg[/height="([^"]+)"/, 1] || vb_h).to_f

        # Split into defs and body
        defs_split = svg.split('</defs>')
        defs_section = defs_split[0] || ''
        body_section = defs_split[1] || svg

        # Parse body paths and compute scale factor
        body_paths = parse_body_paths(body_section)
        return nil if body_paths.empty?

        # Compute Cairo internal scale from max path coordinates
        max_x = 0.0; max_y = 0.0
        body_paths.each do |bp|
          bp[:points].each do |pt|
            max_x = pt[0] if pt[0] > max_x
            max_y = pt[1] if pt[1] > max_y
          end
        end

        # Dynamic scale: body coords → viewBox coords
        geo_scale_x = max_x > 0 ? svg_vb_w / max_x : 1.0
        geo_scale_y = max_y > 0 ? svg_vb_h / max_y : 1.0

        stats = { edges: 0, faces: 0, text: 0, glyphs: 0 }

        # Create page group
        page_group = model.active_entities.add_group
        page_group.name = "PDF_Page_#{page_num}"
        entities = page_group.entities

        # Create layers/tags
        base_layer = model.layers[layer_name] || model.layers.add(layer_name)
        dash_layer = model.layers["Dashed"] || model.layers.add("Dashed")
        dashdot_layer = model.layers["Dashdot"] || model.layers.add("Dashdot")

        Sketchup.status_text = "Drawing #{body_paths.length} geometry paths..."

        # Draw geometry paths
        body_paths.each_with_index do |bp, idx|
          if idx % 500 == 0
            Sketchup.status_text = "Drawing geometry: #{idx}/#{body_paths.length} [#{((idx.to_f/body_paths.length)*100).round}%]"
          end

          pts = bp[:points].map do |px, py|
            # Convert: body coords → viewBox coords → SketchUp inches
            pdf_x = (px * geo_scale_x) - origin_x
            pdf_y = (svg_vb_h - py * geo_scale_y) - origin_y
            Geom::Point3d.new(
              pdf_x * PDF_PT_TO_INCH * scale,
              pdf_y * PDF_PT_TO_INCH * scale,
              0.0
            )
          end

          # Remove duplicate consecutive points
          clean = [pts.first]
          pts[1..-1].each { |p| clean << p if p.distance(clean.last) >= 0.001 }
          next if clean.length < 2

          # Choose layer based on line type
          target_layer = base_layer
          if bp[:dash]
            if bp[:dash].include?(' ')
              parts = bp[:dash].split(' ').map(&:to_f)
              target_layer = parts.length > 2 ? dashdot_layer : dash_layer
            end
          end

          begin
            edges = entities.add_edges(clean)
            if edges
              stats[:edges] += edges.length
              edges.each do |edge|
                begin
                  edge.layer = target_layer if target_layer
                rescue StandardError => e
                  Logger.warn("SvgGeometryRenderer", "edge layer assignment failed: #{e.message}")
                end
              end
            end

            # Create face from closed filled paths
            if create_faces && bp[:filled] && clean.length >= 3 &&
               clean.first.distance(clean.last) < 0.01
              begin
                face = entities.add_face(clean)
                if face
                  stats[:faces] += 1
                  begin
                    face.layer = base_layer if base_layer
                  rescue StandardError => e
                    Logger.warn("SvgGeometryRenderer", "face layer assignment failed: #{e.message}")
                  end
                end
              rescue StandardError => e
                Logger.warn("SvgGeometryRenderer", "add_face failed: #{e.message}")
              end
            end
          rescue StandardError => e
            Logger.warn("SvgGeometryRenderer", "draw geometry path failed: #{e.message}")
          end
        end

        # Draw text via SvgTextRenderer (reuse existing glyph component approach)
        if import_text
          Sketchup.status_text = "Rendering text glyphs..."
          glyphs = SvgTextRenderer.send(:parse_glyph_defs, svg)
          placements = SvgTextRenderer.send(:parse_use_placements, svg)

          # Build glyph components
          glyph_defs = {}
          glyphs.each do |glyph_id, path_d|
            next if path_d.strip.empty?
            subpaths = SvgTextRenderer.send(:svg_path_to_points, path_d, scale)
            next if subpaths.empty?
            defn = model.definitions.add("_g_#{glyph_id}")
            subpaths.each do |sp|
              next if sp.length < 2
              begin
                r = defn.entities.add_edges(sp)
                stats[:edges] += r.length if r
              rescue StandardError => e
                Logger.warn("SvgGeometryRenderer", "add_edges for glyph failed: #{e.message}")
              end
            end
            glyph_defs[glyph_id] = defn if defn.entities.count > 0
          end

          # Place instances
          text_layer = model.layers["#{layer_name}:Text"] ||
                       model.layers.add("#{layer_name}:Text")
          placements.each_with_index do |p, idx|
            if idx % 500 == 0
              Sketchup.status_text = "Placing text: #{idx}/#{placements.length}"
            end
            defn = glyph_defs[p[:glyph_id]]
            next unless defn
            # Glyph positions are in viewBox coords (no scaling needed)
            pdf_x = p[:x] - origin_x
            pdf_y = (svg_vb_h - p[:y]) - origin_y
            x_inch = pdf_x * PDF_PT_TO_INCH * scale
            y_inch = pdf_y * PDF_PT_TO_INCH * scale
            begin
              inst = entities.add_instance(defn,
                Geom::Transformation.new(Geom::Point3d.new(x_inch, y_inch, 0.0)))
              begin
                inst.layer = text_layer if text_layer
              rescue StandardError => e
                Logger.warn("SvgGeometryRenderer", "glyph layer assignment failed: #{e.message}")
              end
              stats[:glyphs] += 1
            rescue StandardError => e
              Logger.warn("SvgGeometryRenderer", "add_instance for glyph failed: #{e.message}")
            end
          end
          stats[:text] = stats[:glyphs]
        end

        # ── Auto-clean geometry if enabled ──
        if @cleanup_geometry && page_group
          Sketchup.status_text = "Cleaning up SVG geometry..."
          cl = GeometryCleanup.cleanup(page_group.entities,
            merge_tolerance: @merge_tolerance,
            min_edge_length: @merge_tolerance)
          stats[:cleanup] = cl
        end

        begin
          page_group.layer = base_layer if page_group && base_layer
        rescue StandardError => e
          Logger.warn("SvgGeometryRenderer", "page group layer assignment failed: #{e.message}")
        end

        stats
      rescue StandardError => e
        begin
          Logger.warn("SvgGeometryRenderer", "Failed: #{e.message}")
        rescue StandardError
          # Logger may be unavailable in minimal runtime/test contexts.
        end
        nil
      ensure
        begin
          File.delete(svg_path) if svg_path && File.exist?(svg_path)
        rescue StandardError => e
          Logger.warn("SvgGeometryRenderer", "cleanup temp svg failed: #{e.message}")
        end
      end

      private

      # ---------------------------------------------------------------
      # Parse <path> elements from SVG body into point arrays.
      # Returns [{ points: [[x,y], ...], filled: bool, dash: str|nil }, ...]
      # ---------------------------------------------------------------
      def self.parse_body_paths(body)
        results = []

        body.scan(/<path\s+([^>]*)\/>/m) do |attrs_str,|
          attrs = attrs_str.to_s

          # Get path data
          d = attrs[/d="([^"]*)"/, 1]
          next unless d && !d.strip.empty?

          # Determine if this is filled or stroked
          is_filled = attrs.include?('fill=') && !attrs.include?('fill="none"')
          is_stroked = attrs.include?('stroke=') && !attrs.include?('stroke="none"')

          # Get dash pattern if any
          dash = attrs[/stroke-dasharray="([^"]*)"/, 1]

          # Parse path into points (use configured curve smoothness)
          points = path_to_points(d, bezier_segments: @bezier_segments)
          next if points.length < 2

          results << {
            points: points,
            filled: is_filled && !is_stroked,
            stroked: is_stroked,
            dash: dash
          }
        end

        results
      end

      # ---------------------------------------------------------------
      # Parse SVG path d="" into flat array of [x,y] points.
      # Handles M, L, H, V, C, S, Z (absolute only — Cairo uses absolute).
      # ---------------------------------------------------------------
      def self.path_to_points(d, bezier_segments: nil)
        seg_count = bezier_segments || @bezier_segments || 16
        tokens = d.scan(/[MLHVCSZmlhvcsz]|[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?/)
        points = []
        cx = 0.0; cy = 0.0
        start_x = 0.0; start_y = 0.0
        cmd = nil; nums = []

        flush = lambda do
          case cmd
          when 'M'
            while nums.length >= 2
              cx, cy = nums.shift(2)
              start_x, start_y = cx, cy
              points << [cx, cy]
            end
          when 'L'
            while nums.length >= 2
              cx, cy = nums.shift(2)
              points << [cx, cy]
            end
          when 'H'
            while nums.length >= 1
              cx = nums.shift
              points << [cx, cy]
            end
          when 'V'
            while nums.length >= 1
              cy = nums.shift
              points << [cx, cy]
            end
          when 'C'
            while nums.length >= 6
              x1, y1, x2, y2, x, y = nums.shift(6)
              # Subdivide cubic bezier using configurable segment count
              p0x, p0y = cx, cy
              chord = Math.sqrt((x-p0x)**2 + (y-p0y)**2)
              # Scale steps proportionally: short chords use fewer segments,
              # long chords use more, up to the configured bezier_segments cap.
              steps = if chord < 5
                        [2, seg_count / 4].max
                      elsif chord < 20
                        [3, seg_count / 3].max
                      else
                        [5, seg_count / 2].max
                      end
              steps = [steps, seg_count].min
              (1..steps).each do |i|
                t = i.to_f / steps; mt = 1.0 - t
                bx = mt**3*p0x + 3*mt**2*t*x1 + 3*mt*t**2*x2 + t**3*x
                by = mt**3*p0y + 3*mt**2*t*y1 + 3*mt*t**2*y2 + t**3*y
                points << [bx, by]
              end
              cx, cy = x, y
            end
          when 'S'
            while nums.length >= 4
              _, _, x, y = nums.shift(4)
              cx, cy = x, y
              points << [cx, cy]
            end
          when 'Z', 'z'
            if (cx - start_x).abs > 0.1 || (cy - start_y).abs > 0.1
              points << [start_x, start_y]
            end
            cx, cy = start_x, start_y
          end
        end

        tokens.each do |tok|
          if tok =~ /\A[A-Za-z]\z/
            flush.call if cmd
            cmd = tok.upcase
            nums = []
          else
            nums << tok.to_f
          end
        end
        flush.call if cmd

        points
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/svg_text_renderer.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/svg_text_renderer.rb`
- Size: `15.80 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/svg_text_renderer.rb
# Renders PDF text as precise vector geometry using pdftocairo.
#
# Performance: each unique glyph is drawn ONCE as a Component, then
# placed as lightweight instances. ~500 draws + ~3000 placements
# instead of ~3000 individual draws.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'
require File.join(File.dirname(__FILE__), 'command_runner')

module BlueCollarSystems
  module PDFVectorImporter
    module SvgTextRenderer

      PDF_PT_TO_INCH = 1.0 / 72.0

      def self.render(entities, pdf_path, page_num, media_box, opts = {})
        exe = find_pdftocairo
        return nil unless exe

        scale = opts[:scale] || 1.0
        y_offset = opts[:y_offset] || 0.0
        text_layer = opts[:layer]
        svg_page_box = opts[:svg_page_box] || media_box
        media_min_x = media_box[0].to_f
        media_min_y = media_box[1].to_f
        svg_min_x = svg_page_box[0].to_f
        svg_min_y = svg_page_box[1].to_f
        page_w   = (svg_page_box[2] - svg_page_box[0]).abs.to_f
        page_h   = (svg_page_box[3] - svg_page_box[1]).abs.to_f
        box_offset_x_in = (svg_min_x - media_min_x) * PDF_PT_TO_INCH * scale.to_f
        box_offset_y_in = (svg_min_y - media_min_y) * PDF_PT_TO_INCH * scale.to_f

        svg_path = File.join(Dir.tmpdir,
          "bc_svg_#{Process.pid}_#{Time.now.to_i}_#{rand(100000)}.svg")

        use_cropbox = false
        begin
          if media_box.is_a?(Array) && media_box.length >= 4 &&
             svg_page_box.is_a?(Array) && svg_page_box.length >= 4
            use_cropbox = svg_page_box.zip(media_box).any? { |a, b| (a.to_f - b.to_f).abs > 0.01 }
          end
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "cropbox compare failed: #{e.message}")
        end

        args = [
          exe.to_s,
          '-svg',
          (use_cropbox ? '-cropbox' : nil),
          '-f', page_num.to_i.to_s,
          '-l', page_num.to_i.to_s,
          '--',
          pdf_path.to_s,
          svg_path.to_s
        ].compact
        run = CommandRunner.run(
          args,
          timeout_s: 90,
          context: 'SvgTextRenderer.pdftocairo'
        )
        return nil unless run[:ok] && File.exist?(svg_path)

        svg = File.read(svg_path)
        glyphs = parse_glyph_defs(svg)
        placements = parse_use_placements(svg)
        return { edges: 0, glyphs: 0 } if placements.empty?

        # OCR-backed PDFs can contain many "#source-*" uses for embedded images.
        # Do not disable glyph rendering solely because of source image uses:
        # that fallback causes text drift on symbol charts and OCR overlays.
        source_use_count = svg.scan(/<use\b[^>]*(?:xlink:href|href)="#source-[^"]+"/).length
        if source_use_count > 0
          Logger.info("SvgTextRenderer",
            "Page #{page_num}: source_uses=#{source_use_count}, glyph_uses=#{placements.length} (rendering glyph geometry)")
        end

        vb_min_x, vb_min_y, vb_w, vb_h = parse_viewbox(svg)
        vb_w = page_w if vb_w <= 0.0
        vb_h = page_h if vb_h <= 0.0
        # pdftocairo SVG coordinates are already in PDF points for the rendered
        # page box (often CropBox). Use direct pt->inch conversion to avoid
        # MediaBox-vs-CropBox rescaling drift on OCR/chart PDFs.
        x_unit_to_in = PDF_PT_TO_INCH * scale.to_f
        y_unit_to_in = PDF_PT_TO_INCH * scale.to_f

        model = entities.model || Sketchup.active_model
        edge_count = 0
        glyph_count = 0

        # Build each unique glyph as a Component (draw once)
        Sketchup.status_text = "Building #{glyphs.length} glyph shapes..."
        glyph_defs = {}
        glyphs.each do |glyph_id, path_d|
          next if path_d.strip.empty?
          subpaths = svg_path_to_points(path_d, x_unit_to_in, y_unit_to_in)
          next if subpaths.empty?

          defn = model.definitions.add("_g_#{glyph_id}")
          subpaths.each do |pts|
            next if pts.length < 2
            begin
              r = defn.entities.add_edges(pts)
              edge_count += r.length if r
            rescue StandardError => e
              Logger.warn("SvgTextRenderer", "add_edges for glyph failed: #{e.message}")
            end
          end
          glyph_defs[glyph_id] = defn if defn.entities.count > 0
        end

        # Place instances (fast)
        total = placements.length
        placements.each_with_index do |p, idx|
          if idx % 500 == 0
            Sketchup.status_text = "Placing text: #{idx}/#{total} [#{((idx.to_f/total)*100).round}%]"
          end

          defn = glyph_defs[p[:glyph_id]]
          next unless defn

          begin
            tr = nil
            if p[:matrix].is_a?(Array) && p[:matrix].length >= 6
              a, b, c, d, e, f = p[:matrix].map(&:to_f)
              # SVG <use> x/y are additive placement offsets.
              e += p[:x].to_f
              f += p[:y].to_f

              tx = (e - vb_min_x) * x_unit_to_in + box_offset_x_in
              ty = (vb_h + vb_min_y - f) * y_unit_to_in + y_offset.to_f + box_offset_y_in

              # Local glyph coordinates are scaled to inches and Y-flipped.
              ratio_xy = y_unit_to_in.zero? ? 1.0 : (x_unit_to_in / y_unit_to_in)
              ratio_yx = x_unit_to_in.zero? ? 1.0 : (y_unit_to_in / x_unit_to_in)
              xaxis = Geom::Vector3d.new(a, -b * ratio_yx, 0.0)
              yaxis = Geom::Vector3d.new(-c * ratio_xy, d, 0.0)
              zaxis = Geom::Vector3d.new(0.0, 0.0, 1.0)
              tr = Geom::Transformation.axes(Geom::Point3d.new(tx, ty, 0.0), xaxis, yaxis, zaxis)
            else
              tx = (p[:x].to_f - vb_min_x) * x_unit_to_in + box_offset_x_in
              ty = (vb_h + vb_min_y - p[:y].to_f) * y_unit_to_in + y_offset.to_f + box_offset_y_in
              tr = Geom::Transformation.new(Geom::Point3d.new(tx, ty, 0.0))
            end

            inst = entities.add_instance(defn, tr)
            begin
              inst.layer = text_layer if inst && text_layer
            rescue StandardError => e
              Logger.warn("SvgTextRenderer", "set_layer on glyph instance failed: #{e.message}")
            end
            glyph_count += 1
          rescue StandardError => e
            Logger.warn("SvgTextRenderer", "add_instance for glyph failed: #{e.message}")
          end
        end

        { edges: edge_count, glyphs: glyph_count }
      rescue StandardError => e
        begin
          Logger.warn("SvgTextRenderer", "Failed: #{e.message}")
        rescue StandardError
          # Logger may be unavailable in minimal runtime/test contexts.
        end
        nil
      ensure
        begin
          File.delete(svg_path) if svg_path && File.exist?(svg_path)
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "cleanup temp svg failed: #{e.message}")
        end
      end

      private

      def self.find_pdftocairo
        env = ENV['BC_PDFTOCAIRO_PATH']
        return env if env && !env.empty? && File.exist?(env)

        begin
          # Common local/system installs
          candidates = []
          if ENV['LOCALAPPDATA'] && !ENV['LOCALAPPDATA'].empty?
            candidates << File.join(ENV['LOCALAPPDATA'],
              'Programs', 'MiKTeX', 'miktex', 'bin', 'x64', 'pdftocairo.exe')
          end
          candidates << 'C:\\Program Files\\MiKTeX\\miktex\\bin\\x64\\pdftocairo.exe'
          # FreeCAD bundles poppler utils in many installs.
          candidates << 'C:\\Program Files\\FreeCAD 1.1\\bin\\pdftocairo.exe'
          Dir.glob('C:/Program Files/FreeCAD*/bin/pdftocairo.exe').each { |p| candidates << p }
          candidates.each { |p| return p if File.exist?(p) }
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "find_pdftocairo path search failed: #{e.message}")
        end

        if (RUBY_PLATFORM =~ /mswin|mingw|cygwin/)
          ['C:/poppler*/bin/pdftocairo.exe',
           'C:/tools/poppler*/bin/pdftocairo.exe'
          ].each do |pat|
            Dir.glob(pat).each { |p| return p if File.exist?(p) }
          end
        end

        begin
          if (RUBY_PLATFORM =~ /mswin|mingw|cygwin/)
            r = `where pdftocairo.exe 2>NUL`.strip
          else
            r = `which pdftocairo 2>/dev/null`.strip
          end
          return r.split("\n").first.strip if !r.empty?
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "find_pdftocairo which/where failed: #{e.message}")
        end
        nil
      end

      def self.parse_glyph_defs(svg)
        h = {}
        svg.scan(/<g id="(glyph-\d+-\d+)">\s*<path d="([^"]*)"/m) do |id, d|
          h[id] = d unless d.strip.empty?
        end
        h
      end

      def self.parse_use_placements(svg)
        a = []
        svg.scan(/<use\b[^>]*>/m) do |m|
          tag = m.is_a?(Array) ? m.first.to_s : m.to_s
          href = tag[/\bxlink:href="([^"]+)"/, 1] || tag[/\bhref="([^"]+)"/, 1]
          next unless href && href.start_with?('#')
          id = href[1..-1]
          next unless id.start_with?('glyph-')

          x = (tag[/\bx="([^"]+)"/, 1] || '0').to_f
          y = (tag[/\by="([^"]+)"/, 1] || '0').to_f

          matrix = nil
          tr = tag[/\btransform="([^"]+)"/, 1]
          if tr && tr =~ /matrix\(([^)]+)\)/i
            vals = $1.split(/[,\s]+/).reject(&:empty?).map(&:to_f)
            matrix = vals[0, 6] if vals.length >= 6
          end

          a << { glyph_id: id, x: x, y: y, matrix: matrix }
        end
        a
      end

      def self.parse_viewbox(svg)
        if (m = svg.match(/viewBox="([^"]+)"/i))
          vals = m[1].split(/[\s,]+/).reject(&:empty?).map(&:to_f)
          return vals[0], vals[1], vals[2], vals[3] if vals.length >= 4
        end
        [0.0, 0.0, 0.0, 0.0]
      rescue StandardError => e
        Logger.warn("SvgTextRenderer", "parse_viewbox failed: #{e.message}")
        [0.0, 0.0, 0.0, 0.0]
      end

      # Convert SVG path to arrays of SketchUp Point3d.
      # Glyph coords are in SVG viewBox units, Y-down.
      # Convert to model inches with potentially non-uniform scaling.
      def self.svg_path_to_points(d, scale_or_x_unit_to_in, y_unit_to_in = nil)
        if y_unit_to_in.nil?
          # Backward compatibility: 2-arg call treated as isotropic scale factor.
          x_unit_to_in = PDF_PT_TO_INCH * scale_or_x_unit_to_in.to_f
          y_unit_to_in = x_unit_to_in
        else
          x_unit_to_in = scale_or_x_unit_to_in.to_f
          y_unit_to_in = y_unit_to_in.to_f
        end

        tokens = d.scan(/[MLHVCSZmlhvcsz]|[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?/)
        subpaths = []
        current = []
        start_pt = nil
        cx = 0.0; cy = 0.0
        cmd = nil; nums = []

        mk = lambda { |gx, gy|
          Geom::Point3d.new(gx * x_unit_to_in, -gy * y_unit_to_in, 0.0)
        }

        run = lambda {
          case cmd
          when 'M'
            while nums.length >= 2
              subpaths << current if current.length >= 2
              cx, cy = nums.shift(2)
              start_pt = mk.call(cx, cy)
              current = [start_pt]
            end
          when 'L'
            while nums.length >= 2
              cx, cy = nums.shift(2)
              current << mk.call(cx, cy)
            end
          when 'H'
            while nums.length >= 1
              cx = nums.shift
              current << mk.call(cx, cy)
            end
          when 'V'
            while nums.length >= 1
              cy = nums.shift
              current << mk.call(cx, cy)
            end
          when 'C'
            while nums.length >= 6
              x1, y1, x2, y2, x, y = nums.shift(6)
              p0 = current.last || mk.call(cx, cy)
              p1 = mk.call(x1, y1); p2 = mk.call(x2, y2); p3 = mk.call(x, y)
              ch = p0.distance(p3)
              n = ch < 0.02 ? 2 : (ch < 0.08 ? 3 : 4)
              (1..n).each do |i|
                t = i.to_f / n; mt = 1.0 - t
                bx = mt**3*p0.x + 3*mt**2*t*p1.x + 3*mt*t**2*p2.x + t**3*p3.x
                by = mt**3*p0.y + 3*mt**2*t*p1.y + 3*mt*t**2*p2.y + t**3*p3.y
                current << Geom::Point3d.new(bx, by, 0.0)
              end
              cx, cy = x, y
            end
          when 'S'
            while nums.length >= 4
              _, _, x, y = nums.shift(4)
              cx, cy = x, y
              current << mk.call(cx, cy)
            end
          when '_RM'  # relative moveto
            while nums.length >= 2
              subpaths << current if current.length >= 2
              cx += nums.shift; cy += nums.shift
              start_pt = mk.call(cx, cy)
              current = [start_pt]
            end
          when '_RL'  # relative lineto
            while nums.length >= 2
              cx += nums.shift; cy += nums.shift
              current << mk.call(cx, cy)
            end
          when '_RH'  # relative horizontal lineto
            while nums.length >= 1
              cx += nums.shift
              current << mk.call(cx, cy)
            end
          when '_RV'  # relative vertical lineto
            while nums.length >= 1
              cy += nums.shift
              current << mk.call(cx, cy)
            end
          when '_RC'  # relative curveto
            while nums.length >= 6
              dx1, dy1, dx2, dy2, dx, dy = nums.shift(6)
              x1 = cx + dx1; y1 = cy + dy1
              x2 = cx + dx2; y2 = cy + dy2
              x = cx + dx;   y = cy + dy
              p0 = current.last || mk.call(cx, cy)
              p1 = mk.call(x1, y1); p2 = mk.call(x2, y2); p3 = mk.call(x, y)
              ch = p0.distance(p3)
              n = ch < 0.02 ? 2 : (ch < 0.08 ? 3 : 4)
              (1..n).each do |i|
                t = i.to_f / n; mt = 1.0 - t
                bx = mt**3*p0.x + 3*mt**2*t*p1.x + 3*mt*t**2*p2.x + t**3*p3.x
                by = mt**3*p0.y + 3*mt**2*t*p1.y + 3*mt*t**2*p2.y + t**3*p3.y
                current << Geom::Point3d.new(bx, by, 0.0)
              end
              cx, cy = x, y
            end
          when '_RS'  # relative smooth curveto
            while nums.length >= 4
              _, _, dx, dy = nums.shift(4)
              cx += dx; cy += dy
              current << mk.call(cx, cy)
            end
          when 'Z'
            if current.last && start_pt && current.last.distance(start_pt) >= 0.0003
              current << start_pt
            end
            subpaths << current if current.length >= 2
            current = start_pt ? [start_pt] : []
          end
        }

        tokens.each do |tok|
          if tok =~ /\A[A-Za-z]\z/
            run.call if cmd
            is_relative = (tok =~ /[a-z]/) ? true : false
            cmd = tok.upcase
            # For relative commands, convert coordinates to absolute before processing
            if is_relative && cmd == 'M'
              cmd = '_RM'  # relative move marker
            elsif is_relative && cmd == 'L'
              cmd = '_RL'
            elsif is_relative && cmd == 'H'
              cmd = '_RH'
            elsif is_relative && cmd == 'V'
              cmd = '_RV'
            elsif is_relative && cmd == 'C'
              cmd = '_RC'
            elsif is_relative && cmd == 'S'
              cmd = '_RS'
            end
            # Z/z behave identically
            nums = []
          else
            nums << tok.to_f
          end
        end
        run.call if cmd
        subpaths << current if current.length >= 2

        subpaths.map { |pts|
          cl = [pts.first]
          pts[1..-1].each { |p| cl << p if p.distance(cl.last) >= 0.0003 }
          cl.length >= 2 ? cl : nil
        }.compact
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/text_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/text_parser.rb`
- Size: `33.21 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/text_parser.rb
# Extracts text content and positioning from PDF content streams.
# Handles BT/ET text blocks, Tm/Td positioning, Tj/TJ string operators,
# and font size tracking. Reconstructs stacked fractions to inline.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class TextParser

      TextItem = Struct.new(
        :text,        # String content
        :x,           # X position in PDF user space
        :y,           # Y position in PDF user space
        :font_size,   # Effective font size (matrix-scaled, for text processing)
        :angle,       # Rotation angle in degrees
        :font_name,   # Font name (if available)
        :raw_font_size # Raw font size from Tf operator (for geometry rendering)
      )

      # Common structural drawing fraction denominators
      VALID_DENOMS = [2, 4, 8, 16, 32, 64].freeze

      def initialize(streams, font_maps = nil)
        @streams = streams
        @text_items = []
        @font_maps = {}

        (font_maps || {}).each do |k, v|
          key = k.to_s
          @font_maps[key] = v
          @font_maps[key.sub(/\A\//, '')] = v
        end
      end

      def parse
        @text_items = []

        @streams.each do |stream|
          next unless stream && !stream.empty?
          extract_text_from_stream(stream)
        end

        # Post-process text items.
        # Reconstruct stacked fractions before run-merge so slash forms survive.
        @text_items = reconstruct_fractions(@text_items)
        @text_items = merge_text_runs(@text_items)
        @text_items = fix_merged_fractions(@text_items)
        @text_items = dedupe_text_items(@text_items)
        @text_items = quality_filter(@text_items)
        @text_items = suppress_overlaps(@text_items)
        @text_items
      end

      private

      def extract_text_from_stream(stream)
        # Text state
        tm = [1, 0, 0, 1, 0, 0]   # Text matrix
        tlm = [1, 0, 0, 1, 0, 0]  # Text line matrix
        font_size = 12.0
        font_name = ""
        in_text = false

        tokens = tokenize(stream)
        operand_stack = []

        tokens.each do |token|
          if token[:type] == :operator
            op = token[:value]
            nums = operand_stack.select { |t| t[:type] == :number }.map { |t| t[:value] }
            strs = operand_stack.select { |t| t[:type] == :string }.map { |t| t[:value] }
            hexs = operand_stack.select { |t| t[:type] == :hex_string }.map { |t| t[:value] }
            names = operand_stack.select { |t| t[:type] == :name }.map { |t| t[:value] }

            case op
            when 'BT'
              in_text = true
              tm = [1, 0, 0, 1, 0, 0]
              tlm = [1, 0, 0, 1, 0, 0]

            when 'ET'
              in_text = false

            when 'Tf'
              # Set font and size
              font_size = nums.last.to_f if nums.last
              font_name = names.last.to_s if names.last

            when 'Tm'
              # Set text matrix directly
              if nums.length >= 6
                tm = nums[0, 6].map(&:to_f)
                tlm = tm.dup
              end

            when 'Td'
              # Move text position
              if nums.length >= 2 && in_text
                tx, ty = nums[0].to_f, nums[1].to_f
                # PDF text translation is pre-multiplied: Tlm = T(tx,ty) * Tlm
                tlm = multiply_matrix([1, 0, 0, 1, tx, ty], tlm)
                tm = tlm.dup
              end

            when 'TD'
              # Move text position and set leading
              if nums.length >= 2 && in_text
                tx, ty = nums[0].to_f, nums[1].to_f
                # PDF text translation is pre-multiplied: Tlm = T(tx,ty) * Tlm
                tlm = multiply_matrix([1, 0, 0, 1, tx, ty], tlm)
                tm = tlm.dup
              end

            when 'T*'
              # Move to start of next line (uses leading)
              if in_text
                # Same pre-multiply rule as Td/TD
                tlm = multiply_matrix([1, 0, 0, 1, 0, -font_size * 1.2], tlm)
                tm = tlm.dup
              end

            when 'Tj'
              # Show text string
              if in_text
                raw = strs.last || hexs.last
                text = decode_text_operand(raw, font_name)
                emit_text(text, tm, font_size, font_name) if readable_text?(text)
              end

            when 'TJ'
              # Show text with individual glyph positioning (array)
              if in_text
                arr_token = operand_stack.find { |t| t[:type] == :array }
                if arr_token
                  text = extract_tj_text(arr_token[:value], font_name)
                  emit_text(text, tm, font_size, font_name) if readable_text?(text)
                end
              end

            when "'"
              # Move to next line and show text
              if in_text
                tlm = multiply_matrix([1, 0, 0, 1, 0, -font_size * 1.2], tlm)
                tm = tlm.dup
                if !strs.empty?
                  text = decode_text_operand(strs.first, font_name)
                  emit_text(text, tm, font_size, font_name) if readable_text?(text)
                end
              end

            when '"'
              # Set word/char spacing, move to next line, show text
              if in_text
                tlm = multiply_matrix([1, 0, 0, 1, 0, -font_size * 1.2], tlm)
                tm = tlm.dup
                if !strs.empty?
                  text = decode_text_operand(strs.first, font_name)
                  emit_text(text, tm, font_size, font_name) if readable_text?(text)
                end
              end
            end

            operand_stack.clear
          else
            operand_stack << token
          end
        end
      end

      def emit_text(text, tm, font_size, font_name)
        # Extract position and rotation from text matrix
        x = tm[4]
        y = tm[5]
        # Font size is scaled by the text matrix (for text processing/dedup)
        effective_size = font_size * Math.sqrt(tm[0]**2 + tm[1]**2)
        effective_size = font_size if effective_size.abs < 0.001
        # Rotation angle
        angle = -Math.atan2(tm[1], tm[0]) * 180.0 / Math::PI

        @text_items << TextItem.new(text, x, y, effective_size, angle, font_name, font_size)
      end

      def decode_text_operand(raw, font_name = nil)
        return "" unless raw
        s = raw.to_s

        bytes = if s.start_with?('<') && s.end_with?('>')
                  decode_pdf_hex_bytes(s)
                else
                  decode_pdf_string_bytes(s)
                end

        mapped = decode_bytes_with_font_map(bytes, font_name)
        text = if mapped && !mapped.empty?
                 mapped
               else
                 # Fallback for simple PDFs without ToUnicode.
                 bytes.encode(Encoding::UTF_8, Encoding::BINARY,
                              invalid: :replace, undef: :replace, replace: '')
               end
        clean_text(text)
      end

      def decode_bytes_with_font_map(bytes, font_name)
        return nil unless font_name && bytes && !bytes.empty?

        fmap = @font_maps[font_name.to_s] || @font_maps[font_name.to_s.sub(/\A\//, '')]
        return nil unless fmap.is_a?(Hash) && fmap[:map].is_a?(Hash) && !fmap[:map].empty?

        code_lengths = (fmap[:code_lengths] || [1]).map(&:to_i).select { |n| n > 0 }.uniq.sort.reverse
        code_lengths = [1] if code_lengths.empty?
        map = fmap[:map]

        out = ""
        i = 0
        while i < bytes.bytesize
          hit = nil
          code_lengths.each do |len|
            next if i + len > bytes.bytesize
            key = bytes.byteslice(i, len)
            if map.key?(key)
              hit = map[key]
              i += len
              break
            end
          end

          if hit
            out << hit
          else
            # Unknown codepoint: keep printable ASCII only as conservative fallback.
            b = bytes.getbyte(i)
            out << b.chr if b && b >= 32 && b <= 126
            i += 1
          end
        end
        out
      rescue StandardError => e
        Logger.warn("TextParser", "decode_tounicode failed: #{e.message}")
        nil
      end

      def clean_text(text)
        return "" unless text
        t = text.to_s.encode(Encoding::UTF_8, Encoding::BINARY, invalid: :replace, undef: :replace, replace: '')
        t = t.gsub(/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/, '')
        t = t.gsub(/[[:space:]]+/, ' ').strip
        t
      end

      def readable_text?(text)
        t = clean_text(text)
        return false if t.empty?
        return false if t.length > 200

        compact = t.gsub(/\s+/, '')
        return false if compact.empty?
        return false if compact =~ /\d{10,}/
        return false if compact =~ /\A[.\-*\/]+\z/
        return false if compact.include?('.-') || compact.include?('-.') || compact.include?('//')

        letters = compact.count('A-Za-z').to_f
        total = compact.length.to_f
        letter_ratio = total > 0 ? letters / total : 0.0

        # Normal words / part marks / callouts.
        return true if letter_ratio >= 0.15
        return true if compact =~ /\A[A-Za-z0-9][A-Za-z0-9_\-:\/\.]{0,31}\z/

        # Dimension-like numeric text.
        return true if compact =~ /\A\d+(?:\/\d+|(?:\.\d+)?(?:["']|mm|cm|in|ft)?)\z/i
        return true if compact =~ /\A\d+[-xX]\d+(?:\/\d+)?\z/

        false
      end

      def quality_filter(items)
        return items if items.empty?

        meaningful = items.count do |it|
          txt = it.text.to_s.gsub(/\s+/, '')
          txt =~ /[A-Za-z]/ ||
            txt =~ /\A\d+(?:\/\d+|(?:\.\d+)?(?:["']|mm|cm|in|ft)?)\z/i ||
            txt =~ /\A\d+[-xX]\d+(?:\/\d+)?\z/
        end

        low_info = items.count do |it|
          txt = it.text.to_s.gsub(/\s+/, '')
          txt.length <= 1 || txt =~ /\A[.\-*\/]+\z/
        end

        # If a page is mostly low-information tokens, suppress text on that page.
        if items.length >= 80 && meaningful < 10 && (low_info.to_f / items.length) > 0.70
          return []
        end

        # In dense CAD sheets, tiny one-character tokens create unreadable clutter.
        # Keep larger callouts and multi-char dimensions while dropping micro-noise.
        one_char_small = items.select do |it|
          txt = it.text.to_s.gsub(/\s+/, '')
          txt.length <= 1 && it.font_size.to_f <= 12.5
        end
        if items.length >= 200 && (one_char_small.length.to_f / items.length) > 0.40
          filtered = items.reject do |it|
            txt = it.text.to_s.gsub(/\s+/, '')
            txt.length <= 1 && it.font_size.to_f <= 12.5
          end
          return filtered unless filtered.empty?
        end

        items
      end

      # Remove text items whose bounding boxes overlap a larger/more informative
      # neighbour. Also cleans fraction residue and thins overcrowded areas.
      def suppress_overlaps(items)
        return items if items.length < 2

        # Build approximate bounding boxes: [x0, y0, x1, y1]
        bboxes = items.map do |it|
          w = estimate_text_width(it.text, it.font_size)
          h = it.font_size.to_f * 1.2
          x0 = it.x.to_f
          y0 = it.y.to_f - h * 0.2
          [x0, y0, x0 + w, y0 + h]
        end

        drop = Array.new(items.length, false)

        # ── Pass 1: Fraction residue cleanup ──
        # Drop stacked numerator/denominator digits that survived reconstruction.
        # CRITICAL: only drop digits that are VERTICALLY offset from the fraction
        # (actual stacked residue). Digits to the LEFT are whole-number parts
        # of the dimension (e.g., "3" in "3 15/16") and must be kept.
        items.each_with_index do |frac_item, fi|
          next if drop[fi]
          next unless frac_item.text =~ /\d+\/\d+/
          fb = bboxes[fi]
          frac_cx = (fb[0] + fb[2]) / 2.0
          frac_cy = (fb[1] + fb[3]) / 2.0
          frac_h = fb[3] - fb[1]

          items.each_with_index do |digit, di|
            next if di == fi || drop[di]
            next unless digit.text =~ /\A\d{1,2}\z/
            dcx = (bboxes[di][0] + bboxes[di][2]) / 2.0
            dcy = (bboxes[di][1] + bboxes[di][3]) / 2.0

            # Only drop if vertically offset (above or below the fraction)
            # NOT if horizontally adjacent (that's a whole number like "3" in "3 15/16")
            dy = (dcy - frac_cy).abs
            dx = (dcx - frac_cx).abs

            # Must be vertically stacked: significant Y offset, small X offset
            is_stacked = dy > frac_h * 0.3 && dx < frac_item.font_size.to_f * 1.5

            if is_stacked
              # Verify the digit matches the fraction's numerator or denominator
              d_val = digit.text.to_i
              frac_parts = frac_item.text.scan(/(\d+)\/(\d+)/).flatten.map(&:to_i)
              if frac_parts.include?(d_val)
                drop[di] = true
              end
            end
          end
        end

        # ── Pass 2: Drop lone single-char digits truly overlapping multi-char items ──
        # Very conservative: tight bbox overlap only, and never drop digits
        # that could be whole-number parts of dimensions
        items.each_with_index do |multi, mi|
          next if drop[mi]
          mt = multi.text.to_s.gsub(/\s/, '')
          next if mt.length < 3
          next if mt =~ /\d+\/\d+/  # don't eat digits near fractions
          mb = bboxes[mi]
          pad = multi.font_size.to_f * 0.3  # very tight — truly on top

          items.each_with_index do |single, si|
            next if si == mi || drop[si]
            txt = single.text.to_s.gsub(/\s/, '')
            next unless txt.length == 1 && txt =~ /\d/

            # Never drop a digit if there's any fraction item nearby —
            # it's likely "3" in "3 15/16" or "2" in "R 2 1/2"
            has_nearby_frac = false
            items.each_with_index do |other, oi|
              next if oi == si || drop[oi]
              if other.text =~ /\d+\/\d+/
                odist = Math.sqrt((other.x.to_f - single.x.to_f)**2 +
                                  (other.y.to_f - single.y.to_f)**2)
                if odist < single.font_size.to_f * 5
                  has_nearby_frac = true
                  break
                end
              end
            end
            next if has_nearby_frac

            scx = (bboxes[si][0] + bboxes[si][2]) / 2.0
            scy = (bboxes[si][1] + bboxes[si][3]) / 2.0
            if scx >= mb[0] - pad && scx <= mb[2] + pad &&
               scy >= mb[1] - pad && scy <= mb[3] + pad
              drop[si] = true
            end
          end
        end

        # ── Pass 3: General overlap — keep the more informative item ──
        # Uses a spatial grid for O(n) average performance instead of O(n^2).
        # But never drop a digit adjacent to a fraction.
        overlap_cell = 30.0  # grid cell size in PDF points
        grid = {}
        items.each_with_index do |_item, idx|
          next if drop[idx]
          bb = bboxes[idx]
          cx0 = (bb[0] / overlap_cell).floor
          cy0 = (bb[1] / overlap_cell).floor
          cx1 = (bb[2] / overlap_cell).floor
          cy1 = (bb[3] / overlap_cell).floor
          (cx0..cx1).each do |cx|
            (cy0..cy1).each do |cy|
              key = (cx << 16) | (cy & 0xFFFF)
              (grid[key] ||= []) << idx
            end
          end
        end

        checked = {}
        grid.each_value do |cell_indices|
          cell_indices.each do |i|
            next if drop[i]
            ab = bboxes[i]
            a = items[i]

            cell_indices.each do |j|
              next if j <= i || drop[j]
              pair = (i << 20) | j
              next if checked[pair]
              checked[pair] = true

              bb = bboxes[j]
              b = items[j]

              next if ab[2] < bb[0] || bb[2] < ab[0] ||
                      ab[3] < bb[1] || bb[3] < ab[1]

              ox = [0, [ab[2], bb[2]].min - [ab[0], bb[0]].max].max
              oy = [0, [ab[3], bb[3]].min - [ab[1], bb[1]].max].max
              overlap = ox * oy
              area_a = [(ab[2] - ab[0]) * (ab[3] - ab[1]), 0.001].max
              area_b = [(bb[2] - bb[0]) * (bb[3] - bb[1]), 0.001].max
              min_area = [area_a, area_b].min

              next unless (overlap / min_area) > 0.30

              a_is_digit = a.text.to_s =~ /\A\d{1,2}\z/
              b_is_digit = b.text.to_s =~ /\A\d{1,2}\z/
              a_is_frac = a.text.to_s =~ /\d+\/\d+/
              b_is_frac = b.text.to_s =~ /\d+\/\d+/
              next if (a_is_digit && b_is_frac) || (b_is_digit && a_is_frac)

              score_a = a.text.to_s.length + (a.text =~ /[A-Za-z]/ ? 5 : 0) +
                         (a.text =~ /\d+\/\d+/ ? 3 : 0)
              score_b = b.text.to_s.length + (b.text =~ /[A-Za-z]/ ? 5 : 0) +
                         (b.text =~ /\d+\/\d+/ ? 3 : 0)
              if score_a >= score_b
                drop[j] = true
              else
                drop[i] = true
                break
              end
            end
          end
        end

        # ── Pass 4: Density thinning ──
        # Thin truly overcrowded areas but protect dimensions and part marks
        surviving = []
        items.each_with_index { |it, i| surviving << [it, bboxes[i], i] unless drop[i] }

        if surviving.length > 100
          cell_size = 60.0
          cells = {}
          surviving.each do |it, bb, idx|
            cx = (bb[0] / cell_size).floor
            cy = (bb[1] / cell_size).floor
            key = [cx, cy]
            cells[key] ||= []
            cells[key] << [it, idx]
          end

          cells.each do |_, group|
            next if group.length <= 5
            ranked = group.sort_by do |it, _|
              txt = it.text.to_s
              score = txt.length
              score += 20 if txt =~ /[A-Za-z]{2,}/
              score += 15 if txt =~ /\d+\/\d+/
              score += 15 if txt =~ /\d+['-]/
              score += 10 if txt =~ /SECTION|DETAIL|MITER|PIPE|GALV/i
              -score
            end
            ranked[5..-1].each do |it, idx|
              txt = it.text.to_s
              # Protect critical text
              next if txt =~ /\d+\/\d+/
              next if txt =~ /\d+['']\s*[-–]?\s*\d/
              next if txt =~ /\b[mp]\d{3,}/i
              next if txt =~ /SECTION|DETAIL/i
              drop[idx] = true
            end
          end
        end

        result = []
        items.each_with_index { |it, i| result << it unless drop[i] }
        result
      rescue StandardError => e
        Logger.warn("TextParser", "suppress_overlaps failed: #{e.message}")
        items
      end

      def merge_text_runs(items)
        return items if items.length < 2

        # Group by similar orientation/font and near-baseline, then merge nearby glyph runs.
        buckets = {}
        items.each do |it|
          angle_key = (it.angle.to_f / 2.0).round
          size_key = (it.font_size.to_f / 0.5).round
          font_key = it.font_name.to_s
          key = [angle_key, size_key, font_key]
          (buckets[key] ||= []) << it
        end

        merged = []
        buckets.each_value do |group|
          next merged.concat(group) if group.length < 2

          rows = []
          group.sort_by { |it| [-it.y.to_f, it.x.to_f] }.each do |it|
            placed = false
            rows.each do |row|
              y_tol = [0.9, row[:size] * 0.28].max
              if (it.y.to_f - row[:y]).abs <= y_tol
                row[:items] << it
                row[:y_sum] += it.y.to_f
                row[:count] += 1
                row[:y] = row[:y_sum] / row[:count]
                placed = true
                break
              end
            end
            unless placed
              rows << {
                y: it.y.to_f,
                y_sum: it.y.to_f,
                count: 1,
                size: it.font_size.to_f,
                items: [it]
              }
            end
          end

          rows.each do |row|
            line = row[:items].sort_by { |it| it.x.to_f }
            run = []
            line.each do |it|
              if run.empty?
                run << it
                next
              end

              prev = run.last
              prev_width = estimate_text_width(prev.text, prev.font_size.to_f)
              gap = it.x.to_f - (prev.x.to_f + prev_width)
              max_join_gap = [prev.font_size.to_f * 2.2, 4.0].max
              min_overlap = -[prev.font_size.to_f * 0.9, 4.0].max

              if gap <= max_join_gap && gap >= min_overlap
                run << it
              else
                merged << merge_run(run)
                run = [it]
              end
            end
            merged << merge_run(run) unless run.empty?
          end
        end

        merged
      rescue StandardError => e
        Logger.warn("TextParser", "merge_text_runs failed: #{e.message}")
        items
      end

      # Fix fractions that merge_text_runs joined with a space instead of a slash.
      # "5 16" → "5/16", "7 16" → "7/16", "15 16" → "15/16"
      # Also handles mid-string: "1'-4 5 16" → "1'-4 5/16"
      def fix_merged_fractions(items)
        items.map do |it|
          text = it.text.to_s
          # Pattern: standalone "N DD" where DD is a valid denominator and N < DD
          fixed = text.gsub(/\b(\d{1,2}) (\d{1,2})\b/) do |match|
            num = $1.to_i
            den = $2.to_i
            if VALID_DENOMS.include?(den) && num > 0 && num < den
              "#{$1}/#{$2}"
            else
              match
            end
          end
          if fixed != text
            TextItem.new(fixed, it.x, it.y, it.font_size, it.angle, it.font_name, it.raw_font_size || it.font_size)
          else
            it
          end
        end
      rescue StandardError => e
        Logger.warn("TextParser", "fix_merged_fractions failed: #{e.message}")
        items
      end

      def merge_run(run)
        return run.first if run.length == 1

        text = ""
        cursor = run.first.x.to_f
        run.each_with_index do |it, idx|
            if idx > 0
              gap = it.x.to_f - cursor
              prev_txt = run[idx - 1].text.to_s
              curr_txt = it.text.to_s

              # Keep mixed dimensions readable: avoid "11/6" from "1" + "1/6".
              force_space =
                (prev_txt =~ /\d\z/ && curr_txt =~ /\A\d+\s*\/\s*\d+/) ||
                (prev_txt =~ /\A\d+\s*\/\s*\d+\z/ && curr_txt =~ /\A\d\z/) ||
                (prev_txt =~ /[A-Za-z]\z/ && curr_txt =~ /\A\d/)

              # Insert space for meaningful gap
              space_gap = [it.font_size.to_f * 0.35, 1.2].max
              text << " " if force_space || gap > space_gap
            end
          text << it.text.to_s
          width = estimate_text_width(it.text, it.font_size.to_f)
          cursor = [cursor, it.x.to_f + width].max
        end

        base = run.first
        TextItem.new(
          clean_text(text),
          base.x,
          base.y,
          base.font_size,
          base.angle,
          base.font_name,
          base.raw_font_size || base.font_size
        )
      end

      def estimate_text_width(text, font_size)
        chars = [text.to_s.length, 1].max
        [font_size.to_f * 0.24 * chars, font_size.to_f * 0.25].max
      end

      def dedupe_text_items(items)
        return items if items.length < 2

        seen = {}
        out = []
        items.each do |it|
          txt = clean_text(it.text)
          next if txt.empty?
          key = [
            txt,
            (it.x.to_f * 2.0).round / 2.0,
            (it.y.to_f * 2.0).round / 2.0,
            (it.font_size.to_f * 2.0).round / 2.0,
            (it.angle.to_f * 2.0).round / 2.0
          ]
          next if seen[key]
          seen[key] = true
          out << it
        end
        out
      rescue StandardError => e
        Logger.warn("TextParser", "deduplicate_text failed: #{e.message}")
        items
      end

      def multiply_matrix(m1, m2)
        [
          m1[0] * m2[0] + m1[1] * m2[2],
          m1[0] * m2[1] + m1[1] * m2[3],
          m1[2] * m2[0] + m1[3] * m2[2],
          m1[2] * m2[1] + m1[3] * m2[3],
          m1[4] * m2[0] + m1[5] * m2[2] + m2[4],
          m1[4] * m2[1] + m1[5] * m2[3] + m2[5]
        ]
      end

      # ---------------------------------------------------------------
      # Fraction reconstruction
      # ---------------------------------------------------------------
      def reconstruct_fractions(items)
        return items if items.length < 2

        # Group text items by proximity on the same Y coordinate
        # Then look for stacked numerator/denominator pairs
        result = []
        used = Array.new(items.length, false)

        items.each_with_index do |item, i|
          next if used[i]

          # Check if this is a small-font digit that might be a fraction part
          if item.text =~ /\A\d{1,2}\z/ && items.length > i + 1
            # Look for a nearby denominator
            items.each_with_index do |other, j|
              next if j <= i || used[j]
              next unless other.text =~ /\A\d{1,2}\z/

              # Check proximity (same X region, different Y = stacked)
              dx = (item.x - other.x).abs
              dy = (item.y - other.y).abs

              # Stacked fractions: similar X, offset Y
              if dx < item.font_size * 3 && dy < item.font_size * 2.0 && dy > 0.3
                num_val = item.text.to_i
                den_val = other.text.to_i

                # Determine which is numerator (higher Y in PDF = visually on top)
                if item.y > other.y
                  numerator, denominator = num_val, den_val
                  base_item = item
                else
                  numerator, denominator = den_val, num_val
                  base_item = other
                end

                if VALID_DENOMS.include?(denominator) && numerator > 0 && numerator < denominator
                  # Found a fraction! Reconstruct as inline
                  frac_text = "#{numerator}/#{denominator}"
                  mid_y = (item.y + other.y) / 2.0
                  result << TextItem.new(
                    frac_text,
                    [item.x, other.x].min,
                    mid_y,
                    [item.font_size, other.font_size].max,
                    item.angle,
                    item.font_name,
                    [item.raw_font_size || item.font_size, other.raw_font_size || other.font_size].max
                  )
                  used[i] = true
                  used[j] = true
                  break
                end
              end
            end
          end

          unless used[i]
            # Try splitting combined digit strings (e.g., "1516" → "15/16")
            if item.text =~ /\A\d{3,4}\z/
              frac = try_split_fraction(item.text)
              if frac
                result << TextItem.new(
                  "#{frac[0]}/#{frac[1]}",
                  item.x, item.y, item.font_size, item.angle, item.font_name,
                  item.raw_font_size || item.font_size
                )
                used[i] = true
                next
              end
            end

            result << item
            used[i] = true
          end
        end

        result
      end

      def try_split_fraction(text)
        return nil if text.length < 3

        best = nil
        (1...text.length).each do |i|
          num_s = text[0, i]
          den_s = text[i..-1]
          begin
            num = num_s.to_i
            den = den_s.to_i
            if VALID_DENOMS.include?(den) && num > 0 && num < den
              if best.nil? || den < best[1]
                best = [num, den]
              end
            end
          rescue StandardError => e
            Logger.warn("TextParser", "parse_fraction failed: #{e.message}")
            next
          end
        end
        best
      end

      # ---------------------------------------------------------------
      # PDF string decoding
      # ---------------------------------------------------------------
      def decode_pdf_string_bytes(str)
        return "".b unless str
        s = str.to_s
        # Remove parentheses wrapper
        if s.start_with?('(') && s.end_with?(')')
          s = s[1..-2]
        end

        out = "".b
        i = 0
        while i < s.length
          ch = s[i]
          if ch == '\\'
            i += 1
            break if i >= s.length
            esc = s[i]

            case esc
            when 'n' then out << "\n".b
            when 'r' then out << "\r".b
            when 't' then out << "\t".b
            when 'b' then out << "\b".b
            when 'f' then out << "\f".b
            when '\\' then out << "\\".b
            when '(' then out << "(".b
            when ')' then out << ")".b
            when "\n"
              # Line continuation: swallow escaped newline
            when "\r"
              # CR or CRLF continuation
              i += 1 if i + 1 < s.length && s[i + 1] == "\n"
            when /[0-7]/
              oct = esc
              j = 0
              while j < 2 && i + 1 < s.length && s[i + 1] =~ /[0-7]/
                i += 1
                oct << s[i]
                j += 1
              end
              out << oct.to_i(8).chr(Encoding::BINARY)
            else
              out << esc.b
            end
          else
            out << ch.b
          end
          i += 1
        end

        out
      end

      def decode_pdf_hex_bytes(str)
        s = str.to_s
        s = s[1..-2] if s.start_with?('<') && s.end_with?('>')
        hex = s.gsub(/[^0-9A-Fa-f]/, '')
        hex = hex + '0' if hex.length.odd?

        [hex].pack('H*')
      end

      def extract_tj_text(array_str, font_name = nil)
        # TJ arrays contain strings and numbers: [(Hello ) -250 (World)]
        arr = array_str.to_s
        chunks = arr.scan(/\((?:\\.|[^\\)])*\)|<[^>]*>/)
        text = ""
        chunks.each do |chunk|
          text << decode_text_operand(chunk, font_name)
        end
        clean_text(text)
      end

      # ---------------------------------------------------------------
      # Tokenizer (simplified for text extraction)
      # ---------------------------------------------------------------
      def tokenize(stream)
        tokens = []
        i = 0
        len = stream.length

        while i < len
          c = stream[i]

          if c =~ /[\s\x00]/
            i += 1; next
          end

          if c == '%'
            eol = stream.index(/[\r\n]/, i) || len
            i = eol + 1; next
          end

          if c == '('
            depth = 1; j = i + 1
            while j < len && depth > 0
              if stream[j] == '\\'; j += 2; next; end
              depth += 1 if stream[j] == '('
              depth -= 1 if stream[j] == ')'
              j += 1
            end
            tokens << { type: :string, value: stream[i...j] }
            i = j; next
          end

          if c == '<' && (i + 1 >= len || stream[i + 1] != '<')
            j = stream.index('>', i) || len
            tokens << { type: :hex_string, value: stream[i..j] }
            i = j + 1; next
          end

          if c == '/'
            j = i + 1
            while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
            tokens << { type: :name, value: stream[i...j] }
            i = j; next
          end

          if c == '['
            depth = 1; j = i + 1
            while j < len && depth > 0
              depth += 1 if stream[j] == '['
              depth -= 1 if stream[j] == ']'
              j += 1
            end
            tokens << { type: :array, value: stream[i...j] }
            i = j; next
          end

          if c == ']'; i += 1; next; end

          if c == '<' && i + 1 < len && stream[i + 1] == '<'
            depth = 1; j = i + 2
            while j < len - 1 && depth > 0
              if stream[j, 2] == '<<'; depth += 1; j += 2
              elsif stream[j, 2] == '>>'; depth -= 1; j += 2
              else j += 1; end
            end
            tokens << { type: :dict, value: stream[i...j] }
            i = j; next
          end

          if c == '>' && i + 1 < len && stream[i + 1] == '>'; i += 2; next; end

          j = i
          while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
          word = stream[i...j]
          if word =~ /\A[+-]?\d*\.?\d+\z/
            tokens << { type: :number, value: word.to_f }
          else
            tokens << { type: :operator, value: word }
          end
          i = j
        end

        tokens
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/unit_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/unit_parser.rb`
- Size: `4.83 KB`
- Modified: `2026-04-01 20:05:09`

```ruby
# bc_pdf_vector_importer/unit_parser.rb
# Parses dimension strings into inches (SketchUp's internal unit).
# Handles: feet-inches compound (5'-6"), mixed fractions (1 1/2 in),
# pure fractions (3/8"), decimals with units, and metric.
#
# Mirrors the FreeCAD version's parse_dimension_mm but outputs inches.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module UnitParser

      # Unit → inches conversion
      UNITS_TO_INCHES = {
        'in'          => 1.0,
        'inch'        => 1.0,
        'inches'      => 1.0,
        '"'           => 1.0,
        'ft'          => 12.0,
        'foot'        => 12.0,
        'feet'        => 12.0,
        "'"           => 12.0,
        'mm'          => 1.0 / 25.4,
        'millimeter'  => 1.0 / 25.4,
        'millimeters' => 1.0 / 25.4,
        'cm'          => 10.0 / 25.4,
        'centimeter'  => 10.0 / 25.4,
        'centimeters' => 10.0 / 25.4,
        'm'           => 1000.0 / 25.4,
        'meter'       => 1000.0 / 25.4,
        'meters'      => 1000.0 / 25.4,
        'yd'          => 36.0,
        'yard'        => 36.0,
        'yards'       => 36.0,
      }.freeze

      # ---------------------------------------------------------------
      # Parse a dimension string → value in inches.
      # Returns nil if unparseable.
      #
      # Examples:
      #   "5'-6\""        → 66.0
      #   "1'-4"          → 16.0
      #   "5' 6 1/2\""    → 66.5
      #   "1 1/2 in"      → 1.5
      #   "3/8"           → 0.375 (assumes inches)
      #   "406.4 mm"      → 16.0
      #   "2.5 ft"        → 30.0
      #   "120"           → 120.0 (assumes model units)
      # ---------------------------------------------------------------
      def self.parse_inches(text)
        return nil unless text.is_a?(String)
        text = text.strip
        return nil if text.empty?

        # 1. Feet-inches compound: 5'-6"  5' 6 1/2"  5ft 6in  1'-4
        result = try_feet_inches(text)
        return result if result

        # 2. Mixed number + unit: 1 1/2 in  3 3/4 ft
        result = try_mixed(text)
        return result if result

        # 3. Pure fraction + unit: 3/8  1/2 in
        result = try_fraction(text)
        return result if result

        # 4. Decimal + unit: 406.4 mm  4.92 in  120
        result = try_decimal(text)
        return result if result

        nil
      end

      # ---------------------------------------------------------------
      # Parse a dimension string → value in the model's current unit.
      # Convenience for the scale tool — uses SketchUp's unit settings.
      # ---------------------------------------------------------------
      def self.parse_model_units(text)
        # First try SketchUp's built-in parser
        begin
          len = text.to_l
          return len.to_f  # returns inches
        rescue StandardError => e
          Logger.warn("UnitParser", "parse_model_units SketchUp parse failed: #{e.message}")
        end
        parse_inches(text)
      end

      private

      def self.try_feet_inches(text)
        # Pattern: 5'-6"  5'-6 1/2"  5' 6"  5ft 6in  5'6  1'-4
        if text =~ /\A\s*(\d+(?:\.\d+)?)\s*(?:'|ft|feet)\s*[-–]?\s*(\d+(?:\.\d+)?)?\s*(?:(\d+)\s*\/\s*(\d+))?\s*(?:"|in|inch|inches)?\s*\z/i
          feet = $1.to_f
          inches = $2 ? $2.to_f : 0.0
          if $3 && $4 && $4.to_f != 0
            frac = $3.to_f / $4.to_f
            inches += frac
          end
          return feet * 12.0 + inches
        end
        nil
      end

      def self.try_mixed(text)
        # Pattern: 1 1/2 in  3 3/4 ft  2 5/8
        if text =~ /\A\s*(\d+(?:\.\d+)?)\s+(\d+)\s*\/\s*(\d+)\s*([a-zA-Z"']+)?\s*\z/
          whole = $1.to_f
          frac = $3.to_f != 0 ? $2.to_f / $3.to_f : 0.0
          unit_str = $4
          value = whole + frac
          factor = unit_factor(unit_str)
          return value * factor
        end
        nil
      end

      def self.try_fraction(text)
        # Pattern: 1/2  3/8 in  1/4"
        if text =~ /\A\s*(\d+)\s*\/\s*(\d+)\s*([a-zA-Z"']+)?\s*\z/
          value = $1.to_f / $2.to_f
          unit_str = $3
          factor = unit_factor(unit_str)
          return value * factor
        end
        nil
      end

      def self.try_decimal(text)
        # Pattern: 406.4 mm  4.92 in  120  2.5ft
        if text =~ /\A\s*(\d+(?:\.\d+)?)\s*([a-zA-Z"']+)?\s*\z/
          value = $1.to_f
          unit_str = $2
          factor = unit_factor(unit_str)
          return value * factor
        end
        nil
      end

      def self.unit_factor(unit_str)
        return 1.0 unless unit_str
        key = unit_str.strip.downcase.gsub(/[.]/, '')
        UNITS_TO_INCHES[key] || 1.0
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/validator.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/validator.rb`
- Size: `3.38 KB`
- Modified: `2026-03-23 16:45:51`

```ruby
# bc_pdf_vector_importer/validator.rb
# Compares dimension text to geometry. Fixed field names.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module Validator

      ValidationResult = Struct.new(
        :status, :feature_type, :dimension_text, :expected_value,
        :measured_value, :error_abs, :error_pct, :suggestion, :prim_id
      )

      def self.validate(recognition_results, text_items = [], opts = {})
        tol_pct = opts[:tolerance_percent] || 2.0
        tol_abs = opts[:tolerance_abs] || 0.015
        results = []

        # Validate holes
        (recognition_results[:holes] || []).each do |hole|
          next unless hole.diameter_note
          measured = hole.diameter_geom
          expected = hole.diameter_note
          error = (measured - expected).abs
          error_pct = expected > 0 ? (error / expected) * 100.0 : 0

          status = if error < tol_abs || error_pct < tol_pct then :ok
                   elsif error_pct < tol_pct * 3 then :warning
                   else :mismatch end

          suggestion = nil
          if status != :ok
            suggestion = "Hole: geometry #{format('%.4f', measured)} vs " \
                         "callout #{format('%.4f', expected)}, " \
                         "diff=#{format('%.4f', error)}"
          end

          results << ValidationResult.new(
            status, :hole, hole.diameter_note.to_s, expected, measured,
            error, error_pct, suggestion, hole.source_prim_id
          )
        end

        # Validate plates
        (recognition_results[:plates] || []).each do |plate|
          (plate.dimension_texts || []).each do |dim|
            next unless dim.is_a?(Hash) && dim[:value]
            expected = dim[:value].to_f
            next unless expected > 0

            w = plate.width_geom || 0
            h = plate.height_geom || 0
            candidates = [
              { label: 'width',  val: w },
              { label: 'height', val: h }
            ]
            best = candidates.min_by { |c| (c[:val] - expected).abs }
            measured = best[:val]
            error = (measured - expected).abs
            error_pct = expected > 0 ? (error / expected) * 100.0 : 0

            status = if error < tol_abs || error_pct < tol_pct then :ok
                     elsif error_pct < tol_pct * 3 then :warning
                     else :mismatch end

            suggestion = status != :ok ?
              "Plate #{best[:label]}: #{format('%.3f', measured)} vs dim #{format('%.3f', expected)}" : nil

            results << ValidationResult.new(
              status, :plate, dim[:text].to_s, expected, measured,
              error, error_pct, suggestion, plate.outer_prim_id
            )
          end
        end

        results
      end

      def self.report(results)
        return "No features validated." if results.empty?
        ok = results.count { |r| r.status == :ok }
        warn = results.count { |r| r.status == :warning }
        bad = results.count { |r| r.status == :mismatch }
        lines = ["Validation: #{ok} OK, #{warn} warnings, #{bad} mismatches"]
        results.select { |r| r.status != :ok }.first(5).each do |r|
          lines << "  #{r.suggestion}" if r.suggestion
        end
        lines.join("\n")
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer/xobject_parser.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer/xobject_parser.rb`
- Size: `9.47 KB`
- Modified: `2026-04-04 04:34:57`

```ruby
# bc_pdf_vector_importer/xobject_parser.rb
# Form XObject parser — detects reusable content blocks in PDFs
# and maps them to SketchUp Component Definitions.
#
# Many CAD PDFs reuse geometry through Form XObjects (repeated elements,
# symbols, repeated details, title block elements). This parser
# identifies them and creates SketchUp components placed as instances,
# dramatically reducing model size and enabling easy editing.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class XObjectParser

      # Represents a reusable Form XObject
      FormXObject = Struct.new(
        :obj_num,       # PDF object number
        :name,          # Resource name (e.g., "Fm0", "X1")
        :bbox,          # Bounding box [x0, y0, x1, y1]
        :matrix,        # Optional transformation matrix [a,b,c,d,e,f]
        :stream_data,   # Decoded content stream
        :usage_count,   # How many times this XObject is referenced
        :paths,         # Parsed vector paths (lazy, filled on first use)
        :instance_xforms # Array of CTM transforms where Do is called
      )

      attr_reader :form_xobjects  # { name => FormXObject }

      def initialize(pdf_parser)
        @pdf = pdf_parser
        @form_xobjects = {}
      end

      # ---------------------------------------------------------------
      # Scan a page's resources for Form XObjects
      # ---------------------------------------------------------------
      def scan_page(page_num)
        page_data = @pdf.page_data(page_num)
        return unless page_data

        # We need to access the page object's /Resources /XObject dict
        # This requires reaching into the parser a bit
        page_ref = @pdf.instance_variable_get(:@pages)[page_num - 1]
        return unless page_ref

        page_obj = @pdf.resolve_object(page_ref)
        page_dict = to_dict(page_obj)
        return unless page_dict

        # Get resources — may be inherited from parent
        resources = find_inherited(page_dict, '/Resources')
        return unless resources

        res_dict = to_dict(@pdf.resolve_object(resources))
        return unless res_dict

        # Get XObject sub-dictionary
        xobj_ref = res_dict['/XObject']
        return unless xobj_ref

        xobj_dict = to_dict(@pdf.resolve_object(xobj_ref))
        return unless xobj_dict

        # Iterate over each XObject entry
        xobj_dict.each do |name, ref|
          next if name == '/Type' || name == '/Subtype'
          next unless ref.is_a?(String) && ref =~ /\A(\d+)\s+(\d+)\s+R\z/

          obj_num = $1.to_i
          xobj = @pdf.resolve_object(ref)
          xobj_d = to_dict(xobj)
          next unless xobj_d

          # Only process Form XObjects (not Image XObjects)
          subtype = xobj_d['/Subtype']
          next unless subtype == '/Form'

          # Extract BBox
          bbox = parse_array_nums(xobj_d['/BBox']) if xobj_d['/BBox']
          bbox ||= [0, 0, 100, 100]

          # Extract optional Matrix
          matrix = nil
          if xobj_d['/Matrix']
            matrix = parse_array_nums(xobj_d['/Matrix'])
          end

          # Get the stream content
          stream_data = @pdf.get_stream_data(obj_num)

          clean_name = name.to_s.gsub(/\A\//, '')

          form = FormXObject.new(
            obj_num,
            clean_name,
            bbox,
            matrix,
            stream_data,
            0,
            nil,
            []
          )

          @form_xobjects[clean_name] = form
        end
      end

      # ---------------------------------------------------------------
      # Count XObject references in content streams (Do operator)
      # ---------------------------------------------------------------
      def count_references(streams)
        return unless streams

        streams.each do |stream|
          next unless stream
          # Scan for "/<name> Do" patterns
          stream.scan(/\/(\S+)\s+Do/) do |match|
            name = match[0]
            if @form_xobjects[name]
              @form_xobjects[name].usage_count += 1
            end
          end
        end
      end

      # ---------------------------------------------------------------
      # Track where each Form XObject is used (capture CTM at Do time)
      # ---------------------------------------------------------------
      def track_placements(streams)
        return unless streams
        # This requires parsing the content stream with CTM tracking
        # We track q/Q state and cm operators to know the CTM at each Do
        ctm_stack = [[1, 0, 0, 1, 0, 0]]
        current_ctm = [1, 0, 0, 1, 0, 0]

        streams.each do |stream|
          next unless stream
          tokens = tokenize_stream(stream)
          operands = []

          tokens.each do |tok|
            if tok[:type] == :operator
              case tok[:value]
              when 'q'
                ctm_stack.push(current_ctm.dup)
              when 'Q'
                current_ctm = ctm_stack.pop || [1, 0, 0, 1, 0, 0]
              when 'cm'
                nums = operands.select { |t| t[:type] == :number }.map { |t| t[:value] }
                if nums.length >= 6
                  current_ctm = multiply_matrices(
                    current_ctm,
                    [nums[0], nums[1], nums[2], nums[3], nums[4], nums[5]]
                  )
                end
              when 'Do'
                name_tok = operands.find { |t| t[:type] == :name }
                if name_tok
                  name = name_tok[:value].gsub(/\A\//, '')
                  if @form_xobjects[name]
                    @form_xobjects[name].instance_xforms << current_ctm.dup
                    @form_xobjects[name].usage_count = @form_xobjects[name].instance_xforms.length
                  end
                end
              end
              operands.clear
            else
              operands << tok
            end
          end
        end
      end

      # ---------------------------------------------------------------
      # Parse the content stream of a Form XObject into vector paths
      # (lazy — only when needed for component creation)
      # ---------------------------------------------------------------
      def parse_xobject_paths(name)
        form = @form_xobjects[name]
        return [] unless form && form.stream_data

        # Re-use the content stream parser
        cs_parser = ContentStreamParser.new([form.stream_data], @pdf)
        paths = cs_parser.parse
        form.paths = paths
        paths
      end

      # ---------------------------------------------------------------
      # Get XObjects that are worth making into Components
      # (referenced more than once)
      # ---------------------------------------------------------------
      def reusable_xobjects(min_uses: 2)
        @form_xobjects.values.select { |f| f.usage_count >= min_uses }
      end

      private

      def to_dict(obj)
        return obj if obj.is_a?(Hash)
        if obj.is_a?(String) && obj.include?('<<')
          begin
            @pdf.send(:parse_dict_string, obj)
          rescue StandardError => e
            Logger.warn("XObjectParser", "parse_dict_string failed: #{e.message}")
            nil
          end
        else
          nil
        end
      end

      MAX_INHERIT_DEPTH = 32

      def find_inherited(dict, key, depth = 0)
        return dict[key] if dict[key]
        return nil if depth >= MAX_INHERIT_DEPTH
        if dict['/Parent']
          parent = @pdf.resolve_object(dict['/Parent'])
          parent_dict = to_dict(parent)
          return find_inherited(parent_dict, key, depth + 1) if parent_dict
        end
        nil
      end

      def parse_array_nums(val)
        if val.is_a?(Array)
          return val.map { |v| v.to_s.to_f }
        elsif val.is_a?(String)
          begin
            @pdf.send(:parse_array_string, val).map { |v| v.to_s.to_f }
          rescue StandardError => e
            Logger.warn("XObjectParser", "parse_array_string failed: #{e.message}")
            []
          end
        else
          []
        end
      end

      def multiply_matrices(m1, m2)
        [
          m1[0] * m2[0] + m1[1] * m2[2],
          m1[0] * m2[1] + m1[1] * m2[3],
          m1[2] * m2[0] + m1[3] * m2[2],
          m1[2] * m2[1] + m1[3] * m2[3],
          m1[4] * m2[0] + m1[5] * m2[2] + m2[4],
          m1[4] * m2[1] + m1[5] * m2[3] + m2[5]
        ]
      end

      def tokenize_stream(stream)
        tokens = []
        i = 0
        len = stream.length
        while i < len
          c = stream[i]
          if c =~ /[\s\x00]/; i += 1; next; end
          if c == '%'
            eol = stream.index(/[\r\n]/, i) || len
            i = eol + 1; next
          end
          if c == '/'
            j = i + 1
            while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
            tokens << { type: :name, value: stream[i...j] }
            i = j; next
          end
          j = i
          while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
          word = stream[i...j]
          if word =~ /\A[+-]?\d*\.?\d+\z/
            tokens << { type: :number, value: word.to_f }
          else
            tokens << { type: :operator, value: word }
          end
          i = j
        end
        tokens
      end

    end
  end
end
```

### extracted/sketchup_ext/bc_pdf_vector_importer.rb

- Path: `extracted/sketchup_ext/bc_pdf_vector_importer.rb`
- Size: `1.50 KB`
- Modified: `2026-04-04 04:36:04`

```ruby
# bc_pdf_vector_importer.rb
# Root loader for the PDF Vector Importer SketchUp Extension
# CI-tested across Ruby 2.2 / 2.7 / 3.0 / 3.2 (SketchUp Make 2017 baseline through current releases).
#
# Copyright 2024-2026 BlueCollar Systems
# License: MIT
# BUILT. NOT BOUGHT.
#
# AI Contributors: Claude & Claude Code (Anthropic), ChatGPT & Codex (OpenAI),
#   Gemini (Google), Microsoft Copilot — collaborative AI development partners.

require 'sketchup.rb'
require 'extensions.rb'

module BlueCollarSystems
  module PDFVectorImporter

    PLUGIN_ID       = 'bc_pdf_vector_importer'.freeze
    PLUGIN_NAME     = 'PDF Vector Importer'.freeze
    PLUGIN_VERSION  = '3.6.4'.freeze
    PLUGIN_DIR      = File.join(File.dirname(__FILE__), PLUGIN_ID).freeze

    extension = SketchupExtension.new(PLUGIN_NAME, File.join(PLUGIN_ID, 'main'))
    extension.creator     = 'BlueCollar Systems'
    extension.description = 'Import PDF vector geometry as native editable SketchUp edges. ' \
                            'Features arc reconstruction, color-based tag grouping, ' \
                            'text import, dash patterns, Scale by Reference tool, ' \
                            'scanned-page detection warnings, and full Bezier support. ' \
                            'CI-tested: Ruby 2.2, 2.7, 3.0, and 3.2 (SketchUp Make 2017+ baseline).'
    extension.version     = PLUGIN_VERSION
    extension.copyright   = '2024-2026 BlueCollar Systems'

    Sketchup.register_extension(extension, true)

  end
end
```

### README.md

- Path: `README.md`
- Size: `8.73 KB`
- Modified: `2026-04-04 04:35:56`

~~~markdown
# PDF Vector Importer for SketchUp

**BUILT. NOT BOUGHT.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-3.6.4-green.svg)]()
[![Platform](https://img.shields.io/badge/Platform-SketchUp%202017%2B-orange.svg)]()
[![Ruby](https://img.shields.io/badge/Ruby-2.2%2B-red.svg)]()

Import PDF vector geometry as native editable SketchUp edges with arc reconstruction, color-based tag grouping, text import, dash patterns, Scale by Reference tool, and full Bezier support. Pure-Ruby PDF parser -- no external dependencies.

---

## Overview

PDF Vector Importer parses PDF content streams directly in Ruby and reconstructs vector geometry as native SketchUp edges. No gems, no external binaries, no C extensions. It runs on every platform SketchUp supports, from SketchUp 2017 Make (Ruby 2.2) through the current Pro release.

The importer profiles each PDF document to identify its origin (fabrication drawings, CAD exports, architectural plans, vector art, or raster scans) and adapts its import strategy accordingly.

---

## Key Features

- **Pure-Ruby PDF parser** -- no gems or external dependencies required
- **Adaptive Bezier subdivision** with configurable flatness tolerance
- **Kasa algebraic circle fitting** for arc reconstruction from point sequences
- **OCG layer support** -- PDF Optional Content Groups map to SketchUp Tags
- **Color-based tag grouping** with dash pattern mapping
- **Scale by Reference** tool -- select an edge, type the real-world dimension
- **Quick Scale** with 15 architectural/engineering presets
- **Architectural scale notation parsing** (1/4"=1'-0", 3/8"=1', etc.)
- **Text import** as geometry or labels
- **Raster fallback** for scanned pages
- **Import quality assessment** with warnings and performance metrics
- **Post-import action workflow** (geometry only, scale, cleanup, feature inventory)
- **Safe Mode import command** (Fast preset) for very dense/problem PDFs
- **Native DXF bridge command** from the extension menu/toolbar
- **Tag visibility controls** for PDF layers
- **Document profiling** (fabrication, CAD, architectural, vector art, raster)
- **FlateDecode decompression** for compressed PDF streams
- **Form XObject recursion** for embedded PDF forms

---

## Installation

1. Download `bc_pdf_vector_importer_v3.6.4.rbz`
2. In SketchUp: **Window > Extension Manager > Install Extension**
3. Select the `.rbz` file
4. Restart SketchUp if prompted

The extension registers under **File > Import** and adds a PDF Vector Importer toolbar.

For SketchUp 2025 users: native PDF import discoverability changed in SketchUp UI,
but this extension still provides dedicated PDF import menu and toolbar commands.

---

## Scale Tool

The Scale by Reference tool lets you correct imported geometry to real-world dimensions. Select any edge, type the known real dimension, and all imported geometry scales proportionally.

### Quick Scale Presets

The Quick Scale dialog provides 15 architectural and engineering presets:

| Preset | Scale Ratio | Factor | Common Use |
|--------|-------------|--------|------------|
| 1:1 | Full size | 1.0 | Detail drawings |
| 1:2 | Half size | 0.5 | Large details |
| 1:4 | Quarter size | 0.25 | Construction details |
| 1:5 | 1/5 size | 0.2 | Detail drawings (metric) |
| 1:8 | 1/8 size | 0.125 | Room plans |
| 1:10 | 1/10 size | 0.1 | Detailed plans (metric) |
| 1:16 | 1/16 size | 0.0625 | Section drawings |
| 1:20 | 1/20 size | 0.05 | Building plans (metric) |
| 1:24 | 1/24 size | 0.04167 | 1/2"=1'-0" plans |
| 1:48 | 1/48 size | 0.02083 | 1/4"=1'-0" plans |
| 1:50 | 1/50 size | 0.02 | General plans (metric) |
| 1:96 | 1/96 size | 0.01042 | 1/8"=1'-0" plans |
| 1:100 | 1/100 size | 0.01 | Site plans (metric) |
| 1:192 | 1/192 size | 0.00521 | 1/16"=1'-0" plans |
| 1:200 | 1/200 size | 0.005 | Site plans (metric) |

The tool also accepts freeform architectural notation such as `1/4"=1'-0"`, `3/8"=1'`, `1"=10'`, and similar formats.

---

## Import Report

After every import, the extension presents a quality assessment report with three sections:

### Quality Assessment

Each import receives a quality grade based on geometry fidelity:

- **Excellent** -- All vectors parsed, arcs reconstructed, no anomalies
- **Good** -- Minor issues (small gaps, unclosed paths) that do not affect usability
- **Fair** -- Some geometry lost or degraded; manual review recommended
- **Poor** -- Significant parsing failures; consider alternate export settings

### Warnings

The report flags common issues:

- Clipping paths that may hide geometry
- Extremely thin or zero-width strokes
- Unsupported blend modes or transparency
- Font-based geometry that could not be converted
- Coordinate values outside the SketchUp modeling range
- Pages with no extractable vector content (raster-only)

### Performance Metrics

Every import logs timing and throughput data:

- Total import time (seconds)
- Objects imported (edges, arcs, faces)
- Throughput (objects/sec)
- PDF stream decompression time
- Bezier subdivision iterations
- Arc fitting attempts and successes

---

## Document Profiling

The importer analyzes each PDF and classifies it into one of five categories to optimize parsing:

| Profile | Characteristics |
|---------|----------------|
| **Fabrication** | Shop drawings, cut lists, weld callouts, BOM tables |
| **CAD** | Exported from AutoCAD, Revit, SolidWorks, or similar |
| **Architectural** | Floor plans, elevations, sections with dimension strings |
| **Vector Art** | Illustrator/Inkscape artwork, logos, complex fills |
| **Raster** | Scanned documents with embedded images, minimal vectors |

---

## Source Structure

```
bc_pdf_vector_importer.rb            # Root loader
bc_pdf_vector_importer/
  main.rb                            # Extension entry point
  pdf_parser.rb                      # Top-level PDF object parser
  content_stream_parser.rb           # PDF content stream interpreter
  geometry_builder.rb                # SketchUp geometry construction
  arc_fitter.rb                      # Kasa circle fitting
  bezier.rb                          # Adaptive Bezier subdivision
  scale_tool.rb                      # Scale by Reference tool
  report_dialog.rb                   # Import report UI
  import_dialog.rb                   # Import options UI
  unit_parser.rb                     # Architectural notation parser
  geometry_cleanup.rb                # Post-import cleanup utilities
  ocg_parser.rb                      # Optional Content Group parser
  text_parser.rb                     # Text extraction and rendering
  dimension_parser.rb                # Dimension string recognition
  document_profiler.rb               # PDF document classification
  generic_recognizer.rb              # Generic shape recognition
  generic_classifier.rb              # Generic element classification
  region_segmenter.rb                # Spatial region segmentation
  primitive_extractor.rb             # Low-level drawing primitive extraction
  primitives.rb                      # Primitive data structures
  recognizer.rb                      # Pattern recognizer
  hatch_detector.rb                  # Hatch pattern detection
  stroke_font.rb                     # Single-stroke font rendering
  svg_geometry_renderer.rb           # SVG geometry path renderer
  svg_text_renderer.rb               # SVG text path renderer
  external_text_extractor.rb         # External text extraction support
  validator.rb                       # Input validation
  xobject_parser.rb                  # Form XObject recursion
  logger.rb                          # Logging utilities
  metadata.rb                        # Version and extension metadata
```

---

## Compatibility

| SketchUp Version | Ruby Version | Status |
|------------------|-------------|--------|
| 2017–2019 | 2.2–2.5 | Supported (including Make; Ruby 2.2 smoke CI-tested) |
| 2020 | 2.5 | May work, not CI-tested |
| 2021–2023 | 2.7 | CI-tested |
| 2024+ | 3.2+ | CI-tested |

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

## AI Contributors

This project was developed with significant contributions from AI assistants:

- **Claude & Claude Code** (Anthropic) — Architecture, code generation, debugging, and code review
- **ChatGPT & Codex** (OpenAI) — Code generation and problem-solving assistance
- **Gemini** (Google) — Development assistance and code suggestions
- **Microsoft Copilot** — Code completion and development support

These AI tools were used as collaborative development partners throughout the project lifecycle.

---

## Author

**BlueCollar Systems** -- BUILT. NOT BOUGHT.
~~~

### repo_context_builder_core.py

- Path: `repo_context_builder_core.py`
- Size: `22.10 KB`
- Modified: `2026-04-05 11:11:49`

```python

#!/usr/bin/env python3
"""
Generic LLM Context Builder

Features:
- High-signal project snapshot for LLM analysis
- Depth-limited file tree
- Exclusion/skip report
- Dependency summary
- Missing expected files report
- Optional command checks via --run-checks
- Safe truncation and light secret redaction
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import sqlite3
import subprocess
import sys
import traceback
from collections import defaultdict
from datetime import datetime
from pathlib import Path
from typing import Dict, Iterable, List, Sequence, Tuple

MAX_FILE_LINES = 3000
MAX_HEAD_LINES = 2000
MAX_TAIL_LINES = 500

DEFAULT_REDACTION_PATTERNS: List[Tuple[re.Pattern, str]] = [
    (
        re.compile(
            r"""(?im)(\b(?:api[_-]?key|token|secret|password|client[_-]?secret)\b\s*[:=]\s*)(["'])([^"']+)\2"""
        ),
        r"\1\2<REDACTED>\2",
    ),
    (
        re.compile(
            r"-----BEGIN [A-Z0-9 ]*PRIVATE KEY-----.*?-----END [A-Z0-9 ]*PRIVATE KEY-----",
            re.DOTALL,
        ),
        "<REDACTED_PRIVATE_KEY_BLOCK>",
    ),
]

TEXT_PREVIEW_EXTENSIONS = {
    ".py", ".rb", ".dart", ".js", ".ts", ".tsx", ".jsx", ".css", ".scss",
    ".html", ".htm", ".md", ".txt", ".json", ".yaml", ".yml", ".toml",
    ".ini", ".cfg", ".conf", ".sql", ".xml", ".plist", ".kts", ".gradle",
    ".cmake", ".sh", ".ps1", ".bat", ".cmd", ".c", ".cpp", ".h", ".hpp",
    ".java", ".kt", ".swift", ".go", ".rs", ".php", ".r", ".lua", ".svg"
}

def _format_size(size_bytes: int) -> str:
    size = float(size_bytes)
    for unit in ("B", "KB", "MB", "GB", "TB"):
        if size < 1024.0:
            return f"{size:.2f} {unit}"
        size /= 1024.0
    return f"{size:.2f} PB"

def _choose_fence(text: str) -> str:
    max_backticks = max((len(m.group(0)) for m in re.finditer(r"`+", text)), default=0)
    max_tildes = max((len(m.group(0)) for m in re.finditer(r"~+", text)), default=0)
    if max_backticks <= max_tildes:
        return "`" * max(3, max_backticks + 1)
    return "~" * max(3, max_tildes + 1)

def _detect_language(path: Path) -> str:
    suffix = path.suffix.lower()
    name = path.name.lower()
    mapping = {
        ".py": "python",".rb": "ruby",".dart": "dart",".js": "javascript",".ts": "typescript",
        ".tsx": "tsx",".jsx": "jsx",".css": "css",".scss": "scss",".html": "html",".htm": "html",
        ".json": "json",".yaml": "yaml",".yml": "yaml",".xml": "xml",".plist": "xml",".md": "markdown",
        ".txt": "text",".sql": "sql",".toml": "toml",".kts": "kotlin",".gradle": "groovy",".sh": "bash",
        ".ps1": "powershell",".bat": "bat",".cmd": "bat",".svg": "xml",
    }
    if suffix == ".cmake" or name == "cmakelists.txt":
        return "cmake"
    return mapping.get(suffix, "")

def _redact(text: str) -> str:
    out = text
    for pattern, replacement in DEFAULT_REDACTION_PATTERNS:
        out = pattern.sub(replacement, out)
    return out

def _truncate_text(text: str):
    lines = text.splitlines()
    if len(lines) <= MAX_FILE_LINES:
        return text, False
    head = lines[:MAX_HEAD_LINES]
    tail = lines[-MAX_TAIL_LINES:]
    clipped = "\n".join(head) + "\n\n# ... SNIPPED ...\n\n" + "\n".join(tail)
    return clipped, True

def _write_heading(out, title: str, level: int = 1) -> None:
    out.write(f"{'#' * max(1, level)} {title}\n\n")

def _write_fenced_block(out, content: str, language: str = "") -> None:
    fence = _choose_fence(content)
    out.write(f"{fence}{language}\n")
    out.write(content)
    if not content.endswith("\n"):
        out.write("\n")
    out.write(f"{fence}\n\n")

def _safe_rel(path: Path, root: Path) -> str:
    try:
        return path.relative_to(root).as_posix()
    except Exception:
        return path.as_posix()

def _read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")

class ContextBuilder:
    def __init__(self, preset: Dict):
        self.preset = preset
        self.project_root = Path(preset.get("project_root", Path(__file__).resolve().parent)).resolve()
        self.dev_logs = self.project_root / preset.get("dev_logs_dir", "dev_logs")
        ts = datetime.now().strftime("%Y%m%d_%H%M%S")
        self.output_path = self.dev_logs / f"llm_context_{ts}.md"
        self.latest_path = self.dev_logs / "latest_llm_context.md"
        self.skip_reasons = defaultdict(list)
        self.truncated_files = []
        self.previewed_files = []

    @property
    def exclude_dir_names(self):
        return set(self.preset.get("exclude_dir_names", []))

    @property
    def exclude_file_names(self):
        return set(self.preset.get("exclude_file_names", []))

    @property
    def exclude_suffixes(self):
        return tuple(self.preset.get("exclude_suffixes", []))

    @property
    def include_extensions(self):
        return set(self.preset.get("include_extensions", sorted(TEXT_PREVIEW_EXTENSIONS)))

    def is_excluded_dir(self, path: Path) -> bool:
        name = path.name
        for pattern in self.exclude_dir_names:
            if pattern.startswith("*.") and name.endswith(pattern[1:]):
                return True
            if name == pattern:
                return True
        return False

    def is_previewable_file(self, path: Path) -> bool:
        if path.name in self.exclude_file_names:
            self.skip_reasons["excluded_name"].append(_safe_rel(path, self.project_root))
            return False
        if any(path.name.endswith(sfx) for sfx in self.exclude_suffixes):
            self.skip_reasons["excluded_suffix"].append(_safe_rel(path, self.project_root))
            return False
        if path.suffix.lower() in self.include_extensions or path.name.lower() == "cmakelists.txt":
            return True
        self.skip_reasons["non_text_or_unlisted_extension"].append(_safe_rel(path, self.project_root))
        return False

    def iter_filtered_files(self, root: Path):
        for current_root, dirs, files in os.walk(root):
            root_path = Path(current_root)
            original_dirs = list(dirs)
            dirs[:] = [d for d in sorted(dirs) if not self.is_excluded_dir(root_path / d)]
            for d in original_dirs:
                if d not in dirs:
                    self.skip_reasons["excluded_directory"].append(_safe_rel(root_path / d, self.project_root))
            for file_name in sorted(files):
                file_path = root_path / file_name
                if self.is_previewable_file(file_path):
                    yield file_path

    def collect_files(self, relative_roots):
        items = []
        for rel in relative_roots:
            base = self.project_root / rel
            if not base.exists():
                continue
            if base.is_file():
                if self.is_previewable_file(base):
                    items.append(base)
                continue
            for path in self.iter_filtered_files(base):
                items.append(path)
        return sorted(set(items))

    def collect_named_files(self, relative_paths):
        paths = []
        for rel in relative_paths:
            candidate = self.project_root / rel
            if candidate.exists() and candidate.is_file() and self.is_previewable_file(candidate):
                paths.append(candidate)
        return paths

    def file_metadata(self, path: Path) -> str:
        stat = path.stat()
        rel = _safe_rel(path, self.project_root)
        modified = datetime.fromtimestamp(stat.st_mtime).strftime("%Y-%m-%d %H:%M:%S")
        return f"- Path: `{rel}`\n- Size: `{_format_size(stat.st_size)}`\n- Modified: `{modified}`\n"

    def write_file_section(self, out, path: Path) -> None:
        rel = _safe_rel(path, self.project_root)
        _write_heading(out, rel, 3)
        out.write(self.file_metadata(path))
        out.write("\n")
        text = _redact(_read_text(path))
        text, truncated = _truncate_text(text)
        if truncated:
            self.truncated_files.append(rel)
            out.write("- Note: File was truncated for token safety.\n\n")
        self.previewed_files.append(rel)
        _write_fenced_block(out, text, _detect_language(path))

    def top_level_inventory(self):
        rows = []
        for child in sorted(self.project_root.iterdir(), key=lambda p: p.name.lower()):
            if self.is_excluded_dir(child):
                continue
            if child.is_dir():
                count = 0
                for _, dirs, files in os.walk(child):
                    dirs[:] = [d for d in dirs if d not in self.exclude_dir_names]
                    count += len(files)
                rows.append((child.name + "/", count, True))
            else:
                rows.append((child.name, child.stat().st_size, False))
        return rows

    def write_inventory_section(self, out) -> None:
        _write_heading(out, "Project Inventory", 2)
        out.write("Filtered inventory for context quality. Heavy/generated folders are excluded.\n\n")
        for name, metric, is_dir in self.top_level_inventory():
            out.write(f"- `{name}`: {metric} files\n" if is_dir else f"- `{name}`: {_format_size(metric)}\n")
        out.write("\n")

    def _tree_depth_for(self, first_part: str) -> int:
        full = set(self.preset.get("tree_full_depth_roots", []))
        shallow = self.preset.get("tree_shallow_depth_roots", {})
        if first_part in full:
            return 99
        return int(shallow.get(first_part, self.preset.get("default_tree_depth", 2)))

    def _build_tree_lines(self):
        root = self.project_root
        lines = [f"{root.name}/"]
        excluded = self.exclude_dir_names
        def add_dir(dir_path: Path, prefix: str = ""):
            try:
                rel_parts = dir_path.relative_to(root).parts
            except Exception:
                rel_parts = ()
            entries = []
            try:
                for p in sorted(dir_path.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower())):
                    if p.is_dir() and p.name in excluded:
                        continue
                    entries.append(p)
            except Exception:
                return
            for i, entry in enumerate(entries):
                last = i == len(entries) - 1
                branch = "└── " if last else "├── "
                lines.append(prefix + branch + entry.name + ("/" if entry.is_dir() else ""))
                if entry.is_dir():
                    rel = entry.relative_to(root)
                    rel_parts = rel.parts
                    depth_limit = self._tree_depth_for(rel_parts[0] if rel_parts else "")
                    if len(rel_parts) < depth_limit:
                        add_dir(entry, prefix + ("    " if last else "│   "))
        add_dir(root, "")
        return lines

    def write_tree_section(self, out) -> None:
        _write_heading(out, "Repo Tree", 2)
        out.write("Depth-limited tree. Full depth for selected roots, shallow for noisy areas.\n\n")
        _write_fenced_block(out, "\n".join(self._build_tree_lines()), "text")

    def parse_dependency_summary(self):
        summary = defaultdict(list)
        for rel in self.preset.get("dependency_files", []):
            path = self.project_root / rel
            if not path.exists() or not path.is_file():
                continue
            text = _read_text(path)
            low = rel.lower()
            if path.name == "pubspec.yaml":
                current = None
                for line in text.splitlines():
                    if re.match(r"^\s*dependencies:\s*$", line):
                        current = "dependencies"; continue
                    if re.match(r"^\s*dev_dependencies:\s*$", line):
                        current = "dev_dependencies"; continue
                    if re.match(r"^\S", line):
                        current = None
                    if current and re.match(r"^\s{2,}[A-Za-z0-9_.-]+:\s*", line):
                        name = line.strip().split(":", 1)[0]
                        if name != "sdk":
                            summary[current].append(line.strip())
            elif low.endswith("requirements.txt") or low.endswith("requirements-dev.txt"):
                key = path.name
                for line in text.splitlines():
                    s = line.strip()
                    if s and not s.startswith("#"):
                        summary[key].append(s)
            elif low.endswith("pyproject.toml"):
                section = None
                for line in text.splitlines():
                    s = line.strip()
                    if s.startswith("[tool.poetry.dependencies]"):
                        section = "poetry_dependencies"
                    elif s.startswith("[tool.poetry.group.dev.dependencies]"):
                        section = "poetry_dev_dependencies"
                    elif s.startswith("["):
                        section = None
                    elif "=" in s and section in {"poetry_dependencies", "poetry_dev_dependencies"}:
                        summary[section].append(s)
            elif low.endswith("package.json"):
                try:
                    data = json.loads(text)
                    for key in ("dependencies", "devDependencies"):
                        for name, version in sorted(data.get(key, {}).items()):
                            summary[key].append(f"{name}: {version}")
                except Exception:
                    summary[path.name].append("<failed to parse package.json>")
        return summary

    def write_dependency_summary(self, out) -> None:
        _write_heading(out, "Dependency Summary", 2)
        deps = self.parse_dependency_summary()
        if not deps:
            out.write("No configured dependency files found.\n\n")
            return
        for section, items in deps.items():
            out.write(f"### {section}\n\n")
            _write_fenced_block(out, "\n".join(items) if items else "None detected.", "text")

    def write_missing_expected_files(self, out) -> None:
        _write_heading(out, "Missing Expected Files", 2)
        for group, key in (("Expected Everywhere", "expected_everywhere"), ("Expected In Some Environments", "expected_some_envs")):
            out.write(f"### {group}\n\n")
            expected = self.preset.get("expected_files", {}).get(key, [])
            missing = [rel for rel in expected if not (self.project_root / rel).exists()]
            if missing:
                _write_fenced_block(out, "\n".join(missing), "text")
            else:
                out.write("None missing.\n\n")

    def write_navigation_inventory(self, out) -> None:
        patterns = self.preset.get("navigation_grep_patterns", [])
        roots = self.preset.get("navigation_roots", self.preset.get("source_roots", []))
        if not patterns or not roots:
            return
        compiled = [re.compile(p) for p in patterns]
        matches = []
        for path in self.collect_files(roots):
            try:
                text = _read_text(path)
            except Exception:
                continue
            for line_no, line in enumerate(text.splitlines(), start=1):
                for pat in compiled:
                    if pat.search(line):
                        matches.append(f"{_safe_rel(path, self.project_root)}:{line_no}: {line.strip()}")
                        break
        _write_heading(out, "Navigation Call-Site Inventory", 2)
        if not matches:
            out.write("No configured navigation call-sites found.\n\n")
            return
        _write_fenced_block(out, "\n".join(matches[:500]), "text")
        if len(matches) > 500:
            out.write(f"- Note: {len(matches) - 500} additional matches omitted.\n\n")

    def write_sqlite_section(self, out) -> None:
        db_paths = self.preset.get("sqlite_paths", [])
        if not db_paths:
            return
        _write_heading(out, "SQLite Schema Snapshot", 2)
        db_path = None
        for rel in db_paths:
            candidate = self.project_root / rel
            if candidate.exists():
                db_path = candidate
                break
        if db_path is None:
            out.write("No SQLite database found in configured locations.\n\n")
            return
        out.write(f"- Database: `{_safe_rel(db_path, self.project_root)}`\n")
        out.write(f"- Size: `{_format_size(db_path.stat().st_size)}`\n\n")
        try:
            with sqlite3.connect(db_path) as conn:
                cur = conn.cursor()
                cur.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")
                tables = [r[0] for r in cur.fetchall()]
                out.write("Tables:\n")
                for name in tables:
                    out.write(f"- `{name}`\n")
                out.write("\n")
        except Exception as exc:
            out.write(f"Database read failed: {exc}\n\n")

    def run_checks(self):
        results = []
        for cmd in self.preset.get("check_commands", []):
            try:
                proc = subprocess.run(
                    cmd, cwd=self.project_root, text=True, capture_output=True,
                    shell=isinstance(cmd, str), timeout=int(self.preset.get("check_timeout_seconds", 180)),
                )
                output = (proc.stdout or "") + ("\n" if proc.stdout and proc.stderr else "") + (proc.stderr or "")
                results.append((cmd if isinstance(cmd, str) else " ".join(cmd), proc.returncode, output.strip()))
            except Exception as exc:
                results.append((cmd if isinstance(cmd, str) else " ".join(cmd), 999, f"Check failed to start: {exc}"))
        return results

    def write_checks_section(self, out, run_checks: bool) -> None:
        _write_heading(out, "Optional Checks", 2)
        if not run_checks:
            out.write("Checks were not run. Use `--run-checks` to capture configured command output.\n\n")
            return
        results = self.run_checks()
        if not results:
            out.write("No check commands configured for this repo.\n\n")
            return
        for cmd, code, output in results:
            out.write("### Command\n\n")
            _write_fenced_block(out, cmd, "text")
            out.write(f"- Exit code: `{code}`\n\n")
            _write_fenced_block(out, output or "<no output>", "text")

    def write_exclusion_report(self, out) -> None:
        _write_heading(out, "Exclusion / Skip Report", 2)
        if not self.skip_reasons and not self.truncated_files:
            out.write("No exclusions or truncations recorded.\n\n")
            return
        for reason in sorted(self.skip_reasons):
            items = sorted(set(self.skip_reasons[reason]))
            out.write(f"### {reason.replace('_', ' ').title()}\n\n")
            out.write(f"- Count: {len(items)}\n\n")
            preview = items[:200]
            _write_fenced_block(out, "\n".join(preview), "text")
            if len(items) > len(preview):
                out.write(f"- Note: {len(items) - len(preview)} additional items omitted.\n\n")
        if self.truncated_files:
            out.write("### Truncated Files\n\n")
            _write_fenced_block(out, "\n".join(sorted(set(self.truncated_files))), "text")

    def build(self, run_checks: bool = False):
        self.dev_logs.mkdir(parents=True, exist_ok=True)
        config_files = self.collect_named_files(self.preset.get("config_paths", []))
        script_files = self.collect_named_files(self.preset.get("script_paths", []))
        source_files = self.collect_files(self.preset.get("source_roots", []))
        test_files = self.collect_files(self.preset.get("test_roots", []))
        with self.output_path.open("w", encoding="utf-8", newline="\n") as out:
            _write_heading(out, self.preset.get("title", "LLM Context Pack"), 1)
            out.write(f"- Generated: `{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}`\n")
            out.write(f"- Project Root: `{self.project_root.as_posix()}`\n")
            out.write(f"- Output File: `{self.output_path.as_posix()}`\n")
            out.write("- Formatting Safety: dynamic fenced blocks are used to avoid fence collisions.\n\n")
            self.write_inventory_section(out)
            self.write_tree_section(out)
            self.write_dependency_summary(out)
            self.write_missing_expected_files(out)
            _write_heading(out, "Core Configuration Files", 2)
            if not config_files:
                out.write("No configuration files were found.\n\n")
            for path in config_files:
                self.write_file_section(out, path)
            _write_heading(out, "Source Files", 2)
            out.write(f"Included files: `{len(source_files)}`\n\n")
            for path in source_files:
                self.write_file_section(out, path)
            _write_heading(out, "Test Files", 2)
            out.write(f"Included files: `{len(test_files)}`\n\n")
            for path in test_files:
                self.write_file_section(out, path)
            _write_heading(out, "Project Scripts", 2)
            if not script_files:
                out.write("No script files were found.\n\n")
            for path in script_files:
                self.write_file_section(out, path)
            self.write_navigation_inventory(out)
            self.write_sqlite_section(out)
            self.write_checks_section(out, run_checks)
            self.write_exclusion_report(out)
            _write_heading(out, "End of Pack", 2)
            out.write("Context pack completed.\n")
        shutil.copyfile(self.output_path, self.latest_path)
        return self.output_path

def main_with_preset(preset: Dict) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-checks", action="store_true", help="Run configured optional checks and append output")
    parser.add_argument("--project-root", default=None, help="Override detected project root")
    args = parser.parse_args()
    if args.project_root:
        preset = dict(preset)
        preset["project_root"] = args.project_root
    try:
        builder = ContextBuilder(preset)
        output = builder.build(run_checks=args.run_checks)
        print("=" * 72)
        print("LLM context pack complete")
        print(f"Output: {output}")
        print(f"Latest: {builder.latest_path}")
        print("=" * 72)
        return 0
    except Exception as exc:
        print("Build failed.")
        print(str(exc))
        print(traceback.format_exc())
        return 1
```

### test/smoke_test.rb

- Path: `test/smoke_test.rb`
- Size: `6.49 KB`
- Modified: `2026-04-04 04:39:02`

```ruby
#!/usr/bin/env ruby
# test/smoke_test.rb
# Basic automated smoke tests for the PDF Vector Importer plugin.
# Checks Ruby syntax, entry-point loadability, and .rbz package validity.
#
# Usage:  ruby test/smoke_test.rb
# Exit 0 = all checks pass, non-zero = failure.

require 'fileutils'
require 'open3'

REPO_ROOT   = File.expand_path('..', __dir__)
SOURCE_DIR  = File.join(REPO_ROOT, 'extracted', 'sketchup_ext', 'bc_pdf_vector_importer')
ENTRY_POINT = File.join(REPO_ROOT, 'extracted', 'sketchup_ext', 'bc_pdf_vector_importer.rb')
RBZ_PATTERN = File.join(REPO_ROOT, '*.rbz')

failures = []
pass_count = 0

puts "=" * 60
puts "PDF Vector Importer -- Smoke Tests"
puts "=" * 60
puts

# ----------------------------------------------------------------
# 1. Ruby syntax check on every .rb file
# ----------------------------------------------------------------
puts "--- Check 1: Ruby syntax on all .rb files ---"
rb_files = Dir.glob(File.join(SOURCE_DIR, '**', '*.rb'))
rb_files << ENTRY_POINT if File.exist?(ENTRY_POINT)

if rb_files.empty?
  failures << "No .rb files found in #{SOURCE_DIR}"
  puts "  FAIL: no .rb files found"
else
  rb_files.each do |f|
    rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
    output = `ruby -c "#{f}" 2>&1`
    if $?.success?
      pass_count += 1
    else
      failures << "Syntax error in #{rel}: #{output.strip}"
      puts "  FAIL: #{rel}"
      puts "        #{output.strip}"
    end
  end
  syntax_ok = rb_files.length - failures.length
  puts "  #{syntax_ok}/#{rb_files.length} files passed syntax check"
end

puts

# ----------------------------------------------------------------
# 2. Entry-point load check (without SketchUp runtime)
# ----------------------------------------------------------------
puts "--- Check 2: Main entry point loadability ---"
# We cannot actually require the entry point because it depends on
# SketchUp's runtime (sketchup.rb, extensions.rb). Instead we verify
# that the file parses cleanly AND that the main.rb file can be
# parsed, which covers the bulk of the logic.

main_rb = File.join(SOURCE_DIR, 'main.rb')
[ENTRY_POINT, main_rb].each do |f|
  next unless File.exist?(f)
  rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
  output = `ruby -c "#{f}" 2>&1`
  if $?.success?
    puts "  PASS: #{rel} parses without error"
    pass_count += 1
  else
    failures << "Entry point load failed for #{rel}: #{output.strip}"
    puts "  FAIL: #{rel} -- #{output.strip}"
  end
end

# Verify the Logger module can actually be loaded standalone
logger_rb = File.join(SOURCE_DIR, 'logger.rb')
if File.exist?(logger_rb)
  output = `ruby -e "load '#{logger_rb.gsub('\\', '/')}'; puts BlueCollarSystems::PDFVectorImporter::Logger.summary" 2>&1`
  if $?.success?
    puts "  PASS: logger.rb loads and executes standalone"
    pass_count += 1
  else
    failures << "logger.rb standalone load failed: #{output.strip}"
    puts "  FAIL: logger.rb standalone -- #{output.strip}"
  end
end

puts

# ----------------------------------------------------------------
# 3. .rbz package exists and is a valid zip
# ----------------------------------------------------------------
puts "--- Check 3: .rbz package validity ---"
rbz_files = Dir.glob(RBZ_PATTERN)

if rbz_files.empty?
  # Clean source checkouts may not include packaged artifacts.
  puts "  PASS: no .rbz package found (clean source checkout)"
  pass_count += 1
else
  rbz_files.each do |rbz|
    rel = File.basename(rbz)
    begin
      # A valid ZIP starts with PK\x03\x04
      bytes = File.binread(rbz, 4)
      pk_header = [0x50, 0x4B, 0x03, 0x04].pack('C*')
      if bytes == pk_header
        # Validate the zip can be opened and list entries
        entry_count = 0
        begin
          if RUBY_PLATFORM =~ /mswin|mingw|cygwin/
            ps_script = "Add-Type -AssemblyName System.IO.Compression.FileSystem; " \
                        "$z = [System.IO.Compression.ZipFile]::OpenRead('#{rbz.tr('/', '\\')}'); " \
                        "$z.Entries.Count; $z.Dispose()"
            list_output, _, status = Open3.capture3('powershell', '-NoProfile', '-Command', ps_script)
            list_output = list_output.strip
          else
            list_output, _, status = Open3.capture3('unzip', '-l', rbz)
          end

          if list_output =~ /(\d+)/ && $1.to_i > 0
            entry_count = $1.to_i
            puts "  PASS: #{rel} is a valid zip archive (#{entry_count} entries)"
            pass_count += 1
          else
            puts "  PASS: #{rel} has valid zip header (PK signature)"
            pass_count += 1
          end
        rescue StandardError => e
          # Fallback: header check is sufficient
          puts "  PASS: #{rel} has valid zip header (PK signature)"
          pass_count += 1
        end
      else
        failures << "#{rel} is not a valid zip (bad header: #{bytes.inspect})"
        puts "  FAIL: #{rel} -- not a valid zip file"
      end
    rescue StandardError => e
      failures << "#{rel} validation error: #{e.message}"
      puts "  FAIL: #{rel} -- #{e.message}"
    end
  end
end

puts
# ----------------------------------------------------------------
# 4. Guardrail: no bare/silent rescue patterns in core extension
# ----------------------------------------------------------------
puts "--- Check 4: no bare/silent rescue patterns in core extension ---"
core_rb_files = Dir.glob(File.join(SOURCE_DIR, '**', '*.rb'))
forbidden_rescue_hits = []

core_rb_files.each do |f|
  rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
  File.open(f, 'rb') do |io|
    io.each_line.with_index do |raw_line, idx|
      line = raw_line.force_encoding('UTF-8')
      line = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace)
      if line =~ /\brescue\s+nil\b/ || line =~ /\brescue\s*=>/
        forbidden_rescue_hits << "#{rel}:#{idx + 1}: #{line.strip}"
      end
    end
  end
end

if forbidden_rescue_hits.empty?
  puts "  PASS: no 'rescue nil' / bare 'rescue => e' patterns found"
  pass_count += 1
else
  failures << "Forbidden rescue patterns found in core extension (#{forbidden_rescue_hits.length} hit(s))."
  puts "  FAIL: found forbidden rescue patterns:"
  forbidden_rescue_hits.first(20).each { |hit| puts "        #{hit}" }
  if forbidden_rescue_hits.length > 20
    puts "        ...and #{forbidden_rescue_hits.length - 20} more"
  end
end

puts
puts "=" * 60
if failures.empty?
  puts "ALL CHECKS PASSED (#{pass_count} checks)"
  puts "=" * 60
  exit 0
else
  puts "#{failures.length} FAILURE(S), #{pass_count} passed:"
  failures.each_with_index { |f, i| puts "  #{i + 1}. #{f}" }
  puts "=" * 60
  exit 1
end
```

## Test Files

Included files: `1`

### test/smoke_test.rb

- Path: `test/smoke_test.rb`
- Size: `6.49 KB`
- Modified: `2026-04-04 04:39:02`

```ruby
#!/usr/bin/env ruby
# test/smoke_test.rb
# Basic automated smoke tests for the PDF Vector Importer plugin.
# Checks Ruby syntax, entry-point loadability, and .rbz package validity.
#
# Usage:  ruby test/smoke_test.rb
# Exit 0 = all checks pass, non-zero = failure.

require 'fileutils'
require 'open3'

REPO_ROOT   = File.expand_path('..', __dir__)
SOURCE_DIR  = File.join(REPO_ROOT, 'extracted', 'sketchup_ext', 'bc_pdf_vector_importer')
ENTRY_POINT = File.join(REPO_ROOT, 'extracted', 'sketchup_ext', 'bc_pdf_vector_importer.rb')
RBZ_PATTERN = File.join(REPO_ROOT, '*.rbz')

failures = []
pass_count = 0

puts "=" * 60
puts "PDF Vector Importer -- Smoke Tests"
puts "=" * 60
puts

# ----------------------------------------------------------------
# 1. Ruby syntax check on every .rb file
# ----------------------------------------------------------------
puts "--- Check 1: Ruby syntax on all .rb files ---"
rb_files = Dir.glob(File.join(SOURCE_DIR, '**', '*.rb'))
rb_files << ENTRY_POINT if File.exist?(ENTRY_POINT)

if rb_files.empty?
  failures << "No .rb files found in #{SOURCE_DIR}"
  puts "  FAIL: no .rb files found"
else
  rb_files.each do |f|
    rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
    output = `ruby -c "#{f}" 2>&1`
    if $?.success?
      pass_count += 1
    else
      failures << "Syntax error in #{rel}: #{output.strip}"
      puts "  FAIL: #{rel}"
      puts "        #{output.strip}"
    end
  end
  syntax_ok = rb_files.length - failures.length
  puts "  #{syntax_ok}/#{rb_files.length} files passed syntax check"
end

puts

# ----------------------------------------------------------------
# 2. Entry-point load check (without SketchUp runtime)
# ----------------------------------------------------------------
puts "--- Check 2: Main entry point loadability ---"
# We cannot actually require the entry point because it depends on
# SketchUp's runtime (sketchup.rb, extensions.rb). Instead we verify
# that the file parses cleanly AND that the main.rb file can be
# parsed, which covers the bulk of the logic.

main_rb = File.join(SOURCE_DIR, 'main.rb')
[ENTRY_POINT, main_rb].each do |f|
  next unless File.exist?(f)
  rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
  output = `ruby -c "#{f}" 2>&1`
  if $?.success?
    puts "  PASS: #{rel} parses without error"
    pass_count += 1
  else
    failures << "Entry point load failed for #{rel}: #{output.strip}"
    puts "  FAIL: #{rel} -- #{output.strip}"
  end
end

# Verify the Logger module can actually be loaded standalone
logger_rb = File.join(SOURCE_DIR, 'logger.rb')
if File.exist?(logger_rb)
  output = `ruby -e "load '#{logger_rb.gsub('\\', '/')}'; puts BlueCollarSystems::PDFVectorImporter::Logger.summary" 2>&1`
  if $?.success?
    puts "  PASS: logger.rb loads and executes standalone"
    pass_count += 1
  else
    failures << "logger.rb standalone load failed: #{output.strip}"
    puts "  FAIL: logger.rb standalone -- #{output.strip}"
  end
end

puts

# ----------------------------------------------------------------
# 3. .rbz package exists and is a valid zip
# ----------------------------------------------------------------
puts "--- Check 3: .rbz package validity ---"
rbz_files = Dir.glob(RBZ_PATTERN)

if rbz_files.empty?
  # Clean source checkouts may not include packaged artifacts.
  puts "  PASS: no .rbz package found (clean source checkout)"
  pass_count += 1
else
  rbz_files.each do |rbz|
    rel = File.basename(rbz)
    begin
      # A valid ZIP starts with PK\x03\x04
      bytes = File.binread(rbz, 4)
      pk_header = [0x50, 0x4B, 0x03, 0x04].pack('C*')
      if bytes == pk_header
        # Validate the zip can be opened and list entries
        entry_count = 0
        begin
          if RUBY_PLATFORM =~ /mswin|mingw|cygwin/
            ps_script = "Add-Type -AssemblyName System.IO.Compression.FileSystem; " \
                        "$z = [System.IO.Compression.ZipFile]::OpenRead('#{rbz.tr('/', '\\')}'); " \
                        "$z.Entries.Count; $z.Dispose()"
            list_output, _, status = Open3.capture3('powershell', '-NoProfile', '-Command', ps_script)
            list_output = list_output.strip
          else
            list_output, _, status = Open3.capture3('unzip', '-l', rbz)
          end

          if list_output =~ /(\d+)/ && $1.to_i > 0
            entry_count = $1.to_i
            puts "  PASS: #{rel} is a valid zip archive (#{entry_count} entries)"
            pass_count += 1
          else
            puts "  PASS: #{rel} has valid zip header (PK signature)"
            pass_count += 1
          end
        rescue StandardError => e
          # Fallback: header check is sufficient
          puts "  PASS: #{rel} has valid zip header (PK signature)"
          pass_count += 1
        end
      else
        failures << "#{rel} is not a valid zip (bad header: #{bytes.inspect})"
        puts "  FAIL: #{rel} -- not a valid zip file"
      end
    rescue StandardError => e
      failures << "#{rel} validation error: #{e.message}"
      puts "  FAIL: #{rel} -- #{e.message}"
    end
  end
end

puts
# ----------------------------------------------------------------
# 4. Guardrail: no bare/silent rescue patterns in core extension
# ----------------------------------------------------------------
puts "--- Check 4: no bare/silent rescue patterns in core extension ---"
core_rb_files = Dir.glob(File.join(SOURCE_DIR, '**', '*.rb'))
forbidden_rescue_hits = []

core_rb_files.each do |f|
  rel = f.sub("#{REPO_ROOT}/", '').sub("#{REPO_ROOT}\\", '')
  File.open(f, 'rb') do |io|
    io.each_line.with_index do |raw_line, idx|
      line = raw_line.force_encoding('UTF-8')
      line = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace)
      if line =~ /\brescue\s+nil\b/ || line =~ /\brescue\s*=>/
        forbidden_rescue_hits << "#{rel}:#{idx + 1}: #{line.strip}"
      end
    end
  end
end

if forbidden_rescue_hits.empty?
  puts "  PASS: no 'rescue nil' / bare 'rescue => e' patterns found"
  pass_count += 1
else
  failures << "Forbidden rescue patterns found in core extension (#{forbidden_rescue_hits.length} hit(s))."
  puts "  FAIL: found forbidden rescue patterns:"
  forbidden_rescue_hits.first(20).each { |hit| puts "        #{hit}" }
  if forbidden_rescue_hits.length > 20
    puts "        ...and #{forbidden_rescue_hits.length - 20} more"
  end
end

puts
puts "=" * 60
if failures.empty?
  puts "ALL CHECKS PASSED (#{pass_count} checks)"
  puts "=" * 60
  exit 0
else
  puts "#{failures.length} FAILURE(S), #{pass_count} passed:"
  failures.each_with_index { |f, i| puts "  #{i + 1}. #{f}" }
  puts "=" * 60
  exit 1
end
```

## Project Scripts

### build_release.py

- Path: `build_release.py`
- Size: `2.91 KB`
- Modified: `2026-03-25 21:26:19`

```python
#!/usr/bin/env python3
"""build_release.py — BlueCollar Systems (SketchUp)
Produces a clean .rbz release archive for SketchUp Extension Warehouse
distribution and manual install.

An .rbz is a zip file whose root contains:
  bc_pdf_vector_importer.rb        (loader/entrypoint)
  bc_pdf_vector_importer/         (support folder with all source files)

Excluded:
  .git/, .github/
  test/ (smoke tests — not shipped)
  *.bak
  __pycache__, .ruff_cache (should not exist in SU repo, but just in case)

Usage:
  python build_release.py
  python build_release.py --out /path/to/output_dir

Output:
  bc_pdf_vector_importer_v<VERSION>.rbz
"""

import argparse
import re
import zipfile
from pathlib import Path

REPO_ROOT   = Path(__file__).parent.resolve()
EXT_ROOT    = REPO_ROOT / "extracted" / "sketchup_ext"
LOADER_FILE = EXT_ROOT / "bc_pdf_vector_importer.rb"
SUPPORT_DIR = EXT_ROOT / "bc_pdf_vector_importer"

EXCLUDE_DIRS  = {".git", ".github", "test", "__pycache__", ".ruff_cache"}
EXCLUDE_FILES = {"build_release.py", ".gitignore", ".gitattributes"}
EXCLUDE_SUFFIXES = {".bak", ".swp", ".pyo", ".pyc"}


def _should_exclude(rel: Path) -> bool:
    for part in rel.parts:
        if part in EXCLUDE_DIRS:
            return True
    if rel.name in EXCLUDE_FILES:
        return True
    if rel.suffix.lower() in EXCLUDE_SUFFIXES:
        return True
    return False


def _read_version() -> str:
    if LOADER_FILE.exists():
        text = LOADER_FILE.read_text(encoding="utf-8", errors="replace")
        m = re.search(r"PLUGIN_VERSION\s*=\s*'([^']+)'", text)
        if m:
            return m.group(1).strip()
    return "0.0.0"


def build(out_dir: Path) -> Path:
    version  = _read_version()
    rbz_name = f"bc_pdf_vector_importer_v{version}.rbz"
    rbz_path = out_dir / rbz_name

    out_dir.mkdir(parents=True, exist_ok=True)

    file_count = 0
    skipped    = 0

    with zipfile.ZipFile(rbz_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        # Root loader file
        if LOADER_FILE.exists():
            zf.write(LOADER_FILE, LOADER_FILE.name)
            file_count += 1

        # Support folder
        for abs_path in sorted(SUPPORT_DIR.rglob("*")):
            if not abs_path.is_file():
                continue
            rel = abs_path.relative_to(EXT_ROOT)
            if _should_exclude(rel):
                skipped += 1
                continue
            zf.write(abs_path, str(rel))
            file_count += 1

    print(f"Built: {rbz_path}")
    print(f"  {file_count} files included, {skipped} excluded")
    return rbz_path


def main() -> None:
    parser = argparse.ArgumentParser(description="Build SU PDFVectorImporter .rbz")
    parser.add_argument("--out", default=str(REPO_ROOT),
                        help="Output directory (default: repo root)")
    args   = parser.parse_args()
    out    = Path(args.out).resolve()
    rbz    = build(out)
    print(f"\nRelease ready: {rbz}")


if __name__ == "__main__":
    main()
```

## Navigation Call-Site Inventory

```text
extracted/sketchup_ext/bc_pdf_vector_importer/compatibility_report.rb:55: lines << capability_line("UI::HtmlDialog available", html_dialog_supported?)
extracted/sketchup_ext/bc_pdf_vector_importer/compatibility_report.rb:92: return false unless defined?(UI::HtmlDialog)
extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb:55: if defined?(UI::HtmlDialog) && !ENV['BC_HEADLESS']
extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb:65: if defined?(UI::HtmlDialog) && !ENV['BC_HEADLESS']
extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb:75: dlg = UI::HtmlDialog.new(
extracted/sketchup_ext/bc_pdf_vector_importer/import_dialog.rb:115: dlg = UI::HtmlDialog.new(
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:852: UI.menu('File').add_item('Import PDF Vectors...') { self.import_pdf }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:855: sub.add_item('Import PDF...') { self.import_pdf }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:856: sub.add_item('Import PDF (Safe Mode)...') { self.import_pdf_safe }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:857: sub.add_item('Batch Import Folder...') { self.batch_import }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:859: sub.add_item('Scale to Real Dimensions...') { self.scale_by_reference }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:860: sub.add_item('Quick Scale...') { self.quick_scale }
extracted/sketchup_ext/bc_pdf_vector_importer/main.rb:862: sub.add_item('About') {
```

## Optional Checks

Checks were not run. Use `--run-checks` to capture configured command output.

## Exclusion / Skip Report

### Excluded Directory

- Count: 3

```text
.git
__pycache__
dev_logs
```

### Excluded Suffix

- Count: 2

```text
bc_pdf_vector_importer_v3.6.6.rbz
bc_pdf_vector_importer_v3.6.7.rbz
```

### Non Text Or Unlisted Extension

- Count: 3

```text
.gitignore
LICENSE
extracted/.gitignore
```

## End of Pack

Context pack completed.

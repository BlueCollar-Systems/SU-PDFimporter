
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

#!/usr/bin/env python3
"""Validate the current LsNativeStack integration in RedMagic RecentsView."""

import argparse
from pathlib import Path


SCROLL_METHOD = ".method protected onScrollChanged(IIII)V"
OVERVIEW_METHOD = ".method public setOverviewStateEnabled(Z)V"
PAGE_SCROLLS_METHOD = (
    ".method protected getPageScrolls([IZLcom/android/launcher3/V4$c;)Z"
)


def method_body(source: str, header: str) -> str:
    start = source.find(header)
    if start < 0:
        raise ValueError(f"missing {header}")
    end = source.find(".end method", start)
    if end < 0:
        raise ValueError(f"{header} has no .end method")
    return source[start:end]


def require(source: str, needle: str, message: str) -> None:
    if needle not in source:
        raise ValueError(message)


def check(path: Path) -> None:
    source = path.read_text(encoding="utf-8")
    scroll = method_body(source, SCROLL_METHOD)
    overview = method_body(source, OVERVIEW_METHOD)
    page_scrolls = method_body(source, PAGE_SCROLLS_METHOD)

    require(
        scroll,
        "LsNativeStack;->onScrollChanged(Lcom/android/quickstep/views/RecentsView;)V",
        "onScrollChanged is not connected to the lightweight deck transform",
    )
    if "updatePageOffsets()V" in scroll:
        raise ValueError("onScrollChanged performs a full OEM offset pass")
    if "LsNativeStack" in page_scrolls:
        raise ValueError("stack code rewrites the OEM page scroll array")

    require(
        overview,
        "LsNativeStack;->onOverviewStateChanged(Lcom/android/quickstep/views/RecentsView;Z)V",
        "Overview lifecycle is not connected to the entry state machine",
    )

    required_calls = {
        "commitInitialPage": "initial page is not committed atomically",
        "obtainPagerEvent": "entry lock is not released before pager interaction",
        "prepareDismissedTask": "dismissed card is not promoted above the deck",
        "adjustDismissOffset": "dismiss reflow still uses full-page offsets",
        "onTaskVisualsReset": "pooled TaskView visuals are not recomposed safely",
    }
    for name, message in required_calls.items():
        require(source, f"LsNativeStack;->{name}", message)

    forbidden = (
        "LsNativeStack;->rewritePageScrolls",
        "LsNativeStack;->applyNativeStackOffsetV3",
        "LsRecentsMemory;",
    )
    for needle in forbidden:
        if needle in source:
            raise ValueError(f"retired stack path remains: {needle}")

    print(f"PASS {path}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("smali", nargs="+", type=Path)
    args = parser.parse_args()
    try:
        for path in args.smali:
            check(path)
    except (OSError, UnicodeError, ValueError) as error:
        parser.exit(1, f"FAIL {error}\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

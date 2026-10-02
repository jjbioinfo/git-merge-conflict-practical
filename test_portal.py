"""Tests for the Study Portal."""

from app_config import WELCOME_MESSAGE
from portal import build_welcome_message


def test_welcome_message() -> None:
    assert build_welcome_message("Asha") == f"{WELCOME_MESSAGE}, Asha!"
    assert build_welcome_message("  Rahul  ") == f"{WELCOME_MESSAGE}, Rahul!"


def test_invalid_username() -> None:
    for invalid_username in ("", "   ", None):
        try:
            build_welcome_message(invalid_username)  # type: ignore[arg-type]
            raise AssertionError(f"username should fail: {invalid_username!r}")
        except ValueError:
            pass


def run_tests() -> int:
    """Run all test groups and return the failure count."""
    tests = [test_welcome_message, test_invalid_username]
    failures = 0
    for test in tests:
        try:
            test()
            print(f"PASS: {test.__name__}")
        except Exception as error:
            failures += 1
            print(f"FAIL: {test.__name__}: {error}")
    print(f"Ran {len(tests)} test groups; failures={failures}")
    return failures


if __name__ == "__main__":
    raise SystemExit(run_tests())

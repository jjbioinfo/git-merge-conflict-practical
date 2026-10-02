"""Run the Study Portal greeting demonstration."""

from app_config import APP_NAME
from portal import build_welcome_message


def main() -> int:
    """Display the application name and a greeting."""
    print(APP_NAME)
    print(build_welcome_message("Asha"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

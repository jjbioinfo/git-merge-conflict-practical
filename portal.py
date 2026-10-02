"""Study Portal functionality."""

from app_config import WELCOME_MESSAGE


def build_welcome_message(username: str) -> str:
    """Return a personalized welcome message."""
    if not isinstance(username, str) or not username.strip():
        raise ValueError("username cannot be empty")
    return f"{WELCOME_MESSAGE}, {username.strip()}!"

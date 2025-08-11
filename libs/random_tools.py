from robot.api.deco import keyword
import random

@keyword("Random Int Between")
def random_int_between(a: int, b: int) -> int:
    """Return a random integer N such that a <= N <= b."""
    return random.randint(int(a), int(b))

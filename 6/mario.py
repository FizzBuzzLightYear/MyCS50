def get_number():
  """
  Gets a valid number from the user.

  Returns:
    An integer between 1 and 8 (inclusive).
  """
  while True:
    try:
      number = int(input("Please enter a number: "))
      if 1 <= number <= 8:
        return number
      else:
        print("Invalid input. Please enter a number between 1 and 8.")
    except ValueError:
      print("Invalid input. Please enter an integer.")

def mario(height):
  """
  Prints a Mario pyramid of the given height.

  Args:
    height: The height of the pyramid.
  """
  for i in range(height, 0, -1):
    for j in range(1, height + 1):
      print("#" if j >= i else " ", end="")
    print("  ", end="")
    for k in range(height, 0, -1):
      print("#" if k >= i else "", end="")
    print()

if __name__ == "__main__":
  height = get_number()
  mario(height)
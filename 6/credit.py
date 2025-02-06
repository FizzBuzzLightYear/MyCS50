def get_credit_card_number():
  """
  Prompts the user for a credit card number and validates its length.

  Returns:
    The entered credit card number as an integer.
    Exits the program if the number is less than 13 digits.
  """
  while True:
    try:
      credit_card_number = int(input("Please supply the credit card number: "))
      if len(str(credit_card_number)) >= 13:
        return credit_card_number
      else:
        print("INVALID")
        exit()
    except ValueError:
      print("Invalid input. Please enter a valid number.")

def luhn_algorithm(credit_card_number):
  """
  Implements Luhn's algorithm to check the validity of a credit card number.

  Args:
    credit_card_number: The credit card number to be validated.
  """
  card_number_str = str(credit_card_number)
  card_type = ""

  # Determine card type
  if (len(card_number_str) == 15 and
      (card_number_str.startswith("34") or card_number_str.startswith("37"))):
    card_type = "AMEX"
  elif (card_number_str[0] == '5' and
        '1' <= card_number_str[1] <= '5'):
    card_type = "MASTERCARD"
  elif (card_number_str[0] == '4' and
        (len(card_number_str) == 13 or len(card_number_str) == 16)):
    card_type = "VISA"
  else:
    card_type = "INVALID"

  odd_sum = 0
  even_sum = 0

  # Calculate even sum
  for i in range(len(card_number_str) - 2, -1, -2):
    digit = int(card_number_str[i]) * 2
    if digit >= 10:
      even_sum += digit // 10 + digit % 10
    else:
      even_sum += digit

  # Calculate odd sum
  for i in range(len(card_number_str) - 1, -1, -2):
    odd_sum += int(card_number_str[i])

  final_sum = even_sum + odd_sum

  if final_sum % 10 == 0:
    print(card_type)
  else:
    print("INVALID")

if __name__ == "__main__":
  credit_card_number = get_credit_card_number()
  luhn_algorithm(credit_card_number)
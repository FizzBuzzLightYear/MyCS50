import string

class TheCounts:
    def __init__(self):
        self.characters = 0
        self.words = 0
        self.sentences = 0

def get_user_input():
    try:
        return input("Text: ")
    except EOFError:
        return ""  # Handle Ctrl+D (EOF)

def count_letters(text):
    count = 0
    for char in text:
        if char.isalpha():
            count += 1
    return count

def count_words(text):
    in_word = False
    count = 0
    for char in text:
        if char.isspace():
            in_word = False
        elif not in_word:
            in_word = True
            count += 1
    return count

def count_sentences(text):
    count = 0
    for char in text:
        if char in ['.', '!', '?']:
            count += 1
    return count

def count_user_inputs(user_input):
    counts = TheCounts()
    counts.characters = count_letters(user_input)
    counts.words = count_words(user_input)
    counts.sentences = count_sentences(user_input)
    return counts

def coleman_liau_func(n_letters, n_words, n_sentences):
    if n_words == 0: # Avoid division by zero
        print("No words entered. Cannot calculate grade.")
        return

    L = (n_letters / n_words) * 100
    S = (n_sentences / n_words) * 100
    index = 0.0588 * L - 0.296 * S - 15.8
    grade = int(index + 0.5)  # Round to nearest integer

    if grade < 1:
        print("Before Grade 1")
    elif grade >= 16:
        print("Grade 16+")
    else:
        print(f"Grade {grade}")

def main():
    current_input = get_user_input()
    if current_input is None:
        return # Handle memory error if get_user_input returned None in C version

    user_input_counts = count_user_inputs(current_input)

    coleman_liau_func(
        user_input_counts.characters,
        user_input_counts.words,
        user_input_counts.sentences
    )

if __name__ == "__main__":
    main()

def custom_sort(element):
    return [int(digit) for digit in element]


def reform(input_lines):
    splits_sorted = sorted(input_lines, reverse=True, key=custom_sort)
    result = ""
    for i in range(len(splits_sorted)):
        result += f'{splits_sorted[i]}'
    return result


lines = []
while True:
    user_input = input()
    if user_input == '':
        break
    else:
        lines.append(user_input)

print(reform(lines))

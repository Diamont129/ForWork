def reform(input_lines):
    n, k = input_lines[0].split()
    locations = [int(line) for line in input_lines[1:]]
    for _ in range(int(k)):
        max_element = max(locations)
        max_index = locations.index(max_element)
        div = int(max_element / 2)
        locations[max_index] = div
        locations.insert(max_index, div)
    return locations


lines = []
while True:
    user_input = input()
    if user_input == '':
        break
    else:
        lines.append(user_input)

result = reform(lines)
for x in result:
    print(x)

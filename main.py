import re


def convert_to_list(input_string):
    pattern = re.compile(r'(\d{0,4})\\(\d{0,5})')
    matches = re.findall(pattern, input_string)
    result = []
    for match in matches:
        result.append('{:0>4}'.format(match[0]) + '\\' + '{:0>5}'.format(match[1]))
    return result


print('Введите строку: ')
base_input = input()
output_list = convert_to_list(base_input)
for output in output_list:
    print(output)

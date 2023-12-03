fn main() {
    let input = include_str!("input.txt");
    let result = process(input);
    println!("Result: {}", result);
}

#[derive(Debug, PartialEq)]
struct NumOccurence {
    num: u32,
    index: usize,
}

#[derive(Debug, PartialEq)]
struct Range {
    start: usize,
    size: usize,
}

fn process(input: &str) -> u32 {
    let lines = input.lines().collect::<Vec<_>>();
    lines
        .iter()
        .enumerate()
        .map(|(line_number, line)| {
            extract_numbers(line)
                .iter()
                .filter_map(|num_occurence| {
                    // Create range and avoid out of bounds
                    let range = Range {
                        start: if num_occurence.index == 0 {
                            0
                        } else {
                            num_occurence.index - 1
                        },
                        size: if num_occurence.index + num_occurence.num.to_string().len()
                            >= line.len()
                        {
                            line.len() - num_occurence.index
                        } else {
                            num_occurence.num.to_string().len() + 2
                        },
                    };
                    // Check if number on same line is adjecent to symbol
                    if range_contains_special_symbol(line, &range) {
                        return Some(num_occurence.num);
                    }

                    // Check if number is adjent to line before
                    if line_number > 0
                        && range_contains_special_symbol(lines[line_number - 1], &range)
                    {
                        return Some(num_occurence.num);
                    }

                    // Check if number is adjent to line after
                    if line_number < lines.len() - 1
                        && range_contains_special_symbol(lines[line_number + 1], &range)
                    {
                        return Some(num_occurence.num);
                    }
                    None::<u32>
                })
                .sum::<u32>()
        })
        .sum::<u32>()
}

fn extract_numbers(line: &str) -> Vec<NumOccurence> {
    let mut result = Vec::new();
    let mut current_num = 0;
    let mut current_index = 0;
    for (index, c) in line.chars().enumerate() {
        if c.is_digit(10) {
            current_num = current_num * 10 + c.to_digit(10).unwrap();
        } else {
            if current_num != 0 {
                result.push(NumOccurence {
                    num: current_num,
                    index: current_index,
                });
            }
            current_num = 0;
            current_index = index + 1;
        }
    }
    if current_num != 0 {
        result.push(NumOccurence {
            num: current_num,
            index: current_index,
        });
    }
    result
}

fn range_contains_special_symbol(line: &str, range: &Range) -> bool {
    line.chars()
        .skip(range.start)
        .take(range.size)
        .any(|c| !c.is_alphanumeric() && c != '.')
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_extract_numbers() {
        let input = "467..114..1";
        let expected = vec![
            NumOccurence { num: 467, index: 0 },
            NumOccurence { num: 114, index: 5 },
            NumOccurence { num: 1, index: 10 },
        ];
        let actual = extract_numbers(input);
        assert_eq!(expected, actual);
    }

    #[test]
    fn test_range_contains_special_symbol() {
        let input = "467..114..1";
        let range = Range { start: 0, size: 3 };
        let expected = false;
        let actual = range_contains_special_symbol(input, &range);
        assert_eq!(expected, actual);

        let range = Range { start: 3, size: 2 };
        let expected = false;
        let actual = range_contains_special_symbol(input, &range);
        assert_eq!(expected, actual);
    }

    #[test]
    fn test_range_contains_special_symbol_with_special_symbol() {
        let input = "467+..114..1";
        let range = Range { start: 0, size: 5 };
        let expected = true;
        let actual = range_contains_special_symbol(input, &range);
        assert_eq!(expected, actual);
    }

    #[test]
    fn test_sample_input() {
        let input = "
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
        ";
        let expected = 4361;
        let actual = process(input);
        assert_eq!(expected, actual);
    }
}

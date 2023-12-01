fn main() {
    let input = include_str!("input1.txt");
    let result = part2(input);
    println!("part2: {}", result);
}

fn part2(input: &str) -> i32 {
    let split = input.lines();
    let result: i32 = split
        .map(|line| {
            let line = convert_line_text(line);
            let numbers = extract_numbers(&line);
            numbers
        })
        .sum();
    result
}

fn extract_numbers(input: &str) -> i32 {
    // Filter out non-numeric characters and convert to i32 vector
    let numbers = input
        .chars()
        .filter(|c| c.is_numeric())
        .map(|c| c.to_digit(10).unwrap() as i32)
        .collect::<Vec<i32>>();
    // Keep only first and last index
    let reduced = numbers
        .iter()
        .enumerate()
        .filter(|&(i, _)| i == 0 || i == numbers.len() - 1)
        .map(|(_, &v)| v)
        .collect::<Vec<i32>>();
    // duplicate arrays if only one number
    let doubled_solo = if reduced.len() == 1 {
        vec![reduced[0], reduced[0]]
    } else {
        reduced
    };
    // Fold to i32
    let result = doubled_solo.iter().fold(0, |acc, &x| acc * 10 + x);
    result
}

fn convert_line_text(input: &str) -> String {
    let replace_table = [
        ("one", "1"),
        ("two", "2"),
        ("three", "3"),
        ("four", "4"),
        ("five", "5"),
        ("six", "6"),
        ("seven", "7"),
        ("eight", "8"),
        ("nine", "9"),
        ("zero", "0"),
    ];

    let mut index = 0;
    let mut return_string = input.to_string();
    while index < return_string.len() {
        for (word, number) in &replace_table {
            if return_string[index..].starts_with(word) {
                let first = return_string.chars().take(index).collect::<String>();
                let second = return_string.chars().skip(index + 1).collect::<String>();
                return_string = format!("{}{}{}", first, number, second);
                index += 1;
            }
        }
        index += 1;
    }
    return_string
}

#[cfg(test)]
mod tests {
    use crate::*;

    #[test]
    fn test_line() {
        let input = "two1nine";
        let expected = 29;
        let line = convert_line_text(input);
        let output = extract_numbers(&line);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_convert_line_text_advanced() {
        let input = "two1sevenine";
        let expected = 29;
        let line = convert_line_text(input);
        let output = extract_numbers(&line);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_part2() {
        let input = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen";
        let expected = 281;
        let output = part2(input);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_input() {
        let input = include_str!("input1.txt");
        let expected = 53868;
        let output = part2(input);
        assert_eq!(output, expected);
    }
}

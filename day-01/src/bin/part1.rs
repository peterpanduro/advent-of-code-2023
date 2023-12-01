fn main() {
    let result = part1(include_str!("input1.txt"));
    println!("part1: {}", result);
}

fn part1(input: &str) -> i32 {
    let split = input.split("\n");
    let result: i32 = split.map(|line| extract_numbers(line)).sum();
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

#[cfg(test)]
mod tests {
    use crate::*;

    #[test]
    fn test_extract_numbers() {
        let input = "1abc2";
        let expected = 12;
        let output = extract_numbers(input);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_extract_numbers_more_numbers() {
        let input = "pqr3s4tu8vwx";
        let expected = 38;
        let output = extract_numbers(input);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_extract_numbers_one_number() {
        let input = "abcde5f";
        let expected = 55;
        let output = extract_numbers(input);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_part1() {
        let input = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet";
        let expected = 142;
        let output = part1(input);
        assert_eq!(output, expected);
    }

    #[test]
    fn test_input() {
        let input = include_str!("input1.txt");
        let expected = 54953;
        let output = part1(input);
        assert_eq!(output, expected);
    }
}

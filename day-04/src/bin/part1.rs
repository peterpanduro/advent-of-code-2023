fn main() {
    let input = include_str!("input.txt");
    let answer = solve(input);
    println!("Answer: {}", answer);
}

fn solve(input: &str) -> u32 {
    input
        .lines()
        .map(|line| {
            let numbers = line
                .split(":")
                .nth(1)
                .expect("Valid")
                .split("|")
                .map(|numbers| numbers.trim().split_whitespace().collect::<Vec<_>>())
                .collect::<Vec<_>>();
            let wins = &numbers[0];
            let mine = &numbers[1];
            let mut num_wins = 0;
            mine.iter().for_each(|&number| {
                if wins.contains(&number) {
                    num_wins += 1;
                }
            });
            let mut points = 0;
            if num_wins > 0 {
                points = 2_u32.pow(num_wins - 1);
            }
            dbg!(points);
            points
        })
        .sum::<u32>()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sample_input() {
        let input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11";
        let expected = 13;
        let actual = solve(input);
        assert_eq!(actual, expected);
    }
}

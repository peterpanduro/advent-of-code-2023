fn main() {
//     let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green";
    let input = include_str!("input.txt");
    let answer = solve(input);
    println!("{}", answer);
}

fn solve(input: &str) -> u32 {
    input.lines().map(process_line).sum()
}

fn process_line(line: &str) -> u32 {
    let mut most_red = 0;
    let mut most_green = 0;
    let mut most_blue = 0;
    line.split(':')
        .nth(1)
        .expect("value")
        .trim()
        .split(';')
        .for_each(|round| {
            round.split(',').for_each(|draw| {
                let cubes: Vec<_> = draw.trim().split(' ').collect();
                let num = cubes[0].parse::<usize>().expect("number");
                let color = cubes[1];
                match color {
                    "red" => most_red = most_red.max(num as u32),
                    "green" => most_green = most_green.max(num as u32),
                    "blue" => most_blue = most_blue.max(num as u32),
                    _ => panic!("unknown color"),
                };
            })
        });
    most_red * most_green * most_blue
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_input() {
        let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green";
        let expected = 2286;
        let actual = solve(input);
        assert_eq!(actual, expected);
    }
}

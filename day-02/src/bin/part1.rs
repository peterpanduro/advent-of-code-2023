const RED_LIMIT: usize = 12;
const GREEN_LIMIT: usize = 13;
const BLUE_LIMIT: usize = 14;

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
    input.lines().filter_map(process_line).sum()
}

fn process_line(line: &str) -> Option<u32> {
    let parts: Vec<&str> = line.split(':').collect();
    let exeeded = parts[1].trim().split(';').any(|round| {
        let result = round.split(',').any(|draw| {
            let cubes: Vec<_> = draw.trim().split(' ').collect();
            let num = cubes[0].parse::<usize>().expect("number");
            let color = cubes[1];
            let exeeded = match color {
                "red" => num > RED_LIMIT,
                "green" => num > GREEN_LIMIT,
                "blue" => num > BLUE_LIMIT,
                _ => panic!("unknown color"),
            };
            exeeded
        });
        result
    });

    if exeeded {
        return None;
    }

    let id = parts[0]
        .trim()
        .split(" ")
        .nth(1)
        .expect("value")
        .parse::<u32>()
        .expect("number");
    Some(id)
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
        let expected = 8;
        let actual = solve(input);
        assert_eq!(actual, expected);
    }
}

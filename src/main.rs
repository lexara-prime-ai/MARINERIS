#[allow(unused_variables)]
#[allow(dead_code)]
#[derive(Debug)]
struct Program<'a> {
    version: &'a str,
    status: ProgramState,
}

#[derive(Debug)]
enum ProgramState {
    Running,
}

impl<'a> Program<'a> {
    fn run(&self) -> String {
        format!("PROGRAM_STATUS: {0:?}", self.status)
    }
}

fn main() {
    let program: Program<'_> = Program {
        version: "0.1.0",
        status: ProgramState::Running,
    };

    println!("{:?}", program.run());
}

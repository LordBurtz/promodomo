# Promodomo

## Overview
Promodomo is a Haskell project that provides a test environment for the ProMo2025 weekly programming exercises to verify your implementation

## Purpose
This project was created to:
- Explore Haskell programming in a structured way
- Provide a testing framework for verifying implementations
- Offer practical exercises for learning functional programming concepts

## Getting Started

### Prerequisites
- GHC (Glasgow Haskell Compiler)

### Installation

#### 1. Clone the Repository
```sh
git clone https://github.com/LordBurtz/promodomo.git
cd promodomo
```

Alternatively, [download the ZIP file](https://github.com/LordBurtz/promodomo/archive/refs/heads/master.zip) and extract it.

#### 2. Install Stack (Build Tool)

**Linux/macOS:**
```sh
curl -sSL https://get.haskellstack.org/ | sh
```

**Windows:**
Download the installer from the [official Stack website](https://docs.haskellstack.org/en/stable/install_and_upgrade/#windows).

## Usage

### Working on Exercises
1. Navigate to the weekly exercise file (e.g., `src/week03/Week03.hs`)
2. Implement the required functions according to the specifications
3. Follow the provided function signatures and type definitions

### Testing Your Implementation

#### Using GHCI (Interactive Mode)
```sh
cabal repl
```

#### Running Tests
```sh
cabal test week03
```
Replace `week03` with the week you're currently working on.

### Alternative Workflow
You can also edit the weekly files directly on GitHub and create a Pull Request. GitHub's CI will automatically run the tests for you.

## Or:
Edit Week{number}.hs and open a PR, githubs CI will test it for you  
(*You can even edit the files in the browser ughh*)
  
fr not that easy to mess up, JUST STAY IN THE FILES I PROVIDED AND USE THE FUNCTION NAMES AND 
DEFINITIONS 

## Project Structure
- `src/` - Contains weekly exercise modules
  - `week03/` - Week 3 exercises and solutions
  - `week04/` - Week 4 exercises and solutions

## Guidelines
- Ensure you keep the function names and type signatures as provided
- Only modify the implementation within the designated weekly files
- Follow Haskell's code style conventions

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
MIT 2025

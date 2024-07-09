# scheme-interpreter

An interpreter for a subset of the Scheme programming language. It implements lexical analysis to tokenize input and syntactic analysis to parse tokens into internal representations using the `Pair` class. This interpreter also supports logical short-circuiting and local variable bindings, providing a robust platform for executing Scheme code.

> [!NOTE]
> Starter Code Creds: UC Berkeley's CS 61A

## Lexing
The lexing process tokenizes input by reading it line by line and matching tokens based on priorities, ensuring accurate interpretation of instructions before labels.

## Parsing
The parsing process validates the lexed tokens, ensuring instructions adhere to correct syntax and are accompanied by necessary arguments.

## Evaluation
The evaluation loop processes various types of expressions, including self-evaluating expressions, symbols, call expressions, and special forms like `if`, `define`, `lambda`, `and`, `or`, `cond`, and `let`.

## Advanced Features
- **Dynamic Scoping:** Supports dynamic scoping of variables.
- **Tail Call Optimization:** Optimizes recursive function calls to prevent stack overflow.
- **Macro Support:** Fully supports defining and using macros within the Scheme language.

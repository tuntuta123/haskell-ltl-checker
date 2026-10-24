# Haskell LTL Checker

An LTL (Linear Temporal Logic) model checker written in Haskell.

I've been getting more into formal verification lately, so I thought it'd be interesting to build a model checker from scratch and get a better understanding of the algorithms behind it.

The plan is to start with LTL formula evaluation, then work towards automata-based model checking using Büchi automata, with counterexample generation for properties that don't hold.

## Roadmap

- [ ] LTL syntax and parsing
- [ ] LTL evaluation over infinite traces
- [ ] Transition system representation
- [ ] Büchi automata
- [ ] Automata-based model checking
- [ ] Counterexample generation

Also considering extending the project to support CTL and Petri nets down the line.

## Built with

- **Haskell**
- **Cabal**

## Getting started

Installation and usage instructions will be added as the implementation progresses.
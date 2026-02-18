# Notionary

A web-based memory learning app built on a simple but powerful idea: 
any subject can be broken down into **notions** — pairs of questions 
and answers — and mastered through repetition and self-testing.

## Motivation

The app was inspired by the work of German psychologist Hermann Ebbinghaus, 
who in the late 19th century systematically studied memory and forgetting. 
His research produced the **forgetting curve** — a mathematical description 
of how quickly learned material fades from memory over time — and, crucially, 
a method to counteract it: **spaced repetition**. By reviewing material at 
carefully timed intervals, and adjusting those intervals based on performance, 
it is possible to move information efficiently into long-term memory.

Notionary was designed to implement this principle. Test results are tracked 
over time with the goal of recommending when a user should return for their 
next session, and at what difficulty level — bringing users back at the right 
moment to reinforce learning before it fades.

## What is a Notion?

A notion is a list of question-and-answer pairs. Notions can cover 
any subject: vocabulary, world capitals, historical dates, music 
recognition, math facts — anything that can be expressed as Q&A.

Users can study pre-built notion sets or create their own.

## Learning Modes

- **Flashcards** — Questions are displayed as cards that flip on click 
  to reveal the answer. Users work through the deck at their own pace.
- **Multiple Choice Test** — Questions are presented with a menu of 
  answers (correct + decoys). User selects the right one.
- **Written Answer Test** — User types the answer from memory.
- **Reverse Test** — The answer is shown first; the user must recall 
  the question.

At the end of each test, the user receives a score and a review of 
their progress over time.

## Features

- User-created notion sets
- Test results stored and tracked in a MySQL database
- Spaced repetition engine to recommend optimal review timing
- Multilingual interface (English, Spanish, French, German, Italian, 
  Portuguese, Russian, Hungarian)
- Dialogue text stored in the database for easy localization

## Tech Stack

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** PHP
- **Database:** MySQL

## Status

This codebase is currently being modernized. Original version dated 2022.


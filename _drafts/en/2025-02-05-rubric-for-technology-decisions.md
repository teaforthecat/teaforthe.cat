---
layout: post
title: Rubric for Technology Decisions
date: 2025-02-05
lang: en
---


## Intro
Sometimes a decision needs to be made. Sometimes it is an important one.
Sometimes it isn't apparent that it is an important one until much later on.
Unil it is too late- productivity has plummeted and people start wispering that
nasty word: _rewrite_. This is the case with technology decisions. They are a
bet into the future and can pay dividends or sink your ship, leading to layoffs
or overseas contractors because development has... become... so... hard.

By _technology_, I'm refering to languages, frameworks, systems, and
tooling that developers will use to do their job everyday. These decisions can
have a million dollar impact on a business, but are often given the weight of
weekend fling and decided based on a whim and a fancy. If you calculate
developer productivity losses over multiple years, this can add up quickly.
Technology decisions can be given the rigor and explicit nature of other
business decisions with a structured document. There are many such structures to
choose from, but I haven't seen a concise, easy to use rubric for assessing a
technology decision, so one is presented here. It is provided as a tool for
assessing the quality of a technology decision. Consider these ideas when
you are about to make a technology decision and hopefully it will stand the test
of time.

**Technology Decision Rubric:**

There are three facets to assess:
1. Domain of the Problem 
1. Experience of the team
1. Offerings of the community 

And some ranges to evaluate each facet:
1. Domain of the problem
  - **3 Points** Most projects made with this tech are in this problem domain.
  - **2 Points** Some projects exist, but they are rare.
  - **1 Point**  No projects can be found with this technology in this domain.
2. Experience of the team
  - **3 Points** Most developers on the team have built and deployed something with this tech many times.
  - **2 Points** Some have used it, some have not.
  - **1 Point**  Zero developers have built and deployed working products with this tech.
3. Offerings of the community
  - **3 Points** There are copious amounts of  projects that integrate and support development using this tech.
  - **2 Points** There are a couple open source projects thatsupport or integrate with this tech.
  - **1 Point**  There are zero established, or only a few, small, early-in-development,  projects that support or integrate with this tech.

## Usage

When considering one or more options for a language or technology, assess the three facets above,
assigning a number to each, add them up, and compare their scores.

- 9   - a good technology decision
- 6-8 - risky! look for another option
- 3-4 - consider this a skunkworks project with zero expectations and should be
  archived at the end 


## Domain of the Problem 
What is the domain of the problem? That is a big question and can be hard to
answer. Here are some examples with what I would name the domain in parentheses.

1. I need users to fill out web forms for data entry. (Web forms)
1. I need to process a million events an hour and publish summary data.  (Event Streaming)
1. I need to analyse a medium-sized dataset using statistical calculations. (Statistics)
1. I need to display colorful graphs from an existing API. (UI Dashboard)
1. I need a microprocessor to process an input signal. (Embedded)

Use your best naming skills to define your problem domain.

## Experience of the team
If the tech is new to the team you can expect and plan for some learning time.
You can also expect that even with learning time, the first version will not be
great. Skunkworks projects are great, they can provide growth opportunities for
growth-hungry developers, impact morale, culture and engagement, and maybe
provide a edge over a competing business. 

An experienced team that knows their tools like the back of their hand can be an
amazing experience. Provided they know _what_ to build (also not easy), they can
provide emmense value. This is the name of the game. 

There are edge cases. If you have a startup and only one developer,
or you plan to augment a team with rotating contractors, there are other things
to consider. This facet still applies though. We need to define the team,
partially, in terms of all possible developers that could potentially join the
team. Language popularity is a researched statistic that is published regularly.
Less so for frameworks or other tooling perhaps, but it is worth looking into.
It would be best for this to be a data-driven facet.


## Offerings of the Community

Guides, blog posts, examples, and documentation are all important. However, What
we are looking for here is up-to-date libraries with many contributors and,
ideally, old. Not new libraries, old boring libraries that have been arround for
ages and are commonly used. Libraries that are quick and easy to use and
understand because they have been refined by experience, collaboration, and
craftsmanship. This could be a whole rubric on its own, it seems, but these are
the libraries to consider when making a technology decision. Every library is
less code the team has to develop and maintain, which lets them focus on the
business and, yep, adding value.


## Examples
    
### Problem 1:
**I need to control lights based on an audio signal.**

Proposed Tech: Rust; _score:_ 6 - research and learning

1. **Problem domain:** _score: 3_ (Embedded)
A large faction of the user base seems to be using this tech with embedded projects and it is called out as a "distinct" domain supported on the website.

2. **Experience of the team:** _score: 1_
One person that has never used Rust
 
3. **Offerings of the community:** _score: 2_
Would be a 3 but many of the supporting libraries are newish, so some issues can be expected, though the quality of tooling and support does seem to be great and getting started is easy because of this

### Problem 2: 

**I need a multi-step process for users to make choices and enter data based on certain criteria.**

Proposed Tech: Ruby on Rails; _score:_ 9 - good

1. **Problem domain** _score: 3_ (Web forms)
Most Rails projects are made in the domain.
2. **Experience of the team** _score: 3_
One developer has 10 years, and one developer will be hired, and Ruby is one of the more common languages.
3. **Offerings of the community** _score: 3_
Rails is a major ecosystem and old, many libraries are easy to use because they conform to Rails conventions

### Problem 3: 
**I need to store and query many different entities which are very interrelated, and I need and auditable record of changes.**

Proposed tech: Datomic _score: 7_ - Risky. Is there another option?

1. **Problem domain** _score: 3_ (Graph Database)
This database fits the needs perfectly, a graph database can handle many relations and it is immutable, meaning change tracking is built-in.
2. **Experience of the team** _score: 1_
No one on the team has used Dataomic, let alone a graph database. The learning curve would be high. 
3. **Offerings of the communtity** _score: 3_
There are a few libraries that support an alternative schema syntax and migrations. The main offerings come from a paid license, which is quite nice, and offer everything that would be needed to support the database.

## Conclusion
Here we see that this Rubric has forced us to be explicit around our thinking
and has helped us segment the concerns about certain tech. Side by side
comparisons would be very interesting for someone to read 5 years into the
future when some resistance, unrest, and whispers ignite questions about how the
team is spending their day. May that never happen to you.. at least not for a
decade.










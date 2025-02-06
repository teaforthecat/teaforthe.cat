---
layout: post
title: Rubric for Technology Decisions
date: 2025-02-05
lang: en
---


## Intro
There are various strategies for making business decisions. Sometimes they
aren't used if the decision doesn't seem important enough. The problem with
technology decisions is that it may not seem like an important decision until
much later on. Until it is too late- productivity has plummeted and people start
wispering that nasty word: _rewrite_. There are more contributors to that
situation, such as application design, and testing, but the technology choice is
one contributor. If you calculate developer productivity losses over multiple
years, this can add up quickly. These decisions can have a million dollar impact
on a business, but often their rationale is hidden in secret (if any rationale
is used at all). They are a bet into the future and can pay dividends or slow
down delivery so much that the business is impacted, leading to layoffs or
overseas contractors because development has... become... so... hard.

    By _technology_, I'm refering to languages, frameworks, systems, and tooling
    that developers will use to do their job everyday. 

Technology decisions can be given the rigor and explicit nature of other
business decisions with a structured document. There are many such structures to
choose from, but I haven't seen a concise, easy to use rubric for assessing a
technology decision, so one is presented here. It is provided as a tool for
assessing the quality of a technology decision. Consider these ideas when you
are about to make a technology decision and hopefully it will stand the test of
time.

**Technology Decision Rubric:**

There are three facets to assess:
1. Domain of the Problem 
1. Experience of the team
1. Offerings of the community 

## Domain of the Problem 
Every project has a problem it is trying to solve. What is the domain of the
problem? That is a big question and can be hard to answer. Here are some
examples with what I would name the domain in parentheses.

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

Provided they know _what_ to build (also not easy), an experienced team with
well-known tools can provide emmense value.

There are edge cases. If you have a startup and only one developer, or you plan
to augment a team with rotating contractors, there are other things to consider.
This facet still applies though. Define the team, partially, in terms of all
possible developers that could potentially join the team. Language popularity is
a researched statistic that is published regularly. Frameworks or other tooling
seem to be less researched, but it is worth looking into. It would be best for
this to be a data-driven facet, though be careful not to fall into a popularity
contest. 

## Offerings of the Community

What we are looking for here is up-to-date libraries with many contributors and,
ideally, old. Not new libraries, old boring libraries that have been arround for
ages and are commonly used. Libraries that are quick and easy to use and
understand because they have been refined by experience, collaboration, and
craftsmanship. Every library used is less code the team has to develop and
maintain, which lets them focus on business value.

## Using the rubric

When considering one or more options for a language or technology, assess each
of the facets, assigning a number to each, add them up, and compare their
scores.

Score ranges for each facet:
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

Total score results:
- 9   - a good technology decision
- 7-8 - risky! look for another option
- 3-6 - consider this a skunkworks project with zero expectations, and the
  project should probably not go to production 

## Other considerations
These haven't been included in the rubric to keep it simple, but these are
potential facets that could be added to your technology decision.

- Are there guides, blog posts, examples, and documentation that are readily
available and easy to use? 
- Is the techology itself easy to learn?

## Examples
    
### Problem 1:
**I need to control lights based on an audio signal.**

Proposed Tech: Rust; _score:_ 6 - skunkworks, research and learning

1. **Problem domain:** _score: 3_ (Embedded)
Seems to have a large user base using this tech with embedded projects and it is called out as a "distinct" domain supported on the website.

2. **Experience of the team:** _score: 1_
One person that has never used Rust
 
3. **Offerings of the community:** _score: 2_
Would be a 3 but many of the supporting libraries are newish, so some issues can be expected, though the quality of tooling and support does seem to be great and getting started is easy because of this.

### Problem 2: 

**I need a multi-step process for users to make choices and enter data based on certain criteria.**

Proposed Tech: Ruby on Rails; _score:_ 9 - good

1. **Problem domain** _score: 3_ (Web forms)
Most Rails projects are made in this domain.
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
team is spending their day. May that never happen to you... at least not for a
decade.


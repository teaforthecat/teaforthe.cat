---
layout: post
title: event-driven-pros-cons
lang: en
---


# Intro

## Pros:

1. Scalable 
1. Loosely Coupled
1. Fast
1. Efficient 

## Scalable
Processors can scale horizontally based on a queue size.

To emphasize the scalability of a system, implement queue-size-based auto-scaling.

## Loosely Coupled
System changes are easier when multiple services can consume the same queue of
messages. 

To emphasize the flexibility of a system, design with intention, and use theory
from Domain-Driven-Design and Service-Oriented Architecture. 

## Fast
Persistent connections allow messages to pass through services quickly.

To emphasize the speed of a system use techniques that fit the needs of the
users. Perhaps time or count based aggregation when needed. Optimize database
transactions by designating reading and writing across different connections,
tables, replicas, etc.

## Efficient 
Related to scalability, the system can respond to usage, saving on
infrastructure costs.

To emphasize efficiency of a system, use dynamic resource allocation techniques,
such. E.g.: spot instances or containers.


## Cons:

1. Complex
1. Latency 
1. Event Ordering
1. Error Handling
1. Development and Testing Challenges


## Complex
It can be hard to understand the flow of events trough a system. It can also be
hard to understand how code handles data from another system. 

To de-emphasize the complexity of a system, use system diagrams and intentional
design, as stated above, using DDD and SOA

## Latency
If a queue gets busy it can delay some events from reaching their destination in
the intended time. 

To de-emphasize the latency of a system, separate reads and writes of a
database. If it is an IO bottleneck such as an external API, use parallel
processes. Consider a state machine in addition to a queue for managing retries,
or putting a problematic request off to the side so it doesn't block other
speedy requests. 

## Event Ordering
Delays can cause some events to be processed at a different time than
others that might have been produced at a similar time. This can be difficult to
manage logically.

To de-emphasize the chaos that can be found in event ordering, design the system
to not minimize the reliance on the order of events. For example something can
be partially valid, if more data is coming in, or timestamps can be passed
through the system and honored rather than being discarded. Compare and set can
be used in transactions.

## Error Handling
Recovering from errors can be challenging. 

To de-emphasize the difficulty in handling errors, use retries and dead-letter
queues, or separate queues, so the events can be processed with special code. 

Use specs on the "edges" of a system, where a process connects to another
process. This can increase reliability through testing.

## Development and Testing Challenges

A shared repo of specs along with unit and integration tests that use mocked
queues can prevent errors from happeing.

To de-emphasize testing challeges, use dependency injection in the code base.
An interface can be used to facilitate dependency injection. With a mock queue
client that implements the same interface, and a consumer that is on a different
thread, an integration test can be a fast and reliable simulation of production.



---
title: "Event 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---

# Event Recap — FCAJ Meetup (06/13/2026)

The FCAJ Meetup on June 13, 2026 brought 4 practical sessions covering the engineering profession, corporate culture, and AWS system architecture — mostly from people actively working in the field.

---

## Speakers & Topics

| Speaker | Topic |
|---|---|
| Dinh Trung Kien & Nguyen Minh Tho | Scalable URL Shortening Service on AWS |
| Trong H. Truong (DevOps @ Endava) | What Does a DevOps Engineer Really Do? |
| Dat Pham & Cuong Nguyen | Real Stories & MNC Culture |
| Danh Hoang Hieu Nghi (AI Engineer) | From First Cloud AI Journey to AWS Partner |

---

## Session Breakdown

### Dinh Trung Kien & Nguyen Minh Tho — Production-Grade URL Shortener on AWS

This session tackled a classic System Design problem — not just getting it to work, but getting it right: scalable, secure, and low-latency.

**Problems with the naive approach:**
A direct Frontend → Backend → Database setup has too many weaknesses: Single Point of Failure, hard to scale, high read latency, no protection against attacks.

**The architecture they built:**
- **Edge layer**: CloudFront + WAF to block bad traffic, Amplify to serve static content
- **App layer**: ECS Fargate + ALB routing into Private Subnets

**The most interesting part — Key Generation Service:**
Instead of generating short codes on demand when a request arrives, a background service continuously pre-generates keys and pushes them into a Redis queue (`LPUSH`). When a request comes in, the backend just `RPOP`s a ready-made key — zero generation latency.

**Read path uses Cache-aside**: ElastiCache Redis is checked first, falling back to DynamoDB only on a cache miss — significantly reducing database load.

---

### Trong — What a DevOps Engineer Actually Does

Trong opened by listing what people usually think DevOps is: writing CI/CD pipelines, typing Docker/K8s commands, being the "hero who fixes the server at 2am." Then compared that to reality.

The actual job is more about the system than the code: on-call duties, incident handling, access management, cost investigation, and Ownership clarification — figuring out who is responsible for what.

**What to study first?** Don't chase tools — tools constantly change. Fundamentals are what matter: **Linux, Networking, Git, Containers**, and one programming language (Python or Golang).

**Hard-learned lessons:**
- Copying commands from StackOverflow without understanding them leads to problems
- Always ask **"Why"** before **"How"**
- Communication is a core skill, not a secondary one
- Use AI to learn faster, not to stop thinking

---

### Dat & Cuong — Real Life in an MNC

Both speakers shared honestly about what actually happens when working at a multinational corporation.

**Survival skills beyond technical:**
Critical thinking, communication, problem solving — and especially **Data Storytelling**: knowing how to analyze isn't enough, you have to present findings in a way people can understand and trust.

**5-level career ladder:**
Follower → Learner → Problem Solver → System Thinker → Super Star

Most newcomers enter as Followers. The jump to Problem Solver — handling issues end-to-end without asking for each step — is the most important transition for being trusted with bigger work.

**No-Blame Post-Mortem culture:**
When something breaks, don't look for someone to blame — look for the root cause in the system and fix it. This is a significant difference between professional and unprofessional environments.

---

### Danh — From First Cloud AI Journey to AWS Partner

Danh shared a personal journey broken into 8 steps, from a curious student to becoming an AWS Partner and giving back to the community.

The key insight wasn't the technical steps — it was the view of **community as a long-term asset**: getting a job is just the beginning. Joining AWS Student Builder Group or AWS Community Builder brings network, cert vouchers, AWS Credits, and most importantly, meeting the right people at the right time.

---

## What I'm Taking Back

Event 3 was different from the first two — less AI, more "professional reality check." Things that stuck:

- **System Design is learnable** — the URL shortener session showed a clear path from fragile MVP to production-grade thinking
- **DevOps is not about tools** — it's about mindset and owning the system
- **Problem Solver level is the near-term goal** — no more asking for each step, resolve things end-to-end
- **Community is a long-term investment** — start participating now, not "when I'm better"

#### Event Photos

<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725807073_84fcd3d4313cc421e775a111f2eb946f.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725831126_11fc0329af32df5ae3a9a9df54015fa5.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725840272_557c064b17e7dec9f7e1ffe307fd9d44.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725858895_fa11f2e171ceb3cbad4d26b5d2009e91.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725873656_699c80fd49a8f98c5842b283eeb7f595.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725874996_9e7511356f7d8eec1fc7fe8fe9419f22.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725890856_d4b0b892b684f333ac8edb8f3b515c44.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:220px;height:auto" />
</div>

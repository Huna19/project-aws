---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Report: GenAI-powered App-DB Modernization Workshop & AWS Community Day (05/23/2026)

AWS Community Day on May 23, 2026 featured 6 deep technical sessions covering AI/LLM in production, AWS infrastructure optimization, and raw lessons from a hackathon under pressure.

---

## Purpose of the Event

- Share real-world solutions and best practices for applying AI/LLM and optimizing cloud infrastructure (AWS).
- Introduce advanced AI architecture patterns: Multi-Agent Systems, Context Engineering, AI Assistants.
- Guide cost optimization, security hardening, and performance improvements from Edge to Origin.
- Share hands-on experience and hard-learned lessons from hackathon projects under tight deadlines.

---

## Speakers & Topics

| Speaker | Role | Topic |
|---|---|---|
| Vy Lam (Cat Vy) | Senior BSA @ VPBank | Enterprise-Grade Multi-Agent System |
| Duc Dao | Solution Architect @ Cloud Kinetics | How LLM Actually Works |
| Team VIB | UTMorpho @ Lotus Hacks | 36-Hour Hackathon |
| Hai Anh | AWS Community Builder @ G-AsiaPacific | Friendly AI Assistant with Amazon Q |
| Tuan Thinh | DevOps Engineer | CloudFront as Your Foundation |
| Tinh Truong | Platform Engineer @ GoTymeX | Context Engineering |

---

## Session Breakdown

### Cat Vy — Enterprise-Grade Multi-Agent System

**The root problem:**
Traditional bank credit scoring requires 3 years of financial data and collateral — completely incompatible with startups that only have 6–18 months of operational data, whose assets are IP and people, and whose data is largely unstructured.

**Solution: Virtual Credit Committee (Multi-Agent Paradigm)**
Instead of a single Agent that easily loses context, the system decomposes into specialized Agents connected via the **MCP protocol**:
- **Financial Analyst** — financial analysis
- **Market Analyst** — market assessment
- **Team Evaluator** — team evaluation
- **Risk Assessor** — risk quantification
- **Compliance** — legal compliance check
- **Manager** — synthesis and final decision

**Outstanding ROI:**
- Processing time: from 2–3 weeks → 2–4 hours (95% faster)
- Operational cost reduced by over 90%
- Approval rate increased to 35–45%

**Enterprise-grade security:**
Deployed via **Bedrock AgentCore** + **Terraform**, with mandatory **Guardrails** to protect sensitive data (PII) and block Prompt Injection.

---

### Duc Dao — The Non-Deterministic Nature of "Deterministic" LLMs

**Common misconception:**
Users typically believe that setting T=0 (Greedy Decoding) means the AI will always return identical results for the same prompt.

**Research reality:**
No large model (GPT-4o, Llama-3, Mixtral...) is perfectly deterministic at T=0. The causes:
- GPU hardware architecture processing in parallel
- **Floating-point** arithmetic errors — math is not associative: (a+b)+c ≠ a+(b+c)
- Inference batching algorithms change calculations per batch

**Consequences & Solutions:**
- T=0 can trap the model in **infinite response loops**
- Fix: set **T=0.1** to add a small random nudge to break the loop
- Combine with higher **repeat penalty** and design systems to **accept probabilistic output**
- Enforce structured output (**JSON/YAML**) via system parameters, not just prompts

---

### Team VIB — 36 Hours at Lotus Hacks 2026

**Starting from zero:**
Entered Lotus Hacks 2026 (Vietnam's largest hackathon) with no preset idea — found inspiration from real daily frustrations and pain points, which gave birth to **UTMorpho**, powered by Claude Sonnet 4 on US-East-1.

**Real challenges during those 36 hours:**
- Relentless time pressure with no breathing room
- **AI Overgeneration** — the AI kept producing excessive, unusable content
- Hitting **Token Limits** right when the deadline was closest
- **Burnout** hitting team members right before Pitch Time

**The turning point:**
Focusing on **Focused Editing Experience** and full **Team Sync** — the two factors that ultimately decided the outcome, more than any number of ideas.

Lesson: **"Real Frustration Creates Real Ideas"** — the best product ideas come from real, lived pain points.

---

### Hai Anh — Friendly AI Assistant with Amazon Q

**The Business User's pain:**
- Too much time collecting information from scattered sources
- Exhausting repetitive manual tasks
- Dependency on specialists for deep data analysis

**Amazon Q Suite solution:**
A unified workspace for humans and AI Agents to collaborate:
- Connects to over **40 data sources** (data connectors)
- Integrates **Bedrock models** and user files
- Fastest path from "insight" to "action"
- Controlled by **Governance, Access controls, and Guardrails** for legal compliance

**Real use case — PM Assistant:**
Fully automated workflow:  
Meeting Minutes (MoM) → Auto-send email to stakeholders → Auto-schedule next meeting

---

### Tuan Thinh — CloudFront from Edge to Origin

**The cloud bill fear:**
With usage-based billing, startups worry about costs spiking from traffic bursts or DDoS attacks.

**Solution: Fixed-Price Plans:**
CloudFront's monthly fixed-price tiers (Free, Pro, Business, Premium):
- **No overage fees**
- **Attack traffic that's blocked is not billed**

**Performance gains:**
- Over **700 global PoPs** + persistent connections drop origin EC2 CPU from **5% → 1%**
- **HTTP/3 multiplexing** enables parallel resource loading
- Data compression cuts response time by **81%** (123ms → 24ms)
- **Origin Cloaking** via OAC/Custom Headers completely hides the origin server

---

### Tinh Truong — Context Engineering: Context Is Everything

**Core message:**
Today's AI models are powerful. Bad or vague results are mostly caused by **weak input context**, not weak models.

**3 classic mistakes when using AI:**

1. **"The Internet Puller"** — Stuffing too many unfiltered documents into chat, diluting the signal and burning tokens

2. **Stating the obvious** — Giving AI existing code then asking it to reconfigure the same technology, instead of focusing on the logic that actually needs changing

3. **Missing goals and constraints** — Vague requests leave AI to guess, with predictably vague results

**Simple Context Framework:**
Before writing any prompt, prepare all 4 elements:
- **Goal** — the specific outcome you want
- **Relevant info** — only what's actually needed
- **Constraints** — technical limits, requirements, restrictions
- **Success criteria** — how to know if the output is correct

---

## What I Learned

**Design & development thinking:**
- **Business-First Approach**: The best product ideas always start from solving real problems in day-to-day operations, not from chasing technology trends
- **Context Engineering is a core skill**: The future isn't Human vs AI — it's people who know how to use AI vs those who don't. The shift is moving from Prompt → Context Systems → Long-term Memory
- **Multi-Agent thinking**: For complex enterprise problems, specialized agents working together deliver better accuracy and ROI than any single agent

**Architecture & infrastructure:**
- **Probabilistic Mindset**: When building LLM applications, design for variance in output — even at T=0. Wrap logic with verification and test continuously
- **Edge Computing**: Use CloudFront Functions or Lambda@Edge to handle logic (geo-routing, security checks, URL rewrites) at the edge, minimizing origin load

---

## How I'll Apply This

- **Daily prompting**: Apply Simple Context Framework (Goal → Relevant info → Constraints → Success criteria) to every AI interaction immediately
- **AI Agent design**: Move from single-agent to decomposed multi-agent architecture, configure T=0.1 to prevent infinite loops
- **Amazon Q + MCP experiments**: Explore integrations to automate repetitive workflows (meeting minutes, auto-reports)
- **Web infrastructure**: Propose CloudFront + Origin Cloaking for web projects, use fixed-price plans for predictable cost control

---

## Event Reflection

This was one of the highest-quality technical events I've attended. Not the kind where you sit and absorb — these were people sharing real problems, real solutions, and real failures.

The contrast between two sessions was striking: Cat Vy's carefully calculated Multi-Agent system with 95% ROI, and Team VIB's chaotic, emotional 36 hours. Both taught completely different things that no documentation could ever capture.

#### Event Photos

<div style="display:flex;flex-wrap:wrap;gap:12px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.2-Event2/z7866450137122_fa7ac674224cf3e8b1fe76ae81263462.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727405347_74ddedcf5bd410288321f619818306df.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727414598_5b95973bda3c8d9c72fdbc89eb5bd78d.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051079376_a0aad7626d002edfd3fd04d548015aa1.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  
</div>

---
title: "Blog 3"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
---

# [AWS Tech Share] Transforming Spectators into Players: Building Interactive Gaming Experiences with GameLift Streams

Today, I would like to share how AWS solves the "Interactive Streaming" problem – turning a passive game stream viewing experience into a real-time, two-way interactive communication channel.

In game development, organizing playtests is often time-consuming (downloading builds, setup, reviewing videos). Furthermore, engaging with the viewer community faces barriers since viewers can only type messages in chat. To solve this problem, AWS has introduced a highly powerful combined architecture.


## 3 "PILLARS" OF THE SOLUTION ARCHITECTURE

- **Amazon GameLift Streams**: Supports directly streaming games from the server to the browser (using WebRTC) with ultra-low latency, reaching up to 1080p quality at 60 FPS, without requiring players to download or install the game.
- **Amazon IVS (Interactive Video Service)**: Ingests the gameplay stream and distributes it globally with sub-second latency.
- **AWS AppSync**: Acts as a bridge, providing WebSocket APIs to transmit messages, reactions, and control inputs from the audience back into the game immediately.


## HOW THE ARCHITECTURE FLOW WORKS

1. The user interacts with a React Frontend interface, securely authenticated via Amazon Cognito.
2. Amazon API Gateway and AWS Lambda handle communication and initialize the stream session.
3. On the server side, GameLift Streams runs the game alongside a background process called the "Broadcast Sidecar".
4. This Sidecar application captures the video/audio, encodes it into H.264 video, and pushes the stream directly to the Amazon IVS stage with sub-300ms latency.

<img src="/images/blog/Blog3/717792483_1542699650893252_4468378101643065781_n.jpg" alt="GameLift Streams Architecture 1" class="blog-image" />
<img src="/images/blog/Blog3/718204942_1542699634226587_8876440514239223290_n.jpg" alt="GameLift Streams Architecture 2" class="blog-image" />
<img src="/images/blog/Blog3/718597666_1542699647559919_5008900173891667306_n.jpg" alt="GameLift Streams Architecture 3" class="blog-image" />



## TECHNICAL HIGHLIGHT: "CONTROL HANDOFF" MECHANISM

The most impressive feature of this solution is how it handles "handing over control" (Control Handoff) to participants. The system utilizes the AWS AppSync Event API to coordinate clean state control messages, such as:
- **TAKEOVER_REQUEST**: Requesting control from the current player.
- **TAKEOVER_APPROVED**: Approving and starting to share the session via the `CreateStreamConnection` API.


## CONCLUSION

This architecture not only optimizes the internal playtesting processes for game studios but also opens up massive potential for media campaigns: where spectators watching the stream can directly participate in the game (e.g., voting on paths, spawning monsters) right inside their browsers without any friction.


Link to original post: https://aws.amazon.com/blogs/gametech/creating-interactive-gaming-experiences-with-amazon-gamelift-streams-and-amazon-interactive-video-service/

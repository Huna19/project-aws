---
title : "Authentication & API Gateway"
date : 2024-01-01
weight : 7
chapter : false
pre : " <b> 5.7. </b> "
---

### Authentication & API Gateway

In this chapter, we will build a centralized user authentication gateway using **Amazon Cognito** and set up **Amazon API Gateway** as a bridge to route requests from the Frontend to the secured Backend services.

#### Implementation Steps:

1. **[Identity Registration (Cognito User Pool)](5.7.1-cognito/)**
   * Create a Cognito User Pool to manage customer email accounts.
   * Create an App Client (with client secret disabled) for compatibility with Single Page Application (SPA) security.

2. **[API Gateway & JWT Authorizer](5.7.2-apigateway/)**
   * Create an API Gateway as an HTTP API.
   * Create a Cognito JWT Authorizer to read authentication tokens from headers.
   * Configure route separation: Public APIs for viewing match listings are accessible without authentication, while booking APIs require login (Protected).

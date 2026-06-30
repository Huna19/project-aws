---
title : "Frontend Tier"
date : 2024-01-01
weight : 4
chapter : false
pre : " <b> 5.4. </b> "
---

### Frontend Tier

In this section, we will configure static website hosting for the **Ticketing App** on **Amazon S3** and set up secure global content distribution through **Amazon CloudFront** using **Origin Access Control (OAC)**.

---

#### 1. Create Amazon S3 Bucket for Frontend

The S3 Bucket will block all public access entirely. Only the CloudFront Distribution will have read access to this Bucket.

1. Open the [Amazon S3 console](https://s3.console.aws.amazon.com/s3/home?region=us-east-1#).
2. Click **Create bucket**.
3. In the **Create bucket** configuration interface:
   * **Bucket name**: Enter a globally unique name following this format: ```frontend-ticket-app-app-<your-account-id>``` (e.g., `frontend-ticket-app-app-123456789012`).
   * **AWS Region**: Select ```us-east-1``` (or the region you are using for the lab).
   * **Object Ownership**: Select **ACLs disabled (recommended)**.
   * **Block Public Access settings for this bucket**:
     * Check **Block all public access** (Completely block direct access from the internet).

![S3 Create](/images/5-Workshop/5.4-Frontend-Tier/s3_create.png)

   * Keep the other default settings and click **Create bucket** at the bottom of the page.

---

#### 2. Create CloudFront Distribution & Configure OAC

1. Open the [Amazon CloudFront console](https://us-east-1.console.aws.amazon.com/cloudfront/v4/home?region=us-east-1#/distributions).
2. Click **Create distribution**.
3. In the **Create distribution** configuration interface:
   * **Origin**:
     * **Origin domain**: Select the S3 Bucket ```frontend-ticket-app-app-<your-account-id>``` you just created above.
     * **Origin access**: Select **Origin access control settings (recommended)**.
     * Click **Create control setting**:
       * Enter Name: ```ticket-app-frontend-oac```.
       * Select **Sign requests (recommended)**.
       * Click **Create**.

![CloudFront Origin OAC](/images/5-Workshop/5.4-Frontend-Tier/cf_oac.png)

   * **Default cache behavior**:
     * **Viewer protocol policy**: Select **Redirect HTTP to HTTPS** (Automatically redirect to the secure HTTPS protocol).
     * **Allowed HTTP methods**: Select ```GET, HEAD, OPTIONS```.
   * **Web Application Firewall (WAF)**:
     * Select **Do not enable security protections** (For the lab, we disable this to avoid additional costs).
   * **Settings**:
     * **Default root object**: Enter ```index.html```.
4. Click **Create distribution** at the bottom.
5. When the screen navigates to the newly created CloudFront Distribution details page, copy the **Distribution domain name** (e.g., `dxxxxxxxxxx.cloudfront.net`) from the overview page for accessing the website later.

---

#### 3. Update S3 Bucket Policy

{{% notice note %}}
After the CloudFront Distribution is created, you must update the S3 Bucket Policy to allow the CloudFront Principal service to read files from your bucket.
{{% /notice %}}

1. When the screen navigates to the newly created CloudFront Distribution details page, you will see a yellow banner displaying a notification requesting you to update the S3 Bucket Policy.
2. Click the **Copy policy** button on the right side of the banner.

![Copy S3 Policy](/images/5-Workshop/5.4-Frontend-Tier/copy_policy.png)

3. Go back to the S3 Bucket details page for ```frontend-ticket-app-app-<your-account-id>```:
   * Select the **Permissions** tab.
   * Scroll down to the **Bucket policy** section -> click **Edit**.
   * Paste the entire JSON policy content you just copied into the editor.
   * Click **Save changes**.

![Save S3 Policy](/images/5-Workshop/5.4-Frontend-Tier/s3_policy_save.png)

---

#### 4. Configure and Build Frontend Source Code

Before uploading the Frontend code to S3, we need to configure the Frontend to communicate with the Cognito User Pool and API Gateway.

1. Navigate to the Frontend source code directory on your computer (the ```ticket-booking-frontend``` directory).
2. Create or edit the environment configuration file ```.env``` in the Frontend directory:
   ```env
   REACT_APP_API_URL=https://ticket-app-api-url (API Gateway URL - see Chapter 5.7)
   REACT_APP_COGNITO_USER_POOL_ID=us-east-1_xxxxx (See Chapter 5.7)
   REACT_APP_COGNITO_CLIENT_ID=xxxxxxxxxxxx (See Chapter 5.7)
   ```
3. Open a Terminal in the Frontend directory and run the following commands to install dependencies and build the project:
   ```bash
   npm install
   npm run build
   ```
   * After successful execution, a ```build``` or ```dist``` directory will be created containing the static files (index.html, JS, CSS, images).

---

#### 5. Upload Source Code to S3 Frontend Bucket

1. Go back to the S3 Bucket details page for ```frontend-ticket-app-app-<your-account-id>``` on the AWS Console.
2. In the **Objects** tab, click **Upload**.
3. Drag and drop all the files and subdirectories located **inside** the ```build``` (or ```dist```) directory generated in Step 4 into the upload area.
   * *Note: The `index.html` file must be uploaded at the root level of the S3 Bucket.*
4. Click **Upload** at the bottom of the page and wait for the upload to complete.

![S3 Upload Complete](/images/5-Workshop/5.4-Frontend-Tier/s3_uploaded_objects.png)

After a successful upload, access the website through the CloudFront Distribution domain name to confirm the interface is displaying correctly.

![Access Website via CloudFront](/images/5-Workshop/5.4-Frontend-Tier/website_access.png)


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

![S3 Bucket Name](/images/5-Workshop/5.4-Frontend-Tier/s3_create_name.png)
![S3 Object Ownership](/images/5-Workshop/5.4-Frontend-Tier/s3_create_ownership.png)
![S3 Create Button](/images/5-Workshop/5.4-Frontend-Tier/s3_create_button.png)

   * Keep the other default settings and click **Create bucket** at the bottom of the page.

---

#### 2. Create Amazon S3 Bucket for Assets (Images & E-tickets)

{{% notice info %}}
In addition to the Frontend Bucket, the application needs a separate S3 Bucket to store match images, e-tickets, and other assets uploaded by the Backend. This bucket allows public access to display images on the frontend interface.
{{% /notice %}}

1. Return to the [Amazon S3 console](https://s3.console.aws.amazon.com/s3/home?region=us-east-1#) → click **Create bucket**.
2. In the **Create bucket** configuration interface:
   * **Bucket name**: Enter a name following this format: ```ticket-app-assets-<your-account-id>``` (e.g., `ticket-app-assets-123456789012`).
   * **AWS Region**: Select ```us-east-1``` (or the region you are using for the lab).

   ![S3 Assets Bucket Name](/images/5-Workshop/5.4-Frontend-Tier/s3_assets_create_name.jpg)

   * **Object Ownership**: Select **ACLs disabled (recommended)**.

   ![S3 Assets Ownership](/images/5-Workshop/5.4-Frontend-Tier/s3_assets_create_ownership.jpg)

   * **Block Public Access settings for this bucket**:
     * **Uncheck** the **Block all public access** box (Allow public read access for images).
     * Check the acknowledgment box "I acknowledge that the current settings might result in this bucket and the objects within becoming public."

   ![S3 Assets Public Access](/images/5-Workshop/5.4-Frontend-Tier/s3_assets_public_access.jpg)

3. Click **Create bucket** at the bottom of the page.
4. After the bucket is created, go to the bucket details page → select the **Permissions** tab → scroll to **Cross-origin resource sharing (CORS)** → click **Edit** → paste the following CORS configuration:
   ```json
   [
     {
       "AllowedHeaders": ["*"],
       "AllowedMethods": ["GET", "PUT", "POST"],
       "AllowedOrigins": ["*"],
       "MaxAgeSeconds": 3000
     }
   ]
   ```
5. Click **Save changes**.



---

#### 3. Create CloudFront Distribution & Configure OAC

1. Open the [Amazon CloudFront console](https://us-east-1.console.aws.amazon.com/cloudfront/v4/home?region=us-east-1#/distributions).
2. Click **Create distribution**.
3. In the **Create distribution** configuration interface:
   * **Distribution options**:
     * **Distribution name**: Enter ```ticket-app-frontend``` or leave as default.
     * **Project type**: Select **Single website or app**.

   ![CloudFront Distribution Options](/images/5-Workshop/5.4-Frontend-Tier/cf_oac.png)

   * **Domain**:
     * Select **Skip domain setup** (We will use the default domain provided by CloudFront).

   ![CloudFront Domain Setup](/images/5-Workshop/5.4-Frontend-Tier/cf_waf.png)

   * **Origin**:
     * **Origin type**: Select **Amazon S3**.
     * **S3 origin**: Select **Browse S3** -> Select the ```frontend-ticket-app-app-<your-account-id>``` bucket created in the previous step.

   ![CloudFront S3 Origin](/images/5-Workshop/5.4-Frontend-Tier/cf_price_class.png)

     * **Origin settings**: Select **Use recommended origin settings** (CloudFront will automatically create the OAC configuration to securely connect to the S3 Private Bucket).

   {{% notice warning %}}
   Note: The S3 bucket must be a standard bucket (REST endpoint), and Static Website Hosting **must not be enabled**, as OAC does not support Website Endpoints.
   {{% /notice %}}

   ![CloudFront Origin Settings](/images/5-Workshop/5.4-Frontend-Tier/cf_origin_settings.jpg)

   * **Security protections**:
     * **AWS WAF**: Keep the default configuration and click **Next**.

   ![CloudFront Security Settings](/images/5-Workshop/5.4-Frontend-Tier/cf_waf_settings.jpg)

   {{% notice note %}}
   Note: Since **Project type = Single website or app** has been selected, AWS will automatically apply the appropriate default configuration for the CloudFront Distribution. For this workshop, just keep the default values and click **Next** to continue. Settings such as Cache Behavior, Viewer Protocol Policy, or Allowed HTTP Methods can be edited later if needed.
   {{% /notice %}}

4. Click **Create distribution** at the bottom.

   ![CloudFront Review and Create](/images/5-Workshop/5.4-Frontend-Tier/cf_review_2.jpg)

5. Once the Distribution is successfully created, CloudFront will display its details. Copy the **Distribution domain name** (e.g., `dxxxxxxxxxx.cloudfront.net`). This is the address used to access the website after deployment is complete.

6. Configure the **Default root object** for the Distribution:
   * Since the CloudFront creation wizard does not support setting the Default root object directly, you need to go to the details page of the newly created Distribution.
   * Under the **General** tab, scroll down to the **Settings** section -> click **Edit** on the right side.

   ![CloudFront Domain](/images/5-Workshop/5.4-Frontend-Tier/cf_domain.png)

   * In the **Default root object** field, enter ```index.html```.
   * Scroll to the bottom of the page and click **Save changes**.

   ![CloudFront Save Settings](/images/5-Workshop/5.4-Frontend-Tier/cf_save_settings.jpg)

---

#### 4. Configure Custom Error Responses for SPA

Since the Frontend application is built with React (a Single Page Application), we need to redirect 403/404 errors to `index.html` so React can handle the routing.

1. In the CloudFront Distribution management page you just created, switch to the **Error pages** tab.
2. Click **Create custom error response**.
3. Configure for **403** error:
   * **HTTP error code**: Select **403: Forbidden**.
   * **Customize error response**: Select **Yes**.
   * **Response page path**: Enter `/index.html`.
   * **HTTP Response code**: Enter **200: OK**.
   * Click **Create custom error response**.

   ![CloudFront Custom Error 403](/images/5-Workshop/5.4-Frontend-Tier/cf_error_403.png)

4. Repeat the steps above to configure for **404** error:
   * **HTTP error code**: Select **404: Not Found**.
   * **Customize error response**: Select **Yes**.
   * **Response page path**: Enter `/index.html`.
   * **HTTP Response code**: Enter **200: OK**.
   * Click **Create custom error response**.

   ![CloudFront Custom Error 404](/images/5-Workshop/5.4-Frontend-Tier/cf_error_404.png)

---

#### 5. Update S3 Bucket Policy

{{% notice note %}}
After the CloudFront Distribution is created, you must update the S3 Bucket Policy to allow the CloudFront Principal service to read files from your bucket.
{{% /notice %}}

1. In the newly created CloudFront Distribution details page, switch to the **Origins** tab.
2. Select the S3 origin and click **Edit**.

   ![CloudFront Origins Tab](/images/5-Workshop/5.4-Frontend-Tier/cf_origins_tab.jpg)

3. In the **Edit origin** interface, scroll down to the policy warning section and click **Copy policy**.

   ![CloudFront Copy Policy](/images/5-Workshop/5.4-Frontend-Tier/cf_copy_policy.jpg)

4. Go back to the S3 Bucket details page for ```frontend-ticket-app-app-<your-account-id>```:
   * Select the **Permissions** tab.
   * Scroll down to the **Bucket policy** section -> click **Edit**.

   ![S3 Edit Policy](/images/5-Workshop/5.4-Frontend-Tier/s3_edit_policy.jpg)

5. Paste the entire JSON policy content you just copied into the editor.

   ![S3 Paste Policy](/images/5-Workshop/5.4-Frontend-Tier/s3_paste_policy.jpg)

6. Scroll to the bottom and click **Save changes**.

   ![S3 Save Policy](/images/5-Workshop/5.4-Frontend-Tier/s3_save_policy_btn.jpg)

---

#### 6. Configure and Build Frontend Source Code

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
   * After running successfully, an ```out``` folder will be created containing static files (index.html, JS, CSS, images).

---

#### 7. Upload Source Code to S3 Frontend Bucket

1. Go back to the S3 Bucket details page for ```frontend-ticket-app-app-<your-account-id>``` on the AWS Console.
2. In the **Objects** tab, click **Upload**.

   ![S3 Upload Button](/images/5-Workshop/5.4-Frontend-Tier/s3_upload_btn.jpg)

3. Drag and drop all files and subfolders **inside** the ```out``` folder generated in Step 6 into the upload area.
   * *Note: The `index.html` file must be uploaded directly to the root directory of the S3 Bucket.*

   ![S3 Upload Files](/images/5-Workshop/5.4-Frontend-Tier/s3_upload_files.jpg)

4. Click **Upload** at the bottom of the page and wait for the process to complete.

   ![S3 Execute Upload](/images/5-Workshop/5.4-Frontend-Tier/s3_upload_execute.jpg)

After a successful upload, access the website through the CloudFront Distribution domain name to confirm the interface is displaying correctly.

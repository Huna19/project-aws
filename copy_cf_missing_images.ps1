$sourceDir = "$PSScriptRoot\5.4 Tầng giao diện\3. Khởi tạo CloudFront Distribution & Cấu hình OAC"
$destDir = "$PSScriptRoot\static\images\5-Workshop\5.4-Frontend-Tier"
$assetsSourceDir = "$PSScriptRoot\5.4 Tầng giao diện\2. Khởi tạo Amazon S3 Bucket cho Assets (Hình ảnh & E-tickets)"

Copy-Item -Path "$sourceDir\z7993847556420_abbb7ee875fc04676de5356907beb989.jpg" -Destination "$destDir\cf_origin_settings.jpg" -Force
Copy-Item -Path "$sourceDir\z7993847583407_173f033c6398524c02de43ae937c4319.jpg" -Destination "$destDir\cf_waf_settings.jpg" -Force
Copy-Item -Path "$sourceDir\z7993847622232_1fbb4d53698243514805be8186fb876e.jpg" -Destination "$destDir\cf_review_1.jpg" -Force
Copy-Item -Path "$sourceDir\z7993847646076_8b59a389de633097684631739722ff8d.jpg" -Destination "$destDir\cf_review_2.jpg" -Force
Copy-Item -Path "$sourceDir\z7993853151902_b7eff7c9fdcabf9ff8ce823db06388cc.jpg" -Destination "$destDir\cf_save_settings.jpg" -Force

Copy-Item -Path "$assetsSourceDir\z7993876146514_0ae1e0b7ed68b14ca6e46c8f759217ad.jpg" -Destination "$destDir\s3_assets_create_name.jpg" -Force
Copy-Item -Path "$assetsSourceDir\z7993876130554_49a3318d5a84e4d7b1be74b2df34a071.jpg" -Destination "$destDir\s3_assets_create_ownership.jpg" -Force
Copy-Item -Path "$assetsSourceDir\z7993876303445_572f0367d0e7e2599f498736f2b0cfae.jpg" -Destination "$destDir\s3_assets_public_access.jpg" -Force

$policySourceDir = "$PSScriptRoot\5.4 Tầng giao diện\5. Cập nhật S3 Bucket Policy"
Copy-Item -Path "$policySourceDir\z7993882390578_012f8acd0b61321230b22c10f00063b7.jpg" -Destination "$destDir\cf_origins_tab.jpg" -Force
Copy-Item -Path "$policySourceDir\z7993882399454_b00c1a4ce49564d4bf4176f942bb1b98.jpg" -Destination "$destDir\cf_copy_policy.jpg" -Force
Copy-Item -Path "$policySourceDir\z7993882463856_2d24cc99ba91c7eebb7ac51d4301a33d.jpg" -Destination "$destDir\s3_edit_policy.jpg" -Force
Copy-Item -Path "$policySourceDir\z7993882483154_379f0dbef86eae0f8541efd13402709e.jpg" -Destination "$destDir\s3_paste_policy.jpg" -Force
Copy-Item -Path "$policySourceDir\z7993882500384_4fbd2ad55ba253259c23999be3e6ed74.jpg" -Destination "$destDir\s3_save_policy_btn.jpg" -Force

$uploadSourceDir = "$PSScriptRoot\5.4 Tầng giao diện\7. Upload mã nguồn lên S3 Frontend Bucket"
Copy-Item -Path "$uploadSourceDir\z7993886425451_a0799a4f4b8fde77553be0764826c409.jpg" -Destination "$destDir\s3_upload_btn.jpg" -Force
Copy-Item -Path "$uploadSourceDir\z7993886436730_ce391b55b773f9a3cc3251121f88628f.jpg" -Destination "$destDir\s3_upload_files.jpg" -Force
Copy-Item -Path "$uploadSourceDir\z7993886444205_e2cbf969ca81f159fc5b401a2522bedc.jpg" -Destination "$destDir\s3_upload_execute.jpg" -Force


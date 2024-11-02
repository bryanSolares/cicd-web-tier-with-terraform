# Deploying application

1. Create base infrastructure

```bash
# .github/workflows/infrastructure.yaml
```

2. Create infrastructure for frontend

```bash
# .github/workflows/deploy-infra.yaml
```

3. Create Identity Provider [Configure AWS OIDC github action](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)

```bash

    # For the provider URL: Use https://token.actions.githubusercontent.com
    # For the "Audience": Use sts.amazonaws.com if you are using the official action.

```
![image](https://github.com/user-attachments/assets/99445772-a176-431a-9a65-471638ab4c01)


4. Create role for github actions on AWS
![image](https://github.com/user-attachments/assets/9b0ba630-e075-463a-9cc2-e172d52bfd27)

trust relationship
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::<account-id>:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:<organization>/<repository>:*"
        }
      }
    }
  ]
}
```
5. Configure Secrets for AWS OIDC and variables on github
![image](https://github.com/user-attachments/assets/9ec1bbed-9cf0-4685-b13e-1f5c185a3291)
![image](https://github.com/user-attachments/assets/fff2f803-c7da-4d60-b18e-34fba55ce988)

6. Push changes to github
```bash
git add .
git commit -m "message"
git push
```
8. Run workflow manually
![image](https://github.com/user-attachments/assets/86b75d1d-c171-4f00-827d-b842a25785ce)
9. Deploy success
![image](https://github.com/user-attachments/assets/e97f987e-a9eb-4e76-b211-5c841bcabf36)



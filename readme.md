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

4. Configure Secrets for AWS OIDC and variables on github
5. Create role for github actions on AWS

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

6. Push changes to github

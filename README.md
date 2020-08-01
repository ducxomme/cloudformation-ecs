1. Create ECR Repository
    ```
    $ make createEcr
    ```
    - Login AWS
    ```
    $ make docker-login
    ```
    - Build image
    ```
    $ make docker-build
    ```
    - Tagging image
    ```
    $ make docker-tag
    ```
    - Push Image to ECR
    ```
    $ make docker-push
    ```
2. Create ECS Cluster, ALB, TG, Log Group.
    ```
    $ make createEcs
    ```
3. Create ECS Task Definition, ECS Service. 
    ```
    $ make createService
    ```
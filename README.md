# pubsub-dev-test

Google Pub/Sub local dev test

**STATUS: WORK IN PROGRESS**: At the moment the program gets stuck at `exists, err := topic.Exists(ctx)` when using the Pub/Sub Emulator.

```shell
# run
gcloud beta emulators pubsub start --project=local-dev-test-gcp-project

# then in another shell
$(gcloud beta emulators pubsub env-init)
docker-compose up
```
import (
        "context"
        "fmt"

        "cloud.google.com/go/pubsub"
        "google.golang.org/api/option"
)

// apiKey shows how to use an API key to authenticate.
func apiKey() error {
        client, err := pubsub.NewClient(context.Background(), "your-project-id", option.WithAPIKey("api-key-string"))
        if err != nil {
                return fmt.Errorf("pubsub.NewClient: %v", err)
        }
        // Use the authenticated client.
        _ = client

        return nil
}

import Config

config :live_sketch, LiveSketchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "your-secret-key-base-here",  # Generate with mix phx.gen.secret
  render_errors: [view: LiveSketchWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveSketch.PubSub,
  live_view: [signing_salt: "your-salt"]

config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason
# zero-http-lite

Tiny HTTP request/response primitives written in [Zero](https://github.com/vercel-labs/zero).

This is intentionally small: Zero's current `std.http` exposes method/body helpers and net metadata, but not a full request/response runtime yet. `zero-http-lite` fills that gap at the library layer with explicit, allocation-free-ish primitives that are easy for agents to inspect with `zero check --json`, `zero graph --json`, and `zero size --json`.

## What it is

A mini HTTP layer for Zero programs:

- `Method` and `Status` enums
- `HttpRequest` and `HttpResponse` shapes
- method token parsing
- status-code/status-text helpers
- text/json response builders
- a tiny example dispatcher
- a checkable CLI demo

## What it is not

- not a TCP server
- not a framework
- not production-ready
- not trying to hide Zero's current limits

The idea is to build the missing higher-level HTTP concepts *on top of* Zero's explicit capability model, not around it.

## Install Zero

```sh
curl -fsSL https://zerolang.ai/install.sh | bash
export PATH="$HOME/.zero/bin:$PATH"
zero --version
```

Or point the smoke script at a local compiler:

```sh
ZERO_BIN=/path/to/zero ./scripts/smoke.sh
```

## Validate

```sh
./scripts/smoke.sh
```

The smoke script runs:

- `zero check --json .`
- `zero graph --json .`
- `zero size --json .`

Artifacts are written to `.zero/out/`.

## Example

```zero
use zhttp

pub fun main(world: World) -> Void raises {
    let req = request(Method.get, "/health", std.mem.span(""))
    let res = dispatch(req)

    if statusCode(res.status) == 200 && std.mem.eql(res.body, "ok") {
        check world.out.write("zero-http-lite ok\n")
    }
}
```

## Current API

Defined in `src/zhttp.0`:

```zero
pub enum Method { get, post, put, patch, del, unknown }
pub enum Status { ok, created, bad_request, not_found, method_not_allowed, internal_error }

pub shape HttpRequest {
    method: Method,
    path: String,
    body: Span<u8>,
}

pub shape HttpResponse {
    status: Status,
    content_type: String,
    body: String,
}
```

The tiny dispatcher is deliberately boring:

- `GET /health` → `200 text/plain ok`
- `POST /echo` → `201 application/json {"echo":true}`
- everything else → `404 text/plain not found`

## Why this repo exists

This repo is a small concrete Zero project rather than a copy of the Zero compiler repo: useful enough to inspect, tiny enough to understand, and shaped around Zero's agent-friendly JSON tooling.

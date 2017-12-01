# Rails Product Demo

Simple Sinatra and Contentful Application.
This application is for Demo purposes.

[Contentful](https://www.contentful.com) provides a content infrastructure for digital teams to power content in websites, apps, and devices. Unlike a CMS, Contentful was built to integrate with the modern software stack. It offers a central hub for structured content, powerful management and delivery APIs, and a customizable web app that enable developers and content creators to ship digital products faster.

## Setup

* Install dependencies

```bash
bundle install
```

* Run Server

```bash
rackup
```

## Viewing Data

The app comes pre-loaded with a Read-Only Demo space.
You can view the content [here](http://localhost:4567/space/swvvfxlfblv8/token/49d26acf33f1221ede35b490c9d72880627e45ad1e39aa9355183cca8d3a757c/content_type/2PqfXUJwE8qSYKuM0U6w8M)

## Using Custom Data

You can create your own Custom Data by following these steps:

* Create an Account in [Contentful](https://www.contentful.com/sign-up/#starter) or [Log In](https://app.contentful.com)
* Create a new Space with `Product` Template
* In the Sinatra app, go to the homepage and input the following:
  * Your newly created Space ID - `Settings -> Space -> Space ID`
  * Production Delivery API Access Token - `APIs -> API Keys -> Website -> Production`
  * Product's Content Type ID - `Content Types -> Product -> JSON Preview -> "sys => id"` (`sys` is the Metadata block of the Content Type)
* Then press `To Products` to see it's contents

## Tutorial

For a Tutorial on how to create your own Sinatra Application using Contentful, you can read [here](./TUTORIAL.md)

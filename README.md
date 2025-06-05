# README

# Rails Code Challenge: Ticketing System

## Overview

This challenge involves completing a simplified Rails-based ticketing system. You will be working with models, a controller, and routes to implement missing logic and expose functionality via API endpoints.

Your focus should be on understanding and using Rails conventions for models, associations, validations, controller actions, and routing.

---

## Files You'll Work In

You will be working in the following files. Any code that is **commented out** is **intended for you to complete**:

### `app/models/ticket.rb`

- **Model**: Already set up with validations and associations.
- What works:
  - `belongs_to :user`
  - Validations for `title` and `status`
- Your task:
  - Complete the `status_description` method to return a human-readable message based on the ticket's status:
    - `"open"` → `"Ticket is open and needs attention."`
    - `"pending"` → `"Ticket is pending and awaiting action."`
    - `"closed"` → `"Ticket has been resolved."`
    - Anything else → `"Unknown status."`

---

### `app/models/user.rb`

- **Model**: Represents a user who can have many tickets.
- What works:
  - `has_many :tickets`
  - Validations for presence and uniqueness of `name` and `email`
- Your task:
  - Implement the following instance methods:
    - `closed_tickets` – return only the user's closed tickets
    - `active_tickets` – return only open or pending tickets
    - `most_recent_ticket` – return the user’s most recently created ticket

---

### `app/controllers/tickets_controller.rb`

- **Controller**: Handles ticket listing, creation, and updates.
- What works:
  - `index` action returns all tickets
- Your tasks:
  - Implement the `create` action to:
    - Save a new ticket using `ticket_params`
    - Return a JSON response with ticket data or validation errors
  - Implement the `update` action to:
    - Find and update a ticket by ID
    - Return updated data or errors if not found or invalid

---

### `config/routes.rb`

- What works:
  - File is present
- Your task:
  - Add the necessary RESTful routes for `create` and `update`
  - Optionally add custom routes for enhanced features

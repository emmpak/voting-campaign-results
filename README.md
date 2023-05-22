# TV SMS Voting Campaign Results - Rails Application

This Rails application allows you to view the results of TV SMS voting campaigns. The data is derived from the logs of the voting system which can be found in `data/votes.txt` file. The application provides a web interface where you can view a list of campaigns and detailed results for each campaign, including the number of valid and invalid votes for each candidate.

## System Requirements

To run this application, you will need:

- Ruby 3.2.2
- Rails 7.0.4
- PostgreSQL 9.6 (or newer)

## Installation

Here are the steps to install and run this application:

1. Clone the repository to your local machine:

   ```
   git clone https://github.com/emmpak/voting-campaign-results.git
   ```

2. Change into the application directory:

   ```
   cd voting-campaign-results
   ```

3. Install the required gems:

   ```
   bundle install
   ```

4. Create the database and run the migrations:

   ```
   rails db:create db:migrate
   ```

5. Run the rake task with the voting data:

   ```
   rake import:votes
   ```

6. Start the Rails server:

   ```
   rails server
   ```

7. Visit `http://localhost:3000` in your web browser to see the application.

## Usage

Once you have the application running:

- Visit the root URL (`/`) to see a list of all voting campaigns.
- Click on a campaign to view detailed results for that campaign, including the number of valid and invalid votes for each candidate.

## Testing

To run the tests for this application:

```
bundle exec rspec
```

## Design Decisions and Approach

For more detailed information on the design decisions and approach for this application, see [Design.md](Design.md).

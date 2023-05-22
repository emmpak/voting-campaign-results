1. **`Campaign` & `Vote` models**: Using two models to map relationships and data fields in the voting system. `Campaign` holds information for each campaign (just name at this stage), and `Vote` represents each vote cast in a campaign. Added some validations at the DB and model levels. Used an enum to represent the Vote `validity` to clearly define its possible states
2. **Data import & parsing**: The script is streaming the file line by line, and for each line, a `Vote ` is created rather than loading the whole file at once. This approach helps keep memory usage minimal for potentially large files. We can also perform batch imports of votes to speed up the task. Since the data is consistently formatted, we can `split` it rather than performing more complex and brittle regex. Created a Struct to map the line data to its corresponding fields without relying on the array indices to make it more readable and self documenting.
3. **Voting results calculation**: Placed the logic in the `Campaign` model (Fat Models, Skinny Controllers) to keep complex business logic in the model layer. Initially, I used the helper method provided by adding the enum functionality:

```
  def valid_vote_results
    votes.during.group(:choice).count
  end

  def invalid_vote_results
    votes.not_during.group(:choice).count
  end
```

3. It's very neat and readable but will unfortunately produce two queries to the DB. If we care more about simplicity and the data is not very large, we can use the above. However, it's just not necessary to do both of those calls one after the other hence the new `vote_results` method which executes one query grouping by validity and choice and then calculating the respective totals. If further optimization is required, we can refactor to `include` the votes along with the campaign.
4. **Testing strategy**: Used RSpec along with Factory Bot and Capybara for setting up test data and writing feature specs. Testing both model methods and user interface interactions.

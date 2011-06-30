Feature: CRUDing features
As a software developer
I want every one to use cucumber
So I need a simple api over the feature files

Scenario: Getting a list of features
  When I go to the features page as json
  Then I should see "features/features.feature"

Scenario: Getting a particular feature
  When I go to the features/features.feature page as json
  Then I should see '"keyword":"Feature"'

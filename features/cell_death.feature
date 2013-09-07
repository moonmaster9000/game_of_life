Feature: Cell Death


  Scenario: Cell has fewer than two neighbors
    Given a cell with fewer than two neighbors
    When the clock ticks
    Then it should die
